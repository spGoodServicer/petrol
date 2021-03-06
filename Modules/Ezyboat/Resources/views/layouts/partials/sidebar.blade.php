<li class="nav-item {{ in_array($request->segment(1), ['ezyboat']) ? 'active active-sub' : '' }}" id="tour_step5">
    <a class="nav-link" href="#"><i class="fa fa-ship nav-icon"></i> <p>@lang('ezyboat::lang.ezyboat')<i class="right fas fa-angle-left"></i></p>
        
    </a>
    <ul class="nav nav-treeview">
        <li class="nav-item {{ $request->segment(2) == 'list' ? 'active' : '' }}"><a class="nav-link"
                href="{{action('\Modules\Ezyboat\Http\Controllers\EzyboatController@index')}}"><i class="fa fa-list nav-icon"></i>
                <p>@lang('ezyboat::lang.list_boats')</p></a>
        </li>
        <li class="nav-item {{ $request->segment(2) == 'boat-operation' ? 'active' : '' }}"><a class="nav-link"
                href="{{action('\Modules\Ezyboat\Http\Controllers\BoatOperationController@index')}}"><i class="fa fa-taxi nav-icon"></i>
                <p>@lang('ezyboat::lang.list_boat_trips')</p></a>
        </li>
        <li class="nav-item {{ $request->segment(2) == 'settings' ? 'active' : '' }}"><a class="nav-link"
                href="{{action('\Modules\Ezyboat\Http\Controllers\SettingController@index')}}"><i class="fa fa-cogs nav-icon"></i>
                <p>@lang('ezyboat::lang.fleet_settings')</p></a>
        </li>

    </ul>
</li>