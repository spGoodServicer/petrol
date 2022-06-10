@extends('layouts.app')
@section('title', __('cheque.templates'))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>Printed Cheque</h1>
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => 'Printed Cheque List'])

   
    <div class="table-responsive">
        <table class="table table-bordered table-striped" id="templates_table">
            <thead>
                <tr>
                    <th>Date & Time</th>
                    <th>Bank Account No</th>
                    <th>Supplier/Payee</th>
                    <th>Purchase Order Number</th>
                    <!--<th>Purchase Bill Number</th>-->
                    <!--<th>Supplier Bill Number</th>-->
                    <th>Cheque Amount</th>
                    <th>Cheque No</th>
                    <th>Cheque Date</th>
                    <th>Reference/Invoice Number</th>
                    <th>Payment Status</th>
                    <th>User</th>
                </tr>
            </thead>
            <tbody>
                @foreach($printedcheque as $data)
                    <tr>
                        <td>{{date("Y-m-d", strtotime($data->created_at))}}</td>
                        <td>{{$data->bank_account_no}}</td>
                        <td>{{$data->name}}</td>
                        <td>{{$data->purchase_order_id}}</td>
                        <!--<td></td>-->
                        <!--<td></td>-->
                        <td>{{$data->cheque_amount}}</td>
                        <td>{{$data->cheque_no}}</td>
                        <td>{{$data->cheque_date}}</td>
                        <td>{{$data->refrence}}</td>
                        <td>{{$data->status}}</td>
                        <td>{{$data->username}}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    @endcomponent
</section>
@endsection
@section('javascript')
<script>
  
     $('#templates_table').DataTable({
        
    });
</script>
@endsection