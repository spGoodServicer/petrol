<!-- Main content -->
<section class="content">
    {!! Form::open(['url' => action('CustomerPaymentBulkController@store'), 'method' => 'post']) !!}
    <div class="row">
        <div class="col-md-12">
            <div class="col-md-3">
                {!! Form::label('customer_payment_bulk_payment_ref_no', __('lang_v1.payment_ref_no').':') !!}
                <div class="input-group">
                    <div class="input-group-addon">
                        CPB-
                    </div>
                    {!! Form::text('customer_payment_bulk_payment_ref_no', $latest_ref_number_CPB, ['class' => 'form-control',
                    'placeholder' => __('lang_v1.payment_ref_no'),'readonly'=>true, 'style' => 'width: 100%;']); !!}
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    {!! Form::label('customer_payment_bulk_customer_id', __('petro::lang.customer').':') !!}
                    {!! Form::select('customer_payment_bulk_customer_id', $customers, null, ['class' => 'form-control
                    select2', 'style' => 'width: 100%;', 'required']); !!}
                </div>
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    {!! Form::label('customer_payment_bulk_balance', __('petro::lang.balance').':') !!}
                    {!! Form::text('customer_payment_bulk_balance', null, ['class' => 'form-control', 'placeholder' =>
                    __('petro::lang.balance'), 'readonly'=>true, 'style' => 'width: 100%;']); !!}
                </div>
                <input type="hidden" name="customer_payment_bulk_balance_amt" value="" id="customer_payment_bulk_balance_amt" >
            </div>
            <div class="col-md-3">
                <div class="form-group">
                    {!! Form::label('customer_payment_bulk_ponits', __('lang_v1.points').':') !!}
                    {!! Form::text('customer_payment_bulk_ponits', null, ['class' => 'form-control', 'placeholder' =>
                    __('lang_v1.points'), 'style' => 'width: 100%;']); !!}
                </div>
            </div>
            <div class="payment_data_row">
                <div class="col-md-3">
                    <div class="form-group">
                        {!! Form::label('customer_payment_bulk_payment_method', __('petro::lang.payment_method').':')
                        !!}
                        {!! Form::select('customer_payment_bulk_payment_method', $account_groups , null, ['class' => 'form-control
                        select2', 'style' => 'width: 100%;', 'placeholder' => __(
                        'petro::lang.please_select' ), 'required' ]); !!}
                    </div>

                </div>
                <div class="col-md-3">
                        <div class="form-group">
                            {!! Form::label('customer_payment_bulk_accounting_module', __('lang_v1.accounting_module').':')
                            !!}
                            {!! Form::select('customer_payment_bulk_accounting_module',['cash' => 'Cash','cash-1' => 'cash-1'], null, ['class' => 'form-control
                            select2', 'style' => 'width: 100%;', 'placeholder' => __(
                            'petro::lang.please_select' ),'required']); !!}
                        </div>
                    </div>
                 <div class="hide cash_divs">




                </div>
                <div class="hide card_divs">



                    <div class="col-md-3">
                        <div class="form-group">
                            {!! Form::label('customer_payment_bulk_card_number', __( 'lang_v1.card_number' ) ) !!}
                            {!! Form::text('customer_payment_bulk_card_number', null, ['class' => 'form-control
                            customer_payment_bulk_fields
                            card_number',
                            'placeholder' => __(
                            'lang_v1.card_number' ) ]); !!}
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            {!! Form::label('customer_payment_bulk_card_name', __( 'lang_v1.card_name' ) ) !!}
                            {!! Form::text('customer_payment_bulk_card_name', null, ['class' => 'form-control
                            customer_payment_bulk_fields
                            card_name',
                            'placeholder' => __(
                            'lang_v1.card_name' ) ]); !!}
                        </div>
                    </div>
                </div>
                <div class="hide cheque_divs">



                    <div class="col-md-3">
                        <div class="form-group">
                            {!! Form::label('customer_payment_bulk_bank_name', __( 'petro::lang.bank_name' ) ) !!}
                            {!! Form::text('customer_payment_bulk_bank_name', null, ['class' => 'form-control
                            customer_payment_bulk_fields
                            bank_name',
                            'style' => 'width: 100%;',
                            'placeholder' => __(
                            'petro::lang.bank_name' ) ]); !!}
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            {!! Form::label('customer_payment_bulk_cheque_date', __( 'petro::lang.cheque_date' ) ) !!}
                            {!! Form::text('customer_payment_bulk_cheque_date', null, ['class' => 'form-control
                            cheque_date',
                            'style' => 'width: 100%;',
                            'placeholder' => __(
                            'petro::lang.cheque_date' ) ]); !!}
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="form-group">
                            {!! Form::label('customer_payment_bulk_cheque_number', __( 'petro::lang.cheque_number' ) )
                            !!}
                            {!! Form::text('customer_payment_bulk_cheque_number', null, ['class' => 'form-control
                            customer_payment_bulk_fields
                            cheque_number',
                            'style' => 'width: 100%;',
                            'placeholder' => __(
                            'petro::lang.cheque_number' ) ]); !!}
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="form-group">
                        {!! Form::label('payable_amount', __( 'lang_v1.payable_amount' ) ) !!}
                        {!! Form::text('payable_amount',  null, ['class' => 'form-control customer_payment_bulk_fields ',
                        'required', 'id' => 'payable_amount',
                        'style' => 'width: 100%;',
                        'placeholder' => __(
                        'lang_v1.amount' ) ]); !!}
                    </div>
                </div>
                @if($customer_interest_deduct_option === 1)
                    <div class="col-md-3">
                        <div class="form-group">
                            {!! Form::label('customer_interest_deduct_option', __('lang_v1.insert_deduct').':')
                            !!}
                            {!! Form::select('customer_interest_deduct_option',['yes' => 'Yes','no' => 'No'], null, ['class' => 'form-control select_interest_filed
                            select2', 'style' => 'width: 100%;','placeholder' => __(
                            'Please Select' )]); !!}
                        </div>
                    </div>
                @endif
                <div class="col-md-3">
                    <div class="form-group">
                        {!! Form::label('transaction_date', __( 'lang_v1.transaction_date' ) ) !!}
                        {!! Form::text('transaction_date', null, ['class' => 'form-control transaction_date
                        customer_payment_bulk_fields', 'required', 'id' => 'transaction_date', 'readonly',
                        'style' => 'width: 100%;',
                        'placeholder' => __(
                        'petro::lang.transaction_date' ) ]); !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
    <br>
    <br>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-bordered table-striped" id="payment_bulk_invoice_table">
                <thead>
                <tr>
                    <th>@lang('lang_v1.date' )</th>
                    <th>@lang('lang_v1.bill_no' )</th>
                    <th>@lang('lang_v1.voucher_no' )</th>
                    <th>@lang('lang_v1.bill_amount' )</th>
                    <th>@lang('lang_v1.outstanding_amount' )</th>
                    <th class="interest_selection_checkbox hide">@lang('lang_v1.interest')</th>
                    <th>@lang('lang_v1.amount_pay_now' )</th>
                </tr>
                </thead>
                <tbody>
                </tbody>
            </table>
        </div>
    </div>
    <div class="row_data"></div>
    <div class="col-md-12">
        <button type="submit" class="btn btn-primary pull-right">@lang('lang_v1.save')</button>
    </div>
    <div class="clearfix"></div>
    {!! Form::close() !!}
</section>
<!-- /.content -->
