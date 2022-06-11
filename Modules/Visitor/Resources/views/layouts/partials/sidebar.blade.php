@can('visitor.registration.create')
<li class="nav-item {{ in_array($request->segment(1), ['visitor-module', 'visitor']) ? 'active active-sub' : '' }}">
    <a class="nav-link" href="#"><i class="fa fa-user-circle"></i> <p>@lang('visitor::lang.visitor_module')<i class="right fas fa-angle-left"></i></p>
        
    </a>
    <ul class="nav nav-treeview">
        @if($visitors)
        <li class="nav-item {{ $request->segment(1) == 'visitor-module' && $request->segment(2) == 'visitor' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\Visitor\Http\Controllers\VisitorController@index')}}"><i
                    class="fa fa-list nav-icon"></i><p>@lang('visitor::lang.list_visitors')</p></a>
        </li>
        @endif
        @if($visitors_registration)
        <li
            class="nav-item {{ $request->segment(1) == 'visitor-module' && $request->segment(2) == 'registration' && $request->segment(3) == '' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\Visitor\Http\Controllers\VisitorRegistrationController@create')}}"><i
                    class="fa fa-registered nav-icon"></i><p>@lang('visitor::lang.visitor_registration')</p></a>
        </li>
        @endif
        @if($visitors_registration_setting)
        <li
            class="nav-item {{ $request->segment(1) == 'visitor-module' && $request->segment(2) == 'settings' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\Visitor\Http\Controllers\VisitorSettingController@index')}}"><i
                    class="fa fa-cogs nav-icon"></i><p>@lang('visitor::lang.visitor_registration_settings')</p></a>
        </li>
        @endif
        <li
            class="nav-item {{ $request->segment(1) == 'visitor-module' && $request->segment(2) == 'qr-visitor-reg' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\Visitor\Http\Controllers\VisitorController@generateQr')}}"><i
                    class="fa fa-qrcode nav-icon"></i><p>@lang('visitor::lang.qr_visitor_reg')</p></a>
        </li>
    </ul>
</li>
@endcan