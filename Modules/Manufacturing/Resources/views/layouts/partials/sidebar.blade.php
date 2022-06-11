{{-- @if($__is_mfg_enabled) --}}
	<li class="nav-item bg-manufacturing {{ in_array($request->segment(1), ['manufacturing']) ? 'active active-sub' : '' }}">
	    <a class="nav-link" href="#">
	        <i class="fa fa-industry nav-icon"></i>
	        <p class="title">@lang('manufacturing::lang.manufacturing')<i class="right fas fa-angle-left"></i></p>
	        
	    </a>

	    <ul class="nav nav-treeview">
		    	<li class="nav-item {{ $request->segment(1) == 'manufacturing'? 'active active-sub' : '' }}">
					<a class="nav-link" href="{{action('\Modules\Manufacturing\Http\Controllers\ManufacturingController@index')}}">
						<i class="fa fa-industry nav-icon"></i>
						<p class="title">
							@lang('manufacturing::lang.manufacturing')
						</p>
				  	</a>
				</li>
        </ul>
	</li>
