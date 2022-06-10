<?php

namespace App\Http\Controllers\Chequer;

use App\Account;
use App\Chequer\PrintedChequeDetail;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Yajra\DataTables\DataTables;
use App\Chequer\CancelCheque;
use App\Utils\ModuleUtil;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;

class DeletedChequeController extends Controller
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
        $maxref=1;
         $business_id = request()->session()->get('business.id');
         $deletedcheque = CancelCheque::leftjoin('users', 'cancel_cheque.user_id', 'users.id')
                                     ->leftjoin('chequer_bank_accounts', 'cancel_cheque.account_no', 'chequer_bank_accounts.id')
                                              ->select(
                                                    'cancel_cheque.*',
                                                    'users.username',
                                                    'chequer_bank_accounts.*')
                                                ->where('cancel_cheque.business_id','$business_id')
                                                ->orderBy('cancel_cheque.id','DESC')
                                                ->get();
        $refno=CancelCheque::select('id')->orderBy('id','ASC')->first();
        if($refno)
           $maxref= $refno->id+1;
        $account=DB::table('chequer_bank_accounts')->get();
        $accounts=[];
        foreach($account as $datarow){
            $accounts[$datarow->id] = $datarow->account_number;
        }
       $chequenolist = PrintedChequeDetail::where('status', NULL) ->where('business_id','$business_id')->distinct()->get();
       $chequenolists=[];
        foreach($chequenolist as $datarow){
            $chequenolists[$datarow->cheque_no] = $datarow->cheque_no;
        }
         return view('chequer/deleted_cheque/index')->with(compact('deletedcheque','maxref','accounts','chequenolists'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function getBank(Request $request)
    {
          $id=$request->id;
          $account=DB::table('chequer_bank_accounts')->where('id',$id)->first();
          $output = [
                'bank' => $account->bank,
                'branch' => $account->branch
            ];
            return $output;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        try {
            $business_id = $request->session()->get('business.id');
            $data = array(
                'date_time' => $request->date_time,
                'reference_no' => $request->reference_no,
                'business_id' => $business_id,
                'account_no' => $request->account_no,
                'cheque_no' => $request->cheque_no,
                'note' => $request->note,
                'user_id' => Auth::user()->id
            );
            
            CancelCheque::create($data);
            PrintedChequeDetail::where('cheque_no', $request->cheque_no)->update(['status'=>'Cancelled']);
            $output = [
                'success' => 1,
                'msg' => __('cheque.cheque_number_add_succuss')
            ];
            
        } catch (\Exception $e) {
            Log::emergency("File:" . $e->getFile() . "Line:" . $e->getLine() . "Message:" . $e->getMessage());

            $output = [
                'success' => 0,
                'msg' => __('messages.something_went_wrong')
            ];
        }

        return redirect()->back()->with('status', $output);
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
        //
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
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }
   
}
