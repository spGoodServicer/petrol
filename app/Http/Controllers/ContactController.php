<?php
namespace App\Http\Controllers;
use App\Account;
use App\AccountTransaction;
use App\Business;
use App\BusinessLocation;
use App\Contact;
use App\ContactLedger;
use App\Customer;
use App\Media;
use App\PurchaseLine;
use App\ContactGroup;
use App\CustomerReference;
use App\System;
use App\Transaction;
use App\TransactionPayment;
use App\User;
use App\Utils\ModuleUtil;
use App\Utils\BusinessUtil;
use App\Utils\ProductUtil;
use App\Utils\TransactionUtil;
use App\Utils\Util;

use Carbon\Carbon;
use Illuminate\Support\Facades\DB;
use Excel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Validator;
use Milon\Barcode\DNS1D;
use Milon\Barcode\Facades\DNS1DFacade;
use Yajra\DataTables\Facades\DataTables;
//$GLOBALS = array(
 //   'n' => 1
//);
class ContactController extends Controller
{
    protected $commonUtil;
    protected $transactionUtil;
    protected $moduleUtil;
    protected $businessUtil;
    protected $productUtil;
    //protected $balance_duen;
    /**
     * Constructor
     *
     * @param Util $commonUtil
     * @return void
     */
    public function __construct(
        Util $commonUtil,
        ModuleUtil $moduleUtil,
        TransactionUtil $transactionUtil,
        BusinessUtil $businessUtil,
        ProductUtil $productUtil
        //balance_duen $GLOBALS
    ) {

        $this->commonUtil = $commonUtil;
        $this->moduleUtil = $moduleUtil;
        $this->businessUtil = $businessUtil;
        $this->transactionUtil = $transactionUtil;
        $this->productUtil = $productUtil;
        //$this->balance_duen =& $GLOBALS;
    }
    /**
    public function getBalance() {
        return $this->balance_duen['n'];
    }
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $type = request()->get('type');
        $types = ['supplier', 'customer'];
        if (empty($type) || !in_array($type, $types)) {
            return redirect()->back();
        }
        if (request()->ajax()) {
            if ($type == 'supplier') {
                return $this->indexSupplier();
            } elseif ($type == 'customer') {
                // dd($this->indexCustomer());
                return $this->indexCustomer();
            } else {
                die("Not Found");
            }
        }
        $reward_enabled = (request()->session()->get('business.enable_rp') == 1 && in_array($type, ['customer'])) ? true : false;
        $contact_fields = !empty(session('business.contact_fields')) ? session('business.contact_fields') : [];
        $is_property = false;
        if (isset($is_property_customer)) {
            $is_property = true;
        }

        return view('contact.index')
            ->with(compact('type', 'reward_enabled', 'contact_fields', 'is_property'));
    }
    /**
     * Returns the database object for supplier
     *
     * @return \Illuminate\Http\Response
     */
    private function indexSupplier()
    {
        if (!auth()->user()->can('supplier.view')) {
            abort(403, 'Unauthorized action.');
        }
        $business_id = request()->session()->get('user.business_id');
        $contact = Contact::leftjoin('transactions AS t', 'contacts.id', '=', 't.contact_id')
            ->leftjoin('contact_groups AS cg', 'contacts.supplier_group_id', '=', 'cg.id')
            ->where('contacts.business_id', $business_id)
            ->where('contacts.is_payee', 0)
            // ->where('contacts.is_property', 0)
            ->onlySuppliers()
            ->select([
                'contacts.contact_id', 'supplier_business_name', 'contacts.active', 'contacts.name', 'cg.name as supplier_group', 'contacts.created_at', 'mobile', 't.transaction_date',
                'contacts.type', 'contacts.id',
                DB::raw("SUM(IF(t.type = 'purchase', final_total, 0)) as total_purchase"),
                DB::raw("SUM(IF(t.type = 'purchase', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as purchase_paid"),
                DB::raw("SUM(IF(t.type = 'purchase_return', final_total, 0)) as total_purchase_return"),
                DB::raw("SUM(IF(t.type = 'purchase_return', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as purchase_return_paid"),
                DB::raw("SUM(IF(t.type = 'opening_balance', final_total, 0)) as opening_balance"),
                DB::raw("SUM(IF(t.type = 'opening_balance', (SELECT SUM(IF(is_return = 1,-1*amount,amount)) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as opening_balance_paid"),
                'email', 'tax_number', 'contacts.pay_term_number', 'contacts.pay_term_type', 'contacts.custom_field1', 'contacts.custom_field2', 'contacts.custom_field3', 'contacts.custom_field4'
            ])
            ->groupBy('contacts.id');
        return Datatables::of($contact)
            ->addColumn(
                'due',
                '<span class="display_currency contact_due" data-orig-value="{{$total_purchase - $purchase_paid}}" data-currency_symbol=true data-highlight=false>{{$total_purchase - $purchase_paid }}</span>'
            )
            ->addColumn(
                'return_due',
                '<span class="display_currency return_due" data-orig-value="{{$total_purchase_return - $purchase_return_paid}}" data-currency_symbol=true data-highlight=false>{{$total_purchase_return - $purchase_return_paid }}</span>'
            )
            ->addColumn(
                'action',
                '<div class="btn-group">
                    <button type="button" class="btn btn-info dropdown-toggle btn-xs"
                        data-toggle="dropdown" aria-expanded="false">' .
                __("messages.actions") .
                '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                        </span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                @if(($total_purchase + $opening_balance - $purchase_paid - $opening_balance_paid)  > 0)
                    <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=purchase" class="pay_purchase_due"><i class="fa fa-credit-card" aria-hidden="true"></i>@lang("contact.pay_due_amount")</a></li>
                @endif
                @if(($total_purchase_return - $purchase_return_paid)  > 0)
                    <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=purchase_return" class="pay_purchase_due"><i class="fa fa-credit-card" aria-hidden="true"></i>@lang("lang_v1.receive_purchase_return_due")</a></li>
                @endif
                @if(($total_purchase + $opening_balance - $purchase_paid - $opening_balance_paid)  <= 0)
                    <li><a href="{{action(\'TransactionPaymentController@getAdvancePayment\', [$id])}}?type=advance_payment" class="pay_purchase_due"><i class="fa fa-money" aria-hidden="true"></i>@lang("lang_v1.advance_payment")</a></li>
                @endif
                <li><a href="{{action(\'TransactionPaymentController@getSecurityDeposit\', [$id])}}?type=security_deposit" class="pay_purchase_due"><i class="fa fa-shield" aria-hidden="true"></i>@lang("lang_v1.security_deposit")</a></li>
                @can("supplier.view")
                    <li><a href="{{action(\'ContactController@show\', [$id])}}"><i class="fa fa-eye" aria-hidden="true"></i> @lang("messages.view")</a></li>
                @endcan
                @can("supplier.update")
                    <li><a href="{{action(\'ContactController@edit\', [$id])}}" class="edit_contact_button"><i class="fa fa-pencil-square-o "></i> @lang("messages.edit")</a></li>
                @endcan
                @can("supplier.delete")
                    <li><a href="{{action(\'ContactController@destroy\', [$id])}}" class="delete_contact_button"><i class="fa fa-trash"></i> @lang("messages.delete")</a></li>
                @endcan
                @can("supplier.view")
                    <li class="divider"></li>
                    <li>
                        <a href="{{action(\'ContactController@show\', [$id])."?view=contact_info"}}">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            @lang("contact.contact_info", ["contact" => __("contact.contact") ])
                        </a>
                    </li>
                    <li>
                        <a href="{{action(\'ContactController@show\', [$id])."?view=ledger"}}">
                            <i class="fa fa-anchor" aria-hidden="true"></i>
                            @lang("lang_v1.ledger")
                        </a>
                    </li>
                    @if(in_array($type, ["both", "supplier"]))
                        <li>
                            <a href="{{action(\'ContactController@show\', [$id])."?view=purchase"}}">
                                <i class="fa fa-arrow-circle-down" aria-hidden="true"></i>
                                @lang("purchase.purchases")
                            </a>
                        </li>
                        <li>
                            <a href="{{action(\'ContactController@show\', [$id])."?view=stock_report"}}">
                                <i class="fa fa-hourglass-half" aria-hidden="true"></i>
                                @lang("report.stock_report")
                            </a>
                        </li>
                    @endif
                    @if(in_array($type, ["both", "customer"]))
                        <li>
                            <a href="{{action(\'ContactController@show\', [$id])."?view=sales"}}">
                                <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
                                @lang("sale.sells")
                            </a>
                        </li>
                    @endif
                    <li>
                        <a href="{{action(\'ContactController@show\', [$id])."?view=documents_and_notes"}}">
                            <i class="fa fa-paperclip" aria-hidden="true"></i>
                             @lang("lang_v1.documents_and_notes")
                        </a>
                    </li>
                    <li>
                        <a href="{{action(\'ContactController@toggleActivate\', [$id])}}">
                        @if($active)
                            <i class="fa fa-times" aria-hidden="true"></i>
                            @lang("lang_v1.deactivate")
                        @else
                            <i class="fa fa-check" aria-hidden="true"></i>
                            @lang("lang_v1.activate")
                        @endif
                        </a>
                    </li>
                @endcan
                </ul></div>'
            )
            ->editColumn('opening_balance', function ($row) {
                $paid_opening_balance = !empty($row->opening_balance_paid) ? $row->opening_balance_paid : 0;
                $opening_balance = !empty($row->opening_balance) ? $row->opening_balance : 0;
                $balance_value = $opening_balance - ($paid_opening_balance);
                $html = '<span class="display_currency ob" data-currency_symbol="true" data-orig-value="' . $opening_balance . '">' . $opening_balance . '</span>';
                return $html;
            })
            ->addColumn('mass_delete', function ($row) {
                return  '<input type="checkbox" class="row-select" value="' . $row->id . '">';
            })
            ->editColumn('pay_term', '
                @if(!empty($pay_term_type) && !empty($pay_term_number))
                    {{$pay_term_number}}
                    @lang("lang_v1.".$pay_term_type)
                @endif
            ')
            // ->editColumn('created_at', '@if(!empty($transaction_date)) {{@format_date($transaction_date)}} @else {{@format_date($created_at)}} @endif')
            ->editColumn('created_at',  function ($row){
                $ob_transaction = Transaction::where('type', 'opening_balance')->where('contact_id', $row->id)->first();
                if(!empty($ob_transaction)){
                    return $this->transactionUtil->format_date($ob_transaction->transaction_date);
                }
                return $this->transactionUtil->format_date($row->created_at);
            })
            ->removeColumn('opening_balance_paid')
            ->removeColumn('type')
            ->removeColumn('id')
            ->removeColumn('total_purchase')
            ->removeColumn('purchase_paid')
            ->removeColumn('total_purchase_return')
            ->removeColumn('purchase_return_paid')
            ->rawColumns(['action', 'opening_balance', 'pay_term', 'due', 'return_due', 'mass_delete'])
            ->make(true);
    }
    /**
     * Returns the database object for customer
     *
     * @return \Illuminate\Http\Response
     */
    private function indexCustomer()
    {
        if (!auth()->user()->can('customer.view')) {
            abort(403, 'Unauthorized action.');
        }
        $business_id = request()->session()->get('user.business_id');
        //$contact_id = $this->businessUtil->check_customer_code($business_id);
        $query = Contact::leftjoin('transactions AS t', 'contacts.id', '=', 't.contact_id')
            ->leftjoin('contact_groups AS cg', 'contacts.customer_group_id', '=', 'cg.id')
            ->where('contacts.business_id', $business_id)
//            ->where('contacts.is_property', 0)
            ->whereIn('contacts.is_property', [1,0])
            ->onlyCustomers()
            ->select([
                'contacts.contact_id', 'contacts.name', 'contacts.created_at', 'contacts.active','cg.name as customer_group', 'mobile', 'contacts.id', 'is_default',
                DB::raw("SUM(IF(t.type = 'sell_return', final_total, 0)) as total_sell_return"),
                DB::raw("SUM(IF(t.type = 'sell_return', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as sell_return_paid"),
                'contacts.pay_term_type', 'contacts.credit_limit',  'contacts.type'
            ])
            ->groupBy('contacts.id');
        //    dd($query->get()->toArray());
            $contacts = Datatables::of($query)

            ->addColumn('return_due', function ($row){
             $hml = '<span class="display_currency" data-currency_symbol="true" data-orig-value="' . json_encode($row) . '">' . $row->total_sell_return . '</span>';
             return $hml;
            })
            ->addColumn(
                'action',
                '<div class="btn-group">
                    <button type="button" class="btn btn-info dropdown-toggle btn-xs"
                        data-toggle="dropdown" aria-expanded="false">' .
                __("messages.actions") .
                '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                        </span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-left" role="menu">
                    <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=sell" class="pay_sale_due"><i class="fa fa-credit-card" aria-hidden="true"></i>@lang("contact.pay_due_amount")</a></li>
                @if(($total_sell_return - $sell_return_paid)  > 0)
                    <li><a href="{{action(\'TransactionPaymentController@getPayContactDue\', [$id])}}?type=sell_return" class="pay_purchase_due"><i class="fa fa-credit-card" aria-hidden="true"></i>@lang("lang_v1.pay_sell_return_due")</a></li>
                @endif
                <li><a href="{{action(\'TransactionPaymentController@getAdvancePayment\', [$id])}}?type=advance_payment" class="pay_purchase_due"><i class="fa fa-money" aria-hidden="true"></i>@lang("lang_v1.advance_payment")</a></li>
                <li><a href="{{action(\'TransactionPaymentController@getSecurityDeposit\', [$id])}}?type=security_deposit" class="pay_purchase_due"><i class="fa fa-shield" aria-hidden="true"></i>@lang("lang_v1.security_deposit")</a></li>
                <li><a href="{{action(\'TransactionPaymentController@getRefundPayment\', [$id])}}?type=refund_payment" class="pay_purchase_due"><i class="fa fa-recycle" aria-hidden="true"></i>@lang("lang_v1.refund_cheque_return")</a></li>
                @can("customer.view")
                    <li><a href="{{action(\'ContactController@show\', [$id])}}"><i class="fa fa-eye" aria-hidden="true"></i> @lang("messages.view")</a></li>
                @endcan
                @can("customer.update")
                    <li><a href="{{action(\'ContactController@edit\', [$id])}}" class="edit_contact_button"><i class="fa fa-pencil-square-o"></i> @lang("messages.edit")</a></li>
                @endcan
                @if(!$is_default)
                @can("customer.delete")
                    <li><a href="{{action(\'ContactController@destroy\', [$id])}}" class="delete_contact_button"><i class="fa fa-trash"></i> @lang("messages.delete")</a></li>
                @endcan
                @endif
                @can("customer.view")
                    <li class="divider"></li>
                    <li>
                        <a href="{{action(\'ContactController@show\', [$id])."?view=contact_info"}}">
                            <i class="fa fa-user" aria-hidden="true"></i>
                            @lang("contact.contact_info", ["contact" => __("contact.contact") ])
                        </a>
                    </li>
                    <li>
                        <a href="{{action(\'ContactController@show\', [$id])."?view=ledger"}}">
                            <i class="fa fa-anchor" aria-hidden="true"></i>
                            @lang("lang_v1.ledger")
                        </a>
                    </li>
                    @if(in_array($type, ["both", "supplier"]))
                        <li>
                            <a href="{{action(\'ContactController@show\', [$id])."?view=purchase"}}">
                                <i class="fa fa-arrow-circle-down" aria-hidden="true"></i>
                                @lang("purchase.purchases")
                            </a>
                        </li>
                        <li>
                            <a href="{{action(\'ContactController@show\', [$id])."?view=stock_report"}}">
                                <i class="fa fa-hourglass-half" aria-hidden="true"></i>
                                @lang("report.stock_report")
                            </a>
                        </li>
                    @endif
                    @if(in_array($type, ["both", "customer"]))
                        <li>
                            <a href="{{action(\'ContactController@show\', [$id])."?view=sales"}}">
                                <i class="fa fa-arrow-circle-up" aria-hidden="true"></i>
                                @lang("sale.sells")
                            </a>
                        </li>
                    @endif
                    <li>
                        <a href="{{action(\'ContactController@show\', [$id])."?view=references"}}">
                            <i class="fa fa-link" aria-hidden="true"></i>
                             @lang("lang_v1.references")
                        </a>
                    </li>
                    <li>
                        <a href="{{action(\'ContactController@show\', [$id])."?view=documents_and_notes"}}">
                            <i class="fa fa-paperclip" aria-hidden="true"></i>
                             @lang("lang_v1.documents_and_notes")
                        </a>
                    </li>
                    <li>
                        <a href="{{action(\'ContactController@toggleActivate\', [$id])}}">
                        @if($active)
                            <i class="fa fa-times" aria-hidden="true"></i>
                            @lang("lang_v1.deactivate")
                        @else
                            <i class="fa fa-check" aria-hidden="true"></i>
                            @lang("lang_v1.activate")
                        @endif
                        </a>
                    </li>
                @endcan
                </ul></div>'
            )
            ->editColumn('due', function ($row) {
                /*$paid_opening_balance = !empty($row->opening_balance_paid) ? $row->opening_balance_paid : 0;
                $opening_balance = !empty($row->opening_balance) ? $row->opening_balance : 0;
                $balance_value = $opening_balance - ($paid_opening_balance);
                $html = '<span class="display_currency ob" data-currency_symbol="true" data-orig-value="' . $balance_value . '">' . $balance_value . '</span>';*/
                $contact_id = $row->id;
                // $ledger_details = $this->__getLedgerDetails($row->id, $start_date, $end_date);
                $details = $this->get_cus_due_bal($contact_id, false);
                $html = '<h5 class="display_currency due" data-currency_symbol="true" data-orig-value="' .  $details . '">' . $details . '</h5>';
                return $html;
            })

            ->editColumn('credit_limit', function ($row) {
                $html = __('lang_v1.no_limit');
                if (!is_null($row->credit_limit)) {
                    $html = '<span class="display_currency" data-currency_symbol="true" data-orig-value="' . $row->credit_limit . '">' . $row->credit_limit . '</span>';
                }
                return $html;
            })
            ->addColumn('mass_delete', function ($row) {
                return  '<input type="checkbox" class="row-select" value="' . $row->id . '">';
            })
            ->editColumn('pay_term', '
                @if(!empty($pay_term_type) && !empty($pay_term_number))
                    {{$pay_term_number}}
                    @lang("lang_v1.".$pay_term_type)
                @endif
            ')
            // ->editColumn('total_rp', '{{$total_rp ?? 0}}')
            // ->editColumn('address', '')
            // ->editColumn('email', '')
            // ->editColumn('tax_number', '')
            ->editColumn('created_at',  function ($row){
                $ob_transaction = Transaction::where('type', 'opening_balance')->where('contact_id', $row->id)->first();
                if(!empty($ob_transaction)){
                    return $this->transactionUtil->format_date($ob_transaction->transaction_date);
                }
                return $this->transactionUtil->format_date($row->created_at);
            })
            ->removeColumn('type')
            ->removeColumn('id')
            ->removeColumn('is_default')
            ->removeColumn('total_sell_return')
            ->removeColumn('sell_return_paid');
            return $contacts->rawColumns(['action','due', 'credit_limit', 'pay_term',  'return_due', 'mass_delete'])
            ->make(true);
    }

    public function get_outstanding(){
        if (!auth()->user()->can('customer.view')) {
            abort(403, 'Unauthorized action.');
        }

        $business_id = request()->session()->get('user.business_id');
        $contacts = Contact::where('contacts.business_id', $business_id)
        ->where('contacts.is_property', 0)
        ->onlyCustomers()
        ->groupBy('contacts.id')->pluck('contacts.id');

        $total_outstanding = $total_overpayment = 0;
        foreach($contacts as $contact) {
            $dueAmt = $this->get_cus_due_bal($contact, false);
            if ((int)$dueAmt > 0) {
                $total_outstanding += $dueAmt;
            } else {
                $total_overpayment += $dueAmt;
            }
        }

        return response([
            'total_outstanding' => $total_outstanding,
            'total_overpayment' => abs($total_overpayment)
        ]);
    }

    public function get_cus_due_bal($contact_id, $todayOnly = true)
    {
        $start_date = $todayOnly ? date('Y-m-d') : (new \DateTime('first day of january'))->format('Y-m-d');
        $end_date = date('Y-m-d');
        $business_id = request()->session()->get('user.business_id');

        // ONLY SHOW OPENING BALANCE WHEN NO SALES AND PAYMENT
        $opening_balance_new = DB::select("select `cl`.`amount` as opening_balance
            from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
            where `cl`.`contact_id` = " . $contact_id . "
            and `cl`.`type` = 'debit'
            and `t`.`business_id` = " . $business_id . "
            and `t`.`type` = 'opening_balance'
            order by `cl`.`operation_date` limit 2"
        );

        $total_sell = DB::select("select
            sum(`cl`.`amount`) as total_sell
            from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
            where `cl`.`contact_id` =  " . $contact_id . "
            and `cl`.`type` = 'debit'
            and `t`.`type` != 'opening_balance'
            and `t`.`business_id` = " . $business_id . "
            group by `cl`.`id` and `cl`.`contact_id` "
        );

        $ledger_details['total_invoice'] = count($total_sell) > 0 ? $total_sell[0]->total_sell : 0;
        $query = ContactLedger::where('contact_ledgers.contact_id', $contact_id)
        ->where('contact_ledgers.type','credit')
        ->select(
            'contact_ledgers.type',
            'contact_ledgers.amount'
        )->groupBy('contact_ledgers.id')->orderBy('contact_ledgers.id', 'asc');
        $query->orderby('contact_ledgers.operation_date');
        $ledger_transactions = $query->get();
        $total_paid = $skipped_cr = 0;
        foreach($ledger_transactions->toArray() as $val) {
            if($val['type'] == 'credit') {
                $amount = $val['amount'];
                $total_paid = $total_paid + $amount;
            }
        }
        $ledger_details['beginning_balance'] = count($opening_balance_new) > 0 ? $opening_balance_new[0]->opening_balance : 0;
        $ledger_details['balance_due'] = $ledger_details['beginning_balance'] + $ledger_details['total_invoice'] -$total_paid;

        return  $ledger_details['balance_due'];
    }
    public function get_due_bal($contact_id, $todayOnly = true)
    {
        $start_date = $todayOnly ? date('Y-m-d') : (new \DateTime('first day of january'))->format('Y-m-d');
        $end_date = date('Y-m-d');

        $business_id = request()->session()->get('user.business_id');
        $asset_account_id = Account::leftjoin('account_types', 'accounts.account_type_id', 'accounts.id')
            ->where('account_types.name', 'like', '%Assets%')
            ->where('accounts.business_id', $business_id)
            ->pluck('accounts.id')->toArray();
        $contact = Contact::find($contact_id);
        $opening_balance = Transaction::where('contact_id', $contact_id)->where('type', 'opening_balance')->where('payment_status', 'due')->sum('final_total');

        if ($contact->type == 'customer') {
            // ONLY SHOW OPENING BALANCE WHEN NO SALES AND PAYMENT
            $opening_amount = '';
            $opening_balance_new = DB::select("select `cl`.`amount` as opening_balance
                from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
                left join `business_locations` bl on `t`.`location_id` = `bl`.`id`
                where `cl`.`contact_id` = " . $contact_id . "
                and `cl`.`type` = 'debit'
                and `t`.`business_id` = " . $business_id . "
                and `t`.`type` = 'opening_balance'
                and date(`cl`.`operation_date`) >= '" . $start_date . "'
                and date(`cl`.`operation_date`) <= '" . $end_date . "'
                order by `cl`.`operation_date` limit 2");

            if (count($opening_balance_new) <= 1) {
                $opening_amount =  DB::select("select (select(0 - IFNULL(amount,0))) as opening_balance from `contact_ledgers` where contact_id = '$contact_id' order by created_at ASC limit 1");
                if (count($opening_balance_new) == 0) {
                    $opening_balance_new = DB::select(" select ( select
                    sum(`bc_cl`.`amount`) as total_paid
                    from `contact_ledgers` bc_cl left join `transactions` bc_t on `bc_cl`.`transaction_id` = `bc_t`.`id`
                    left join `business_locations` bc_bl on `bc_t`.`location_id` = `bc_bl`.`id`
                    where `bc_cl`.`contact_id` =  " . $contact_id . "
                    and `bc_cl`.`type` = 'credit'
                    and `bc_t`.`business_id` = " . $business_id . "
                    and date(`bc_cl`.`operation_date`)  <= '" . $start_date . "'
                    group by `bc_cl`.`id` and `bc_cl`.`contact_id` order by bc_cl.operation_date) as before_purchase,
                    (select sum(`cl`.`amount`)
                    from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
                    left join `business_locations` bl on `t`.`location_id` = `bl`.`id`
                        where `cl`.`contact_id` = " . $contact_id . "
                        and `cl`.`type` = 'debit'
                        and `t`.`business_id` = " . $business_id . "
                        and date(`cl`.`operation_date`) < '" . $start_date . "'
                        group by `cl`.`id` and `cl`.`contact_id` order by cl.operation_date)  as before_sell,
                    (select(IFNULL(before_sell,0) - IFNULL(before_purchase,0))) as opening_balance");
                }
            }

            $total_sell = DB::select("select
                sum(`bc_cl`.`amount`) as total_sell
                from `contact_ledgers` bc_cl left join `transactions` bc_t on `bc_cl`.`transaction_id` = `bc_t`.`id`
                left join `business_locations` bc_bl on `bc_t`.`location_id` = `bc_bl`.`id`
                where `bc_cl`.`contact_id` =  " . $contact_id . "
                and `bc_cl`.`type` = 'debit'
                and `bc_t`.`type` != 'opening_balance'
                and `bc_t`.`business_id` = " . $business_id . "
                and date(`bc_cl`.`operation_date`)  >= '" . $start_date . "'
                and date(`bc_cl`.`operation_date`)  <= '" . $end_date . "'
                group by `bc_cl`.`id` and `bc_cl`.`contact_id` ");

            $ledger_details['total_invoice'] = count($total_sell) > 0 ? $total_sell[0]->total_sell : 0;
            $ledger_details['opening'] = $opening_amount;
            $query = ContactLedger::leftjoin('transactions', 'contact_ledgers.transaction_id', 'transactions.id')
                ->leftjoin('business_locations', 'transactions.location_id', 'business_locations.id')
                ->leftjoin('transaction_payments', 'contact_ledgers.transaction_payment_id', 'transaction_payments.id')
                ->where('contact_ledgers.contact_id', $contact_id)
                ->where('transactions.business_id', $business_id)
                ->select(
                    'contact_ledgers.*',
                    'contact_ledgers.type as acc_transaction_type',
                    'business_locations.name as location_name',
                    'transactions.sub_type as t_sub_type',
                    'transactions.final_total',
                    'transactions.ref_no',
                    'transactions.invoice_no',
                    'transactions.is_direct_sale',
                    'transactions.is_credit_sale',
                    'transactions.is_settlement',
                    'transactions.transaction_date',
                    'transactions.payment_status',
                    'transactions.pay_term_number',
                    'transactions.pay_term_type',
                    'transactions.type as transaction_type',
                    'transaction_payments.method as payment_method',
                    'transaction_payments.transaction_id as tp_transaction_id',
                    'transaction_payments.paid_on',
                    'transaction_payments.bank_name',
                    'transaction_payments.cheque_date',
                    'transaction_payments.cheque_number'
                )->groupBy('contact_ledgers.id')->orderBy('contact_ledgers.id', 'asc');
        }

        if (!empty($start_date)  && !empty($end_date)) {
            $query->whereDate('contact_ledgers.operation_date', '>=', $start_date);
            $query->whereDate('contact_ledgers.operation_date', '<=', $end_date);
        }

        $query->orderby('contact_ledgers.operation_date');
        $ledger_transactions = $query->get();
        if ($contact->type == 'customer') {
            $total_paid = $skipped_cr = 0;
            $dateTimestamp1 = date('Y-m-d',strtotime($contact->created_at));
            foreach($ledger_transactions->toArray() as $val) {
                if($val['acc_transaction_type'] == 'credit') {
                    if(!empty($val['transaction_payment_id'])) {
                        $transaction_payment = TransactionPayment::where('id', $val['transaction_payment_id'])->withTrashed()->first();
                    }
                    $amount = 0;
                    if(!empty($transaction_payment)){
                        if(empty($transaction_payment->transaction_id)){
                            // if empty then it will be parent payment
                            // show parent transaction payment amount
                            $amount = $transaction_payment->amount;
                        }else{
                            // get the amount from contact ledger if not a payment
                            $amount = $val['amount'];
                        }
                    }else{
                        $amount = $val['amount'];
                    }
                    if($val['transaction_type'] == 'opening_balance' ){
                        $dateTimestamp1 = date('Y-m-d',strtotime($val['transaction_date'])) ;
                        $skipped_cr += $amount;
                        continue;
                    }
                    $total_paid = $total_paid + $amount;
                }
            }
            $ledger_details['total_paid'] = $total_paid;
            $ledger_details['bf_balance'] = $ledger_details['beginning_balance'] = count($opening_balance_new) > 0 ? $opening_balance_new[0]->opening_balance : 0;
            $ledger_details['balance'] = $ledger_details['balance_due'] = $ledger_details['beginning_balance'] + $ledger_details['total_invoice'] - ($ledger_details['total_paid']);
            if(!empty($start_date) && $dateTimestamp1 >= $start_date){
                $ledger_details['bf_balance'] = 0;
                $ledger_details['balance'] = 0;
            }
            if(!empty($start_date) && $dateTimestamp1 > $start_date){
                // echo "Inside Con<br>";
                $ledger_details['beginning_balance'] =0;
                $ledger_details['balance_due'] -=  $skipped_cr ;
            }

            return  $ledger_details['balance_due'];
        }
        return 0;
    }
    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }
        $type = request()->type;
        $business_id = request()->session()->get('user.business_id');
        //Check if subscribed or not
        if (!$this->moduleUtil->isSubscribed($business_id)) {
            return $this->moduleUtil->expiredResponse();
        }
        $types = [];
        if (auth()->user()->can('supplier.create')) {
            $types['supplier'] = __('report.supplier');
        }
        if (auth()->user()->can('customer.create')) {
            $types['customer'] = __('report.customer');
        }
        if (auth()->user()->can('supplier.create') && auth()->user()->can('customer.create')) {
            $types['both'] = __('lang_v1.both_supplier_customer');
        }
        $customer_groups = ContactGroup::forDropdown($business_id);
        $supplier_groups = ContactGroup::forDropdown($business_id, true, false, 'supplier');
        $contact_id = $this->businessUtil->check_customer_code($business_id);
        return view('contact.create')
            ->with(compact('types', 'customer_groups', 'supplier_groups', 'contact_id', 'type'));
    }
    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }
        try {
            // $input['property_id']=$request->property_id;
            $business_id = $request->session()->get('user.business_id');
            if (!$this->moduleUtil->isSubscribed($business_id)) {
                return $this->moduleUtil->expiredResponse();
            }
            DB::beginTransaction();
            if ($request->type == 'customer') {
                if (!$this->moduleUtil->isQuotaAvailable('customers', $business_id)) {
                    return $this->moduleUtil->quotaExpiredResponse('customers', $business_id, action('ContactController@index'));
                }
                if (!empty($request->password)) {
                    if(isset($request->image) || isset($request->signature)){
                        $validator = Validator::make($request->all(), [
                            'password' => 'required|min:4|max:255',
                            'confirm_password' => 'required|same:password',
                            'image' => 'required|mimes:jpeg,png,jpg,gif,svg|max:2048',
                            'signature' => 'required|mimes:jpeg,png,jpg,gif,svg|max:2048',
                        ]);
                    }else{
                        $validator = Validator::make($request->all(), [
                            'password' => 'required|min:4|max:255',
                            'confirm_password' => 'required|same:password',
                        ]);
                    }
                    if ($validator->fails()) {
                        $output = [
                            'success' => false,
                            'msg' => 'Password does not match'
                        ];
                        return $output;
                    }
                }
                $customer_data = array(
                    'business_id' => $business_id,
                    'first_name' => $request->name,
                    'last_name' => '',
                    'email' => $request->email,
                    'username' => $request->contact_id,
                    'password' => Hash::make($request->password),
                    'mobile' => $request->mobile ?? ' ',
                    'contact_number' => $request->alternate_number,
                    'landline' => $request->landline,
                    'geo_location' => '',
                    'address' => $request->city ?? ' ',
                    'town' => $request->state ?? ' ',
                    'district' => $request->country ?? ' ',
                    'is_company_customer' => 1
                );
                Customer::create($customer_data);
            }
            $input = $request->only([
                'type', 'supplier_business_name',
                'name', 'pay_term_number', 'pay_term_type', 'mobile', 'landline', 'alternate_number', 'city', 'state', 'country', 'landmark', 'customer_group_id', 'supplier_group_id', 'contact_id', 'custom_field1', 'custom_field2', 'custom_field3', 'custom_field4', 'email'
            ]);
            $input['business_id'] = $business_id;
            $input['created_by'] = $request->session()->get('user.id');
            $input['credit_limit'] = $request->input('credit_limit') != '' ? $this->commonUtil->num_uf($request->input('credit_limit')) : null;
            if ($request->transaction_date && $request->type == 'supplier') {
                $input['created_at'] = date('Y-m-d H:i:s', strtotime($request->transaction_date));
            }
            //Check Contact id
            $count = 0;
            if (!empty($input['contact_id'])) {
                $count = Contact::where('business_id', $input['business_id'])
                    ->where('contact_id', $input['contact_id'])
                    ->count();
            }
            if ($count == 0) {
                //Update reference count
                $ref_count = $this->commonUtil->setAndGetReferenceCount('contacts');
                if (empty($input['contact_id'])) {
                    //Generate reference number
                    $input['contact_id'] = $this->commonUtil->generateReferenceNumber('contacts', $ref_count);
                }
                $input['is_property']=$request->property_id_value;
                if($request->hasFile('image')){
                    $imageName = Media::uploadFile($request->file('image'));
                    $input['image']=$imageName;
                }if($request->hasFile('signature')){
                    $signatureName = Media::uploadFile($request->file('signature'));
                    $input['signature']=$signatureName;
                }
                $contact = Contact::create($input);
                //Add opening balance
                if (!empty($request->input('opening_balance'))) {
                    $this->transactionUtil->createOpeningBalanceTransaction($business_id, $contact->id, $request->input('opening_balance'), $request->transaction_date);
                }
                $output = [
                    'success' => true,
                    'data' => $contact,
                    'msg' => __("contact.added_success")
                ];
            } else {
                throw new \Exception("Error Processing Request", 1);
            }
            DB::commit();
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $output = [
                'success' => false,
                'msg' => __("messages.something_went_wrong")
            ];
        }
        return $output;
    }
    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        if (!auth()->user()->can('supplier.view') && !auth()->user()->can('customer.view')) {
            abort(403, 'Unauthorized action.');
        }
        $business_id = request()->session()->get('user.business_id');
        $contact = Contact::where('contacts.id', $id)
            ->where('contacts.business_id', $business_id)
            ->join('transactions AS t', 'contacts.id', '=', 't.contact_id')
            ->with(['business'])
            ->select(
                DB::raw("SUM(IF(t.type = 'purchase', final_total, 0)) as total_purchase"),
                DB::raw("SUM(IF(t.type = 'sell' AND t.status = 'final', final_total, 0)) as total_invoice"),
                DB::raw("SUM(IF(t.type = 'sell' AND t.status = 'final' AND t.payment_status != 'paid', final_total, 0)) as total_sale_due"),
                DB::raw("SUM(IF(t.type = 'purchase', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as purchase_paid"),
                DB::raw("SUM(IF(t.type = 'sell' AND t.status = 'final', (SELECT SUM(IF(is_return = 1,-1*amount,amount)) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as invoice_received"),
                DB::raw("SUM(IF(t.type = 'opening_balance', final_total, 0)) as opening_balance"),
                DB::raw("SUM(IF(t.type = 'opening_balance', (SELECT SUM(amount) FROM transaction_payments WHERE transaction_payments.transaction_id=t.id), 0)) as opening_balance_paid"),
                'contacts.*'
            )->first();
        $reward_enabled = (request()->session()->get('business.enable_rp') == 1 && in_array($contact->type, ['customer', 'both'])) ? true : false;
        $contact_dropdown = Contact::contactDropdown($business_id, false, false);
        $references = CustomerReference::where('business_id', $business_id)->where('contact_id', $id)->pluck('reference', 'reference');
        $business_locations = BusinessLocation::forDropdown($business_id, true);
        //get contact view type : ledger, notes etc.
        $view_type = request()->get('view');
        if (is_null($view_type)) {
            $view_type = 'contact_info';
        }
        // dd($contact);

        $transaction_amounts = ContactLedger::where('contact_id', $id)->distinct('amount')->pluck('amount');

        return view('contact.show')
            ->with(compact('contact', 'reward_enabled', 'contact_dropdown', 'business_locations', 'view_type', 'references', 'transaction_amounts'));
    }
    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        if (!auth()->user()->can('supplier.update') && !auth()->user()->can('customer.update')) {
            abort(403, 'Unauthorized action.');
        }
        if (request()->ajax()) {
            $business_id = request()->session()->get('user.business_id');
            $contact = Contact::where('business_id', $business_id)->find($id);
            if (!$this->moduleUtil->isSubscribed($business_id)) {
                return $this->moduleUtil->expiredResponse();
            }
            $types = [];
            if (auth()->user()->can('supplier.create')) {
                $types['supplier'] = __('report.supplier');
            }
            if (auth()->user()->can('customer.create')) {
                $types['customer'] = __('report.customer');
            }
            if (auth()->user()->can('supplier.create') && auth()->user()->can('customer.create')) {
                $types['both'] = __('lang_v1.both_supplier_customer');
            }
            $customer_groups = ContactGroup::forDropdown($business_id);
            $supplier_groups = ContactGroup::forDropdown($business_id, true, false, 'supplier');
            $ob_transaction =  Transaction::where('contact_id', $id)
                ->where('type', 'opening_balance')
                ->first();
            $opening_balance = !empty($ob_transaction->final_total) ? $ob_transaction->final_total : 0;
            //Deduct paid amount from opening balance.
            if (!empty($opening_balance)) {
                $opening_balance_paid = $this->transactionUtil->getTotalAmountPaid($ob_transaction->id);
                if (!empty($opening_balance_paid)) {
                    $opening_balance = $opening_balance - $opening_balance_paid;
                }
                $opening_balance = $this->commonUtil->num_f($ob_transaction->final_total);
            }
            return view('contact.edit')
                ->with(compact('contact', 'types', 'customer_groups', 'supplier_groups', 'opening_balance', 'ob_transaction'));
        }
    }
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        if (!auth()->user()->can('supplier.update') && !auth()->user()->can('customer.update')) {
            abort(403, 'Unauthorized action.');
        }
        if (request()->ajax()) {
            try {                                                                              // removed below line
                $input = $request->only(['contact_id', 'type', 'supplier_business_name', 'name', 'tax_number', 'pay_term_number', 'pay_term_type', 'mobile', 'landline', 'alternate_number', 'city', 'state', 'country', 'landmark', 'customer_group_id', 'supplier_group_id', 'custom_field1', 'custom_field2', 'custom_field3', 'custom_field4', 'email']);
                $input['credit_limit'] = $request->input('credit_limit') != '' ? $this->commonUtil->num_uf($request->input('credit_limit')) : null;
                $business_id = $request->session()->get('user.business_id');
                if (!$this->moduleUtil->isSubscribed($business_id)) {
                    return $this->moduleUtil->expiredResponse();
                }
                $contact_user = User::where('username', $input['contact_id'])->first();
                if (request()->type == 'customer') {
                    if (!empty(request()->password)) {
                        $validator = Validator::make(request()->all(), [
                            'password' => 'required|min:4|max:255',
                            'confirm_password' => 'required|same:password'
                        ]);
                        if ($validator->fails()) {
                            $output = [
                                'success' => false,
                                'msg' => 'Password does not match'
                            ];
                            return $output;
                        }
                    }
                    if (empty($contact_user)) {
                        if (!$this->moduleUtil->isQuotaAvailable('customers', $business_id)) {
                            return $this->moduleUtil->quotaExpiredResponse('customers', $business_id, action('ContactController@index'));
                        }
                        // it is company customer
                        $customer_details = request()->only(['email', 'password']);
                        $customer_details['language'] = env('APP_LOCALE');
                        $customer_details['surname'] = '';
                        $customer_details['first_name'] = request()->name;
                        $customer_details['last_name'] = '';
                        $customer_details['username'] = request()->contact_id;
                        $customer_details['is_customer'] = 1;
                        $customer_details['business_id'] = $business_id;
                        if (!empty(request()->password)) {
                            $customer_details['password'] = Hash::make(request()->password);
                        }
                        $user = User::create_user($customer_details);
                        $user->business_id = $business_id;
                        $user->is_customer = 1;
                        $enable_customer_login = System::getProperty('enable_customer_login');
                        if (!$enable_customer_login) {
                            $user->status = 'inactive';
                        }
                        $user->save();
                    } else {
                        $contact_user->first_name = request()->name;
                        if (!empty(request()->password)) {
                            $contact_user->password = Hash::make(request()->password);
                        }
                        $contact_user->save();
                    }
                }
                $count = 0;
                //Check Contact id
                if (!empty($input['contact_id'])) {
                    $count = Contact::where('business_id', $business_id)
                        ->where('contact_id', $input['contact_id'])
                        ->where('id', '!=', $id)
                        ->count();
                }
                if ($count == 0) {
                    $contact = Contact::where('business_id', $business_id)->findOrFail($id);
                    foreach ($input as $key => $value) {
                        $contact->$key = $value;
                    }
                    $contact->save();
                    //Get opening balance if exists
                    $ob_transaction =  Transaction::where('contact_id', $id)
                        ->where('type', 'opening_balance')
                        ->first();
                    if (!empty($ob_transaction)) {
                        $amount = $this->commonUtil->num_uf($request->input('opening_balance'));
                        // $opening_balance_paid = $this->transactionUtil->getTotalAmountPaid($ob_transaction->id);
                        // if (!empty($opening_balance_paid)) {
                        //     $amount -= $opening_balance_paid;
                        // }
                        $ob_transaction->final_total = $amount;
                        $ob_transaction->transaction_date = $this->transactionUtil->uf_date($request->transaction_date);
                        $ob_transaction->save();
                        $payable_account_id = $this->transactionUtil->account_exist_return_id('Accounts Payable');
                        $receivealbe_account_id = $this->transactionUtil->account_exist_return_id('Accounts Receivable');
                        $account_transaction = AccountTransaction::where('transaction_id', $ob_transaction->id)->whereIn('account_id', [$payable_account_id, $receivealbe_account_id])->first();
                        $account_transaction->amount = $ob_transaction->final_total;
                        $account_transaction->save();
                        $contact_ledger_trnsaction = ContactLedger::where('transaction_id', $ob_transaction->id)->first();
                        $contact_ledger_trnsaction->amount = $ob_transaction->final_total;
                        $contact_ledger_trnsaction->save();
                        //Update opening balance payment status
                        $this->transactionUtil->updatePaymentStatus($ob_transaction->id, $ob_transaction->final_total);
                    } else {
                        //Add opening balance
                        if (!empty($request->input('opening_balance'))) {
                            $this->transactionUtil->createOpeningBalanceTransaction($business_id, $contact->id, $request->input('opening_balance'));
                        }
                    }
                    $output = [
                        'success' => true,
                        'msg' => __("contact.updated_success")
                    ];
                } else {
                    throw new \Exception("Error Processing Request", 1);
                }
            } catch (\Exception $e) {
                Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                $output = [
                    'success' => false,
                    'msg' => __("messages.something_went_wrong")
                ];
            }
            return $output;
        }
    }
    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        if (!auth()->user()->can('supplier.delete') && !auth()->user()->can('customer.delete')) {
            abort(403, 'Unauthorized action.');
        }
        if (request()->ajax()) {
            try {
                $business_id = request()->user()->business_id;
                //Check if any transaction related to this contact exists
                $count = Transaction::where('business_id', $business_id)
                    ->where('contact_id', $id)->where('final_total', '>', 0)
                    ->count();
                if ($count == 0) {
                    $contact = Contact::where('business_id', $business_id)->findOrFail($id);
                    $transactions = Transaction::where('business_id', $business_id)
                        ->where('contact_id', $id)->get();
                    foreach ($transactions as $transaction) {
                        AccountTransaction::where('transaction_id', $transaction->id)->forcedelete();
                        $transaction->delete();
                    }
                    if (!$contact->is_default) {
                        $contact->delete();
                    }
                    $output = [
                        'success' => true,
                        'msg' => __("contact.deleted_success")
                    ];
                } else {
                    $output = [
                        'success' => false,
                        'msg' => __("lang_v1.you_cannot_delete_this_contact")
                    ];
                }
            } catch (\Exception $e) {
                Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
                $output = [
                    'success' => false,
                    'msg' => __("messages.something_went_wrong")
                ];
            }
            return $output;
        }
    }
    /**
     * Mass deletes contact.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function massDestroy(Request $request)
    {
        if (!auth()->user()->can('product.delete')) {
            abort(403, 'Unauthorized action.');
        }
        try {
            $purchase_exist = false;
            if (!empty($request->input('selected_rows'))) {
                $business_id = $request->session()->get('user.business_id');
                $selected_rows = explode(',', $request->input('selected_rows'));
                $contacts = Contact::where('business_id', $business_id)
                    ->whereIn('id', $selected_rows)
                    ->get();
                DB::beginTransaction();
                $not_deleted_contact = []; // not deleted contact names
                foreach ($contacts  as $contact) {
                    $transactions = Transaction::where('contact_id', $contact->id)->whereIn('type', ['sell', 'purchase'])->where('deleted_at', null)->first();
                    if (!empty($transactions)) {
                        array_push($not_deleted_contact, $contact->name);
                    } else {
                        $contact->delete();
                    }
                }
                DB::commit();
            }
            if (empty($not_deleted_contact)) {
                $output = [
                    'success' => 1,
                    'msg' => __('lang_v1.deleted_success')
                ];
            } else {
                $not_deleted_contact_name =  implode(',', $not_deleted_contact);
                $output = [
                    'success' => 0,
                    'msg' => __('lang_v1.contacts') . ' ' . $not_deleted_contact_name . ' ' . __('lang_v1.contact_could_not_be_deleted')
                ];
            }
        } catch (\Exception $e) {
            DB::rollBack();
            \Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $output = [
                'success' => 0,
                'msg' => __("messages.something_went_wrong")
            ];
        }
    }
    /**
     * Retrieves list of customers, if filter is passed then filter it accordingly.
     *
     * @param  string  $q
     * @return JSON
     */
    public function getCustomers()
    {
        if (request()->ajax()) {
            $term = request()->input('q', '');
            $business_id = request()->session()->get('user.business_id');
            $user_id = request()->session()->get('user.id');
            $contacts = Contact::where('business_id', $business_id)->where('active', 1);
            $selected_contacts = User::isSelectedContacts($user_id);
            if ($selected_contacts) {
                $contacts->join('user_contact_access AS uca', 'contacts.id', 'uca.contact_id')
                    ->where('uca.user_id', $user_id);
            }
            if (!empty($term)) {
                $contacts->where(function ($query) use ($term) {
                    $query->where('name', 'like', '%' . $term . '%')
                        ->orWhere('supplier_business_name', 'like', '%' . $term . '%')
                        ->orWhere('mobile', 'like', '%' . $term . '%')
                        ->orWhere('contacts.contact_id', 'like', '%' . $term . '%');
                });
            }
            $contacts->select(
                'contacts.id',
                DB::raw("IF(contacts.contact_id IS NULL OR contacts.contact_id='', name, CONCAT(name, ' (', contacts.contact_id, ')')) AS text"),
                'mobile',
                'landmark',
                'city',
                'state',
                'pay_term_number',
                'pay_term_type'
            )
                ->onlyCustomers();
            if (request()->session()->get('business.enable_rp') == 1) {
                $contacts->addSelect('total_rp');
            }
            $contacts = $contacts->get();
            return json_encode($contacts);
        }
    }
    /**
     * Retrieves list of customers, if filter is passed then filter it accordingly.
     *
     * @param  string  $q
     * @return JSON
     */
    public function getSuppliers()
    {
        if (request()->ajax()) {
            $term = request()->input('q', '');
            $business_id = request()->session()->get('user.business_id');
            $user_id = request()->session()->get('user.id');
            $contacts = Contact::where('business_id', $business_id)->where('active', 1);
            $selected_contacts = User::isSelectedContacts($user_id);
            if ($selected_contacts) {
                $contacts->join('user_contact_access AS uca', 'contacts.id', 'uca.contact_id')
                    ->where('uca.user_id', $user_id);
            }
            if (!empty($term)) {
                $contacts->where(function ($query) use ($term) {
                    $query->where('name', 'like', '%' . $term . '%')
                        ->orWhere('supplier_business_name', 'like', '%' . $term . '%')
                        ->orWhere('mobile', 'like', '%' . $term . '%')
                        ->orWhere('contacts.contact_id', 'like', '%' . $term . '%');
                });
            }
            $contacts->select(
                'contacts.id',
                DB::raw("IF(contacts.contact_id IS NULL OR contacts.contact_id='', name, CONCAT(name, ' (', contacts.contact_id, ')')) AS text"),
                'mobile',
                'landmark',
                'city',
                'state',
                'pay_term_number',
                'pay_term_type'
            )
                ->onlySuppliers();
            if (request()->session()->get('business.enable_rp') == 1) {
                $contacts->addSelect('total_rp');
            }
            $contacts = $contacts->get();
            return json_encode($contacts);
        }
    }
    /**
     * Checks if the given contact id already exist for the current business.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function checkContactId(Request $request)
    {
        $contact_id = $request->input('contact_id');
        $valid = 'true';
        if (!empty($contact_id)) {
            $business_id = $request->session()->get('user.business_id');
            $hidden_id = $request->input('hidden_id');
            $query = Contact::where('business_id', $business_id)
                ->where('contact_id', $contact_id);
            if (!empty($hidden_id)) {
                $query->where('id', '!=', $hidden_id);
            }
            $count = $query->count();
            if ($count > 0) {
                $valid = 'false';
            }
        }
        echo $valid;
        exit;
    }
    /**
     * Shows import option for contacts
     *
     * @param  \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function getImportContacts()
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }
        $zip_loaded = extension_loaded('zip') ? true : false;
        //Check if zip extension it loaded or not.
        if ($zip_loaded === false) {
            $output = [
                'success' => 0,
                'msg' => 'Please install/enable PHP Zip archive for import'
            ];
            return view('contact.import')
                ->with('notification', $output);
        } else {
            return view('contact.import');
        }
    }
    /**
     * Imports contacts
     *
     * @param  \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function postImportContacts(Request $request)
    {
        if (!auth()->user()->can('supplier.create') && !auth()->user()->can('customer.create')) {
            abort(403, 'Unauthorized action.');
        }
        try {
            $notAllowed = $this->commonUtil->notAllowedInDemo();
            if (!empty($notAllowed)) {
                return $notAllowed;
            }
            //Set maximum php execution time
            ini_set('max_execution_time', 0);
            if ($request->hasFile('contacts_csv')) {
                $file = $request->file('contacts_csv');
                $parsed_array = Excel::toArray([], $file);
                //Remove header row
                $imported_data = array_splice($parsed_array[0], 1);
                $business_id = $request->session()->get('user.business_id');
                $user_id = $request->session()->get('user.id');
                $formated_data = [];
                $is_valid = true;
                $error_msg = '';
                DB::beginTransaction();
                foreach ($imported_data as $key => $value) {
                    //Check if 26 no. of columns exists
                    if (count($value) != 26) {
                        $is_valid =  false;
                        $error_msg = "Number of columns mismatch";
                        break;
                    }
                    $row_no = $key + 1;
                    $contact_array = [];
                    //Check contact type
                    $contact_type = '';
                    $contact_types = [
                        1 => 'customer',
                        2 => 'supplier',
                        3 => 'both'
                    ];
                    if (!empty($value[0])) {
                        $contact_type = strtolower(trim($value[0]));
                        if (in_array($contact_type, [1, 2, 3])) {
                            $contact_array['type'] = $contact_types[$contact_type];
                        } else {
                            $is_valid =  false;
                            $error_msg = "Invalid contact type in row no. $row_no";
                            break;
                        }
                    } else {
                        $is_valid =  false;
                        $error_msg = "Contact type is required in row no. $row_no";
                        break;
                    }
                    //Check contact name
                    if (!empty($value[1])) {
                        $contact_array['name'] = $value[1];
                    } else {
                        $is_valid =  false;
                        $error_msg = "Contact name is required in row no. $row_no";
                        break;
                    }
                    //Check supplier fields
                    if (in_array($contact_type, ['supplier', 'both'])) {
                        //Check business name
                        if (!empty(trim($value[2]))) {
                            $contact_array['supplier_business_name'] = $value[2];
                        } else {
                            $is_valid =  false;
                            $error_msg = "Business name is required in row no. $row_no";
                            break;
                        }
                        //Check pay term
                        if (trim($value[6]) != '') {
                            $contact_array['pay_term_number'] = trim($value[6]);
                        } else {
                            $is_valid =  false;
                            $error_msg = "Pay term is required in row no. $row_no";
                            break;
                        }
                        //Check pay period
                        $pay_term_type = strtolower(trim($value[7]));
                        if (in_array($pay_term_type, ['days', 'months'])) {
                            $contact_array['pay_term_type'] = $pay_term_type;
                        } else {
                            $is_valid =  false;
                            $error_msg = "Pay term period is required in row no. $row_no";
                            break;
                        }
                    }
                    //Check contact ID
                    if (!empty(trim($value[3]))) {
                        $count = Contact::where('business_id', $business_id)
                            ->where('contact_id', $value[3])
                            ->count();
                        if ($count == 0) {
                            $contact_array['contact_id'] = $value[3] . '-' . $business_id;
                        } else {
                            $is_valid =  false;
                            $error_msg = "Contact ID already exists in row no. $row_no";
                            break;
                        }
                    }
                    //Tax number
                    if (!empty(trim($value[4]))) {
                        $contact_array['tax_number'] = $value[4];
                    }
                    //Check opening balance
                    if (!empty(trim($value[5])) && $value[5] != 0) {
                        $contact_array['opening_balance'] = $this->productUtil->num_uf(trim($value[5]));
                    }
                    //Check credit limit
                    if (trim($value[8]) != '' && in_array($contact_type, ['customer', 'both'])) {
                        $contact_array['credit_limit'] = trim($value[8]);
                    }
                    //Check email
                    if (!empty(trim($value[9]))) {
                        if (filter_var(trim($value[9]), FILTER_VALIDATE_EMAIL)) {
                            $contact_array['email'] = $value[9];
                        } else {
                            $is_valid =  false;
                            $error_msg = "Invalid email id in row no. $row_no";
                            break;
                        }
                    }
                    //Mobile number
                    if (!empty(trim($value[10]))) {
                        $contact_array['mobile'] = $value[10];
                    } else {
                        $is_valid =  false;
                        $error_msg = "Mobile number is required in row no. $row_no";
                        break;
                    }
                    //Alt contact number
                    $contact_array['alternate_number'] = $value[11];
                    //Landline
                    $contact_array['landline'] = $value[12];
                    //City
                    $contact_array['city'] = $value[13];
                    //State
                    $contact_array['state'] = $value[14];
                    //Country
                    $contact_array['country'] = $value[15];
                    //Landmark
                    $contact_array['landmark'] = $value[16];
                    //Cust fields
                    $contact_array['custom_field1'] = $value[17];
                    $contact_array['custom_field2'] = $value[18];
                    $contact_array['custom_field3'] = $value[19];
                    $contact_array['custom_field4'] = $value[20];
                    $contact_array['transaction_date'] = \PhpOffice\PhpSpreadsheet\Shared\Date::excelToDateTimeObject($value[21]);
                    $contact_array['security_deposit'] = $value[22];
$contact_array['security_deposit_asset_account'] = $value[23];
                    $contact_array['security_deposit_liability_account'] = $value[24];
                    $contact_array['payment_account'] = $value[25];
                    $formated_data[] = $contact_array;
                }
                if (!$is_valid) {
                    throw new \Exception($error_msg);
                }
                if (!empty($formated_data)) {
                    foreach ($formated_data as $contact_data) {
                        $ref_count = $this->transactionUtil->setAndGetReferenceCount('contacts');
                        //Set contact id if empty
                        if (empty($contact_data['contact_id'])) {
                            $contact_data['contact_id'] = $this->commonUtil->generateReferenceNumber('contacts', $ref_count) . '-' . $business_id;
                        }
                        $opening_balance = 0;
                        if (isset($contact_data['opening_balance'])) {
                            $opening_balance = $contact_data['opening_balance'];
                            $transaction_date = $contact_data['transaction_date'];
                            unset($contact_data['opening_balance']);
                            unset($contact_data['transaction_date']);
                        }
                        if (isset($contact_data['transaction_date'])) {
                            $transaction_date = $contact_data['transaction_date'];
                            unset($contact_data['transaction_date']);
                        }
                        $security_deposit = 0;
                        if (isset($contact_data['security_deposit'])) {
                            $security_deposit = $contact_data['security_deposit'];
                            unset($contact_data['security_deposit']);
                        } else {
                            unset($contact_data['security_deposit']);
                        }
                        $contact_data['business_id'] = $business_id;
                        $contact_data['created_by'] = $user_id;
                        $contact = Contact::create($contact_data);
                        if (!empty($opening_balance)) {
                            $this->transactionUtil->createOpeningBalanceTransaction($business_id, $contact->id, $opening_balance, $transaction_date);
                        }
                        if (!empty($security_deposit)) {
                            $business_location = BusinessLocation::where('business_id', $business_id)->first();
                            $payment_type = 'security_deposit';
                            $final_amount = $this->transactionUtil->num_uf($security_deposit);
                            $ob_data = [
                                'business_id' => $business_id,
                                'location_id' => $business_location->id,
                                'type' => $payment_type,
                                'status' => 'final',
                                'payment_status' => 'due',
                                'contact_id' => $contact->id,
                                'transaction_date' => $transaction_date,
                                'total_before_tax' => $final_amount,
                                'final_total' => $final_amount,
                                'created_by' => request()->session()->get('user.id')
                            ];
                            //Update reference count
                            $ob_ref_count = $this->transactionUtil->setAndGetReferenceCount($payment_type);
                            //Generate reference number
                            $ob_data['ref_no'] = $this->transactionUtil->generateReferenceNumber($payment_type, $ob_ref_count);
                            //Create opening balance transaction
                            $transaction = Transaction::create($ob_data);
                        }
                    }
                }
                $output = [
                    'success' => 1,
                    'msg' => __('product.file_imported_successfully')
                ];
                DB::commit();
            }
        } catch (\Exception $e) {
            DB::rollBack();
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $output = [
                'success' => 0,
                'msg' => $e->getMessage()
            ];
            return redirect()->route('contacts.import')->with('notification', $output);
        }
        return redirect()->action('ContactController@index', ['type' => 'supplier'])->with('status', $output);
    }
    /**
     * Shows ledger for contacts
     *
     * @param  \Illuminate\Http\Request
     * @return \Illuminate\Http\Response
     */
    public function getLedger()
    {
        // dd("ll");
        if (!auth()->user()->can('supplier.view') && !auth()->user()->can('customer.view')) {
            abort(403, 'Unauthorized action.');
        }
        $business_id = request()->session()->get('user.business_id');
        $asset_account_id = Account::leftjoin('account_types', 'accounts.account_type_id', 'accounts.id')
            ->where('account_types.name', 'like', '%Assets%')
            ->where('accounts.business_id', $business_id)
            ->pluck('accounts.id')->toArray();
        $contact_id = request()->input('contact_id');
        $start_date = request()->start_date;
        $end_date =  request()->end_date;

        $transaction_type =  request()->transaction_type;
        $transaction_amount =  request()->transaction_amount;
        $contact = Contact::find($contact_id);
        $business_details = $this->businessUtil->getDetails($contact->business_id);
        $location_details = BusinessLocation::where('business_id', $contact->business_id)->first();
        $opening_balance = Transaction::where('contact_id', $contact_id)->where('type', 'opening_balance')->where('payment_status', 'due')->sum('final_total');

        // dd($opening_balance);

        $ledger_details = $this->__getLedgerDetails($contact_id, $start_date, $end_date);
        if ($contact->type == 'supplier') {
            // dd("sup");
            $query = ContactLedger::leftjoin('transactions', 'contact_ledgers.transaction_id', 'transactions.id')
                ->leftjoin('transaction_payments', 'contact_ledgers.transaction_payment_id', 'transaction_payments.id')
                ->leftjoin('business_locations', 'transactions.location_id', 'business_locations.id')
                ->leftjoin('account_transactions', 'transactions.id', 'account_transactions.transaction_id')
                ->leftjoin('accounts', 'account_transactions.account_id', 'accounts.id')
                ->where('transactions.contact_id', $contact_id)
                ->where('transactions.business_id', $business_id)
                ->select(
                    'contact_ledgers.*',
                    'contact_ledgers.type as acc_transaction_type',
                    'business_locations.name as location_name',
                    'account_transactions.interest',
                    'transactions.ref_no',
                    'transactions.invoice_no',
                    'transactions.transaction_date',
                    'transactions.payment_status',
                    'transactions.pay_term_number',
                    'transactions.pay_term_type',
                    'transaction_payments.method as payment_method',
                    'transaction_payments.bank_name',
                    'transaction_payments.cheque_date',
                    'transaction_payments.cheque_number',
                    //'transaction_payments.interest',
                    'transactions.type as transaction_type',
                    'accounts.account_number',
                    'accounts.name as account_name'
                )->groupBy('contact_ledgers.id')->orderBy('contact_ledgers.id', 'asc');

				$ledger_details['bf_balance'] = 0;
		}
        if ($contact->type == 'customer') {
            // dd("cus");
            $opening_amount = ''; // ONLY SHOW OPENING BALANCE WHEN NO SALES AND PAYMENT
            $opening_balance_new = DB::select("select `cl`.`amount` as opening_balance
                from `transactions` t left join `contact_ledgers` cl on `cl`.`transaction_id` = `t`.`id`
                left join `business_locations` bl on `t`.`location_id` = `bl`.`id`
                where `cl`.`contact_id` = " . $contact_id . "
                and `cl`.`type` = 'debit'
                and `t`.`business_id` = " . $business_id . "
                and `t`.`type` = 'opening_balance'
                and date(`cl`.`operation_date`) >= '" . $start_date . "'
                and date(`cl`.`operation_date`) <= '" . $end_date . "'
                order by `cl`.`operation_date` limit 2");

                // dd(count($opening_balance_new));
            if (count($opening_balance_new) <= 1) {
                // dd("1");
                $opening_amount =  DB::select(" select (select(0 - IFNULL(amount,0))) as opening_balance
                from `contact_ledgers` where contact_id = '$contact_id' order by created_at ASC limit 1");
                if (count($opening_balance_new) == 0) {
                    $opening_balance_new = DB::select(" select ( select
                    sum(`bc_cl`.`amount`) as total_paid
                    from `contact_ledgers` bc_cl left join `transactions` bc_t on `bc_cl`.`transaction_id` = `bc_t`.`id`
                    left join `business_locations` bc_bl on `bc_t`.`location_id` = `bc_bl`.`id`
                    where `bc_cl`.`contact_id` =  " . $contact_id . "
                    and `bc_cl`.`type` = 'credit'
                    and `bc_t`.`business_id` = " . $business_id . "
                    and date(`bc_cl`.`operation_date`)  < '" . $start_date . "'
                    group by `bc_cl`.`id` and `bc_cl`.`contact_id` order by bc_cl.operation_date) as before_purchase,
                    (select sum(`cl`.`amount`)
                    from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
                    left join `business_locations` bl on `t`.`location_id` = `bl`.`id`
                        where `cl`.`contact_id` = " . $contact_id . "
                        and `cl`.`type` = 'debit'
                        and `t`.`business_id` = " . $business_id . "
                        and date(`cl`.`operation_date`) < '" . $start_date . "'
                        group by `cl`.`id` and `cl`.`contact_id` order by cl.operation_date)  as before_sell,
                    (select(IFNULL(before_sell,0) - IFNULL(before_purchase,0))) as opening_balance");

                    // $opening_balance_new = DB::select(" select ( select
                    // sum(`bc_cl`.`amount`) as total_paid
                    // from `contact_ledgers` bc_cl left join `transactions` bc_t on `bc_cl`.`transaction_id` = `bc_t`.`id`
                    // left join `business_locations` bc_bl on `bc_t`.`location_id` = `bc_bl`.`id`
                    // where `bc_cl`.`contact_id` =  " . $contact_id . "
                    // and `bc_cl`.`type` = 'credit'
                    // and `bc_t`.`business_id` = " . $business_id . "
                    // and date(`bc_cl`.`operation_date`)  <= '" . $start_date . "'
                    // group by `bc_cl`.`id` and `bc_cl`.`contact_id` order by bc_cl.operation_date) as before_purchase,
                    // (select sum(`cl`.`amount`)
                    // from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
                    // left join `business_locations` bl on `t`.`location_id` = `bl`.`id`
                    //     where `cl`.`contact_id` = " . $contact_id . "
                    //     and `cl`.`type` = 'debit'
                    //     and `t`.`business_id` = " . $business_id . "
                    //     and date(`cl`.`operation_date`) < '" . $start_date . "'
                    //     group by `cl`.`id` and `cl`.`contact_id` order by cl.operation_date)  as before_sell,
                    // (select(IFNULL(before_sell,0) - IFNULL(before_purchase,0))) as opening_balance");
                }


            // dd($opening_balance_new[0]);
            } else {
                // dd($opening_balance_new);
                $opening_balance_new = DB::select("select `cl`.`amount` as opening_balance
                from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
                left join `business_locations` bl on `t`.`location_id` = `bl`.`id`
                where `cl`.`contact_id` = " . $contact_id . "
                and `cl`.`type` = 'debit'
                and `t`.`business_id` = " . $business_id . "
                and `t`.`type` = 'opening_balance'
                and date(`cl`.`operation_date`) >= '" . $start_date . "'
                and date(`cl`.`operation_date`) <= '" . $end_date . "'
                order by `cl`.`operation_date`");


            // dd($opening_balance_new);
            }
                // $total_paid = DB::select("select
                // sum(`bc_tp`.`amount`) as total_paid
                // from `contact_ledgers` bc_cl left join `transactions` bc_t on `bc_cl`.`transaction_id` = `bc_t`.`id`
                // left join `business_locations` bc_bl on `bc_t`.`location_id` = `bc_bl`.`id`
                // left join `transaction_payments` bc_tp on `bc_cl`.`transaction_payment_id` = `bc_tp`.`id`
                // where `bc_cl`.`contact_id` =  " . $contact_id . "
                // and `bc_cl`.`type` = 'credit'
                // and `bc_tp`.`method` != 'null'
                // and `bc_t`.`business_id` = " . $business_id . "
                // and date(`bc_cl`.`operation_date`)  >= '" . $start_date . "'
                // and date(`bc_cl`.`operation_date`)  <= '" . $end_date . "'
                // group by `bc_cl`.`id` and `bc_cl`.`contact_id` ");
            $total_sell = DB::select("select
            sum(`bc_cl`.`amount`) as total_sell
            from `contact_ledgers` bc_cl left join `transactions` bc_t on `bc_cl`.`transaction_id` = `bc_t`.`id`
           left join `business_locations` bc_bl on `bc_t`.`location_id` = `bc_bl`.`id`
           where `bc_cl`.`contact_id` =  " . $contact_id . "
           and `bc_cl`.`type` = 'debit'
           and `bc_t`.`type` != 'opening_balance'
           and `bc_t`.`business_id` = " . $business_id . "
           and date(`bc_cl`.`operation_date`)  >= '" . $start_date . "'
           and date(`bc_cl`.`operation_date`)  <= '" . $end_date . "'
           group by `bc_cl`.`id` and `bc_cl`.`contact_id` ");
            $ledger_details['total_invoice'] = count($total_sell) > 0 ? $total_sell[0]->total_sell : 0;
            $ledger_details['opening'] = $opening_amount;
            //$GLOBALS['n'] = $array($ledger_details['balance_due'], $contact_id);
            $query = ContactLedger::leftjoin('transactions', 'contact_ledgers.transaction_id', 'transactions.id')
                ->leftjoin('account_transactions', 'contact_ledgers.transaction_id', 'account_transactions.transaction_id')
                ->leftjoin('business_locations', 'transactions.location_id', 'business_locations.id')
                ->leftjoin('transaction_payments', 'contact_ledgers.transaction_payment_id', 'transaction_payments.id')
                ->where('contact_ledgers.contact_id', $contact_id)
                ->where('transactions.business_id', $business_id)
                ->select(
                    'contact_ledgers.*',
                    'transaction_payments.amount as cheque_return_amount',
                    'transactions.cheque_return_charges',

                    'contact_ledgers.type as acc_transaction_type',
                    'business_locations.name as location_name',
                    'transactions.sub_type as t_sub_type',
                    'transactions.final_total',
                    'transactions.ref_no',
                    'transactions.invoice_no',
                    'transactions.is_direct_sale',
                    'transactions.is_credit_sale',
                    'transactions.is_settlement',
                    'transactions.transaction_date',
                    'transactions.payment_status',
                    'transactions.pay_term_number',
                    'transactions.pay_term_type',
                    'transactions.type as transaction_type',
                    'transactions.created_at as transaction_created_at',
                    'transaction_payments.method as payment_method',
                    'transaction_payments.transaction_id as tp_transaction_id',
                    'transaction_payments.paid_on',
                    'transaction_payments.bank_name',
                    'transaction_payments.cheque_date',
                    'transaction_payments.cheque_number',
                    'transaction_payments.card_number'
                //     DB::raw("(select
                //     sum(`bc_cl`.`amount`)
                //     from `contact_ledgers` bc_cl left join `transactions` bc_t on `bc_cl`.`transaction_id` = `bc_t`.`id`
                //    left join `business_locations` bc_bl on `bc_t`.`location_id` = `bc_bl`.`id`
                //    where `bc_cl`.`contact_id` =  `contact_ledgers`.`contact_id`
                //    and `bc_cl`.`type` = 'credit'
                //    and `bc_t`.`business_id` = `transactions`.`business_id`
                //    and `bc_cl`.`id`  <= `contact_ledgers`.`id`
                //    group by `bc_cl`.`id` and `bc_cl`.`contact_id`) as balance_credit"),
                //     DB::raw("(select
                //     sum(`cl`.`amount`)
                //    from `contact_ledgers` cl left join `transactions` t on `cl`.`transaction_id` = `t`.`id`
                //    left join `business_locations` bl on `t`.`location_id` = `bl`.`id`
                //    where `cl`.`contact_id` =  `contact_ledgers`.`contact_id`
                //    and `cl`.`type` = 'debit'
                //    and `t`.`business_id` = `transactions`.`business_id`
                //    and `cl`.`id`  <= `contact_ledgers`.`id`
                //    group by `cl`.`id` and `cl`.`contact_id`) as balance_debit"),
                //     DB::raw("(select(IFNULL(balance_debit,0) - IFNULL(balance_credit,0)) ) as balance")
                )->groupBy('contact_ledgers.id')->orderBy('contact_ledgers.id', 'asc');
                // dd($query->get());
        }
        if (!empty($start_date)  && !empty($end_date)) {
            $query->whereDate('contact_ledgers.operation_date', '>=', $start_date);
            $query->whereDate('contact_ledgers.operation_date', '<=', $end_date);
            // $query->whareBetween("transaction_payments.paid_on", [$start_date, $end_date]);
        }
        if (!empty($transaction_type)) { // debit / credit type filter
            $query->where('contact_ledgers.type', $transaction_type);
        }
        if (!empty($transaction_amount)) {
            $query->where('contact_ledgers.amount', $transaction_amount);
        }
       $query->orderby('contact_ledgers.operation_date');
        // $query->skip(0)->take(5);
        // $ledger_transactions = $query->get();

        $ledger_transactions = $query->get();

        // dd($ledger_details['beginning_balance']);

                // dd($opening_balance_new);
        if ($contact->type == 'customer') {
            // dd($ledger_transactions);
            $total_paid = $skipped_cr = 0;
            $dateTimestamp1 = date('Y-m-d',strtotime($contact->created_at));
            foreach($ledger_transactions->toArray() as $val) {


               if($val['acc_transaction_type'] == 'credit') {
                    if(!empty($val['transaction_payment_id'])){
                        $transaction_payment = TransactionPayment::where('id', $val['transaction_payment_id'])->withTrashed()->first();
                    }
                    $amount = 0;
                    if(!empty($transaction_payment)){
                        if(empty($transaction_payment->transaction_id)){ // if empty then it will be parent payment
                            $amount = $transaction_payment->amount;  // show parent transaction payment amount
                        }else{
                            $amount = $val['amount']; // get the amount from contact ledger if not a payment
                        }
                    }else{
                        $amount = $val['amount'];
                    }
                    if($val['transaction_type'] === 'opening_balance' && $val['final_total'] < 0) {
                        if(strtotime($start_date) < strtotime($val['transaction_created_at'])) {
                            $ledger_details['opening_balance'] = $val['final_total'];
                        }
                    }
                    // fixed total amount
                    $total_paid = $total_paid + $amount;
                    // else {
                    //     $total_paid = $total_paid + $amount;
                    // }

                    // fixed total amount
					if($val['transaction_type'] == 'opening_balance' ){
                        $dateTimestamp1 = date('Y-m-d',strtotime($val['transaction_date'])) ;
                        $skipped_cr += $amount;
                       continue;
                    }

               }

            }
            //$opening_balance = $ledger_details['beginning_balance'];
            // dd($dateTimestamp1);
            // $dateTimestamp2 = strtotime($date2);
            // dd($ledger_details['beginning_balance']);
            $ledger_details['total_paid'] = $total_paid;
            $ledger_details['bf_balance'] = $ledger_details['beginning_balance'] = count($opening_balance_new) > 0 ? $opening_balance_new[0]->opening_balance : 0;
            // dd($opening_balance_new);
            // $ledger_details['beginning_balance'] = count($bg_bl) > 0 ? $bg_bl[0]->opening_balance : 0;
            $ledger_details['balance'] = $ledger_details['balance_due'] = $ledger_details['beginning_balance'] + $ledger_details['total_invoice'] - ($ledger_details['total_paid']);
            // dd($ledger_details);
            //    dd($ledger_details);
            if(!empty($start_date) && $dateTimestamp1 >= $start_date){
                $ledger_details['beginning_balance'] =0;
                 if(count($ledger_details['ledger']) > 0) { $ledger_details['bf_balance'] =0 ; } else{$ledger_details['bf_balance'] =$ledger_details['balance_due'];$ledger_details['beginning_balance'] =$ledger_details['balance_due'];};
                  //$ledger_details['balance_due'] = 0;
                $ledger_details['balance'] = 0;

            }
            if(!empty($start_date) && $dateTimestamp1 > $start_date){
                // echo "Inside Con<br>";
               $ledger_details['beginning_balance'] =0;
                if(count($ledger_details['ledger']) > 0) { $ledger_details['bf_balance'] =0 ; } else{$ledger_details['bf_balance'] =$ledger_details['balance_due'];$ledger_details['beginning_balance'] =$ledger_details['balance_due'];};
               $ledger_details['balance_due'] -=  $skipped_cr ;
            }else{
                 //$ledger_details['balance'] -=  $skipped_cr ;
            }
        }
        // dd($ledger_details['beginning_balance']);

        // dd($ledger_transactions);
        //  $ledger_details['bf_balance'] = 0;
        //   $ledger_details['beginning_balance'] =0;
	    //dd($ledger_transactions);
	    //dd((count($ledger_details['ledger']) > 0) ? 1 : 0  , $ledger_details);

	    $total_debit = 0;
	    $total_credit = 0;

	    foreach($ledger_transactions as $value){
	        if($value->type == "debit" && $value->payment_status != 'due'){
	            $total_debit += $value->amount;
	           // var_dump('debit', $value->amount , $total_debit);
	        }else if($value->type == "credit"){

	             $total_credit += $value->amount;
	             //var_dump('credit', $value->amount , $total_credit);
	        }
	    }

	   // dd($total_debit , $total_credit);

        if (request()->input('action') == 'pdf') {
            $for_pdf = true;
            $html = view('contact.ledger')
                ->with(compact('ledger_details', 'contact', 'opening_balance_new','for_pdf', 'ledger_transactions', 'business_details', 'location_details'))->render();
            $mpdf = $this->getMpdf();
            $mpdf->WriteHTML($html);
            $mpdf->Output();
            exit;
        }

        $customer_created_date = auth()->user()->created_at->toArray();
        if(!isset($ledger_details['opening_balance'])) {
            $ledger_details['opening_balance'] = 0;
        }
        if (request()->input('action') == 'print') {
            $for_pdf = true;
            return view('contact.ledger')
                ->with(compact('ledger_details', 'contact','opening_balance_new', 'for_pdf', 'ledger_transactions', 'business_details', 'location_details'))->render();
        }
        return view('contact.ledger')
            ->with(compact('ledger_details', 'contact', 'opening_balance','opening_balance_new', 'ledger_transactions', 'business_details', 'location_details'));
    }
    public function postCustomersApi(Request $request)
    {
        try {
            $api_token = $request->header('API-TOKEN');
            $api_settings = $this->moduleUtil->getApiSettings($api_token);
            $business = Business::find($api_settings->business_id);
            $data = $request->only(['name', 'email']);
            $customer = Contact::where('business_id', $api_settings->business_id)
                ->where('email', $data['email'])
                ->whereIn('type', ['customer', 'both'])
                ->first();
            if (empty($customer)) {
                $data['type'] = 'customer';
                $data['business_id'] = $api_settings->business_id;
                $data['created_by'] = $business->owner_id;
                $data['mobile'] = 0;
                $ref_count = $this->commonUtil->setAndGetReferenceCount('contacts', $business->id);
                $data['contact_id'] = $this->commonUtil->generateReferenceNumber('contacts', $ref_count, $business->id);
                $customer = Contact::create($data);
            }
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            return $this->respondWentWrong($e);
        }
        return $this->respond($customer);
    }
    /**
     * Function to get ledger details
     *
     */
    private function __getLedgerDetails($contact_id, $start, $end)
    {
        $contact = Contact::where('id', $contact_id)->first();
        //Get transaction totals between dates
        $transactions = $this->__transactionQuery($contact_id, $start, $end)
            ->with(['location'])->get();
        $transaction_types = Transaction::transactionTypes();
        //Get sum of totals before start date
        $previous_transaction_sums = $this->__transactionQuery($contact_id, $start)
            ->select(
                DB::raw("SUM(IF(type = 'purchase', final_total, 0)) as total_purchase"),
                DB::raw("SUM(IF(type = 'sell' AND status = 'final', final_total, 0)) as total_invoice"),
                DB::raw("SUM(IF(type = 'sell_return', final_total, 0)) as total_sell_return"),
                DB::raw("SUM(IF(type = 'purchase_return', final_total, 0)) as total_purchase_return"),
                DB::raw("SUM(IF(type = 'opening_balance', final_total, 0)) as opening_balance")
            )->first();
        $ledger = [];
        foreach ($transactions as $transaction) {
            $ledger[] = [
                'date' => $transaction->transaction_date,
                'ref_no' => in_array($transaction->type, ['sell', 'sell_return']) ? $transaction->invoice_no : $transaction->ref_no,
                'type' => $transaction_types[$transaction->type],
                'location' => $transaction->location->name,
                'payment_status' =>  __('lang_v1.' . $transaction->payment_status),
                'total' => $transaction->final_total,
                'payment_method' => '',
                'debit' => '',
                'credit' => '',
                'others' => $transaction->additional_notes
            ];
        }
        $invoice_sum = $transactions->where('type', 'sell')->sum('final_total');
        $purchase_sum = $transactions->where('type', 'purchase')->sum('final_total');
        $sell_return_sum = $transactions->where('type', 'sell_return')->sum('final_total');
        $purchase_return_sum = $transactions->where('type', 'purchase_return')->sum('final_total');
        $opening_balance_sum = $transactions->where('type', 'opening_balance')->sum('final_total');
        //Get payment totals between dates
        $payments = $this->__paymentQuery($contact_id, $start, $end)
            ->select('transaction_payments.*', 'bl.name as location_name', 't.type as transaction_type', 't.ref_no', 't.invoice_no')->get();
        $paymentTypes = $this->transactionUtil->payment_types();
        //Get payment totals before start date
        $prev_payments_sum = $this->__paymentQuery($contact_id, $start)
            ->select(DB::raw("SUM(transaction_payments.amount) as total_paid"))
            ->first();
        foreach ($payments as $payment) {
            $ref_no = in_array($payment->transaction_type, ['sell', 'sell_return']) ?  $payment->invoice_no :  $payment->ref_no;
            $ledger[] = [
                'date' => $payment->paid_on,
                'ref_no' => $payment->payment_ref_no,
                'type' => $transaction_types['payment'],
                'location' => $payment->location_name,
                'payment_status' => '',
                'total' => '',
                'payment_method' => !empty($paymentTypes[$payment->method]) ? $paymentTypes[$payment->method] : '',
                'debit' => in_array($payment->transaction_type, ['purchase', 'sell_return']) ? $payment->amount : '',
                'credit' => in_array($payment->transaction_type, ['sell', 'purchase_return', 'opening_balance']) ? $payment->amount : '',
                'others' => $payment->note . '<small>' . __('account.payment_for') . ': ' . $ref_no . '</small>'
            ];
            if ($contact->type == "supplier") {
            }
        }
        $total_ob_paid = $payments->where('transaction_type', 'opening_balance')->sum('amount');
        $total_invoice_paid = $payments->where('transaction_type', 'sell')->sum('amount');
        $total_purchase_paid = $payments->where('transaction_type', 'purchase')->sum('amount');
        $start_date = $this->commonUtil->format_date($start);
        $end_date = $this->commonUtil->format_date($end);
        $total_invoice = $invoice_sum - $sell_return_sum;
        $total_purchase = $purchase_sum - $purchase_return_sum;
        $total_prev_invoice = $previous_transaction_sums->total_purchase + $previous_transaction_sums->total_invoice -  $previous_transaction_sums->total_sell_return -  $previous_transaction_sums->total_purchase_return;
        $total_prev_paid = $prev_payments_sum->total_paid;
        $beginning_balance = ($previous_transaction_sums->opening_balance + $total_prev_invoice) - $prev_payments_sum->amount - $total_prev_paid;
        $total_paid = $total_invoice_paid + $total_purchase_paid + $total_ob_paid;
        $curr_due =  ($beginning_balance + $total_invoice + $total_purchase) - $total_paid;
        //Sort by date
        if (!empty($ledger)) {
            usort($ledger, function ($a, $b) {
                $t1 = strtotime($a['date']);
                $t2 = strtotime($b['date']);
                return $t2 - $t1;
            });
        }
        $output = [
            'ledger' => $ledger,
            'start_date' => $start_date,
            'end_date' => $end_date,
            'total_invoice' => $total_invoice,
            'total_purchase' => $total_purchase,
            'beginning_balance' => $beginning_balance,
            'total_paid' => $total_paid,
            'balance_due' => $curr_due
        ];
        return $output;
    }
    /**
     * Query to get transaction totals for a customer
     *
     */
    private function __transactionQuery($contact_id, $start, $end = null)
    {
        $business_id = request()->session()->get('user.business_id');
        $transaction_type_keys = array_keys(Transaction::transactionTypes());
        $query = Transaction::where('transactions.contact_id', $contact_id)
            ->where('transactions.business_id', $business_id)
            ->where('status', '!=', 'draft')
            ->whereIn('type', $transaction_type_keys);
        if (!empty($start)  && !empty($end)) {
            $query->whereDate(
                'transactions.transaction_date',
                '>=',
                $start
            )
                ->whereDate('transactions.transaction_date', '<=', $end)->get();
        }
        if (!empty($start)  && empty($end)) {
            $query->whereDate('transactions.transaction_date', '<', $start);
        }
        return $query;
    }
    /**
     * Query to get payment details for a customer
     *
     */
    private function __paymentQuery($contact_id, $start, $end = null)
    {
        $business_id = request()->session()->get('user.business_id');
        $query = TransactionPayment::join(
            'transactions as t',
            'transaction_payments.transaction_id',
            '=',
            't.id'
        )
            ->leftJoin('business_locations as bl', 't.location_id', '=', 'bl.id')
            ->where('t.contact_id', $contact_id)
            ->where('t.business_id', $business_id)
            ->where('t.status', '!=', 'draft');
        if (!empty($start)  && !empty($end)) {
            $query->whereDate('t.transaction_date', '>=', $start)
                ->whereDate('t.transaction_date', '<=', $end);
        }
        if (!empty($start)  && empty($end)) {
            $query->whereDate('t.transaction_date', '<', $start);
        }
        return $query;
    }
    /**
     * Function to send ledger notification
     *
     */
    public function sendLedger(Request $request)
    {
        $notAllowed = $this->notificationUtil->notAllowedInDemo();
        if (!empty($notAllowed)) {
            return $notAllowed;
        }
        try {
            $data = $request->only(['to_email', 'subject', 'email_body', 'cc', 'bcc']);
            $emails_array = array_map('trim', explode(',', $data['to_email']));
            $contact_id = $request->input('contact_id');
            $business_id = request()->session()->get('business.id');
            $start_date = request()->input('start_date');
            $end_date =  request()->input('end_date');
            $contact = Contact::find($contact_id);
            $asset_account_id = Account::leftjoin('account_types', 'accounts.account_type_id', 'accounts.id')
                ->where('account_types.name', 'like', '%Assets%')
                ->where('accounts.business_id', $business_id)
                ->pluck('accounts.id')->toArray();
            $ledger_details = $this->__getLedgerDetails($contact_id, $start_date, $end_date);
            $business_details = $this->businessUtil->getDetails($contact->business_id);
            $location_details = BusinessLocation::where('business_id', $contact->business_id)->first();
            $opening_balance = Transaction::where('contact_id', $contact_id)->where('type', 'opening_balance')->where('payment_status', 'due')->sum('final_total');
            if ($contact->type == 'supplier') {
                $query = AccountTransaction::leftjoin('transactions', 'account_transactions.transaction_id', 'transactions.id')
                    ->leftjoin('transaction_payments', 'transactions.id', 'transaction_payments.transaction_id')
                    ->leftjoin('business_locations', 'transactions.location_id', 'business_locations.id')
                    ->where('transactions.type', 'purchase')
                    ->orWhere('transactions.type', 'opening_balance')
                    ->where('contact_id', $contact_id)
                    ->whereNotIn('account_transactions.account_id', $asset_account_id)
                    ->select(
                        'account_transactions.*',
                        'account_transactions.type as acc_transaction_type',
                        'business_locations.name as location_name',
                        'transactions.ref_no',
                        'transactions.transaction_date',
                        'transactions.payment_status',
                        'transaction_payments.method as payment_method',
                        'transactions.type as transaction_type',
                        DB::raw('(SELECT SUM(IF(AT.type="credit", -1 * AT.amount, AT.amount)) from account_transactions as AT WHERE AT.operation_date <= account_transactions.operation_date AND AT.account_id  =account_transactions.account_id AND AT.deleted_at IS NULL AND AT.id <= account_transactions.id) as balance')
                    );
            }
            if ($contact->type == 'customer') {
                $query = AccountTransaction::leftjoin('transactions', 'account_transactions.transaction_id', 'transactions.id')
                    ->leftjoin('transaction_payments', 'transactions.id', 'transaction_payments.transaction_id')
                    ->leftjoin('business_locations', 'transactions.location_id', 'business_locations.id')
                    ->leftjoin('accounts', 'account_transactions.account_id', 'accounts.id')
                    ->where('transactions.type', 'sell')
                    ->orWhere('transactions.type', 'opening_balance')
                    // ->orWhere('transactions.type', 'sell_return')
                    ->where('contact_id', $contact_id)
                    // ->whereNull('accounts.asset_type')
                    ->select(
                        'account_transactions.*',
                        'account_transactions.type as acc_transaction_type',
                        'business_locations.name as location_name',
                        'transactions.ref_no',
                        'transactions.transaction_date',
                        'transactions.payment_status',
                        'transaction_payments.method as payment_method',
                        'transactions.type as transaction_type',
                        DB::raw('(SELECT SUM(IF(AT.type="credit", -1 * AT.amount, AT.amount)) from account_transactions as AT WHERE AT.operation_date <= account_transactions.operation_date AND AT.account_id  =account_transactions.account_id AND AT.deleted_at IS NULL AND AT.id <= account_transactions.id) as balance')
                    );
            }
            if (!empty($start_date)  && !empty($end_date)) {
                $query->whereDate(
                    'transactions.transaction_date',
                    '>=',
                    $start_date
                )->whereDate('transactions.transaction_date', '<=', $end_date)->get();
            }
            $ledger_transactions = $query->get();
            $orig_data = [
                'email_body' => $data['email_body'],
                'subject' => $data['subject']
            ];
            $tag_replaced_data = $this->notificationUtil->replaceTags($business_id, $orig_data, null, $contact);
            $data['email_body'] = $tag_replaced_data['email_body'];
            $data['subject'] = $tag_replaced_data['subject'];
            //replace balance_due
            $data['email_body'] = str_replace('{balance_due}', $this->notificationUtil->num_f($ledger_details['balance_due']), $data['email_body']);
            $data['email_settings'] = request()->session()->get('business.email_settings');
            $for_pdf = true;
            $html = view('contact.ledger')
                ->with(compact('ledger_details', 'contact', 'for_pdf', 'ledger_transactions', 'business_details', 'location_details'))->render();
            $mpdf = $this->getMpdf();
            $mpdf->WriteHTML($html);
            $file = config('constants.mpdf_temp_path') . '/' . time() . '_ledger.pdf';
            $mpdf->Output($file, 'F');
            $data['attachment'] =  $file;
            $data['attachment_name'] =  'ledger.pdf';
            \Notification::route('mail', $emails_array)
                ->notify(new CustomerNotification($data));
            if (file_exists($file)) {
                unlink($file);
            }
            $output = ['success' => 1, 'msg' => __('lang_v1.notification_sent_successfully')];
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());
            $output = [
                'success' => 0,
                'msg' => "File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage()
            ];
        }
        return $output;
    }
    /**
     * Function to get product stock details for a supplier
     *
     */
    public function getSupplierStockReport($supplier_id)
    {
        $pl_query_string = $this->commonUtil->get_pl_quantity_sum_string();
        $query = PurchaseLine::join('transactions as t', 't.id', '=', 'purchase_lines.transaction_id')
            ->join('products as p', 'p.id', '=', 'purchase_lines.product_id')
            ->join('variations as v', 'v.id', '=', 'purchase_lines.variation_id')
            ->join('product_variations as pv', 'v.product_variation_id', '=', 'pv.id')
            ->join('units as u', 'p.unit_id', '=', 'u.id')
            ->where('t.type', 'purchase')
            ->where('t.contact_id', $supplier_id)
            ->select(
                'p.name as product_name',
                'v.name as variation_name',
                'pv.name as product_variation_name',
                'p.type as product_type',
                'u.short_name as product_unit',
                'v.sub_sku',
                DB::raw('SUM(quantity) as purchase_quantity'),
                DB::raw('SUM(quantity_returned) as total_quantity_returned'),
                DB::raw('SUM(quantity_sold) as total_quantity_sold'),
                DB::raw("SUM( COALESCE(quantity - ($pl_query_string), 0) * purchase_price_inc_tax) as stock_price"),
                DB::raw("SUM( COALESCE(quantity - ($pl_query_string), 0)) as current_stock")
            )->groupBy('purchase_lines.variation_id');
        if (!empty(request()->location_id)) {
            $query->where('t.location_id', request()->location_id);
        }
        $product_stocks =  Datatables::of($query)
            ->editColumn('product_name', function ($row) {
                $name = $row->product_name;
                if ($row->product_type == 'variable') {
                    $name .= ' - ' . $row->product_variation_name . '-' . $row->variation_name;
                }
                return $name . ' (' . $row->sub_sku . ')';
            })
            ->editColumn('purchase_quantity', function ($row) {
                $purchase_quantity = 0;
                if ($row->purchase_quantity) {
                    $purchase_quantity =  (float) $row->purchase_quantity;
                }
                return '<span data-is_quantity="true" class="display_currency" data-currency_symbol=false  data-orig-value="' . $purchase_quantity . '" data-unit="' . $row->product_unit . '" >' . $purchase_quantity . '</span> ' . $row->product_unit;
            })
            ->editColumn('total_quantity_sold', function ($row) {
                $total_quantity_sold = 0;
                if ($row->total_quantity_sold) {
                    $total_quantity_sold =  (float) $row->total_quantity_sold;
                }
                return '<span data-is_quantity="true" class="display_currency" data-currency_symbol=false  data-orig-value="' . $total_quantity_sold . '" data-unit="' . $row->product_unit . '" >' . $total_quantity_sold . '</span> ' . $row->product_unit;
            })
            ->editColumn('stock_price', function ($row) {
                $stock_price = 0;
                if ($row->stock_price) {
                    $stock_price =  (float) $row->stock_price;
                }
                return '<span class="display_currency" data-currency_symbol=true >' . $stock_price . '</span> ';
            })
            ->editColumn('current_stock', function ($row) {
                $current_stock = 0;
                if ($row->current_stock) {
                    $current_stock =  (float) $row->current_stock;
                }
                return '<span data-is_quantity="true" class="display_currency" data-currency_symbol=false  data-orig-value="' . $current_stock . '" data-unit="' . $row->product_unit . '" >' . $current_stock . '</span> ' . $row->product_unit;
            });
        return $product_stocks->rawColumns(['current_stock', 'stock_price', 'total_quantity_sold', 'purchase_quantity'])->make(true);
    }
    public function toggleActivate($contact_id)
    {
        $contact = Contact::findOrFail($contact_id);
        $active_status = $contact->active;
        $contact->active = !$active_status;
        $contact->save();
        if ($active_status) {
            $output = ['success' => 1, 'msg' => __('lang_v1.contact_deactivate_success')];
        } else {
            $output = ['success' => 1, 'msg' => __('lang_v1.contact_activate_success')];
        }
        return redirect()->back()->with('status', $output);
    }
    public function listSecurityDeposit($contact_id)
    {
        if (request()->ajax()) {
            $business_id = request()->session()->get('user.business_id');
            $security_deposit = Transaction::leftjoin('users', 'transactions.created_by', 'users.id')
                ->where('transactions.business_id', $business_id)->where('transactions.contact_id', $contact_id)
                ->whereIn('transactions.type', ['security_deposit', 'refund_security_deposit'])
                ->select('transactions.transaction_date', 'users.username', 'transactions.final_total', 'transactions.type', 'transactions.ref_no');

            $business_details = Business::find($business_id);
            return Datatables::of($security_deposit)
                // ->editColumn('final_total', function ($row) use ($business_details) {
                //     $amount = 0;

                //     if ($row->type == "security_deposit") {
                //         $amount = $row->final_total;
                //     }
                //     if ($row->type == "refund_security_deposit") {
                //         $amount = -1 * $row->final_total;
                //     }
                //     return '<span class="display_currency payment_due" data-currency_symbol="true" data-orig-value="' . $amount . '">' . $amount . '</sapn>';
                // })
                ->editColumn('transaction_date', '{{@format_date($transaction_date)}}')
                ->addColumn('description', function ($row) {
                    $details = '';
                    if ($row->type == 'security_deposit') {
                        $details .= 'Security Deposit <br>';
                    }
                    if ($row->type == 'refund_security_deposit') {
                        $details .= 'Security Deposit Refund <br>';
                    }
                    $details .= 'Ref No: ' . $row->ref_no;
                    return $details;
                })->addColumn('debit', function ($row)  use ($business_details) {
                    $amount = 0;

                    if ($row->type == "refund_security_deposit") {
                        $amount =  $row->final_total;
                        return '<span class="display_currency payment_due" data-currency_symbol="true" data-orig-value="' . $amount . '">' . $amount . '</sapn>';
                    }
                    return '';

                })->addColumn('credit', function ($row)  use ($business_details) {
                    $amount = 0;

                    if ($row->type == "security_deposit") {
                        $amount = $row->final_total;
                        return '<span class="display_currency payment_due" data-currency_symbol="true" data-orig-value="' . $amount . '">' . $amount . '</sapn>';
                    }

                    return '';
                })

                ->rawColumns(['debit','credit', 'description'])
                ->make(true);
        }
    }
    public function getOutstandingReceivedReport()
    {
        $business_id = request()->session()->get('user.business_id');
        $business_locations = BusinessLocation::forDropdown($business_id);
        $suppliers = Contact::suppliersDropdown($business_id, false);
        $customers = Contact::customersDropdown($business_id, false);
        $payment_types = $this->transactionUtil->payment_types();
        $customer_group = ContactGroup::forDropdown($business_id, false, true);
        $types = Contact::typeDropdown(true);
        $bill_nos = Transaction::invoiveNumberDropDown('sell');
        $payment_ref_nos = Transaction::paymentRefNumberDropDown('sell');
        $cheque_numbers = Transaction::chequeNumberDropDown('sell');
        return view('contact.outstanding_received_report')->with(compact(
            'suppliers',
            'business_locations',
            'customers',
            'customer_group',
            'types',
            'payment_types',
            'bill_nos',
            'payment_ref_nos',
            'cheque_numbers'
        ));
    }
    public function getIssuedPaymentDetails()
    {
        $business_id = request()->session()->get('user.business_id');
        $business_locations = BusinessLocation::forDropdown($business_id);
        $suppliers = Contact::suppliersDropdown($business_id, false);
        $customers = Contact::customersDropdown($business_id, false);
        $payment_types = $this->transactionUtil->payment_types();
        $customer_group = ContactGroup::forDropdown($business_id, false, true, 'supplier');
        $types = Contact::typeDropdown(true);
        $bill_nos = Transaction::invoiveNumberDropDown('purchase');
        $payment_ref_nos = Transaction::paymentRefNumberDropDown('purchase');
        $cheque_numbers = Transaction::chequeNumberDropDown('purchase');
        $business_details = Business::find($business_id);
        if (request()->ajax()) {
            $purchase = Transaction::leftJoin('contacts', 'transactions.contact_id', '=', 'contacts.id')
                ->leftJoin('transaction_payments as tp', 'transactions.id', '=', 'tp.transaction_id')
                ->where('transactions.business_id', $business_id)
                ->where('transactions.type', 'purchase')
                ->where('contacts.type', 'supplier')
                ->whereIn('transactions.payment_status', ['paid', 'partial'])
                ->select(
                    'transactions.id',
                    'transactions.transaction_date',
                    'transactions.invoice_no',
                    'contacts.name',
                    'transactions.payment_status',
                    'transactions.final_total',
                    'tp.paid_on',
                    'tp.method',
                    'tp.cheque_number',
                    'tp.card_number',
                    'tp.payment_ref_no',
                    DB::raw('SUM(tp.amount) as total_paid')
                );
            if (!empty(request()->customer_id)) {
                $customer_id = request()->customer_id;
                $purchase->where('contacts.id', $customer_id);
            }
            if (!empty(request()->bill_no)) {
                $purchase->where('transactions.invoice_no', request()->bill_no);
            }
            if (!empty(request()->payment_ref_no)) {
                $purchase->where('tp.payment_ref_no', request()->payment_ref_no);
            }
            if (!empty(request()->cheque_number)) {
                $purchase->where('tp.cheque_number', request()->cheque_number);
            }
            if (!empty(request()->payment_type)) {
                $purchase->where('tp.method', request()->payment_type);
            }
            if (!empty(request()->start_date) && !empty(request()->end_date)) {
                $start = request()->start_date;
                $end =  request()->end_date;
                $purchase->whereDate('tp.paid_on', '>=', $start)
                    ->whereDate('tp.paid_on', '<=', $end);
            }
            $purchase->orderBy('tp.paid_on', 'desc')->groupBy('tp.id');
            $datatable = Datatables::of($purchase)
                ->addColumn(
                    'action',
                    function ($row) {
                        $html = '<div class="btn-group">
                                    <button type="button" class="btn btn-info dropdown-toggle btn-xs"
                                        data-toggle="dropdown" aria-expanded="false">' .
                            __("messages.actions") .
                            '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                                        </span>
                                    </button>
                                    <ul class="dropdown-menu dropdown-menu-right" role="menu">';
                        if (auth()->user()->can("sell.view") || auth()->user()->can("direct_sell.access") || auth()->user()->can("view_own_sell_only")) {
                            $html .= '<li><a href="#" data-href="' . action("SellController@show", [$row->id]) . '" class="btn-modal" data-container=".view_modal"><i class="fa fa-external-link" aria-hidden="true"></i> ' . __("messages.view") . '</a></li>';
                        }
                        $html .= '<li><a href="#" class="print-invoice" data-href="' . route('sell.printInvoice', [$row->id]) . '"><i class="fa fa-print" aria-hidden="true"></i> ' . __("messages.print") . '</a></li>
                            <li><a href="#" class="print-invoice" data-href="' . route('sell.printInvoice', [$row->id]) . '?package_slip=true"><i class="fa fa-file-text-o" aria-hidden="true"></i> ' . __("lang_v1.packing_slip") . '</a></li>';
                        $html .= '<li><a href="#" data-href="' . action('SellController@editShipping', [$row->id]) . '" class="btn-modal" data-container=".view_modal"><i class="fa fa-truck" aria-hidden="true"></i>' . __("lang_v1.edit_shipping") . '</a></li>';
                        $html .= '</ul></div>';
                        return $html;
                    }
                )
                ->removeColumn('id')
                ->editColumn('final_total', function ($row) use ($business_details) {
                    return '<span class="display_currency final-total" data-currency_symbol="true" data-orig-value="' . $row->final_total . '">' . $this->productUtil->num_f($row->final_total, false, $business_details, false) . '</span>';
                })
                ->editColumn('total_paid', function ($row) use ($business_details) {
                    if ($row->total_paid == '') {
                        $total_paid_html = '<span class="display_currency total-paid" data-currency_symbol="true" data-orig-value="0.00">' . $this->productUtil->num_f(0, false, $business_details, false) . '</span>';
                    } else {
                        $total_paid_html = '<span class="display_currency total-paid" data-currency_symbol="true" data-orig-value="' . $row->total_paid . '">' . $this->productUtil->num_f($row->total_paid, false, $business_details, false) . '</span>';
                    }
                    return $total_paid_html;
                })
                ->editColumn('transaction_date', '{{@format_date($transaction_date)}}')
                ->editColumn('paid_on', '{{@format_date($paid_on)}}')
                ->editColumn('method', function ($row) {
                    if ($row->method == 'bank_transfer') {
                        return 'Bank';
                    }
                    return ucfirst($row->method);
                })
                ->editColumn('cheque_number', function ($row) {
                    if ($row->method == 'bank_transfer' || $row->method == 'cheque') {
                        return $row->cheque_number;
                    }
                    if ($row->method == 'card') {
                        return $row->card_number;
                    }
                    return '';
                })
                ->editColumn('invoice_no', function ($row) {
                    $invoice_no = $row->invoice_no;
                    if (!empty($row->woocommerce_order_id)) {
                        $invoice_no .= ' <i class="fa fa-wordpress text-primary no-print" title="' . __('lang_v1.synced_from_woocommerce') . '"></i>';
                    }
                    if (!empty($row->return_exists)) {
                        $invoice_no .= ' &nbsp;<small class="label bg-red label-round no-print" title="' . __('lang_v1.some_qty_returned_from_sell') . '"><i class="fa fa-undo"></i></small>';
                    }
                    if (!empty($row->is_recurring)) {
                        $invoice_no .= ' &nbsp;<small class="label bg-red label-round no-print" title="' . __('lang_v1.subscribed_invoice') . '"><i class="fa fa-recycle"></i></small>';
                    }
                    if (!empty($row->recur_parent_id)) {
                        $invoice_no .= ' &nbsp;<small class="label bg-info label-round no-print" title="' . __('lang_v1.subscription_invoice') . '"><i class="fa fa-recycle"></i></small>';
                    }
                    return $invoice_no;
                })
                ->setRowAttr([
                    'data-href' => function ($row) {
                        if (auth()->user()->can("sell.view") || auth()->user()->can("view_own_sell_only")) {
                            return  action('SellController@show', [$row->id]);
                        } else {
                            return '';
                        }
                    }
                ]);
            $rawColumns = ['final_total', 'action', 'total_paid', 'total_remaining', 'payment_status', 'invoice_no', 'discount_amount', 'tax_amount', 'total_before_tax', 'shipping_status'];
            return $datatable->rawColumns($rawColumns)
                ->make(true);
        }
        return view('contact.issued_payment_details')->with(compact(
            'suppliers',
            'business_locations',
            'customers',
            'customer_group',
            'types',
            'payment_types',
            'bill_nos',
            'payment_ref_nos',
            'cheque_numbers'
        ));
    }
}
