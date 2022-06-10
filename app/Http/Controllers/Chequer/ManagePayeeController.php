<?php

namespace App\Http\Controllers\Chequer;

use App\Account;
use App\Chequer\ChequeNumberMaintain;
use App\Chequer\ChequerBankAccount;
use App\Chequer\ChequerCurrency;
use App\Chequer\ChequerDefaultSetting;
use App\Chequer\ChequerPurchaseOrder;
use App\Chequer\ChequerStamp;
use App\Chequer\ChequerSupplier;
use App\Chequer\ChequeTemplate;
use App\Chequer\PrintedChequeDetail;
use App\Contact;
use App\Events\TransactionPaymentAdded;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Transaction;
use App\TransactionPayment;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use App\Utils\ModuleUtil;
use App\Utils\TransactionUtil;
use Illuminate\Support\Facades\Log;
use Yajra\DataTables\Facades\DataTables;
class ManagePayeeController extends Controller
{
    protected $moduleUtil;

    /**
     * Constructor
     *
     * @param ProductUtils $product
     * @return void
     */
    public function __construct(ModuleUtil $moduleUtil)
    {
        $this->moduleUtil = $moduleUtil;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */

    public function index()
    {
        $business_id = request()->session()->get('business.id');
         
        if (request()->ajax()) {

            //Check if subscribed or not, then check for location quota
            if (!$this->moduleUtil->isSubscribed(request()->session()->get('business.id'))) {
                return $this->moduleUtil->expiredResponse();
            }
            $contacts = Contact::where('business_id', $business_id)
                                ->where('type', 'supplier');

            return Datatables::of($contacts)
                ->addColumn('action', function ($row) {
                    if($row->is_payee)
                    {
                        $html = '<div class="btn-group">
                        <button type="button" class="btn btn-info dropdown-toggle btn-xs" 
                            data-toggle="dropdown" aria-expanded="false">' .
                            __("messages.actions") .
                            '<span class="caret"></span><span class="sr-only">Toggle Dropdown
                            </span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        <li><a href="javascript:void(0);" data-toggle="modal" data-target="#myModal" data-id="'.$row->id.'" data-name="'.$row->name.'" class="edit_payee_button"><i class="glyphicon glyphicon-edit"></i> Edit</a></li>
                        
                         <li><a href="javascript:void(0);" data-url="'.url('delete-payees', [$row->id]).'" class="delete_payee_button"><i class="fa fa-trash"></i> Delete</a></li>
                        ';
                        $html .=  '</ul></div>';
                    }
                    else
                      $html='';
                    return $html;
                })
                ->editColumn('created_date', '{{date("Y-m-d", strtotime($created_at))}}')
                // ->rawColumns(['action'])
                ->make(true);
        }
        return view('chequer/payee/index');

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
     
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $id=$request->id;
        try {
            $business_id = $request->session()->get('business.id');
            $msg='Added';
            if($id)
            {
                $contact=Contact::find($id);
                $msg='Updated';
            }
            else
                $contact =new  Contact();
            $contact->business_id=$business_id;
            $contact->name=$request->payee_name;
            $contact->is_payee=1;
            $contact->created_by=$request->session()->get('user.id');
            $contact->save();
            $output = [
                'success' => 1,
                'msg' => 'Default Setting '.$msg.' Successfully'
            ];
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output = [
                'success' => 0,
                'msg' => __('messages.something_went_wrong')
            ];
        }
       return back()->with('status', $output);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $business_id = request()->session()->get('business.id');
        $templates = ChequeTemplate::where('business_id', $business_id)->get();
        return view('chequewrite::templates.create')->with(compact('templates', 'id'));
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
        //to update template store method is use
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
 
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
                        'msg' => 'Payee Deleted Successfully'
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
         return  $output;
    }

 
}