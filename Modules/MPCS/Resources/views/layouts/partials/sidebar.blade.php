<li
class="nav-item {{ in_array($request->segment(1), ['mpcs']) ? 'active active-sub' : '' }}"
id="tour_step5">
<a class="nav-link" href="#" id="tour_step5_menu"><i class="fa fa-calculator"></i> <p>@lang('mpcs::lang.mpcs')<i class="right fas fa-angle-left"></i></p>
  
</a>
<ul class="nav nav-treeview">
  @if(auth()->user()->can('f9c_form') || auth()->user()->can('f15a9abc_form') || auth()->user()->can('f16a_form') || auth()->user()->can('f21c_form'))
  <li class="{{ $request->segment(1) == 'mpcs' && $request->segment(2) == 'form-set-1' ? 'active' : '' }}"><a
      href="{{action('\Modules\MPCS\Http\Controllers\MPCSController@FromSet1')}}"><i class="fa fa-file-alt-o"></i><p>@lang('mpcs::lang.form_set_1')</p></a>
  </li>
  @endif
  @if(auth()->user()->can('f17_form'))
  <li class="{{ $request->segment(1) == 'mpcs' && $request->segment(2) == 'F17' ? 'active' : '' }}"><a
      href="{{action('\Modules\MPCS\Http\Controllers\F17FormController@index')}}"><i class="fa fa-file-alt-o"></i><p>@lang('mpcs::lang.F17_form')</p></a>
  </li>
  @endif
  @if(auth()->user()->can('f14b_form') || auth()->user()->can('f20_form'))
  <li class="{{ $request->segment(1) == 'mpcs' && $request->segment(2) == 'F14B_F20_Forms' ? 'active' : '' }}"><a
      href="{{action('\Modules\MPCS\Http\Controllers\F20F14bFormController@index')}}"><i class="fa fa-file-alt-o"></i><p>@lang('mpcs::lang.F20andF14b_form')</p></a>
  </li>
  @endif
  @if(auth()->user()->can('f21_form'))
  <li class="{{ $request->segment(1) == 'mpcs' && $request->segment(2) == 'F21' ? 'active' : '' }}"><a
      href="{{action('\Modules\MPCS\Http\Controllers\MPCSController@F21')}}"><i class="fa fa-file-alt-o"></i><p>@lang('mpcs::lang.F21_form')</p></a>
  </li>
  @endif
  @if(auth()->user()->can('f22_stock_taking_form'))
  <li class="{{ $request->segment(1) == 'mpcs' && $request->segment(2) == 'F22_stock_taking' ? 'active' : '' }}"><a
      href="{{action('\Modules\MPCS\Http\Controllers\F22FormController@F22StockTaking')}}"><i class="fa fa-file-alt-o"></i><p>@lang('mpcs::lang.F22StockTaking_form')</p></a>
  </li>
  @endif
  <li class="{{ $request->segment(1) == 'mpcs' && $request->segment(2) == 'forms-setting' ? 'active' : '' }}"><a
      href="{{action('\Modules\MPCS\Http\Controllers\FormsSettingController@index')}}"><i class="fa fa-cogs"></i><p>@lang('mpcs::lang.mpcs_forms_setting')</p></a>
  </li>
  
</ul>
</li>