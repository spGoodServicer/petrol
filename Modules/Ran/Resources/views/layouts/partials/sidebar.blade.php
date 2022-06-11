<li class="nav-item {{ in_array($request->segment(1), ['ran']) && $request->segment(2) != 'issue-customer-bill'? 'active active-sub' : '' }}" id="tour_step5">
  <a class="nav-link" href="#"><i class="fa fa-globe fa-lg"></i> <p>@lang('ran::lang.ran')<i class="right fas fa-angle-left"></i></p></a>
  <ul class="nav nav-treeview">
    <li class="nav-item {{ $request->segment(2) == 'gold' ? 'active' : '' }}">
      <a class="nav-link" href="{{action('\Modules\Ran\Http\Controllers\GoldController@index')}}"><i class="fa fa-globe nav-icon"></i>
        <p>@lang('ran::lang.gold')</p></a>
    </li>
    <li class="nav-item {{ $request->segment(2) == 'production' ? 'active' : '' }}">
      <a class="nav-link" href="{{action('\Modules\Ran\Http\Controllers\ProductionController@index')}}"><i class="fa fa-industry nav-icon"></i>
        <p>@lang('ran::lang.production')</p>
      </a>
    </li>
    <li class="nav-item {{ $request->segment(2) == 'goldsmith' ? 'active' : '' }}">
      <a class="nav-link" href="{{action('\Modules\Ran\Http\Controllers\GoldSmithController@index')}}"><i class="fa fa-id-badge nav-icon"></i>
        <p>@lang('ran::lang.goldsmith')</p>
      </a>
    </li>
  </ul>
</li>