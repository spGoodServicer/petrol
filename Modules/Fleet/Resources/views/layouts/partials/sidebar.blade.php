<li class="nav-item {{ in_array($request->segment(1), ['fleet-management']) ? 'active active-sub' : '' }}" id="tour_step5">
    <a href="#"><i class="fa fa-ship"></i> <span>@lang('fleet::lang.fleet_management')</span>
        <span class="pull-right-container">
            <i class="right fas fa-angle-left"></i>
        </span>
    </a>
    <ul class="nav nav-treeview">
        <li class="{{ $request->segment(2) == 'fleet' ? 'active' : '' }}"><a
                href="{{action('\Modules\Fleet\Http\Controllers\FleetController@index')}}"><i class="fa fa-list"></i>
                @lang('fleet::lang.list_fleet')</a>
        </li>
        <li class="{{ $request->segment(2) == 'route-operation' ? 'active' : '' }}"><a
                href="{{action('\Modules\Fleet\Http\Controllers\RouteOperationController@index')}}"><i class="fa fa-taxi"></i>
                @lang('fleet::lang.route_operation')</a>
        </li>
        <li class="{{ $request->segment(2) == 'settings' ? 'active' : '' }}"><a
                href="{{action('\Modules\Fleet\Http\Controllers\SettingController@index')}}"><i class="fa fa-cogs"></i>
                @lang('fleet::lang.fleet_settings')</a>
        </li>

    </ul>
</li>