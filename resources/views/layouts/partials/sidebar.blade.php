@inject('request', 'Illuminate\Http\Request')
@php
	$sidebar_setting = App\SiteSettings::where('id', 1)->select('ls_side_menu_bg_color', 'ls_side_menu_font_color', 'sub_module_color', 'sub_module_bg_color')->first();

	$module_array['disable_all_other_module_vr'] = 0;
	$module_array['enable_petro_module'] = 0;
	$module_array['enable_petro_dashboard'] = 0;
	$module_array['enable_petro_task_management'] = 0;
	$module_array['enable_petro_pump_dashboard'] = 0;
	$module_array['enable_petro_pumper_management'] = 0;
	$module_array['enable_petro_daily_collection'] = 0;
	$module_array['enable_petro_settlement'] = 0;
	$module_array['enable_petro_list_settlement'] = 0;
	$module_array['enable_petro_dip_management'] = 0;
	$module_array['enable_sale_cmsn_agent'] = 0;
	$module_array['enable_crm'] = 0;
	$module_array['mf_module'] = 0;
	$module_array['hr_module'] = 0;
	$module_array['employee'] = 0;
	$module_array['teminated'] = 0;
	$module_array['award'] = 0;
	$module_array['leave_request'] = 0;
	$module_array['attendance'] = 0;
	$module_array['import_attendance'] = 0;
	$module_array['late_and_over_time'] = 0;
	$module_array['payroll'] = 0;
	$module_array['salary_details'] = 0;
	$module_array['basic_salary'] = 0;
	$module_array['payroll_payments'] = 0;
	$module_array['hr_reports'] = 0;
	$module_array['notice_board'] = 0;
	$module_array['hr_settings'] = 0;
	$module_array['department'] = 0;
	$module_array['jobtitle'] = 0;
	$module_array['jobcategory'] = 0;
	$module_array['workingdays'] = 0;
	$module_array['workshift'] = 0;
	$module_array['holidays'] = 0;
	$module_array['leave_type'] = 0;
	$module_array['salary_grade'] = 0;
	$module_array['employment_status'] = 0;
	$module_array['salary_component'] = 0;
	$module_array['hr_prefix'] = 0;
	$module_array['hr_tax'] = 0;
	$module_array['religion'] = 0;
	$module_array['hr_setting_page'] = 0;
	$module_array['enable_sms'] = 0;
	$module_array['access_account'] = 0;
	$module_array['enable_booking'] = 0;
	$module_array['customer_order_own_customer'] = 0;
	$module_array['customer_settings'] = 0;
	$module_array['customer_order_general_customer'] = 0;
	$module_array['mpcs_module'] = 0;
	$module_array['fleet_module'] = 0;
	$module_array['ezyboat_module'] = 0;
	$module_array['merge_sub_category'] = 0;
	$module_array['backup_module'] = 0;
	$module_array['banking_module'] = 0;
	$module_array['products'] = 0;
	$module_array['purchase'] = 0;
	$module_array['stock_transfer'] = 0;
	$module_array['service_staff'] = 0;
	$module_array['enable_subscription'] = 0;
	$module_array['add_sale'] = 0;
	$module_array['stock_adjustment'] = 0;
	$module_array['tables'] = 0;
	$module_array['type_of_service'] = 0;
	$module_array['pos_sale'] = 0;
	$module_array['expenses'] = 0;
	$module_array['modifiers'] = 0;
	$module_array['kitchen'] = 0;
	$module_array['orders'] = 0;
	$module_array['enable_cheque_writing'] = 0;
	$module_array['issue_customer_bill'] = 0;
	$module_array['tasks_management'] = 0;
	$module_array['notes_page'] = 0;
	$module_array['tasks_page'] = 0;
	$module_array['reminder_page'] = 0;
	$module_array['member_registration'] = 0;
	$module_array['visitors_registration_module'] = 0;
	$module_array['visitors'] = 0;
	$module_array['visitors_registration'] = 0;
	$module_array['visitors_registration_setting'] = 0;
	$module_array['visitors_district'] = 0;
	$module_array['visitors_town'] = 0;
	$module_array['home_dashboard'] = 0;
	$module_array['contact_module'] = 0;
	$module_array['contact_supplier'] = 0;
	$module_array['contact_customer'] = 0;
	$module_array['contact_group_customer'] = 0;
	$module_array['import_contact'] = 0;
	$module_array['customer_reference'] = 0;
	$module_array['customer_statement'] = 0;
	$module_array['customer_payment'] = 0;
	$module_array['outstanding_received'] = 0;
	$module_array['issue_payment_detail'] = 0;
	$module_array['property_module'] = 0;
	$module_array['ran_module'] = 0;
	$module_array['report_module'] = 0;
	$module_array['product_report'] = 0;
	$module_array['payment_status_report'] = 0;
	$module_array['verification_report'] = 0;
	$module_array['activity_report'] = 0;
	$module_array['contact_report'] = 0;
	$module_array['trending_product'] = 0;
	$module_array['user_activity'] = 0;
	$module_array['report_verification'] = 0;
	$module_array['report_table'] = 0;
	$module_array['report_staff_service'] = 0;
	$module_array['verification_report'] = 0;
	$module_array['notification_template_module'] = 0;
	$module_array['settings_module'] = 0;
	$module_array['user_management_module'] = 0;
	$module_array['leads_module'] = 0;
	$module_array['leads'] = 0;
	$module_array['day_count'] = 0;
	$module_array['leads_import'] = 0;
	$module_array['leads_settings'] = 0;
	$module_array['sms_module'] = 0;
	$module_array['list_sms'] = 0;
	$module_array['status_order'] = 0;
	$module_array['list_orders'] = 0;
	$module_array['upload_orders'] = 0;
	$module_array['subcriptions'] = 0;
	$module_array['over_limit_sales'] = 0;
	$module_array['sale_module'] = 0;
	$module_array['all_sales'] = 0;
	$module_array['list_pos'] = 0;
	$module_array['list_draft'] = 0;
	$module_array['list_quotation'] = 0;
	$module_array['list_sell_return'] = 0;
	$module_array['shipment'] = 0;
	$module_array['discount'] = 0;
	$module_array['import_sale'] = 0;
	$module_array['reserved_stock'] = 0;
	$module_array['repair_module'] = 0;
	$module_array['catalogue_qr'] = 0;
	$module_array['business_settings'] = 0;
	$module_array['business_location'] = 0;
	$module_array['invoice_settings'] = 0;
	$module_array['tax_rates'] = 0;
	$module_array['list_easy_payment'] = 0;
	$module_array['payday'] = 0;

    $module_array['purchase_module'] = 0;
    $module_array['all_purchase'] = 0;
    $module_array['add_purchase'] = 0;
    $module_array['import_purchase'] = 0;
    $module_array['add_bulk_purchase'] = 0;
    $module_array['purchase_return'] = 0;

     $module_array['cheque_write_module'] = 0;
     $module_array['cheque_templates'] = 0;
     $module_array['write_cheque'] = 0;
     $module_array['manage_stamps'] = 0;
     $module_array['manage_payee'] = 0;
     $module_array['cheque_number_list'] = 0;
     $module_array['deleted_cheque_details'] = 0;
     $module_array['printed_cheque_details'] = 0;
     $module_array['default_setting'] = 0;

	foreach ($module_array as $key => $module_value) {
		${$key} = 0;
	}
	$business_id = request()->session()->get('user.business_id');
	$subscription = Modules\Superadmin\Entities\Subscription::active_subscription($business_id);
	if (!empty($subscription)) {
		$pacakge_details = $subscription->package_details;
		$disable_all_other_module_vr = 0;
		if (array_key_exists('disable_all_other_module_vr', $pacakge_details)) {
			$disable_all_other_module_vr = $pacakge_details['disable_all_other_module_vr'];
		}
		foreach ($module_array as $key => $module_value) {
			if ($disable_all_other_module_vr == 0) {
				if (array_key_exists($key, $pacakge_details)) {
					${$key} = $pacakge_details[$key];
				} else {
					${$key} = 0;
				}
			} else {
				${$key} = 0;
				$disable_all_other_module_vr = 1;
				$visitors_registration_module = 1;
				$visitors = 1;
				$visitors_registration = 1;
				$visitors_registration_setting = 1;
				$visitors_district = 1;
				$visitors_town = 1;
			}
		}
	}
	if ( auth()->user()->can('superadmin')) {
		foreach ($module_array as $key => $module_value) {
			${$key} = 1;
		}
		$disable_all_other_module_vr = 0;
	}
@endphp
<style>
    /* .skin-blue .main-sidebar {
    	background-color: @if( !empty($sidebar_setting->ls_side_menu_bg_color)) {{$sidebar_setting->ls_side_menu_bg_color}}
    	@endif;
    }
    .skin-blue .sidebar a {
    	color: @if( !empty($sidebar_setting->ls_side_menu_font_color)) {{$sidebar_setting->ls_side_menu_font_color}}
    	@endif;
    }
    .skin-blue .treeview-menu>li>a {
    	color: @if( !empty($sidebar_setting->sub_module_color)) {{$sidebar_setting->sub_module_color}}
    	@endif;
    }
    .skin-blue .sidebar-menu>li>.treeview-menu {
    	background: @if( !empty($sidebar_setting->sub_module_bg_color)) {{$sidebar_setting->sub_module_bg_color}}
    	@endif;
    } */
</style>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar sidebar-dark-primary elevation-4">
    <a href="index3.html" class="brand-link">
        <img src="{{ asset('AdminLTE/img/AdminLTELogo.png')}}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" style="opacity: .8">
        <span class="brand-text font-weight-light">AdminLTE 3</p>
    </a>
    <!-- sidebar: style can be found in sidebar.less -->
    <div class="sidebar">
        <nav class="mt-2">
        @php $user = App\User::where('id', auth()->user()->id)->first(); $is_admin = $user->hasRole('Admin#' . request()->session()->get('business.id')) ? true : false; @endphp
        <!-- Sidebar Menu -->
        @if(session()->get('business.is_patient'))
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            @if(session()->get('business.is_patient'))
            <li class="nav-item  {{ $request->segment(1) == 'patient' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('PatientController@index')}}"> <i class="fa fa-dashboard nav-icon"></i> <p> @lang('home.home')</p> </a>
            </li>
            @endif @if(session()->get('business.is_hospital'))
            <li class="nav-item  {{ $request->segment(1) == 'patient' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('HospitalController@index')}}"> <i class="fa fa-dashboard nav-icon"></i> <p> @lang('home.home')</p> </a>
            </li>
            @endif
            <li class="nav-item  {{ $request->segment(1) == 'reports' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('ReportController@getUserActivityReport')}}">
					<i class="fa fa-eercast nav-icon"></i>
					<span class="title">@lang('report.user_activity')</p>
				</a>
            </li>
            @if ($is_admin) @if(Module::has('Superadmin')) @includeIf('superadmin::layouts.partials.subscription') @endif @if(request()->session()->get('business.is_patient'))
            <li class="nav-item treeview @if( in_array($request->segment(1), ['family-members', 'superadmin', 'pay-online'])) {{'active active-sub'}} @endif">
                <a href="#" id="tour_step2_menu">
                    <i class="fa fa-cog nav-icon"></i> <p>@lang('business.settings')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item  {{ $request->segment(1) == 'family-member' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('FamilyController@index')}}"><i class="fa fa-users nav-icon"></i> @lang('patient.family_member')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(2) == 'family-subscription' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('\Modules\Superadmin\Http\Controllers\FamilySubscriptionController@index')}}"><i class="fa fa-users nav-icon"></i> @lang('patient.family_subscription')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'pay-online' && $request->segment(2) == 'create' ? 'active active-sub' : '' }}">
                        <a class="nav-link" href="{{action('\Modules\Superadmin\Http\Controllers\PayOnlineController@create')}}">
                            <i class="fa fa-money-bill nav-icon"></i>
                            <span class="title">
                                @lang('superadmin::lang.pay_online')
                            </p>
                        </a>
                    </li>
                </ul>
            </li>
            @endif @endif
        </ul>
        @else
        <!-- The main POS System Menu -->
        <ul class="nav nav-pills nav-sidebar flex-column" data-widget="treeview" role="menu" data-accordion="false">
            <!-- Call superadmin module if defined -->
            @if(Module::has('Superadmin')) @includeIf('superadmin::layouts.partials.sidebar') @endif
            <!-- Call ecommerce module if defined -->
            @if(Module::has('Ecommerce')) @includeIf('ecommerce::layouts.partials.sidebar') @endif
            <!-- <li class="header">HEADER</li> -->
            @if($home_dashboard) @if(auth()->user()->can('dashboard.data') && !auth()->user()->is_pump_operator && !auth()->user()->is_property_user)
            <li class="nav-item  {{ $request->segment(1) == 'home' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('HomeController@index')}}"> <i class="fa fa-dashboard nav-icon"></i> <p> @lang('home.home')</p> </a>
            </li>
            @endif @endif @if(auth()->user()->is_pump_operator) @if(auth()->user()->can('pump_operator.dashboard'))
            <li class="nav-item  {{ $request->segment(1) == 'petro' && $request->segment(2) == 'pump-operators' && $request->segment(3) == 'dashboard' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\PumpOperatorController@dashboard')}}"><i class="fa fa-tachometer nav-icon"></i> <p>@lang('petro::lang.dashboard')</p></a>
            </li>
            @endif
            <li class="nav-item  {{ $request->segment(1) == 'petro' && $request->segment(2) == 'pump-operators' && $request->segment(3) == 'pumper-day-entries' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('\Modules\Petro\Http\Controllers\PumperDayEntryController@index')}}"><i class="fa fa-calculator nav-icon"></i> <p>@lang('petro::lang.pumper_day_entries')</p></a>
            </li>
            @endif
			@if(auth()->user()->is_customer == 0)
				@if(auth()->user()->can('crm.view'))
					@if($enable_crm == 1)
						<li class="nav-item treeview {{ in_array($request->segment(1), ['crm']) ? 'active active-sub' : '' }}">
							<a href="#" class="nav-link">
								<i class="fab fa-connectdevelop nav-icon"></i>
								<p class="title">@lang('lang_v1.crm') <i class="right fas fa-angle-left"></i></p>
							</a>
							<ul class="nav nav-treeview">
								@can('crm.view')
								<li class="nav-item {{ $request->segment(1) == 'crm' && $request->input('type') == 'customer' ? 'active' : '' }}">
									<a href="{{action('CRMController@index')}}" class="nav-link"><i class="fa fa-star nav-icon"></i> <p>@lang('lang_v1.crm')</p></a>
								</li>
								<li class="nav-item {{ $request->segment(1) == 'crmgroups' ? 'active' : '' }}">
									<a href="{{action('CrmGroupController@index')}}" class="nav-link"><i class="fa fa-object-group nav-icon"></i> <p>@lang('lang_v1.crm_group')</p></a>
								</li>
								@endcan
								<li class="nav-item {{ $request->segment(1) == 'crm-activity' ? 'active' : '' }}">
									<a href="{{action('CRMActivityController@index')}}" class="nav-link"><i class="fa fa-object-group nav-icon"></i> <p>@lang('lang_v1.crm_activity')</p></a>
								</li>
							</ul>
						</li>
					@endif
				@endif
			@endif
			@if($leads_module)
				@includeIf('leads::layouts.partials.sidebar')
			@endif
			@if(Auth::guard('agent')->check())
				@includeIf('agent::layouts.partials.sidebar')
			@endif
			@if($contact_module)
				@if(auth()->user()->can('supplier.view') || auth()->user()->can('customer.view') )
					<li class="nav-item treeview {{ in_array($request->segment(1), ['contacts', 'customer-group', 'contact-group', 'customer-reference', 'customer-statement', 'outstanding-received-report']) ? 'active active-sub' : '' }}" id="tour_step4">
						<a href="#" id="tour_step4_menu" class="nav-link">
							<i class="fa fa-address-book nav-icon"></i> <p>@lang('contact.contacts') <i class="right fas fa-angle-left"></i></p>
						</a>
						<ul class="nav nav-treeview">
							@if($contact_supplier) @can('supplier.view')
							<li class="nav-item {{ $request->input('type') == 'supplier' ? 'active' : '' }}">
								<a href="{{action('ContactController@index', ['type' => 'supplier'])}}" class="nav-link"><i class="fa fa-star nav-icon nav-icon"></i> <p>@lang('report.supplier')</p></a>
							</li>
							@endcan @endif @can('customer.view') @if($contact_customer) {{-- @if(!$property_module)--}}
							<li class="nav-item {{ $request->input('type') == 'customer' ? 'active' : '' }}">
								<a href="{{action('ContactController@index', ['type' => 'customer'])}}" class="nav-link"><i class="fa fa-star nav-icon nav-icon"></i> <p>@lang('report.customer')</p></a>
							</li>
							{{-- @endif--}} @endif @if($contact_group_customer)
							<li class="nav-item {{ $request->segment(1) == 'contact-group' ? 'active' : '' }}">
								<a href="{{action('ContactGroupController@index')}}" class="nav-link"><i class="fa fa-users"></i> <p>@lang('lang_v1.contact_groups')</p></a>
							</li>
							@endif @endcan @if($import_contact) @if(!$property_module && $contact_customer) @if(auth()->user()->can('supplier.create') || auth()->user()->can('customer.create') )
							<li class="nav-item {{ $request->segment(1) == 'contacts' && $request->segment(2) == 'import' ? 'active' : '' }}">
								<a href="{{action('ContactController@getImportContacts')}}" class="nav-link"><i class="fa fa-download nav-icon"></i> <p>@lang('lang_v1.import_contacts')</p></a>
							</li>
							@endcan @endif @endif @if($customer_reference) @if($enable_petro_module && $contact_customer && !$property_module)
							<li class="nav-item {{ $request->segment(1) == 'customer-reference' ? 'active' : '' }}">
								<a href="{{action('CustomerReferenceController@index')}}" class="nav-link"><i class="fa fa-link nav-icon"></i> <p>@lang('lang_v1.customer_reference')</p></a>
							</li>
							@endif @endif @if($contact_customer) @if($customer_statement)
							<li class="nav-item {{ $request->segment(1) == 'customer-statement' ? 'active' : '' }}">
								<a href="{{action('CustomerStatementController@index')}}" class="nav-link"><i class="fa fa-paperclip nav-icon"></i> <p>@lang('contact.customer_statements')</p></a>
							</li>
							@endif @if($customer_payment)
							<li class="nav-item {{ $request->segment(1) == 'customer-payment-simple' ? 'active' : '' }}">
								<a href="{{action('CustomerPaymentController@index')}}" class="nav-link"><i class="fa fa-money-bill nav-icon"></i> <p>@lang('lang_v1.customer_payments')</p></a>
							</li>
							@endif @if($outstanding_received)
							<li class="nav-item  {{ $request->segment(1) == 'outstanding-received-report' ? 'active' : '' }}">
								<a href="{{action('ContactController@getOutstandingReceivedReport')}}" class="nav-link"><i class="fa fa-arrow-right nav-icon"></i> <p>@lang('lang_v1.outstanding_received')</p></a>
							</li>
							@endif @endif @if($contact_supplier) @if($issue_payment_detail)
							<li class="nav-item  {{ $request->segment(1) == 'issued-payment-details' ? 'active' : '' }}">
								<a href="{{action('ContactController@getIssuedPaymentDetails')}}" class="nav-link"><i class="fa fa-arrow-left nav-icon"></i> <p>@lang('lang_v1.issued_payment_details')</p></a>
							</li>
							@endif @endif
						</ul>
					</li>
				@endif
			@endif
			@if($property_module)
				@includeIf('property::layouts.partials.sidebar')
			@endif
			@if($products)
				@if(auth()->user()->can('product.view') || auth()->user()->can('product.create') || auth()->user()->can('brand.view') || auth()->user()->can('unit.view') || auth()->user()->can('category.view') || auth()->user()->can('brand.create') || auth()->user()->can('unit.create') || auth()->user()->can('category.create') )
					<li class="nav-item treeview {{ in_array($request->segment(1), ['variation-templates', 'products', 'labels', 'import-products', 'import-opening-stock', 'selling-price-group', 'brands', 'units', 'categories', 'warranties']) ? 'active active-sub' : '' }}"
						id="tour_step5">
						<a href="#" id="tour_step5_menu" class="nav-link">
							<i class="fa fa-cubes nav-icon"></i> <p>@lang('sale.products') <i class="right fas fa-angle-left"></i></p>
							
								
							
						</a>
						<ul class="nav nav-treeview">
							@can('product.view')
							<li class="nav-item  {{ $request->segment(1) == 'products' && $request->segment(2) == '' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('ProductController@index')}}"><i class="fa fa-list nav-icon"></i><p>@lang('lang_v1.list_products')</p></a>
							</li>
							@endcan @can('product.create')
							<li class="nav-item  {{ $request->segment(1) == 'products' && $request->segment(2) == 'create' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('ProductController@create')}}"><i class="fa fa-plus-circle nav-icon"></i><p>@lang('product.add_product')</p></a>
							</li>
							@endcan @can('product.view')
							<li class="nav-item  {{ $request->segment(1) == 'labels' && $request->segment(2) == 'show' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('LabelsController@show')}}"><i class="fa fa-barcode nav-icon"></i><p>@lang('barcode.print_labels')</p></a>
							</li>
							@endcan @can('product.create')
							<li class="nav-item  {{ $request->segment(1) == 'variation-templates' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('VariationTemplateController@index')}}"><i class="fa fa-circle-notch nav-icon"></i><p>@lang('product.variations')</p></a>
							</li>
							@endcan @can('product.create')
							<li class="nav-item  {{ $request->segment(1) == 'import-products' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('ImportProductsController@index')}}"><i class="fa fa-download nav-icon"></i><p>@lang('product.import_products')</p></a>
							</li>
							@endcan @if(session()->get('business.is_pharmacy'))
							<li class="nav-item  {{ $request->segment(1) == 'sample-medical-product-list' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('SampleMedicalProductController@index')}}"><i class="fa fa-download nav-icon"></i><p>@lang('lang_v1.sample_medical_product_list')</p></a>
							</li>
							@endif @can('product.opening_stock')
							<li class="nav-item  {{ $request->segment(1) == 'import-opening-stock' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('ImportOpeningStockController@index')}}"><i class="fa fa-download nav-icon"></i><p>@lang('lang_v1.import_opening_stock')</p></a>
							</li>
							@endcan @can('product.create')
							<li class="nav-item  {{ $request->segment(1) == 'selling-price-group' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('SellingPriceGroupController@index')}}"><i class="fa fa-circle-notch nav-icon"></i><p>@lang('lang_v1.selling_price_group')</p></a>
							</li>
							@endcan @if(auth()->user()->can('unit.view') || auth()->user()->can('unit.create'))
							<li class="nav-item  {{ $request->segment(1) == 'units' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('UnitController@index')}}"><i class="fa fa-balance-scale nav-icon"></i> <p>@lang('unit.units')</p></a>
							</li>
							@endif @if(auth()->user()->can('category.view') || auth()->user()->can('category.create'))
							<li class="nav-item  {{ $request->segment(1) == 'categories' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('CategoryController@index')}}"><i class="fa fa-tags nav-icon"></i> <p>@lang('category.categories') </p></a>
							</li>
							@endif @if(auth()->user()->can('brand.view') || auth()->user()->can('brand.create'))
							<li class="nav-item  {{ $request->segment(1) == 'brands' ? 'active' : '' }}">
								<a class="nav-link" href="{{action('BrandController@index')}}"><i class="fa fa-gem nav-icon"></i> <p>@lang('brand.brands')</p></a>
							</li>
							@endif
							<li class="nav-item  {{ $request->segment(1) == 'warranties' ? 'active active-sub' : '' }}">
								<a class="nav-link" href="{{action('WarrantyController@index')}}">
									<i class="fa fa-shield-virus nav-icon"></i>
									<span class="title">@lang('lang_v1.warranties')</p>
								</a>
							</li>
							@if($enable_petro_module) @if($merge_sub_category)
							<li class="nav-item  {{ $request->segment(1) == 'merged-sub-categories' ? 'active active-sub' : '' }}">
								<a class="nav-link" href="{{action('MergedSubCategoryController@index')}}">
									<i class="fa fa-compress nav-icon"></i>
									<span class="title">@lang('lang_v1.merged_sub_categories')</p>
								</a>
							</li>
							@endif @endif
						</ul>
					</li>
				@endif
			@endif
            <!-- Start Petro Module -->
            @if($enable_petro_module) @if(auth()->user()->can('petro.access')) @includeIf('petro::layouts.partials.sidebar') @endif @endif
            <!-- End Petro Module -->
            <!-- Start MPCS Module -->
            @if($mpcs_module) @if(auth()->user()->can('mpcs.access')) @includeIf('mpcs::layouts.partials.sidebar') @endif @endif
            <!-- End MPCS Module -->
            <!-- Start Fleet Module -->
            @if($fleet_module) @if(auth()->user()->can('fleet.access')) @includeIf('fleet::layouts.partials.sidebar') @endif @endif
            <!-- End Fleet Module -->
            <!-- Start Ezyboat Module -->
            @if($ezyboat_module) {{-- @if(auth()->user()->can('ezyboat.access')) --}} @includeIf('ezyboat::layouts.partials.sidebar') {{-- @endif --}} @endif
            <!-- End Ezyboat Module -->
            <!-- Start Gold Module -->
            @if($ran_module) @if(auth()->user()->can('ran.access')) @includeIf('ran::layouts.partials.sidebar') @endif @endif
            <!-- End Gold Module -->
            @if(Module::has('Manufacturing')) @if($mf_module) @if(auth()->user()->is_customer == 0) @if(auth()->user()->can('manufacturing.access_recipe') || auth()->user()->can('manufacturing.access_production') )
            @include('manufacturing::layouts.partials.sidebar') @endif @endif @endif @endif

            @if($purchase && $purchase_module)
                @if(in_array('purchase', $enabled_modules))
                    @if(auth()->user()->can('purchase.view') || auth()->user()->can('purchase.create') || auth()->user()->can('purchase.update') )
                        <li class="nav-item treeview {{in_array($request->segment(1), ['purchases', 'purchase-return', 'import-purchases']) ? 'active active-sub' : '' }}" id="tour_step6">
                            <a href="#" id="tour_step6_menu" class="nav-link">
                                <i class="fa fa-arrow-circle-down nav-icon"></i>
                                <p>@lang('purchase.purchases')</p>
                                <span class="pull-right-container">
                                    <i class="right fas fa-angle-left"></i>
                                </p>
                            </a>
                            <ul class="nav nav-treeview">
                                @if($all_purchase)
                                <li class="nav-item  {{ $request->segment(1) == 'purchases' && $request->segment(2) == null ? 'active' : '' }}">
                                    <a href="{{action('PurchaseController@index')}}" class="nav-link"><i class="fa fa-list nav-icon"></i><p>@lang('purchase.list_purchase')</p></a>
                                </li>
                                @endif
                                @if($add_bulk_purchase)
                                <li class="nav-item  {{ $request->segment(1) == 'purchases' && $request->segment(2) == 'add-purchase-bulk' ? 'active' : '' }}">
                                    <a href="{{action('PurchaseController@addPurchaseBulk')}}" class="nav-link"><i class="fa fa-stack-exchange nav-icon"></i> @lang('purchase.add_purchase_bulk')</p></a>
                                </li>
                                @endif
                                @if($add_purchase)
                                <li class="nav-item  {{ $request->segment(1) == 'purchases' && $request->segment(2) == 'create' ? 'active' : '' }}">
                                    <a href="{{action('PurchaseController@create')}}" class="nav-link"><i class="fa fa-plus-circle nav-icon"></i> @lang('purchase.add_purchase')</p></a>
                                </li>
                                @endif
                                @if($purchase_return)
                                <li class="nav-item  {{ $request->segment(1) == 'purchase-return' ? 'active' : '' }}">
                                    <a href="{{action('PurchaseReturnController@index')}}" class="nav-link"><i class="fa fa-undo nav-icon"></i> @lang('lang_v1.list_purchase_return')</p></a>
                                </li>
                                @endif
                                @if($import_purchase)
                                <li class="nav-item  {{ $request->segment(1) == 'import-purchases'? 'active' : '' }}">
                                    <a href="{{action('ImportPurchasesController@index')}}" class="nav-link"><i class="fa fa-recycle nav-icon"></i><p>@lang('lang_v1.import_purchases')</p></a>
                                </li>
                                @endif
                            </ul>
                        </li>
                    @endif
                @endif
            @endif
            @if($sale_module) @if(in_array('add_sale', $enabled_modules)) @if(auth()->user()->can('sell.view') || auth()->user()->can('sell.create') || auth()->user()->can('direct_sell.access') ||
            auth()->user()->can('view_own_sell_only'))
            <li class="nav-item treeview {{  in_array( $request->segment(1), ['sales', 'pos', 'sell-return', 'ecommerce', 'discount', 'shipments', 'import-sales', 'reserved-stocks']) ? 'active active-sub' : '' }}" id="tour_step7">
                <a href="#" class="nav-link" id="tour_step7_menu">
                    <i class="fa fa-arrow-circle-up nav-icon"></i> <p>@lang('sale.sale')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    @if($all_sales) @if(auth()->user()->can('direct_sell.access') || auth()->user()->can('view_own_sell_only'))
                    <li class="nav-item  {{ $request->segment(1) == 'sales' && $request->segment(2) == null ? 'active' : '' }}">
                        <a href="{{action('SellController@index')}}" class="nav-link"><i class="fa fa-list nav-icon"></i><p>@lang('lang_v1.all_sales')</p></a>
                    </li>
                    @endif @endif
                    <!-- Call superadmin module if defined -->
                    @if(Module::has('Ecommerce')) @includeIf('ecommerce::layouts.partials.sell_sidebar') @endif @if($add_sale) @can('direct_sell.access')
                    <li class="nav-item  {{ $request->segment(1) == 'sales' && $request->segment(2) == 'create' ? 'active' : '' }}">
                        <a href="{{action('SellController@create')}}" class="nav-link"><i class="fa fa-plus-circle nav-icon"></i><p>@lang('sale.add_sale')</p></a>
                    </li>
                    @endcan @endif @if($list_pos) @can('sell.view')
                    <li class="nav-item  {{ $request->segment(1) == 'pos' && $request->segment(2) == null ? 'active' : '' }}">
                        <a href="{{action('SellPosController@index')}}" class="nav-link"><i class="fa fa-list nav-icon"></i><p>@lang('sale.list_pos')</p></a>
                </li>
                    @endcan @endif @if(in_array('pos_sale', $enabled_modules)) @can('sell.create')
                    <li class="nav-item  {{ $request->segment(1) == 'pos' && $request->segment(2) == 'create' ? 'active' : '' }}">
                        <a href="{{action('SellPosController@create')}}" class="nav-link"><i class="fa fa-plus-circle nav-icon"></i><p>@lang('sale.pos_sale')</p></a>
                    </li>
                    @endcan @endif @if($list_draft) @can('list_drafts')
                    <li class="nav-item  {{ $request->segment(1) == 'sales' && $request->segment(2) == 'drafts' ? 'active' : '' }}">
                        <a href="{{action('SellController@getDrafts')}}" class="nav-link"><i class="fa fa-pencil-square nav-icon" aria-hidden="true"></i><p>@lang('lang_v1.list_drafts')</p></a>
                    </li>
                    @endcan @endif @if($list_quotation) @can('list_quotations')
                    <li class="nav-item  {{ $request->segment(1) == 'sales' && $request->segment(2) == 'quotations' ? 'active' : '' }}">
                        <a href="{{action('SellController@getQuotations')}}" class="nav-link"><i class="fa fa-pencil-square nav-icon" aria-hidden="true"></i><p>@lang('lang_v1.list_quotations')</p></a>
                    </li>
                    @endcan @endif @if($customer_order_own_customer == 1 || $customer_order_general_customer == 1) @if($list_orders)
                    <li class="nav-item  {{ $request->segment(1) == 'sales' && $request->segment(2) == 'customer-orders' ? 'active' : '' }}">
                        <a href="{{action('SellController@getCustomerOrders')}}" class="nav-link"><i class="fa fa-pencil-square nav-icon" aria-hidden="true"></i><p>@lang('lang_v1.list_orders')</p></a>
                    </li>
                    @endif @if($upload_orders)
                    <li class="nav-item  {{ $request->segment(1) == 'sales' && $request->segment(2) == 'customer-orders' ? 'active' : '' }}">
                        <a href="{{action('SellController@getCustomerUploadedOrders')}}" class="nav-link"><i class="fa fa-upload nav-icon" aria-hidden="true"></i><p>@lang('customer.uploaded_orders')</p></a>
                    </li>
                    @endif @endif @if($list_sell_return) @can('sell.view')
                    <li class="nav-item  {{ $request->segment(1) == 'sell-return' && $request->segment(2) == null ? 'active' : '' }}">
                        <a href="{{action('SellReturnController@index')}}" class="nav-link"><i class="fa fa-undo nav-icon"></i><p>@lang('lang_v1.list_sell_return')</p></a>
                    </li>
                    @endcan @endif @if($shipment) @can('access_shipping')
                    <li class="nav-item  {{ $request->segment(1) == 'shipments' ? 'active' : '' }}">
                        <a href="{{action('SellController@shipments')}}" class="nav-link"><i class="fa fa-truck nav-icon"></i><p>@lang('lang_v1.shipments')</p></a>
                    </li>
                    @endcan @endif @if($discount) @can('discount.access')
                    <li class="nav-item  {{ $request->segment(1) == 'discount' ? 'active' : '' }}">
                        <a href="{{action('DiscountController@index')}}" class="nav-link"><i class="fa fa-percent nav-icon"></i><p>@lang('lang_v1.discounts')</p></a>
                    </li>
                    @endcan @endif @if($subcriptions) @if(in_array('subscription', $enabled_modules) && auth()->user()->can('direct_sell.access'))
                    <li class="nav-item  {{ $request->segment(1) == 'subscriptions'? 'active' : '' }}">
                        <a href="{{action('SellPosController@listSubscriptions')}}"><i class="fa fa-recycle nav-icon"></i><p>@lang('lang_v1.subscriptions')</p></a>
                    </li>
                    @endif @endif @if($import_sale)
                    <li class="nav-item  {{ $request->segment(1) == 'import-sales'? 'active' : '' }}">
                        <a href="{{action('ImportSalesController@index')}}" class="nav-link"><i class="fa fa-recycle nav-icon"></i><p>@lang('lang_v1.import_sales')</p></a>
                    </li>
                    @endif @if($reserved_stock)
                    <li class="nav-item  {{ $request->segment(1) == 'reserved-stocks'? 'active' : '' }}">
                        <a href="{{action('ReservedStocksController@index')}}" class="nav-link"><i class="fa fa-recycle nav-icon"></i><p>@lang('lang_v1.reserved_stocks')</p></a>
                    </li>
                    @endif @if($customer_settings) @if($over_limit_sales)
                    <li class="nav-item  {{ $request->segment(1) == 'sales' && $request->segment(2) == 'over-limit-sales' ? 'active' : '' }}">
                        <a href="{{action('SellController@overLimitSales')}}" class="nav-link"><i class="fa fa-plus-circle nav-icon"></i><p>@lang('sale.over_limit_sales')</p></a>
                    </li>
                    @endif @endif
                </ul>
            </li>
            @endif @endif @endif @if(Module::has('Repair')) @if($repair_module) @if(auth()->user()->can('repair.access'))
            <li class="nav-item  {{ $request->segment(1) == 'repair' ? 'active' : '' }}">
                <a href="{{action('\Modules\Repair\Http\Controllers\DashboardController@index')}}" class="nav-link"><i class="fa fa-wrench nav-icon"></i><p>@lang('lang_v1.repair')</p></a>
            </li>
            @endif @endif @endif @if($stock_transfer) @if(in_array('stock_transfer', $enabled_modules)) @if(auth()->user()->can('purchase.view') || auth()->user()->can('purchase.create') )
            <li class="nav-item treeview {{ $request->segment(1) == 'stock-transfers' || $request->segment(1) == 'stock-transfers-request'  ? 'active active-sub' : '' }}">
                <a href="#" class="nav-link">
                    <i class="fa fa-truck nav-icon" aria-hidden="true"></i> <p>@lang('lang_v1.stock_transfers')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    @can('purchase.view')
                    <li class="nav-item  {{ $request->segment(1) == 'stock-transfers' && $request->segment(2) == null ? 'active' : '' }}">
                        <a href="{{action('StockTransferController@index')}}"><i class="fa fa-list nav-icon"></i><p>@lang('lang_v1.list_stock_transfers')</p></a>
                    </li>
                    @endcan @can('purchase.create')
                    <li class="nav-item  {{ $request->segment(1) == 'stock-transfers' && $request->segment(2) == 'create' ? 'active' : '' }}">
                        <a href="{{action('StockTransferController@create')}}"><i class="fa fa-plus-circle nav-icon"></i><p>@lang('lang_v1.add_stock_transfer')</p></a>
                    </li>
                    @endcan {{-- @can('purchase.create') --}}
                    <li class="nav-item  {{ $request->segment(1) == 'stock-transfers-request' && $request->segment(2) == null ? 'active' : '' }}">
                        <a href="{{action('StockTransferRequestController@index')}}"><i class="fa fa-question-circle nav-icon"></i><p>@lang('lang_v1.stock_transfer_request')</p></a>
                    </li>
                    {{-- @endcan --}}
                    <!--<li>-->
                    <!--    <a href="{{ url('List_Store_Transaction') }}"><i class="fa fa-list nav-icon"></i><p>@lang('lang_v1.list_store_transactions')</p></a>-->
                    <!--</li>-->
                    <li></li>
                </ul>
            </li>
            @endif @endif @endif {{-- @if($stock_adjustment)--}} {{-- @if(in_array('stock_adjustment', $enabled_modules))--}} {{-- @if(auth()->user()->can('purchase.view') || auth()->user()->can('purchase.create') )--}}
            <li class="nav-item treeview {{ $request->segment(1) == 'stock-adjustments' ? 'active active-sub' : '' }}">
                <a href="#" class="nav-link">
                    <i class="fa fa-database nav-icon" aria-hidden="true"></i>
                    <p>@lang('stock_adjustment.stock_adjustment')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    @can('purchase.view')
                    <li class="nav-item  {{ $request->segment(1) == 'stock-adjustments' && $request->segment(2) == null ? 'active' : '' }}">
                        <a href="{{action('StockAdjustmentController@index')}}"><i class="fa fa-list nav-icon"></i><p>@lang('stock_adjustment.list')</p></a>
                    </li>
                    @endcan @can('purchase.create')
                    <li class="nav-item  {{ $request->segment(1) == 'stock-adjustments' && $request->segment(2) == 'create' ? 'active' : '' }}">
                        <a href="{{action('StockAdjustmentController@create')}}"><i class="fa fa-plus-circle nav-icon"></i><p>@lang('stock_adjustment.add')</p></a>
                    </li>
                    @endcan
                </ul>
            </li>
            {{-- @endif--}} {{-- @endif--}} {{-- @endif--}} @if($expenses) @if(in_array('expenses', $enabled_modules)) @if(auth()->user()->can('expense.access'))
            <li class="nav-item treeview {{  in_array( $request->segment(1), ['expense-categories', 'expenses']) ? 'active active-sub' : '' }}">
                <a href="#" class="nav-link">
                    <i class="fa fa-minus-circle nav-icon"></i> <p>@lang('expense.expenses')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item  {{ $request->segment(1) == 'expenses' && empty($request->segment(2)) ? 'active' : '' }}">
                        <a href="{{action('ExpenseController@index')}}"><i class="fa fa-list nav-icon"></i><p>@lang('lang_v1.list_expenses')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'expenses' && $request->segment(2) == 'create' ? 'active' : '' }}">
                        <a href="{{action('ExpenseController@create')}}"><i class="fa fa-plus-circle nav-icon"></i><p>@lang('messages.add') @lang('expense.expenses')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'expense-categories' ? 'active' : '' }}">
                        <a href="{{action('ExpenseCategoryController@index')}}"><i class="fa fa-circle-notch nav-icon"></i><p>@lang('expense.expense_categories')</p></a>
                    </li>
                </ul>
            </li>
            @endif @endif @endif
            <!-- Start hr Module -->
            @if($hr_module) @includeIf('hr::layouts.partials.sidebar') @endif
            <!-- End hr Module -->
            <!-- Start PayRoll Module -->
            @if($payday) @if(auth()->user()->can('payday') && !auth()->user()->is_pump_operator && !auth()->user()->is_property_user)
            <li>
                <a href="javascript:void(0);" id="login_payroll"> <i class="fa fa-briefcase nav-icon"></i> <p> PayRoll</p> </a>
            </li>
            @endif @endif
            <!-- End PayRoll Module -->
            <!-- Start Task Management Module -->
            @if($tasks_management)
                @can('tasks_management.access')
                    @includeIf('tasksmanagement::layouts.partials.sidebar')
                @endcan
            @endif
            <!-- End Task Management Module -->
            @if($banking_module == 1 || $access_account == 1)
                @if(in_array('account', $enabled_modules) || in_array('banking_module', $enabled_modules))
                    @can('account.access')
                        <li class="nav-item treeview {{ $request->segment(1) == 'accounting-module' ? 'active active-sub' : '' }}">
                <a href="#" class="nav-link">
                    <i class="fa fa-money-bill nav-icon" aria-hidden="true"></i> <p>@if($access_account) @lang('account.accounting_module') @else @lang('account.banking_module') @endif</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'account' ? 'active' : '' }}">
                        <a href="{{action('AccountController@index')}}"><i class="fa fa-list nav-icon"></i><p>@lang('account.list_accounts')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'disabled-account' ? 'active' : '' }}">
                        <a href="{{action('AccountController@disabledAccount')}}"><i class="fa fa-times nav-icon"></i><p>@lang('account.disabled_account')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'journals' ? 'active' : '' }}">
                        <a href="{{action('JournalController@index')}}"><i class="fa fa-book nav-icon"></i><p>@lang('account.list_journals')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'get-profit-loss-report' ? 'active' : '' }}">
                        <a href="{{action('AccountController@getProfitLossReport')}}"><i class="fa fa-file-text nav-icon"></i><p>@lang('lang_v1.profit_loss_report')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'income-statement' ? 'active' : '' }}">
                        <a href="{{action('AccountReportsController@incomeStatement')}}"><i class="fa fa-book nav-icon"></i><p>@lang('account.income_statement')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'balance-sheet' ? 'active' : '' }}">
                        <a href="{{action('AccountReportsController@balanceSheet')}}"><i class="fa fa-book nav-icon"></i><p>@lang('account.balance_sheet')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'trial-balance' ? 'active' : '' }}">
                        <a href="{{action('AccountReportsController@trialBalance')}}"><i class="fa fa-balance-scale nav-icon"></i><p>@lang('account.trial_balance')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'cash-flow' ? 'active' : '' }}">
                        <a href="{{action('AccountController@cashFlow')}}"><i class="fa fa-exchange nav-icon"></i><p>@lang('lang_v1.cash_flow')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-modproductule' && $request->segment(2) == 'payment-account-report' ? 'active' : '' }}">
                        <a href="{{action('AccountReportsController@paymentAccountReport')}}"><i class="fa fa-file-text-o nav-icon"></i><p>@lang('account.payment_account_report')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'accounting-module' && $request->segment(2) == 'import' ? 'active' : '' }}">
                        <a href="{{action('AccountController@getImportAccounts')}}"><i class="fa fa-download nav-icon"></i><p>@lang('lang_v1.import_accounts')</p></a>
                    </li>
                </ul>
            </li>
                    @endcan
                @endif
            @endif




            @if($report_module) @if(auth()->user()->can('report.access'))
            <li class="nav-item treeview {{  in_array( $request->segment(1), ['reports']) ? 'active active-sub' : '' }}" id="tour_step8">
                <a href="#" id="tour_step8_menu">
                    <i class="fa fa-bar-chart-o nav-icon"></i> <p>@lang('report.reports') <i class="right fas fa-angle-left"></i></p>
                    
                </a>
                <ul class="nav nav-treeview">
                    @if($product_report) @if(auth()->user()->can('stock_report.view') || auth()->user()->can('stock_adjustment_report.view') || auth()->user()->can('item_report.view') || auth()->user()->can('product_purchase_report.view')
                    || auth()->user()->can('product_sell_report.view') || auth()->user()->can('product_transaction_report.view') )
                    <li class="nav-item  {{ $request->segment(2) == 'product' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getProductReport')}}"><i class="fa fa-hourglass-half nav-icon"></i><p>@lang('report.product_report')</p></a>
                    </li>
                    @endif @endif @if($payment_status_report) @if(auth()->user()->can('purchase_payment_report.view') || auth()->user()->can('sell_payment_report.view') || auth()->user()->can('outstanding_received_report.view') ||
                    auth()->user()->can('aging_report.view') )
                    <li class="nav-item  {{ $request->segment(2) == 'payment-status' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getPaymentStatusReport')}}"><i class="fa fa-money-bill nav-icon"></i><p>@lang('report.payment_status_report')</p></a>
                    </li>
                    @endif @endif @if(auth()->user()->can('daily_report.view') || auth()->user()->can('daily_summary_report.view') || auth()->user()->can('register_report.view') || auth()->user()->can('profit_loss_report.view') )
                    <li class="nav-item  {{ $request->segment(2) == 'management' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getManagementReport')}}"><i class="fa fa-briefcase nav-icon"></i><p>@lang('report.management_report')</p></a>
                    </li>
                    @endif @if($verification_report || $report_verification)
                    <li class="nav-item  {{ $request->segment(2) == 'verification' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getVerificationReport')}}"><i class="fa fa-check-circle nav-icon"></i><p>@lang('report.verification_reports')</p></a>
                    </li>
                    @endif @if($activity_report) @if(auth()->user()->can('sales_report.view') || auth()->user()->can('purchase_and_slae_report.view') || auth()->user()->can('expense_report.view') ||
                    auth()->user()->can('sales_representative.view') || auth()->user()->can('tax_report.view') )
                    <li class="nav-item  {{ $request->segment(2) == 'activity' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getActivityReport')}}"><i class="fa fa-user-secret nav-icon"></i><p>@lang('report.activity_report')</p></a>
                    </li>
                    @endif @endif @if($contact_report) @can('contact_report.view')
                    <li class="nav-item  {{ $request->segment(2) == 'contact' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getContactReport')}}"><i class="fa fa-address-book nav-icon"></i><p>@lang('report.contact_report')</p></a>
                    </li>
                    @endcan @endif @can('stock_report.view') @if(session('business.enable_product_expiry') == 1)
                    <li class="nav-item  {{ $request->segment(2) == 'stock-expiry' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getStockExpiryReport')}}"><i class="fa fa-calendar-times-o nav-icon"></i><p>@lang('report.stock_expiry_report')</p></a>
                    </li>
                    @endif @endcan @can('stock_report.view') @if(session('business.enable_lot_number') == 1)
                    <li class="nav-item  {{ $request->segment(2) == 'lot-report' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getLotReport')}}"><i class="fa fa-hourglass-half nav-icon" aria-hidden="true"></i><p>@lang('lang_v1.lot_report')</p></a>
                    </li>
                    @endif @endcan @if($trending_product) @can('trending_products.view')
                    <li class="nav-item  {{ $request->segment(2) == 'trending-products' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getTrendingProducts')}}"><i class="fa fa-line-chart nav-icon" aria-hidden="true"></i><p>@lang('report.trending_products')</p></a>
                    </li>
                    @endcan @endif @if($user_activity) @can('user_activity.view')
                    <li class="nav-item  {{ $request->segment(2) == 'user_activity' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getUserActivityReport')}}">
							<i class="fa fa-eercast" aria-hidden="true"></i>
							<span class="title">@lang('report.user_activity')</p>
						</a>
                    </li>

                     @endcan @endif @if($report_table) @can('report_table.view')
                    <li class="nav-item  {{ $request->segment(2) == 'table-report' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getTableReport')}}"><i class="fa fa-table nav-icon"></i><p>@lang('restaurant.table_report')</p></a>
                    </li>
                   @endcan @endif @if($report_staff_service) @can('sales_representative.view')
                    <li class="nav-item  {{ $request->segment(2) == 'service-staff-report' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('ReportController@getServiceStaffReport')}}"><i class="fa fa-user-secret nav-icon"></i><p>@lang('restaurant.service_staff_report')</p></a>
                    </li>

                    @endcan @endif
                    <!--@if($tables) @if(in_array('tables', $enabled_modules)) @can('purchase_n_sell_report.view')-->
                    <!--<li class="nav-item  {{ $request->segment(2) == 'table-report' ? 'active' : '' }}">-->
                    <!--    <a class="nav-link" href="{{action('ReportController@getTableReport')}}"><i class="fa fa-table nav-icon"></i><p>@lang('restaurant.table_report')</p></a>-->
                    <!--</li>-->
                    <!--@endcan @endif @endif @if($service_staff) @if(in_array('service_staff', $enabled_modules)) @can('sales_representative.view')-->
                    <!--<li class="nav-item  {{ $request->segment(2) == 'service-staff-report' ? 'active' : '' }}">-->
                    <!--    <a class="nav-link" href="{{action('ReportController@getServiceStaffReport')}}"><i class="fa fa-user-secret nav-icon"></i><p>@lang('restaurant.service_staff_report')</p></a>-->
                    <!--</li>-->
                    <!--@endcan @endif @endif-->
                </ul>
            </li>
            @endif @endif @if($catalogue_qr) @if(auth()->user()->can('catalogue.access'))
            <li class="nav-item treeview {{  in_array( $request->segment(1), ['backup']) ? 'active active-sub' : '' }}">
                <a class="nav-link" href="{{action('\Modules\ProductCatalogue\Http\Controllers\ProductCatalogueController@generateQr')}}">
                    <i class="fa fa-qrcode"></i>
                    <p>@lang('lang_v1.catalogue_qr')</p>
                </a>
            </li>
            @endif @endif @if($backup_module) @can('backup')
            <li class="nav-item treeview {{  in_array( $request->segment(1), ['backup']) ? 'active active-sub' : '' }}">
                <a class="nav-link" href="{{action('BackUpController@index')}}">
                    <i class="fa fa-dropbox"></i>
                    <p>@lang('lang_v1.backup')</p>
                </a>
            </li>
            @endcan @endif




            <!-- Call restaurant module if defined -->
            @if($enable_booking)
            <!-- check if module in subscription -->
            @if(in_array('booking', $enabled_modules)) @if(auth()->user()->can('crud_all_bookings') || auth()->user()->can('crud_own_bookings') )
            <li class="nav-item treeview {{ $request->segment(1) == 'bookings'? 'active active-sub' : '' }}">
                <a class="nav-link" href="{{action('Restaurant\BookingController@index')}}"><i class="fa fa-calendar-check-o"></i> <p>@lang('restaurant.bookings')</p></a>
            </li>
            @endif @endif @endif @if($kitchen) @if(in_array('kitchen', $enabled_modules))
            <li class="nav-item treeview {{ $request->segment(1) == 'modules' && $request->segment(2) == 'kitchen' ? 'active active-sub' : '' }}">
                <a class="nav-link" href="{{action('Restaurant\KitchenController@index')}}"><i class="fa fa-fire"></i> <p>@lang('restaurant.kitchen')</p></a>
            </li>
            @endif @endif @if($orders) @if(in_array('service_staff', $enabled_modules))
            <li class="nav-item treeview {{ $request->segment(1) == 'modules' && $request->segment(2) == 'orders' ? 'active active-sub' : '' }}">
                <a class="nav-link" href="{{action('Restaurant\OrderController@index')}}"><i class="fa fa-list-alt"></i> <p>@lang('restaurant.orders')</p></a>
            </li>
            @endif @endif @if($notification_template_module) @can('send_notifications')
            <li class="nav-item treeview {{  $request->segment(1) == 'notification-templates' ? 'active active-sub' : '' }}">
                <a href="{{ url('notification-templates')}}">
                    <i class="fa fa-envelope"></i> <p>@lang('lang_v1.notification_templates')</p>
                    <!-- <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p> -->
                </a>
                <!-- <ul class="nav nav-treeview">
                    @if($enable_sms) @can('sms.view')
                    <li class="nav-item  {{ $request->segment(2) == 'sms-template' ? 'active' : '' }}">
                        <a href="{{ url('notification-templates/sms-template')}}"><i class="fa fa-commenting-o"></i> @lang('lang_v1.sms_template')</p></a>
                    </li>
                    @endcan @endif
                    <li class="nav-item  {{ $request->segment(2) == 'email-template' ? 'active' : '' }}">
                        <a href="{{ url('notification-templates/email-template')}}"><i class="fa fa-envelope-o"></i> @lang('lang_v1.email_template')</p></a>
                    </li>
                </ul> -->
            </li>
            @endif @endrole @php $business_or_entity = App\System::getProperty('business_or_entity'); @endphp @if(!$disable_all_other_module_vr) @if(!auth()->user()->is_pump_operator)
            <li
                class="treeview @if( in_array($request->segment(1), ['pay-online', 'stores', 'business', 'tax-rates', 'barcodes', 'invoice-schemes', 'business-location', 'invoice-layouts', 'printers', 'subscription', 'types-of-service']) || in_array($request->segment(2), ['tables', 'modifiers']) ) {{'active active-sub'}} @endif"
            >
                <a href="#" id="tour_step2_menu">
                    <i class="fa fa-cog"></i> <p>@lang('business.settings')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="treeview-menu" id="tour_step3">
                    @if($settings_module) @can('business_settings.access') @if($business_settings)
                    <li class="nav-item  {{ $request->segment(1) == 'business' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('BusinessController@getBusinessSettings')}}" id="tour_step2">
                            <i class="fa fa-cogs"></i> @if($business_or_entity == 'business'){{ __('business.business_settings') }} @elseif($business_or_entity == 'entity'){{ __('lang_v1.entity_settings') }} @else {{
                            __('business.business_settings') }} @endif
                        </a>
                    </li>
                    @endif @if($business_location)
                    <li class="nav-item  {{ $request->segment(1) == 'business-location' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('BusinessLocationController@index')}}">
                            <i class="fa fa-map-marker"></i> @if($business_or_entity == 'business'){{ __('business.business_locations') }} @elseif($business_or_entity == 'entity'){{ __('lang_v1.entity_locations') }} @else {{
                            __('business.business_locations') }} @endif
                        </a>
                    </li>
                    @endif @if(!$property_module)
                    <li class="nav-item  {{ $request->segment(1) == 'stores' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('StoreController@index')}}"><i class="fa fa-stack-exchange"></i> @lang('business.stores_settings')</p></a>
                    </li>
                    @endif @endcan @can('invoice_settings.access') @if($invoice_settings)
                    <li class="@if( in_array($request->segment(1), ['invoice-schemes', 'invoice-layouts']) ) {{'active'}} @endif">
                        <a class="nav-link" href="{{action('InvoiceSchemeController@index')}}"><i class="fa fa-file"></i> <p>@lang('invoice.invoice_settings')</p></a>
                    </li>
                    @endif @endcan @if(!$property_module) @can('barcode_settings.access')
                    <li class="nav-item  {{ $request->segment(1) == 'barcodes' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('BarcodeController@index')}}"><i class="fa fa-barcode"></i> <p>@lang('barcode.barcode_settings')</p></a>
                    </li>
                    @endcan
                    <li class="nav-item  {{ $request->segment(1) == 'printers' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('PrinterController@index')}}"><i class="fa fa-share-alt"></i> <p>@lang('printer.receipt_printers')</p></a>
                    </li>
                    @endif @if(auth()->user()->can('tax_rate.view') || auth()->user()->can('tax_rate.create')) @if($tax_rates)
                    <li class="nav-item  {{ $request->segment(1) == 'tax-rates' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('TaxRateController@index')}}"><i class="fa fa-bolt"></i> <p>@lang('tax_rate.tax_rates')</p></a>
                    </li>
                    @endif @endif @if(!$property_module) @if($customer_settings) @if(auth()->user()->can('customer_settings.access'))
                    <li class="nav-item  {{ $request->segment(1) == 'customer-settings' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('CustomerSettingsController@index')}}"><i class="fa fa-bolt"></i> <p>@lang('lang_v1.customer_settings')</p></a>
                    </li>
                    @endif @endif @if(in_array('tables', $enabled_modules)) @can('business_settings.access')
                    <li class="nav-item  {{ $request->segment(1) == 'modules' && $request->segment(2) == 'tables' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('Restaurant\TableController@index')}}"><i class="fa fa-table"></i> @lang('restaurant.tables')</p></a>
                    </li>
                    @endcan @endif @if($expenses) @if(in_array('modifiers', $enabled_modules)) @if(auth()->user()->can('product.view') || auth()->user()->can('product.create') )
                    <li class="nav-item  {{ $request->segment(1) == 'modules' && $request->segment(2) == 'modifiers' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('Restaurant\ModifierSetsController@index')}}"><i class="fa fa-delicious"></i> @lang('restaurant.modifiers')</p></a>
                    </li>
                    @endif @endif @endif @endif @if(in_array('type_of_service', $enabled_modules) && !$property_module)
                    <li class="nav-item  {{  $request->segment(1) == 'types-of-service' ? 'active active-sub' : '' }}">
                        <a class="nav-link" href="{{action('TypesOfServiceController@index')}}">
                            <i class="fa fa-user-circle-o"></i>
                            <p>@lang('lang_v1.types_of_service')</p>
                        </a>
                    </li>
                    @endif @endif @if(Module::has('Superadmin')) @includeIf('superadmin::layouts.partials.subscription') @endif
                    <li class="nav-item  {{ $request->segment(1) == 'pay-online' && $request->segment(2) == 'create' ? 'active active-sub' : '' }}">
                        <a class="nav-link" href="{{action('\Modules\Superadmin\Http\Controllers\PayOnlineController@create')}}">
                            <i class="fa fa-money-bill"></i>
                            <span class="title">
                                @lang('superadmin::lang.pay_online')
                            </p>
                        </a>
                    </li>
                </ul>
            </li>
            @endif @endif @if($sms_module) @can('sms.access') @includeIf('sms::layouts.partials.sidebar') @endcan @endif @if($member_registration) @can('member.access') @includeIf('member::layouts.partials.sidebar') @endcan @endif
            @if(auth()->user()->hasRole('Super Manager#1'))
            <li class="nav-item treeview {{ in_array($request->segment(1), ['super-manager']) ? 'active active-sub' : '' }}">
                <a href="#" class="nav-link">
                    <i class="fa fa-user-secret nav-icon"></i>
                    <span class="title">@lang('lang_v1.super_manager')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item  {{ $request->segment(2) == 'visitors' ? 'active active-sub' : '' }}">
                        <a class="nav-link" href="{{action('SuperManagerVisitorController@index')}}">
                            <i class="fa fa-users"></i>
                            <span class="title">
                                @lang('lang_v1.all_visitor_details')
                            </p>
                        </a>
                    </li>
                </ul>
            </li>
            @endif @if($visitors_registration_module) @includeIf('visitor::layouts.partials.sidebar') @endif @if($user_management_module) @if(auth()->user()->can('user.view') || auth()->user()->can('user.create') ||
            auth()->user()->can('roles.view'))
            <li class="nav-item treeview {{ in_array($request->segment(1), ['roles', 'users', 'sales-commission-agents']) ? 'active active-sub' : '' }}">
                <a href="#" class="nav-link">
                    <i class="fa fa-users"></i>
                    <span class="title">@lang('user.user_management')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    @can( 'user.view' )
                    <li class="nav-item  {{ $request->segment(1) == 'users' ? 'active active-sub' : '' }}">
                        <a class="nav-link" href="{{action('ManageUserController@index')}}">
                            <i class="fa fa-user nav-icon"></i>
                            <span class="title">
                                @lang('user.users')
                            </p>
                        </a>
                    </li>
                    @endcan @can('roles.view')
                    <li class="nav-item  {{ $request->segment(1) == 'roles' ? 'active active-sub' : '' }}">
                        <a class="nav-link" href="{{action('RoleController@index')}}">
                            <i class="fa fa-briefcase nav-icon"></i>
                            <span class="title">
                                @lang('user.roles')
                            </p>
                        </a>
                    </li>
                    @endcan @if($enable_sale_cmsn_agent == 1) @can('user.create')
                    <li class="nav-item  {{ $request->segment(1) == 'sales-commission-agents' ? 'active active-sub' : '' }}">
                        <a class="nav-link" href="{{action('SalesCommissionAgentController@index')}}">
                            <i class="fa fa-handshake nav-icon"></i>
                            <span class="title">
                                @lang('lang_v1.sales_commission_agents')
                            </p>
                        </a>
                    </li>
                    @endcan @endif
                </ul>
            </li>
            @endif @endif
            <!-- call Project module if defined -->
            @if(Module::has('Project')) @includeIf('project::layouts.partials.sidebar') @endif
            <!-- call Essentials module if defined -->
            @if(Module::has('Essentials')) @includeIf('essentials::layouts.partials.sidebar_hrm') @includeIf('essentials::layouts.partials.sidebar') @endif @if(Module::has('Woocommerce')) @includeIf('woocommerce::layouts.partials.sidebar')
            @endif
            <!-- only customer accessable pages -->
            @if(auth()->user()->is_customer == 1)
            <li class="nav-item treeview {{  in_array( $request->segment(1), ['customer-sales', 'customer-sell-return', 'customer-order', 'customer-order-list']) ? 'active active-sub' : '' }}" id="">
                <a href="#" id="">
                    <i class="fa fa-arrow-circle-up nav-icon"></i> <p>@lang('sale.sale')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    <li class="nav-item  {{ $request->segment(1) == 'customer-sales' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('CustomerSellController@index')}}"><i class="fa fa-list nav-icon"></i><p>@lang('lang_v1.all_sales')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'customer-sell-return'  ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('CustomerSellReturnController@index')}}"><i class="fa fa-undo nav-icon"></i><p>@lang('lang_v1.list_sell_return')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'customer-order' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('CustomerOrderController@create')}}"><i class="fa fa-bullseye nav-icon"></i><p>@lang('lang_v1.order')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'customer-order-list' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('CustomerOrderController@getOrders')}}"><i class="fa fa-list-ol nav-icon"></i><p>@lang('lang_v1.list_order')</p></a>
                    </li>
                </ul>
            </li>
            @endif
            <!-- end only customer accessable pages -->
            @if($enable_cheque_writing == 1)
                @if(auth()->user()->can('enable_cheque_writing'))
            <!--  Cheque Writing Module pages -->
            <li class="nav-item treeview {{  in_array( $request->segment(1), ['cheque-templates', 'cheque-write', 'stamps', 'cheque-numbers','payees','deleted_cheque_details','printed_cheque_details','default_setting']) ? 'active active-sub' : '' }}" id="" style="background: brown;">
                <a href="#" id="">
                    <i class="fa fa-book nav-icon"></i> <p>@lang('cheque.cheque_writing_module')</p>
                    <span class="pull-right-container">
                        <i class="right fas fa-angle-left"></i>
                    </p>
                </a>
                <ul class="nav nav-treeview">
                    @if($cheque_templates)
                    <li class="nav-item  {{ $request->segment(1) == 'cheque-templates'  && $request->segment(2) == '' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('Chequer\ChequeTemplateController@index')}}"><i class="fa fa-book nav-icon"></i><p>@lang('cheque.templates')</p></a>
                    </li>
                    <li class="nav-item  {{ $request->segment(1) == 'cheque-templates' && $request->segment(2) == 'create' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('Chequer\ChequeTemplateController@create')}}"><i class="fa fa-plus nav-icon"></i><p>@lang('cheque.add_new_templates')</p></a>
                    </li>
                    @endif
                    @if($write_cheque)
                    <li class="nav-item  {{ $request->segment(1) == 'cheque-write' && $request->segment(2) == 'create' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('Chequer\ChequeWriteController@create')}}"><i class="fa fa-pencil-square-o nav-icon"></i><p>@lang('cheque.write_cheque')</p></a>
                    </li>
                    @endif
                    @if($manage_stamps)
                    <li class="nav-item  {{ $request->segment(1) == 'stamps' && $request->segment(2) == '' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('Chequer\ChequerStampController@index')}}"><i class="fa fa-gavel nav-icon"></i><p>@lang('cheque.manage_stamps')</p></a>
                    </li>
                    @endif
                    @if($manage_payee)
                   <li class="nav-item  {{ $request->segment(1) == 'payees' && $request->segment(2) == '' ? 'active' : '' }}">
                        <a href="{{url('payees')}}"><i class="fa fa-money-bill nav-icon"></i>Manage Payee</a>
                    </li>
                    @endif
                    @if($cheque_number_list)
                    <li class="nav-item  {{ $request->segment(1) == 'cheque-numbers' && $request->segment(2) == '' ? 'active' : '' }}">
                        <a class="nav-link" href="{{action('Chequer\ChequeNumberController@index')}}"><i class="fa fa-list-ol nav-icon"></i><p>@lang('cheque.cheque_number_list')</p></a>
                    </li>
                    @endif
                    @if($deleted_cheque_details)
                    <li class="nav-item  {{ $request->segment(1) == 'deleted_cheque_details' && $request->segment(2) == '' ? 'active' : '' }}">
                        <a href="{{url('deleted_cheque_details')}}"><i class="fa fa-trash nav-icon"></i>Delete Cheque Numbers</a>
                    </li>
                    @endif
                    @if($printed_cheque_details)
                    <li class="nav-item  {{ $request->segment(1) == 'printed_cheque_details' && $request->segment(2) == '' ? 'active' : '' }}">
                        <a href="{{url('printed_cheque_details')}}"><i class="fa fa-print nav-icon"></i>Printed Cheque Details</a>
                    </li>
                    @endif
                    @if($default_setting)
                     <li class="nav-item  {{ $request->segment(1) == 'default_setting' && $request->segment(2) == '' ? 'active' : '' }}">
                        <a href="{{url('default_setting')}}"><i class="fa fa-cog nav-icon"></i>Default Settings</a>
                    </li>
                    @endif
                </ul>
            </li>
            @endif
            @endif
        </ul>
        @endif
        </nav>
        <!-- /.sidebar-menu -->
    </div>
    <!-- /.sidebar -->
</aside>
