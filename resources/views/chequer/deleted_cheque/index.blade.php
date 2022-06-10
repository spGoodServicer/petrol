@extends('layouts.app')
@section('title', __('cheque.templates'))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
    <h1>Cancelled Cheque List</h1>
</section>

<!-- Main content -->
<section class="content">
    @component('components.widget', ['class' => 'box-primary', 'title' => 'Cancelled Cheque List'])

      @slot('tool')
    <div class="box-tools">
        <a  class="btn btn-block btn-primary" data-toggle="modal" data-target="#myModal"
            href="#" onclick="return false;" >
            <i class="fa fa-plus"></i> Cancel Cheque</a>
    </div>
    @endslot
    <div class="table-responsive">
        <table class="table table-bordered table-striped" id="templates_table">
            <thead>
                <tr>
                    <th>Date & Time</th>
                    <th>Account Number</th>
                    <th>Bank</th>
                    <th>Cheque No</th>
                    <th>Note</th>
                    <th>User</th>
                </tr>
            </thead>
            <tbody>
                @foreach($deletedcheque as $data)
                    <tr>
                        <td>{{$data->date_time}}</td>
                        <td>{{$data->account_number}}</td>
                        <td>{{$data->bank}}</td>
                        <td>{{$data->cheque_no}}</td>
                        <td>{{$data->note}}</td>
                        <td>{{$data->username}}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>

    @endcomponent
</section>
<div class="modal" tabindex="-1" role="dialog" id="myModal">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Cancel Cheque</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      {!! Form::open(['url' => url('add_deleted_cheque'), 'method' => 'post', 'id' => 'payee_form' ]) !!}
        <div class="row">
					
					<div class="col-md-4">
						<div class="form-group">
							<label>Date</label>
							<input type="text" name="date_time" id="mydate" class="form-control" required readonly  />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Ref Number</label>
							<input type="text" name="reference_no" id="reference_no" class="form-control" required value="{{$maxref}}" />
						</div>
					</div>
				</div>
				<div class="row">

					<div class="col-md-8">
						<div class="form-group">
							<label>Account Number</label>
								{!! Form::select('account_no',$accounts, null, ['placeholder' =>
                               __('messages.please_select'), 'style' => 'width: 100%','onchange'=>'getBank(this.value)', 'class' => 'form-control select2']) !!}
						
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Bank</label>
							<input type="text" name="bank" id="bank" class="form-control" readonly />
						</div>
					</div>
					
				
				</div>
				<div class="row">
					<div class="col-md-4">
						<div class="form-group">
							<label>Branch</label>
							<input type="text" name="branch" id="branch" class="form-control" readonly />
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>Cheque No</label>
								{!! Form::select('cheque_no',$chequenolists, null, ['placeholder' =>
                               __('messages.please_select'), 'style' => 'width: 100%', 'class' => 'form-control select2']) !!}
						
						</div>
					</div>
					<div class="col-md-4">
						<div class="form-group">
							<label>User </label>
							<input type="text" name="created_by" class="form-control"  value="{{ auth()->user()->username }}" readonly="">
						</div>
					</div>

				</div>
				<div class="row">
					
					<div class="col-md-12">
						<div class="form-group">
							<label style="text-align: left;">note</label>
							<input type="text" id="note" name="note" class="form-control"  value="">
						</div>
					</div>
					
                </div>
			</div>
			
			<div class="modal-footer">

					<input type="submit" name="btn" value="Submit" id="sendBtn" data-toggle="modal" onclick="saveReport()" data-target="#confirm-submit" class="btn btn-primary" />
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			</div>
		</div><!-- Panel Body // END -->
      {!! Form::close() !!}
    </div>
  </div>
</div>
@endsection
@section('javascript')
<script>
  
     $('#templates_table').DataTable({
        
    });
    function getBank(id)
    {
        $.ajax({
             method: "get",
             url: "{{url('getBank')}}",
             dataType: "json",
             data:{id:id},
             success: function(result){
                $('#bank').val(result.bank);
                $('#branch').val(result.branch);
            }
        });
    }
	$('#mydate').datepicker({
		format: 'dd-mm-yyyy',
		autoclose: true
	});
	$('#mydate').datepicker('setDate', 'today');
</script>
@endsection