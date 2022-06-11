<li class="nav-item {{ in_array($request->segment(1), ['member-module', 'member']) ? 'active active-sub' : '' }}">
    <a class="nav-link" href="#"><i class="fa fa-user-circle nav-icon"></i> <p>@lang('member::lang.member_module')<i class="right fas fa-angle-left"></i></p>
    </a>
    <ul class="nav nav-treeview">
        <li class="nav-item {{ $request->segment(1) == 'member-module' && $request->segment(2) == 'members' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\Member\Http\Controllers\MemberController@index')}}"><i
                    class="fa fa-list nav-icon nav-icon"></i><p>@lang('member::lang.list_member')</p></a>
        </li>
        <li
            class="nav-item {{ $request->segment(1) == 'member' && $request->segment(2) == 'suggestions' && $request->segment(3) == '' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\Member\Http\Controllers\SuggestionController@index')}}"><i
                    class="fa fa-thumbs-o-up nav-icon"></i><p>@lang('member::lang.list_suggestions')</p></a>
        </li>
        <li class="nav-item {{ $request->segment(1) == 'member-module' && $request->segment(2) == 'member-settings' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\Member\Http\Controllers\MemberSettingController@index')}}"><i
                    class="fa fa-cogs nav-icon"></i><p>@lang('member::lang.member_settings')</p></a>
        </li>

    </ul>
</li>