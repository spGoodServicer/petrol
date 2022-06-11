<li class="nav-item {{ in_array($request->segment(1), ['agents']) ? 'active active-sub' : '' }}">
    <a href="#"><i class="fa fa-user-secret"></i> <p>@lang('agent::lang.agent')<i class="right fas fa-angle-left"></i></p>
       
    </a>
    <ul class="nav nav-treeview">
        <li class="{{ $request->segment(1) == 'agent' && $request->segment(2) == 'dashboard'? 'active' : '' }}">
            <a href="{{action('\Modules\Agent\Http\Controllers\AgentController@dashboard')}}"><i
                    class="fa fa-chart-line"></i><p>@lang('agent::lang.dashboard')</p></a>
        </li>
      

    </ul>
</li>