<li class="nav-item {{ in_array($request->segment(1), ['fleet-management']) ? 'active active-sub' : '' }}" id="tour_step5">
    <a class="nav-link" href="#"><i class="fa fa-ship nav-icon"></i> <p>@lang('fleet::lang.fleet_management')<i class="right fas fa-angle-left"></i></p>
    </a>
    <ul class="nav nav-treeview">
        <li class="{{ $request->segment(2) == 'fleet' ? 'active' : '' }}"><a class="nav-link"
                href="{{action('\Modules\Fleet\Http\Controllers\FleetController@index')}}"><i class="fa fa-list nav-icon"></i>
                <p>@lang('fleet::lang.list_fleet')</p></a>
        </li>
        <li class="nav-item {{ $request->segment(2) == 'route-operation' ? 'active' : '' }}"><a class="nav-link"
                href="{{action('\Modules\Fleet\Http\Controllers\RouteOperationController@index')}}"><i class="fa fa-taxi nav-icon"></i>
                <p>@lang('fleet::lang.route_operation')</p></a>
        </li>
        <li class="nav-item {{ $request->segment(2) == 'settings' ? 'active' : '' }}"><a class="nav-link"
                href="{{action('\Modules\Fleet\Http\Controllers\SettingController@index')}}"><i class="fa fa-cogs nav-icon"></i>
                <p>@lang('fleet::lang.fleet_settings')</p></a>
        </li>

    </ul>
</li>