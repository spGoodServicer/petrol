@can('superadmin')
<li class="nav-item menu-open bg-red {{ in_array($request->segment(1), ['superadmin', 'sample-medical-product-import', 'site-settings', 'pay-online']) ? 'active active-sub' : '' }}">
	<a href="#" class="nav-link">
		<i class="fa fa-university nav-icon"></i>
		<p class="title">@lang('superadmin::lang.superadmin') <i class="right fas fa-angle-left"></i></p>
		
	</a>
	<ul class="nav nav-treeview">
		<li class="nav-item {{ empty($request->segment(2)) && $request->segment(1) != 'site-settings' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\SuperadminController@index')}}" class="nav-link">
				<i class="fa fa-university nav-icon"></i>
				<p class="title">
					@lang('superadmin::lang.superadmin')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'business' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\BusinessController@index')}}">
				<i class="fa fa-university nav-icon"></i>
				<p class="title">
					@lang('superadmin::lang.all_business')
				</p>
			</a>
		</li>
		<!-- superadmin subscription -->
		<li class="nav-item {{ $request->segment(2) == 'superadmin-subscription' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\SuperadminSubscriptionsController@index')}}"><i
					class="fa fa-retweet nav-icon"></i>
				<p class="title">@lang('superadmin::lang.subscription')</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'packages' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\PackagesController@index')}}">
				<i class="fa fa-credit-card"></i>
				<p class="title">
					@lang('superadmin::lang.subscription_packages')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'tenant-management' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\TenantManagementController@index')}}">
				<i class="fa fa-sitemap"></i>
				<p class="title">
					@lang('superadmin::lang.tenant_management')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'agent' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\AgentController@index')}}">
				<i class="fa fa-user"></i>
				<p class="title">
					@lang('superadmin::lang.list_agents')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'referrals' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\ReferralController@index')}}">
				<i class="fa fa-link"></i>
				<p class="title">
					@lang('superadmin::lang.referrals')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'settings' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\SuperadminSettingsController@edit')}}">
				<i class="fa fa-cogs"></i>
				<p class="title">
					@lang('superadmin::lang.super_admin_settings')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'imports-exports' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\ImportExportController@index')}}">
				<i class="fa fa-arrows-alt"></i>
				<p class="title">
					@lang('superadmin::lang.import_export')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(1) == 'pay-online' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\PayOnlineController@index')}}">
				<i class="fa fa-list"></i>
				<p class="title">
					@lang('superadmin::lang.pay_online_list')
				</p>
			</a>
		</li>
		<li class="nav-item {{ $request->segment(2) == 'help-explanation' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\HelpExplanationController@index')}}">
				<i class="fa fa-info-circle"></i>
				<p class="title">
					@lang('superadmin::lang.help_explanation')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(2) == 'communicator' ? 'active active-sub' : '' }}">
			<a href="{{action('\Modules\Superadmin\Http\Controllers\CommunicatorController@index')}}">
				<i class="fa fa-envelope"></i>
				<p class="title">
					@lang('superadmin::lang.communicator')
				</p>
			</a>
		</li>

		<li class="nav-item {{ $request->segment(1) == 'site-settings'? 'active' : '' }}">
			<a href="{{route('site_settings.view')}}">
				<i class="fa fa-gears"></i> <p>@lang('site_settings.settings')</p></a>
		</li>
		<li class="nav-item {{ $request->segment(1) == 'system_administration'? 'active' : '' }}">
			<a href="{{route('site_settings.help_view')}}">
				<i class="fa fa-question-circle"></i> <p>@lang('site_settings.help')</p></a>
		</li>

		<li class="nav-item {{ $request->segment(1) == 'sample-medical-product-import' ? 'active' : '' }}">
			<a href="{{action('ImportMedicalProductController@index')}}">
				<i class="fa fa-download"></i><p>@lang('lang_v1.sample_medical_product_import')</p></a>
		</li>
</ul>
</li>
@endcan