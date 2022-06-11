<li class="nav-item {{ in_array($request->segment(1), ['sms']) ? 'active active-sub' : '' }}">
    <a class="nav-link" href="#"><i class="fa fa-lg fa-comments nav-icon"></i> <p>@lang('sms::lang.sms')<i class="right fas fa-angle-left"></i></p>
        
    </a>
   <ul class="nav nav-treeview">
        {{--  @if($sms)
        @if(auth()->user()->can('sms.view') || auth()->user()->can('sms.edit') ||
        auth()->user()->can('sms.destory')|| auth()->user()->can('sms.create')) --}}
        <li class="nav-item {{ $request->segment(1) == 'sms' && $request->segment(2) == ''? 'active' : '' }}">
            <a class="nav-link" href="nav-link {{action('\Modules\SMS\Http\Controllers\SMSController@index')}}"><i
                    class="fa fa-commenting-o nav-icon"></i><p>@lang('sms::lang.list_sms')</p></a>
        </li>
        {{-- @endcan
        @endif --}}
     


    </ul>
</li>