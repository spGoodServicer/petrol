{{-- @if($__is_mfg_enabled) --}}
	<li class="treeview bg-manufacturing {{ in_array($request->segment(1), ['manufacturing']) ? 'active active-sub' : '' }}">
	    <a href="#">
	        <i class="fa fa-industry"></i>
	        <p class="title">@lang('manufacturing::lang.manufacturing')</p>
	        <p class="pull-right-container">
	            <i class="right fas fa-angle-left"></i>
			</p>
	    </a>

	    <ul class="nav nav-treeview">
		    	<li class="{{ $request->segment(1) == 'manufacturing'? 'active active-sub' : '' }}">
					<a href="{{action('\Modules\Manufacturing\Http\Controllers\ManufacturingController@index')}}">
						<i class="fa fa-industry"></i>
						<p class="title">
							@lang('manufacturing::lang.manufacturing')
						</p>
				  	</a>
				</li>
        </ul>
	</li>
