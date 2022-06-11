<li class="nav-item treeview {{ in_array($request->segment(1), ['property']) ? 'active active-sub' : '' }}" id="tour_step5">
  <a href="#" class="nav-link">
    <i class="fa fa-building nav-icon"></i> 
    <p>@lang('property::lang.property') <i class="right fas fa-angle-left"></i></p>
  </a>
  <ul class="nav nav-treeview">
    <li class="nav-item {{ $request->segment(2) == 'list-price-changes' ? 'active' : '' }}">
      <a href="{{action('\Modules\Property\Http\Controllers\PriceChangesController@index')}}" class="nav-link"><i
                class="fa fa-building nav-icon"></i>
        <p>@lang('property::lang.list_price_changes')</p></a></li>
    <li class="nav-item {{ $request->segment(2) == 'sale-and-customer-payment' && $request->segment(3) == 'dashboard' ? 'active' : '' }}"><a
      href="{{action('\Modules\Property\Http\Controllers\SaleAndCustomerPaymentController@dashboard', ['type' => 'customer'])}}"><i
        class="fa fa-chart-line nav-icon"></i>
      <p>@lang('property::lang.sales_dashboard')</p></a></li>
    @can('property.customer.view')
    <li class="nav-item {{ $request->segment(2) == 'contacts' && $request->input('type') == 'customer' ? 'active' : '' }}"><a
        href="{{action('\Modules\Property\Http\Controllers\ContactController@index', ['type' => 'customer'])}}" class="nav-link"><i
          class="fa fa-star nav-icon"></i>
        @lang('property::lang.property_customer')</a></li>
    @endcan
    @can('property.list.view')
    <li class="nav-item {{ $request->segment(2) == 'properties' ? 'active' : '' }}">
      <a class="nav-link" href="{{action('\Modules\Property\Http\Controllers\PropertyController@index')}}"><i class="fa fa-building nav-icon"></i>
        <p>@lang('property::lang.list_properties')</p></a>
    </li>
    @endcan
    @can('property.purchase.view')
    <li class="nav-item {{ $request->segment(2) == 'purchases' ? 'active' : '' }}">
      <a href="{{action('\Modules\Property\Http\Controllers\PurchaseController@index')}}" class="nav-link"><i
          class="fa fa-arrow-circle-down nav-icon"></i><p>
        @lang('property::lang.property_purchase')</p></a>
    </li>
    @endcan
    @can('property.purchase.view')
      <li class="nav-item {{ $request->segment(2) == 'reports' ? 'active' : '' }}">
        <a href="{{action('\Modules\Property\Http\Controllers\ReportController@index')}}" class="nav-link"><i
                  class="fa fa-file"></i>
          <p>@lang('property::lang.reports')</p></a>
      </li>
    @endcan
    @can('property.settings.access')
    <li class="nav-item {{ $request->segment(2) == 'settings' ? 'active' : '' }}">
      <a href="{{action('\Modules\Property\Http\Controllers\SettingController@index')}}" class="nav-link"><i class="fa fa-cogs nav-icon"></i>
        <p>@lang('property::lang.settings')</p></a>
    </li>
    @endcan
  </ul>
</li>
@if($list_easy_payment)
@if(auth()->user()->can('list_easy_payments.access'))
<li class="nav-item treeview {{  in_array( $request->segment(2), ['easy-payments']) ? 'active active-sub' : '' }}">
  <a href="{{action('\Modules\Property\Http\Controllers\EasyPaymentController@index')}}" class="nav-link"><i class="fa fa-money-bill nav-icon""></i>
    <p>@lang('property::lang.list_easy_payments')</p>
  </a>
</li>
@endif
@endif
