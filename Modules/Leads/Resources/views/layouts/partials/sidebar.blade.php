<li class="nav-item treeview {{ in_array($request->segment(1), ['leads']) ? 'active active-sub' : '' }}">
    <a href="#" class="nav-link"><i class="fa fa-lg fa-lightbulb-o nav-icon"></i> <p>@lang('leads::lang.leads') <i class="right fas fa-angle-left"></i></p>
        
    </a>
    <ul class="nav nav-treeview">
        @if($leads)
        @if(auth()->user()->can('leads.view') || auth()->user()->can('leads.edit') ||
        auth()->user()->can('leads.destory')|| auth()->user()->can('leads.create'))
        <li class="nav-item {{ $request->segment(1) == 'leads' && $request->segment(2) == 'leads'? 'active' : '' }}">
            <a href="{{action('\Modules\Leads\Http\Controllers\LeadsController@index')}}" class="nav-link"><i
                    class="fa fa-lightbulb-o nav-icon"></i> <p>@lang('leads::lang.leads')</p></a>
        </li>
        @endcan
        @endif
        @if($leads_import)
        @can('leads.import')
        <li class="nav-item {{ $request->segment(1) == 'leads' && $request->segment(2) == 'import'? 'active' : '' }}">
            <a href="{{action('\Modules\Leads\Http\Controllers\ImportLeadsController@index')}}" class="nav-link"><i
                    class="fa fa-download nav-icon"></i><p>@lang('leads::lang.import_data')</p></a>
        </li>
        @endcan
        @endif
        @if($day_count)
        @can('day_count')
        <li class="nav-item {{ $request->segment(1) == 'leads' && $request->segment(2) == 'day-count'? 'active' : '' }}">
            <a href="{{action('\Modules\Leads\Http\Controllers\DayCountController@index')}}" class="nav-link"><i
                    class="fa fa-plus nav-icon"></i><p>@lang('leads::lang.day_count')</p></a>
        </li>
        @endcan
        @endif

        @if($leads_settings)
        @can('leads.settings')
        <li class="nav-item {{ $request->segment(1) == 'leads' && $request->segment(2) == 'settings'? 'active' : '' }}">
            <a href="{{action('\Modules\Leads\Http\Controllers\SettingController@index')}}" class="nav-link"><i
                    class="fa fa-cogs nav-icon"></i><p>@lang('leads::lang.settings')</p></a>
        </li>
        @endcan
        @endif

    </ul>
</li>