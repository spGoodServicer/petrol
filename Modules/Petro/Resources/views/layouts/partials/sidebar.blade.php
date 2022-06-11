<li class="nav-item {{ in_array($request->segment(1), ['petro']) && $request->segment(2) != 'issue-customer-bill'? 'active active-sub' : '' }}" id="tour_step5">
<a class="nav-link" href="#" id="tour_step5_menu">
  <i class="fa fa-tint fa-lg nav-icon"></i>
    <p>@lang('petro::lang.petro')<i class="right fas fa-angle-left nav-icon"></i></p>
</a>
<ul class="nav nav-treeview">
@if($enable_petro_dashboard)
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'dashboard' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\PetroController@index')}}">
      <i class="fa fa-tachometer nav-icon"></i><p> @lang('petro::lang.dashboard')</p></a>
  </li>
@endif
@if($enable_petro_task_management)
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'tank-management' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\FuelTankController@index')}}"><i class="fa fa-ship nav-icon"></i><p> @lang('petro::lang.tank_management')</p></a>
  </li>
@endif
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'pump-management' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\PumpController@index')}}"><i class="fa fa-superpowers nav-icon"></i><p> @lang('petro::lang.pump_management')</p></a>
  </li>
@if($enable_petro_pumper_management)
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'pump-operators' && $request->segment(3) == '' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\PumpOperatorController@index')}}"><i class="fa fa-user nav-icon"></i><p> @lang('petro::lang.pumper_management')</p></a>
  </li>
@endif
@if($enable_petro_daily_collection)
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'daily-collection' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\DailyCollectionController@index')}}"><i class="fa fa-ravelry nav-icon"></i><p> @lang('petro::lang.daily_collection')</p></a>
  </li>
@endif
@if($enable_petro_settlement)
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'settlement' && $request->segment(3) == 'create' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\SettlementController@create')}}"><i class="fa fa-eercast nav-icon"></i><p> @lang('petro::lang.settlement')</p></a>
  </li>
@endif
@if($enable_petro_list_settlement)
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'settlement' && $request->segment(3) == '' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\SettlementController@index')}}"><i class="fa fa-list nav-icon"></i><p> @lang('petro::lang.list_settlement')</p></a>
  </li>
@endif
@if($enable_petro_dip_management)
  <li class="nav-item {{ $request->segment(1) == 'petro' && $request->segment(2) == 'dip-management' && $request->segment(3) == '' ? 'active' : '' }}">
    <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\DipManagementController@index')}}"><i class="fa fa-thermometer nav-icon"></i><p> @lang('petro::lang.dip_management')</p></a>
  </li>
@endif
  

</ul>

</li>



@if($issue_customer_bill)

@can('issue_customer_bill.access')

<li class="nav-item {{in_array($request->segment(2), ['issue-customer-bill']) ? 'active active-sub' : '' }}">
  <a class="nav-link" href="#" id="tour_step6_menu"><i class="fa fa-file-text nav-icon"></i>
    <p>@lang('petro::lang.bill_to_customer') <i class="right fas fa-angle-left nav-icon"></i></p>
  </a>
  <ul class="nav nav-treeview">
    <li class="nav-item {{ $request->segment(2) == 'issue-customer-bill'? 'active' : '' }}">
      <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\IssueCustomerBillController@index')}}">
        <i class="fa fa-list nav-icon"></i>@lang('petro::lang.issue_bills_customer')</p></a>
    </li>
  </ul>

</li>

@endcan

@endif