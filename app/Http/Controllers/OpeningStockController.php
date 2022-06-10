<?php

namespace App\Http\Controllers;

use App\Account;
use App\AccountTransaction;
use App\AccountType;
use App\BusinessLocation;

use App\Product;
use App\PurchaseLine;
use App\Store;
use App\Transaction;
use App\Utils\ProductUtil;

use App\Utils\TransactionUtil;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Redirect;

class OpeningStockController extends Controller
{

    /**
     * All Utils instance.
     *
     */
    protected $productUtil;
    protected $transactionUtil;

    /**
     * Constructor
     *
     * @param ProductUtils $product
     * @return void
     */
    public function __construct(ProductUtil $productUtil, TransactionUtil $transactionUtil)
    {
        $this->productUtil = $productUtil;
        $this->transactionUtil = $transactionUtil;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function add($product_id)
    {
        if (!auth()->user()->can('product.update')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');

        //Get the product
        $product = Product::where('business_id', $business_id)
            ->where('id', $product_id)
            ->with([
                'variations',
                'variations.product_variation',
                'unit',
                'product_locations'
            ])
            ->first();
        if (!empty($product) && $product->enable_stock == 1) {
            //Get Opening Stock Transactions for the product if exists
            $transactions = Transaction::where('business_id', $business_id)
                ->where('opening_stock_product_id', $product_id)
                ->where('type', 'opening_stock')
                ->with(['purchase_lines'])
                ->get();

            $purchases = [];
            foreach ($transactions as $transaction) {
                $purchase_lines = [];

                foreach ($transaction->purchase_lines as $purchase_line) {
                    if (!empty($purchase_lines[$purchase_line->variation_id])) {
                        $k = count($purchase_lines[$purchase_line->variation_id]);
                    } else {
                        $k = 0;
                        $purchase_lines[$purchase_line->variation_id] = [];
                    }

                    //Show only remaining quantity for editing opening stock.
                    $purchase_lines[$purchase_line->variation_id][$k]['quantity'] = $purchase_line->quantity_remaining;
                    $purchase_lines[$purchase_line->variation_id][$k]['purchase_price'] = $purchase_line->purchase_price;
                    $purchase_lines[$purchase_line->variation_id][$k]['purchase_line_id'] = $purchase_line->id;
                    $purchase_lines[$purchase_line->variation_id][$k]['exp_date'] = $purchase_line->exp_date;
                    $purchase_lines[$purchase_line->variation_id][$k]['lot_number'] = $purchase_line->lot_number;
                }
                $purchases[$transaction->location_id] = $purchase_lines;
            }

            $locations = BusinessLocation::forDropdown($business_id);

            //Unset locations where product is not available
            $available_locations = $product->product_locations->pluck('id')->toArray();
            foreach ($locations as $key => $value) {
                if (!in_array($key, $available_locations)) {
                    unset($locations[$key]);
                }
            }
            if (count($locations) == 0) {
                $output = [
                    'success' => 0,
                    'msg' => 'Product not assigned to any branch'
                ];
                if (request()->ajax()) {
                    return $output;
                }

                return redirect()->action(
                    'ProductController@edit',
                    $product_id
                )->with('status', $output);
            }

            $stores = [];
            foreach ($locations as $key => $value) {
                $temp_store = Store::where('location_id', $key)->first();
                if (!empty($temp_store)) {
                    $stores[] = $temp_store;
                } else {
                    $output = [
                        'success' => 0,
                        'msg' => 'No store assigned to location'
                    ];
                    if (request()->ajax()) {
                        return $output;
                    }
                    return redirect()->action(
                        'ProductController@edit',
                        $product_id
                    )->with('status', $output);
                }
            }



            $enable_expiry = request()->session()->get('business.enable_product_expiry');
            $enable_lot = request()->session()->get('business.enable_lot_number');

            if (request()->ajax()) {
                return view('opening_stock.ajax_add')
                    ->with(compact(
                        'product',
                        'locations',
                        'purchases',
                        'enable_expiry',
                        'enable_lot',
                        'stores'
                    ));
            }

            return view('opening_stock.add')
                ->with(compact(
                    'product',
                    'locations',
                    'purchases',
                    'enable_expiry',
                    'enable_lot',
                    'stores'
                ));
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function save(Request $request)
    {
        if (!auth()->user()->can('product.update')) {
            abort(403, 'Unauthorized action.');
        }

        try {
            $opening_stocks = $request->input('stocks');
            $store_opening_stocks = $request->input('store_stocks');

            $product_id = $request->input('product_id');

            $business_id = $request->session()->get('user.business_id');
            $user_id = $request->session()->get('user.id');

            $product = Product::where('business_id', $business_id)
                ->where('id', $product_id)
                ->with(['variations', 'product_tax'])
                ->first();

            $locations = BusinessLocation::forDropdown($business_id)->toArray();

            if (!empty($product) && $product->enable_stock == 1) {
                //Get product tax
                $tax_percent = !empty($product->product_tax->amount) ? $product->product_tax->amount : 0;
                $tax_id = !empty($product->product_tax->id) ? $product->product_tax->id : null;

                //Get start date for financial year.
                $transaction_date = request()->session()->get("financial_year.start");
                $transaction_date = \Carbon::createFromFormat('Y-m-d', $transaction_date)->toDateTimeString();

                DB::beginTransaction();
                //$key is the location_id
                foreach ($opening_stocks as $key_os => $value) {
                    $location_id = $key_os;
                    $purchase_total = 0;
                    //Check if valid location
                    if (array_key_exists($location_id, $locations)) {
                        $purchase_lines = [];
                        $updated_purchase_line_ids = [];

                        //create purchase_lines array
                        //$k is the variation id
                        foreach ($value as $k => $rows) {
                            foreach ($rows as $key => $v) {
                                $purchase_price = $this->productUtil->num_uf(trim($v['purchase_price']));
                                $item_tax = $this->productUtil->calc_percentage($purchase_price, $tax_percent);
                                $purchase_price_inc_tax = $purchase_price + $item_tax;
                                $qty_remaining = $this->productUtil->num_uf(trim($v['quantity']));

                                $exp_date = null;
                                if (!empty($v['exp_date'])) {
                                    $exp_date = $this->productUtil->uf_date($v['exp_date']);
                                }

                                $lot_number = null;
                                if (!empty($v['lot_number'])) {
                                    $lot_number = $v['lot_number'];
                                }

                                $purchase_line = null;

                                if (isset($v['purchase_line_id'])) {
                                    $purchase_line = PurchaseLine::findOrFail($v['purchase_line_id']);
                                    //Quantity = remaining + used
                                    $qty_remaining = $qty_remaining + $purchase_line->quantity_used;

                                    if ($qty_remaining != 0) {
                                        //Calculate transaction total
                                        $purchase_total += ($purchase_price_inc_tax * $qty_remaining);

                                        $updated_purchase_line_ids[] = $purchase_line->id;

                                        $old_qty = $purchase_line->quantity;

                                        $this->productUtil->updateProductQuantity($location_id, $product->id, $k, $qty_remaining, $old_qty, null, false);

                                        //updating stock in store
                                        if (!empty($store_opening_stocks)) {
                                            foreach ($store_opening_stocks as $key_s => $val_s) {
                                                foreach ($val_s as $item_s) {

                                                    $this->productUtil->updateProductQuantityStoreForOpeningStock($location_id, $product->id, $k, $item_s[0]['quantity'], $item_s[0]['store_id'], $old_qty, null, false);
                                                }
                                            }
                                        }
                                    }
                                } else {
                                    //create newly added purchase lines
                                    $purchase_line = new PurchaseLine();
                                    $purchase_line->product_id = $product->id;
                                    $purchase_line->variation_id = $k;
                                    $old_qty = 0;
                                    $this->productUtil->updateProductQuantity($location_id, $product->id, $k, $qty_remaining, 0, null, false);

                                    //updating stock in store
                                    if (!empty($store_opening_stocks)) {
                                        foreach ($store_opening_stocks as $key_s => $val_s) {
                                            foreach ($val_s as $item_s) {

                                                $this->productUtil->updateProductQuantityStore($location_id, $product->id, $k, $item_s[0]['quantity'], $item_s[0]['store_id'], $old_qty, null, true);
                                            }
                                        }
                                    }


                                    //Calculate transaction total
                                    $purchase_total += ($purchase_price_inc_tax * $qty_remaining);
                                }
                                if (!is_null($purchase_line)) {
                                    $purchase_line->item_tax = $item_tax;
                                    $purchase_line->tax_id = $tax_id;
                                    $purchase_line->quantity = $qty_remaining;
                                    $purchase_line->pp_without_discount = $purchase_price;
                                    $purchase_line->purchase_price = $purchase_price;
                                    $purchase_line->purchase_price_inc_tax = $purchase_price_inc_tax;
                                    $purchase_line->exp_date = $exp_date;
                                    $purchase_line->lot_number = $lot_number;

                                    $purchase_lines[] = $purchase_line;
                                }
                            }
                        }

                        //create transaction & purchase lines
                        if (!empty($purchase_lines)) {
                            $is_new_transaction = false;

                            $transaction = Transaction::where('type', 'opening_stock')
                                ->where('business_id', $business_id)
                                ->where('opening_stock_product_id', $product->id)
                                ->where('location_id', $location_id)
                                ->first();
                            if (!empty($transaction)) {
                                $transaction->total_before_tax = $purchase_total;
                                $transaction->final_total = $purchase_total;
                                $transaction->store_id = $request->store_id ?? null;
                                $transaction->update();
                            } else {
                                $is_new_transaction = true;

                                $transaction = Transaction::create(
                                    [
                                        'type' => 'opening_stock',
                                        'opening_stock_product_id' => $product->id,
                                        'status' => 'received',
                                        'business_id' => $business_id,
                                        'transaction_date' => $transaction_date,
                                        'total_before_tax' => $purchase_total,
                                        'location_id' => $location_id,
                                        'final_total' => $purchase_total,
                                        'payment_status' => 'paid',
                                        'created_by' => $user_id,
                                        'store_id'  => $request->store_id ?? null
                                    ]
                                );
                            }

                            //unset deleted purchase lines
                            $delete_purchase_line_ids = [];
                            $delete_purchase_lines = null;
                            $delete_purchase_lines = PurchaseLine::where('transaction_id', $transaction->id)
                                ->whereNotIn('id', $updated_purchase_line_ids)
                                ->get();

                            if ($delete_purchase_lines->count()) {
                                foreach ($delete_purchase_lines as $delete_purchase_line) {
                                    $delete_purchase_line_ids[] = $delete_purchase_line->id;

                                    //decrease deleted only if previous status was received
                                    $this->productUtil->decreaseProductQuantity(
                                        $delete_purchase_line->product_id,
                                        $delete_purchase_line->variation_id,
                                        $transaction->location_id,
                                        $delete_purchase_line->quantity
                                    );
                                }
                                //Delete deleted purchase lines
                                PurchaseLine::where('transaction_id', $transaction->id)
                                    ->whereIn('id', $delete_purchase_line_ids)
                                    ->delete();
                            }
                            $transaction->purchase_lines()->saveMany($purchase_lines);

                            //Update mapping of purchase & Sell.
                            if (!$is_new_transaction) {
                                $this->transactionUtil->adjustMappingPurchaseSellAfterEditingPurchase('received', $transaction, $delete_purchase_lines);
                            }



                            //Adjust stock over selling if found
                            $this->productUtil->adjustStockOverSelling($transaction);
                        } else {
                            //Delete transaction if all purchase line quantity is 0 (Only if transaction exists)
                            $delete_transaction = Transaction::where('type', 'opening_stock')
                                ->where('business_id', $business_id)
                                ->where('opening_stock_product_id', $product->id)
                                ->where('location_id', $location_id)
                                ->with(['purchase_lines'])
                                ->first();

                            if (!empty($delete_transaction)) {
                                $delete_purchase_lines = $delete_transaction->purchase_lines;

                                foreach ($delete_purchase_lines as $delete_purchase_line) {
                                    $this->productUtil->decreaseProductQuantity($product->id, $delete_purchase_line->variation_id, $location_id, $delete_purchase_line->quantity);
                                    $delete_purchase_line->delete();
                                }

                                //Update mapping of purchase & Sell.
                                $this->transactionUtil->adjustMappingPurchaseSellAfterEditingPurchase('received', $delete_transaction, $delete_purchase_lines);

                                $delete_transaction->delete();
                            }
                        }
                    }

                    if ($qty_remaining  > 0) {
                        $acc_tran_type = 'debit';
                    }
                    if ($qty_remaining  < 0) {
                        $acc_tran_type = 'credit';
                    }
                    $product_details = $this->transactionUtil->getTransactionProductDetail($transaction->id,  $transaction->type)[0];

                    if ($product_details->enable_stock) {
                        if (!empty($product_details->stock_type)) {
                            $account_id = $product_details->stock_type;
                            $account_transaction_data = [
                                'amount' => $transaction->final_total,
                                'account_id' => $account_id,
                                'type' => $acc_tran_type,
                                'operation_date' => $transaction->transaction_date,
                                'created_by' => $transaction->created_by,
                                'transaction_id' => $transaction->id,
                                'transaction_payment_id' => null,
                                'note' => null
                            ];

                            AccountTransaction::createAccountTransaction($account_transaction_data);

                            $opening_balance_equity_id = $this->transactionUtil->account_exist_return_id('Opening Balance Equity Account');
                            $this->transactionUtil->createAccountTransaction($transaction, 'credit', $opening_balance_equity_id, $transaction->final_total);
                        }
                    }
                }

                DB::commit();
            }

            $output = [
                'success' => 1,
                'msg' => __('lang_v1.opening_stock_added_successfully')
            ];
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output = [
                'success' => 0,
                'msg' => 'Default account is not assigned to location'
            ];
            return back()->with('status', $output);
        }

        if (request()->ajax()) {
            return $output;
        }

        return redirect('products')->with('status', $output);
    }
}
