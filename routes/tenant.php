<?php

/*
|--------------------------------------------------------------------------
| Tenant Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

use Illuminate\Support\Facades\Route;
use Stancl\Tenancy\Middleware\InitializeTenancyByDomain;
use Stancl\Tenancy\Middleware\InitializeTenancyBySubdomain;
use Stancl\Tenancy\Middleware\PreventAccessFromCentralDomains;
use Stancl\Tenancy\Middleware\ScopeSessions;

include_once('install_r.php');

Route::middleware(['web', InitializeTenancyBySubdomain::class, PreventAccessFromCentralDomains::class, ScopeSessions::class])->group(function () {

    Route::middleware(['IsInstalled', 'bootstrap', 'web', 'lscache:no-cache'])->group(function () {
        Route::get('/', [
            'as' => 'login',
            'uses' => 'Auth\LoginController@showLoginForm'
        ]);

        Route::post('/register/member', 'MemberRegisterController@store')->name('business.member_register');
        Route::post('/login/member', 'Auth\MemberLoginController@memberLogin');
        Route::post('/member/forgot-password', 'Auth\MemberForgotPasswordController@sendResetLinkEmail')->name('member_password.email');
        Route::post('/member/reset-password', 'Auth\MemberResetPasswordController@showResetForm')->name('member_password.reset');

        Route::post('/login/employee', 'Auth\EmployeeLoginController@employeeLogin');
        Route::post('/employee/forgot-password', 'Auth\EmployeeForgotPasswordController@sendResetLinkEmail')->name('employee_password.email');
        Route::post('/employee/reset-password', 'Auth\EmployeeResetPasswordController@showResetForm')->name('employee_password.reset');

        Route::post('/register/customer', 'CustomerController@store')->name('business.customer_register');
        Route::get('/logout/customer', 'Auth\CustomerLoginController@logout');
        Route::post('/login/customer', 'Auth\CustomerLoginController@customerLogin');
        Route::post('/customer/forgot-password', 'Auth\CustomerForgotPasswordController@sendResetLinkEmail')->name('customer_password.email');
        Route::post('/customer/reset-password', 'Auth\CustomerResetPasswordController@showResetForm')->name('customer_password.reset');
        Route::get('/logout/agent', 'Auth\AgentLoginController@logout');
        Route::post('/login/agent', 'Auth\AgentLoginController@agentLogin');
        Route::post('/agent/forgot-password', 'Auth\AgentForgotPasswordController@sendResetLinkEmail')->name('agent_password.email');
        Route::post('/agent/reset-password', 'Auth\AgentResetPasswordController@showResetForm')->name('agent_password.reset');
        Auth::routes();
        Route::get('/business/get-business-by-category', 'BusinessController@getBusinessByCategory');
        Route::get('/business/register', 'BusinessController@getRegister')->name('business.getRegister');
        Route::post('/business/register', 'BusinessController@postRegister')->name('business.postRegister');
        Route::post('/business/visitor-register', 'BusinessController@postVisitorRegister')->name('business.postVisitorRegister');
        Route::post('/business/patient-register', 'BusinessController@postPatientRegister')->name('business.postPatientRegister');
        Route::post('/business/agent-register', 'BusinessController@postAgentRegister')->name('business.postAgentRegister');
        Route::post('/business/register/check-username', 'BusinessController@postCheckUsername')->name('business.postCheckUsername');
        Route::post('/business/register/check-email', 'BusinessController@postCheckEmail')->name('business.postCheckEmail');
        Route::post('/business/register/check-username-agent', 'BusinessController@postCheckUsernameAgent')->name('business.postCheckUsernameAgent');
        Route::post('/business/register/check-email-agent', 'BusinessController@postCheckEmailAgent')->name('business.postCheckEmailAgent');

        Route::get('/invoice/{token}', 'SellPosController@showInvoice')
            ->name('show_invoice');

        Route::get('/pump-operator/login', 'Auth\PumpOperatorLoginController@login');
        Route::post('/pump-operator/login', 'Auth\PumpOperatorLoginController@postLogin');
        Route::get('/pump-operator/logout', 'Auth\PumpOperatorLoginController@logout');

        Route::get('/property-user/login', 'Auth\PropertyUserLoginController@login');
        Route::post('/property-user/login', 'Auth\PropertyUserLoginController@postLogin');
        Route::get('/property-user/logout', 'Auth\PropertyUserLoginController@logout');

        Route::post('/login/visitor', 'Auth\VisitorLoginController@visitorLogin');
    });

    Route::middleware(['web', 'auth:customer'])->group(function () {
        Route::post('/customer/get-profile', 'CustomerController@updateProfile');
        Route::get('/customer/profile', 'CustomerController@getProfile');
        Route::post('/customer/update-password', 'CustomerController@updatePassword')->name('customer.updatePassword');
        Route::get('/customer/home/get-totals', 'CustomerController@getTotals');
        Route::get('/customer/home', 'CustomerController@index')->name('customer-home');
        Route::get('/customer/order/get_upload_document_image/{business_id}', 'Ecom\EcomCustomerOrderController@uploadDocumentImage');
        Route::post('/customer/order/save_upload_document_image', 'Ecom\EcomCustomerOrderController@uploadDocumentImageSave');
        Route::get('/customer/order/lists', 'Ecom\EcomCustomerOrderController@getOrders');
        Route::get('/customer/order/get-image/{id}', 'Ecom\EcomCustomerOrderController@getImage');
        Route::get('/customer/order/uploaded', 'Ecom\EcomCustomerOrderController@getUploadedOrders');
        Route::get('/make-the-bill/{id}', 'Ecom\EcomCustomerOrderController@makeTheBill');
        Route::get('/customer/confirm-order/{id}', 'Ecom\EcomCustomerOrderController@confirmOrder');
        Route::get('/customer/pos/create', 'Ecom\EcomCustomerOrderController@createPos');
        Route::post('/customer/order/save-payment', 'Ecom\EcomCustomerOrderController@savePayment');
        Route::get('/customer/order/add-payment/{transaction_id}', 'Ecom\EcomCustomerOrderController@addPayment');
        Route::resource('/customer/order', 'Ecom\EcomCustomerOrderController');
        Route::get('/customer/details/list-sucrity-deposit', 'Ecom\ContactController@listSecurityDeposit');
        Route::resource('/customer/details', 'Ecom\ContactController');
    });

    Route::middleware(['web', 'auth:agent'])->group(function () {
        Route::post('/agent/update-password', 'AgentController@updatePassword');
        Route::post('/agent/get-profile', 'AgentController@updateProfile');
        Route::get('/agent/profile', 'AgentController@getProfile');
        Route::get('agent/home', 'AgentController@home');
        Route::resource('agent/', 'AgentController');
    });

    Route::group(['middleware' => 'auth:employee,web', 'prefix' => 'employee', 'namespace' => '\Modules\HR\Http\Controllers'], function () {
        Route::get('/home', 'EmployeeController@home')->name('employee-home');
        Route::get('/attendance', 'AttendanceController@getEmployeeAttendance');
        Route::get('/salaries', 'PayrollPaymentController@getEmployeeSalariesPayment');
        Route::get('/leave-request', 'LeaveRequestController@getEmployeeLeaveRequest');
    });
    Route::group(['middleware' => 'auth:member,web', 'prefix' => 'member', 'namespace' => '\Modules\Member\Http\Controllers'], function () {
        Route::get('/home', 'MemberController@home')->name('member-home');
        Route::get('/profile', 'MemberController@getProfile');
        Route::put('/profile', 'MemberController@updateProfile');
        Route::get('/suggestions/change-status/{id}', 'SuggestionController@getUpdateStatus');
        Route::post('/suggestions/change-status/{id}', 'SuggestionController@postUpdateStatus');
        Route::resource('/suggestions', 'SuggestionController');
    });

    Route::group(['middleware' => 'auth:visitor,web', 'prefix' => 'visitor', 'namespace' => '\Modules\Visitor\Http\Controllers'], function () {
        Route::get('/home', 'VisitController@home')->name('visitor-home');
    });

    Route::get('default-district/get-drop-down', 'DefaultDistrictController@getDistrictDropDown');
    Route::get('default-district/getTowns', 'DefaultDistrictController@getTownsByDistrict');

    Route::resource('default-district', 'DefaultDistrictController');
    Route::resource('default-town', 'DefaultTownController');

    Route::group(['namespace' => '\Modules\Visitor\Http\Controllers'], function () {
        Route::get('/visitor/{business_id}/{location_id}', 'VisitorController@createVisitor');
        Route::post('/visitor/store', 'VisitorController@saveVisitor');
        Route::get('/visitor/get-detail-if-registered', 'VisitorController@getDetailIfRegistered');
        Route::post('/visitor/register', 'VisitorRegistrationController@selfRegistration');
    });

    //Routes for authenticated users only
    Route::middleware(['IsInstalled', 'auth:customer,web', 'SetSessionData', 'DayEnd', 'language', 'timezone', 'bootstrap'])->group(function () {
        Route::get('/logout', 'Auth\LoginController@logout')->name('logout');

        Route::get('/home', 'HomeController@index')->name('home');
        Route::get('/home/get-totals', 'HomeController@getTotals');
        Route::get('/home/product-stock-alert', 'HomeController@getProductStockAlert');
        Route::get('/home/purchase-payment-dues', 'HomeController@getPurchasePaymentDues');
        Route::get('/home/sales-payment-dues', 'HomeController@getSalesPaymentDues');

        Route::get('/load-more-notifications', 'HomeController@loadMoreNotifications');

        Route::get('/clear-cache', 'BusinessController@clearCache');
        Route::post('/test-email', 'BusinessController@testEmailConfiguration');
        Route::resource('/customer-settings', 'CustomerSettingsController');
        Route::get('/customer-limit-approval/get-approval-details/{customer_id}/{requested_user}', 'CustomerLimitApprovalController@getApprovalDetails');
        Route::post('/customer-limit-approval/update-approval-details/{customer_id}', 'CustomerLimitApprovalController@updateApprovalLimit');
        Route::get('/customer-limit-approval/send-reuqest-for-approval/{customer_id}', 'CustomerLimitApprovalController@sendRequestForApproval');
        Route::resource('/customer-limit-approval', 'CustomerLimitApprovalController');
        Route::post('/test-sms', 'BusinessController@testSmsConfiguration');
        Route::get('/business/settings', 'BusinessController@getBusinessSettings')->name('business.getBusinessSettings');
        Route::post('/business/update', 'BusinessController@postBusinessSettings')->name('business.postBusinessSettings');
        Route::get('/user/profile', 'UserController@getProfile')->name('user.getProfile');
        Route::post('/user/update', 'UserController@updateProfile')->name('user.updateProfile');
        Route::post('/user/update-password', 'UserController@updatePassword')->name('user.updatePassword');
        Route::get('/business/dayEnd', 'BusinessController@dayEnd')->name('business.dayEnd');

        Route::resource('brands', 'BrandController');


        Route::resource('tax-rates', 'TaxRateController');

        Route::get('get_sub_units', 'UnitController@getSubUnits');
        Route::resource('units', 'UnitController');

        Route::get('/contacts/stock-report/{supplier_id}', 'ContactController@getSupplierStockReport');
        Route::get('/contacts/ledger', 'ContactController@getLedger');
        Route::get('/contacts/import', 'ContactController@getImportContacts')->name('contacts.import');
        Route::post('/contacts/import', 'ContactController@postImportContacts');
        Route::post('/contacts/check-contact-id', 'ContactController@checkContactId');
        Route::get('/contacts/customers', 'ContactController@getCustomers');
        Route::get('/contacts/suppliers', 'ContactController@getSuppliers');
        Route::get('/get-customer-reference/barcode', 'CustomerReferenceController@getCustomerReferenceBarcode');
        Route::get('/get-customer-reference/{id}', 'CustomerReferenceController@getCustomerReference');
        Route::resource('customer-reference', 'CustomerReferenceController');
        Route::resource('customer-statement-settings', 'CustomerStatementSettingController');
        Route::get('get-customer-statement-no', 'CustomerStatementController@getCustomerStatementNo');
        Route::get('customer-statement/get-statement-list', 'CustomerStatementController@getCustomerStatementList');
        Route::get('customer-statement/reprint/{statement_id}', 'CustomerStatementController@rePrint');
        Route::resource('customer-statement', 'CustomerStatementController');
        Route::resource('customer-payments', 'CustomerPaymentController');
        Route::resource('customer-payment-simple', 'CustomerPaymentSimpleController');
        Route::get('customer-payment-bulk/get-payment-table', 'CustomerPaymentBulkController@bulkPaymentTable');
        Route::resource('customer-payment-bulk', 'CustomerPaymentBulkController');
        Route::get('contacts/toggle-activate/{contact_id}', 'ContactController@toggleActivate');
        Route::get('/contacts/list-security-deposit/{contact_id}', 'ContactController@listSecurityDeposit');
        Route::post('contacts/mass-destroy', 'ContactController@massDestroy');
        Route::get('outstanding-received-report', 'ContactController@getOutstandingReceivedReport');
        Route::get('issued-payment-details', 'ContactController@getIssuedPaymentDetails');
        Route::resource('contacts', 'ContactController');


        Route::resource('crm-activity-details', 'CrmActivityDetailController');
        Route::resource('crm-activity', 'CRMActivityController');
        Route::get('/crm/add_comments', 'CRMController@addComments');
        Route::get('/crm/show_comments', 'CRMController@showComments');
        Route::resource('crm', 'CRMController');
        Route::resource('crmgroups', 'CrmGroupController');

        Route::resource('categories', 'CategoryController');
        Route::get('merged-sub-category/get-sub-categories/{category_id}', 'MergedSubCategoryController@getSubCategories');
        Route::resource('merged-sub-category', 'MergedSubCategoryController');

        Route::resource('variation-templates', 'VariationTemplateController');
        Route::get('variation-transfer/get-variation-by-category', 'VariationTransferController@getVariationByCategory');
        Route::get('variation-transfer/get-variation-of-product/{variation_id}', 'VariationTransferController@getVariationOfProduct');
        Route::resource('variation-transfer', 'VariationTransferController');

        Route::get('/delete-media/{media_id}', 'ProductController@deleteMedia');
        Route::post('/products/mass-deactivate', 'ProductController@massDeactivate');
        Route::get('/products/activate/{id}', 'ProductController@activate');
        Route::get('/products/view-product-group-price/{id}', 'ProductController@viewGroupPrice');
        Route::get('/products/add-selling-prices/{id}', 'ProductController@addSellingPrices');
        Route::post('/products/save-selling-prices', 'ProductController@saveSellingPrices');
        Route::get('/products/min-selling-prices/{id}', 'ProductController@minSellPrice');
        Route::post('/products/min-selling-prices-update', 'ProductController@minSellPriceUpdate');
        Route::post('/products/mass-delete', 'ProductController@massDestroy');
        Route::get('/products/view/{id}', 'ProductController@view');
        Route::get('/products/list', 'ProductController@getProducts');
        Route::get('/products/list-no-variation', 'ProductController@getProductsWithoutVariations');
        Route::post('/products/bulk-edit', 'ProductController@bulkEdit');
        Route::post('/products/bulk-update', 'ProductController@bulkUpdate');
        Route::post('/products/bulk-update-location', 'ProductController@updateProductLocation');
        Route::get('/products/get-product-to-edit/{product_id}', 'ProductController@getProductToEdit');

        Route::post('/products/get_sub_categories', 'ProductController@getSubCategories');
        Route::post('/products/get_product_category_wise', 'ProductController@getProductsCategoryWise');
        Route::get('/products/get_sub_units', 'ProductController@getSubUnits');
        Route::post('/products/product_form_part', 'ProductController@getProductVariationFormPart');
        Route::post('/products/get_product_variation_row', 'ProductController@getProductVariationRow');
        Route::post('/products/get_variation_template', 'ProductController@getVariationTemplate');
        Route::get('/products/get_variation_value_row', 'ProductController@getVariationValueRow');
        Route::post('/products/check_product_sku', 'ProductController@checkProductSku');
        Route::get('/products/quick_add', 'ProductController@quickAdd');
        Route::post('/products/save_quick_product', 'ProductController@saveQuickProduct');
        Route::get('/products/get-combo-product-entry-row', 'ProductController@getComboProductEntryRow');

        Route::resource('products', 'ProductController');

        Route::get('/purchases/get-supplier-due', 'PurchaseController@getSupplierDue');
        Route::post('/purchases/update-status', 'PurchaseController@updateStatus');
        Route::get('/purchases/get_products', 'PurchaseController@getProducts');
        Route::get('/purchases/get_suppliers', 'PurchaseController@getSuppliers');
        Route::get('/purchases/get_unload_tank_row', 'PurchaseController@getUnloadTankRow');
        Route::get('/purchases/get_unload_tank_row_bulk', 'PurchaseController@getUnloadTankRowBulk');
        Route::post('/purchases/get_purchase_entry_row_bulk', 'PurchaseController@getPurchaseEntryRowBulk');
        Route::post('/purchases/get_purchase_entry_row', 'PurchaseController@getPurchaseEntryRow');
        Route::post('/purchases/get_purchase_entry_row_temp', 'PurchaseController@getPurchaseEntryRowTemp');
        Route::post('/purchases/check_ref_number', 'PurchaseController@checkRefNumber');
        Route::get('/purchases/print/{id}', 'PurchaseController@printInvoice');
        Route::get('purchases/get-payment-method-by-location-id/{location_id}', 'PurchaseController@getPaymentMethodByLocationId');
        Route::post('purchases/get_payment_row', 'PurchaseController@getPaymentRow');
        Route::post('purchases/save-purchase-bulk', 'PurchaseController@savePurchaseBulk');
        Route::get('purchases/add-purchase-bulk', 'PurchaseController@addPurchaseBulk');
        Route::get('purchases/purchase-pos', 'PurchaseController@getPurchasePos');
        Route::post('purchases/purchase-pos', 'PurchaseController@postPurchasePos');
        Route::get('purchases/get-invoice-no', 'PurchaseController@getInvoiceNo');
        Route::resource('purchases', 'PurchaseController');
        Route::resource('purchase-pos', 'PurchasePosController');

        Route::get('/import-sales', 'ImportSalesController@index');
        Route::post('/import-sales/preview', 'ImportSalesController@preview');
        Route::post('/import-sales', 'ImportSalesController@import');
        Route::get('/revert-sale-import/{batch}', 'ImportSalesController@revertSaleImport');

        Route::get('/import-purchases', 'ImportPurchasesController@index');
        Route::post('/import-purchases/preview', 'ImportPurchasesController@preview');
        Route::post('/import-purchases', 'ImportPurchasesController@import');
        Route::get('/revert-sale-import/{batch}', 'ImportPurchasesController@revertSaleImport');

        Route::get('/toggle-subscription/{id}', 'SellPosController@toggleRecurringInvoices');
        Route::get('/toggle_popup', 'SellPosController@toggle_popup');
        Route::post('/sells/pos/get-types-of-service-details', 'SellPosController@getTypesOfServiceDetails');
        Route::get('/sells/subscriptions', 'SellPosController@listSubscriptions');
        Route::get('/sells/invoice-url/{id}', 'SellPosController@showInvoiceUrl');
        Route::get('/sells/over-limit-sales', 'SellController@overLimitSales');
        Route::get('/sells/duplicate/{id}', 'SellController@duplicateSell');
        Route::get('/sales/drafts', 'SellController@getDrafts');
        Route::get('/sales/customer/orders/get-image/{id}', 'SellController@getImage');
        Route::get('/sales/customer/orders', 'SellController@getCustomerOrders');
        Route::get('/sales/customer/uploaded-orders', 'SellController@getCustomerUploadedOrders');
        Route::get('/sales/quotations', 'SellController@getQuotations');
        Route::get('/sales/outstanding_report/{ref_no}', 'SellController@showReport');
        Route::get('/sells/draft-dt', 'SellController@getDraftDatables');
        Route::get('/sells/get-invoice', 'SellController@getInvoiveNo');
        Route::resource('sales', 'SellController');
        Route::resource('reserved-stocks', 'ReservedStocksController');


        Route::get('/sells/pos/get_product_row/{variation_id}/{location_id}', 'SellPosController@getProductRow');
        Route::get('sells/pos/get_product_row_temp/{variation_id}/{location_id}/{temp_qty}', 'SellPosController@getProductRowTemp');
        Route::post('/sells/pos/get_payment_row', 'SellPosController@getPaymentRow');
        Route::get('/sales/pos/get_payment_account_id/{payment_method}', 'SellPosController@getPaymentRowAccountId');
        Route::post('/sells/pos/get-reward-details', 'SellPosController@getRewardDetails');
        Route::get('/sells/pos/get-recent-transactions', 'SellPosController@getRecentTransactions');
        Route::get('/sells/{transaction_id}/print', 'SellPosController@printInvoice')->name('sell.printInvoice');
        Route::get('/sells/{ref_number}/print_invoice', 'SellPosController@printOustandingInvoice')->name('sell.printOustandingInvoice');
        Route::get('/sells/pos/get-product-suggestion', 'SellPosController@getProductSuggestion');
        Route::get('pos/get_customer_details', 'SellPosController@getCustomerDetails');
        Route::get('purchase/get_supplier_details', 'PurchaseController@getSupplierDetails');
        Route::resource('pos', 'SellPosController');

        Route::resource('roles', 'RoleController');

        Route::post('update-password/{id}', 'ManageUserController@updatePassword');
        Route::get('change-password/{id}', 'ManageUserController@changePassword');
        Route::get('business-users', 'ManageUserController@businessUsers');
        Route::post('lock_screen', 'ManageUserController@lockScreen');
        Route::post('check_user_password', 'ManageUserController@checkUserPassword');
        Route::resource('users', 'ManageUserController');

        Route::resource('group-taxes', 'GroupTaxController');

        Route::get('/barcodes/set_default/{id}', 'BarcodeController@setDefault');
        Route::resource('barcodes', 'BarcodeController');

        //Invoice schemes..
        Route::get('/invoice-schemes/set_default/{id}', 'InvoiceSchemeController@setDefault');
        Route::resource('invoice-schemes', 'InvoiceSchemeController');

        //Print Labels
        Route::get('/labels/show', 'LabelsController@show');
        Route::get('/labels/add-product-row', 'LabelsController@addProductRow');
        Route::get('/labels/preview', 'LabelsController@preview');

        //Reports...
        Route::get('/reports/get-credit-status-totals', 'ReportController@getCreditStatusTotalsReport');
        Route::get('/reports/activity', 'ReportController@getActivityReport');
        Route::get('/reports/management', 'ReportController@getManagementReport');
        Route::get('/reports/verification', 'ReportController@getVerificationReport');
        Route::get('/reports/payment-status', 'ReportController@getPaymentStatusReport');
        Route::get('/reports/product', 'ReportController@getProductReport');
        Route::get('/reports/contact', 'ReportController@getContactReport');
        Route::get('/reports/service-staff-report', 'ReportController@getServiceStaffReport');
        Route::get('/reports/service-staff-line-orders', 'ReportController@serviceStaffLineOrders');
        Route::get('/reports/table-report', 'ReportController@getTableReport');
        Route::get('/reports/profit-loss', 'ReportController@getProfitLoss');
        Route::get('/reports/get-opening-stock', 'ReportController@getOpeningStock');
        Route::get('/reports/get-product-transaction-summary', 'ReportController@getProductTransactionSummary');
        Route::get('/reports/purchase-sell', 'ReportController@getPurchaseSell');
        Route::get('/reports/customer-supplier', 'ReportController@getCustomerSuppliers');
        Route::get('/reports/product-transaction-report', 'ReportController@getProductTransactionReport');
        Route::get('/reports/product-weight-loss-excess-report', 'ReportController@getWeightLossExcessReport');
        Route::get('/reports/stock-report', 'ReportController@getStockReport');
        Route::get('/reports/stock-details', 'ReportController@getStockDetails');
        Route::get('/reports/tax-report', 'ReportController@getTaxReport');
        Route::get('/reports/trending-products', 'ReportController@getTrendingProducts');
        Route::get('/reports/expense-report', 'ReportController@getExpenseReport');
        Route::get('/reports/stock-adjustment-report', 'ReportController@getStockAdjustmentReport');
        Route::get('/reports/register-report', 'ReportController@getRegisterReport');
        Route::get('/reports/sales-representative-report', 'ReportController@getSalesRepresentativeReport');
        Route::get('/reports/sales-representative-total-expense', 'ReportController@getSalesRepresentativeTotalExpense');
        Route::get('/reports/sales-representative-total-sell', 'ReportController@getSalesRepresentativeTotalSell');
        Route::get('/reports/sales-representative-total-commission', 'ReportController@getSalesRepresentativeTotalCommission');
        Route::get('/reports/stock-expiry', 'ReportController@getStockExpiryReport');
        Route::get('/reports/stock-expiry-edit-modal/{purchase_line_id}', 'ReportController@getStockExpiryReportEditModal');
        Route::post('/reports/stock-expiry-update', 'ReportController@updateStockExpiryReport')->name('updateStockExpiryReport');
        Route::get('/reports/customer-group', 'ReportController@getCustomerGroup');
        Route::get('/reports/product-purchase-report-summary', 'ReportController@getproductPurchaseReportSummary');
        Route::get('/reports/product-purchase-report', 'ReportController@getproductPurchaseReport');
        Route::get('/reports/product-sell-report-summary', 'ReportController@getproductSellReportSummary');
        Route::get('/reports/product-sell-report', 'ReportController@getproductSellReport');
        Route::get('/reports/sales-report', 'ReportController@getproductSalesReportDuplicate');
        Route::get('/reports/product-sell-grouped-report', 'ReportController@getproductSellGroupedReport');
        Route::get('/reports/product-sales-grouped-report-duplicate', 'ReportController@getproductSalesGroupedReportDuplicate');
        Route::get('/reports/lot-report', 'ReportController@getLotReport');
        Route::get('/reports/purchase-payment-report', 'ReportController@purchasePaymentReport');
        Route::get('/reports/sell-payment-report', 'ReportController@sellPaymentReport');
        Route::get('/reports/product-stock-details', 'ReportController@productStockDetails');
        Route::get('/reports/adjust-product-stock', 'ReportController@adjustProductStock');
        Route::get('/reports/get-profit/{by?}', 'ReportController@getProfit');
        Route::get('/reports/items-report', 'ReportController@itemsReport');
        Route::get('/reports/outstanding_report', 'ReportController@getOutstandingReport');
        Route::get('/reports/aging_report', 'ReportController@getAgingReport');
        Route::get('/reports/daily-summary-report', 'ReportController@getDailySummaryReport');
        Route::get('/reports/daily-report', 'ReportController@getDailyReport');
        Route::get('/reports/montly-report', 'ReportController@getMonthlyReport');
        Route::get('/reports/comparison-report', 'ReportController@getComparisonReport');
        Route::get('/reports/get_daily_report_modal_view/{type}', 'ReportController@getDailyReportDetailsView');
        Route::get('/reports/user_activity', 'ReportController@getUserActivityReport');

        Route::get('business-location/activate-deactivate/{location_id}', 'BusinessLocationController@activateDeactivateLocation');

        //Business Location Settings...
        Route::prefix('business-location/{location_id}')->name('location.')->group(function () {
            Route::get('settings', 'LocationSettingsController@index')->name('settings');
            Route::post('settings', 'LocationSettingsController@updateSettings')->name('settings_update');
        });

        //Business Locations...
        Route::post('business-location/check-location-id', 'BusinessLocationController@checkLocationId');
        Route::resource('business-location', 'BusinessLocationController');
        Route::get('location-has-stores-count/{location_id}', 'StoreController@locationHasStoreCount');
        Route::resource('stores', 'StoreController');

        //Invoice layouts..
        Route::resource('invoice-layouts', 'InvoiceLayoutController');

        //Expense Categories...
        Route::get('get-expense-account-category-id/{category_id}', 'ExpenseCategoryController@getAccountIdByCategory');
        Route::get('expense-categories/get-drop-down', 'ExpenseCategoryController@getExpenseCategoryDropDown');
        Route::post('expense-categories/check-duplicate', 'ExpenseCategoryController@checkDuplicate');
        Route::resource('expense-categories', 'ExpenseCategoryController');

        //Expenses...
        Route::get('expenses/get-payment-method-by-location-id', 'ExpenseController@getPaymentMethodByLocationDropDown');
        Route::resource('expenses', 'ExpenseController');

        //Transaction payments...
        Route::get('/payments/get-payment-method-by-location-id/{location_id}', 'TransactionPaymentController@getPaymentMethodByLocationDropDown');
        Route::get('/payments/show-child-payments/{payment_id}', 'TransactionPaymentController@showChildPayments');
        Route::get('/payments/view-payment/{payment_id}', 'TransactionPaymentController@viewPayment');
        Route::get('/payments/get-cheque-dropdown-by-bank-id/{bank_id}/{contact_id}', 'TransactionPaymentController@getChequeDropdownByBankId');
        Route::get('/payments/get-payment-details-by-id/{payment_id}', 'TransactionPaymentController@getPaymentDetailsById');
        Route::get('/payments/add_payment/{transaction_id}', 'TransactionPaymentController@addPayment');

        Route::post('payments/refund-security-deposit/{contact_id}', 'TransactionPaymentController@getRefundSecurityDeposit');
        Route::get('payments/security-deposit/{contact_id}', 'TransactionPaymentController@getSecurityDeposit');
        Route::post('payments/security-deposit/{contact_id}', 'TransactionPaymentController@postSecurityDeposit');
        Route::get('/payments/refund-payment/{contact_id}', 'TransactionPaymentController@getRefundPayment');
        Route::post('/payments/refund-payment/{contact_id}', 'TransactionPaymentController@postRefundPayment');
        Route::get('/payments/advance-payment/{contact_id}', 'TransactionPaymentController@getAdvancePayment');
        Route::post('/payments/advance-payment/{contact_id}', 'TransactionPaymentController@postAdvancePayment');
        Route::get('/payments/pay-contact-due/{contact_id}', 'TransactionPaymentController@getPayContactDue');
        Route::post('/payments/pay-contact-due', 'TransactionPaymentController@postPayContactDue');
        Route::get('payments/pending-payment/{id}', 'TransactionPaymentController@pendingPayment');
        Route::get('payments/pending-payment-confirm/{id}', 'TransactionPaymentController@pendingPaymentConfirm');
        Route::get('payments/get-accounts-dropdown', 'TransactionPaymentController@getAccountDropDown');
        Route::get('payments/get-payment-datatable/{id}', 'TransactionPaymentController@getPaymentDatatable');
        Route::resource('payments', 'TransactionPaymentController');

        //Printers...
        Route::resource('printers', 'PrinterController');
        Route::resource('business-category', 'BusinessCategoryController');

        Route::get('/stock-adjustments/remove-expired-stock/{purchase_line_id}', 'StockAdjustmentController@removeExpiredStock');
        Route::post('/stock-adjustments/get_product_row', 'StockAdjustmentController@getProductRow');
        Route::post('/stock-adjustments/get_product_row_temp', 'StockAdjustmentController@getProductRowTemp');
        Route::get('stock-adjustments/inventory-adjustment-account', 'StockAdjustmentController@getInventoryAdjustmentAccount');
        Route::resource('stock-adjustments', 'StockAdjustmentController');

        Route::get('/cash-register/register-details', 'CashRegisterController@getRegisterDetails');
        Route::get('/cash-register/close-register', 'CashRegisterController@getCloseRegister');
        Route::post('/cash-register/close-register', 'CashRegisterController@postCloseRegister');
        Route::resource('cash-register', 'CashRegisterController');

        //Import products
        Route::get('/import-products', 'ImportProductsController@index');
        Route::post('/import-products/store', 'ImportProductsController@store');

        //Sales Commission Agent
        Route::resource('sales-commission-agents', 'SalesCommissionAgentController');

        //Stock Transfer
        Route::get('stock-transfers/print/{id}', 'StockTransferController@printInvoice');
        Route::get('/stock-transfer/get_transfer_location/{id}', 'StockTransferController@getBusinessLocationExcept');
        Route::get('/stock-transfer/get_transfer_location_temp/{id}', 'StockTransferController@getBusinessLocationTemp');
        Route::get('/stock-transfer/get_transfer_store_id/{id}', 'StockTransferController@getBusinessLocationStoreId');
        Route::get('/stock-transfer/get_transfer_store_id_temp/{id}', 'StockTransferController@getBusinessLocationStoreIdTemp');
        Route::resource('stock-transfers', 'StockTransferController');
        Route::post('stock-transfers-request/received-transfer/{id}', 'StockTransferRequestController@postReceivedTransfer');
        Route::get('stock-transfers-request/received-transfer/{id}', 'StockTransferRequestController@getReceivedTrasnfer');
        Route::get('stock-transfers-request/stop-notification/{id}', 'StockTransferRequestController@stopNotification');
        Route::get('stock-transfers-request/get-notification-poup/{id}', 'StockTransferRequestController@getNotificationPopup');
        Route::post('stock-transfers-request/save-transfer', 'StockTransferRequestController@saveTransfer');
        Route::get('stock-transfers-request/create-transfer/{id}', 'StockTransferRequestController@createTransfer');
        Route::resource('stock-transfers-request', 'StockTransferRequestController');

        Route::get('/opening-stock/add/{product_id}', 'OpeningStockController@add');
        Route::post('/opening-stock/save', 'OpeningStockController@save');

        //Customer Groups
        Route::resource('contact-group', 'ContactGroupController');

        //Import opening stock
        Route::get('/import-opening-stock', 'ImportOpeningStockController@index');
        Route::post('/import-opening-stock/store', 'ImportOpeningStockController@store');

        //Sell return
        Route::post('sell-return/save-pos-return', 'SellReturnController@savePosReturn');
        Route::resource('sell-return', 'SellReturnController');
        Route::get('sell-return/get-product-row', 'SellReturnController@getProductRow');
        Route::get('/sell-return/print/{id}', 'SellReturnController@printInvoice');
        Route::get('/sell-return/add/{id}', 'SellReturnController@add');

        //Backup
        Route::get('backup/download/{file_name}', 'BackUpController@download');
        Route::get('backup/delete/{file_name}', 'BackUpController@delete');
        Route::resource('backup', 'BackUpController', ['only' => [
            'index', 'create', 'store'
        ]]);

        Route::get('export-selling-price-group/toggle-activate/{id}', 'SellingPriceGroupController@toggleActivate');
        Route::get('export-selling-price-group', 'SellingPriceGroupController@export');
        Route::post('import-selling-price-group', 'SellingPriceGroupController@import');

        Route::resource('selling-price-group', 'SellingPriceGroupController');

        Route::resource('notification-templates', 'NotificationTemplateController')->only(['index', 'store']);
        Route::get('notification-templates/email-template', 'NotificationTemplateController@index');
        Route::get('notification-templates/sms-template', 'NotificationTemplateController@index');
        Route::get('notification/get-template/{transaction_id}/{template_for}', 'NotificationController@getTemplate');
        Route::post('notification/send', 'NotificationController@send');

        Route::post('/purchase-return/update', 'CombinedPurchaseReturnController@update');
        Route::get('/purchase-return/edit/{id}', 'CombinedPurchaseReturnController@edit');
        Route::post('/purchase-return/save', 'CombinedPurchaseReturnController@save');
        Route::post('/purchase-return/get_product_row', 'CombinedPurchaseReturnController@getProductRow');
        Route::get('/purchase-return/create', 'CombinedPurchaseReturnController@create');
        Route::get('/purchase-return/add/{id}', 'PurchaseReturnController@add');
        Route::resource('/purchase-return', 'PurchaseReturnController', ['except' => ['create']]);

        Route::get('/discount/activate/{id}', 'DiscountController@activate');
        Route::post('/discount/mass-deactivate', 'DiscountController@massDeactivate');
        Route::resource('discount', 'DiscountController');

        Route::resource('super-manager/visitors', 'SuperManagerVisitorController');

        Route::group(['prefix' => 'accounting-module'], function () {
            Route::get('/journals/get-account-dropdown-by-type/{account_type_id}', 'JournalController@getAccountDropdownByAccountType');
            Route::get('/journals/get_row', 'JournalController@getRow');
            Route::resource('/journal', 'JournalController');
            Route::get('/get-profit-loss-report', 'AccountController@getProfitLossReport');
            Route::delete('/delete-account-transaction/{transaction_id}', 'AccountController@deleteAccountTransaction');
            Route::post('/update-account-transaction/{transaction_id}', 'AccountController@updateAccountTransaction');
            Route::get('/eidt-account-transaction/{transaction_id}', 'AccountController@editAccountTransaction');
            Route::get('/get-account-dp', 'AccountController@getBankAccountDropDown');
            Route::get('/get-account-group-name-dp', 'AccountController@getBankAccountByGroupDP');
            Route::get('/get-account-by-group-id/{group_id}', 'AccountController@getAccountByGroupId');
            Route::get('/get-account-group-by-account/{type_id}', 'AccountController@getAccountGroupByAccount');
            Route::get('/get-parent-account-by-type/{type_id}', 'AccountController@getParentAccountsByType');
            Route::get('/account/image-modal', 'AccountController@imageModal');
            Route::resource('/account-settings', 'AccountSettingController');
            Route::resource('/account', 'AccountController');
            Route::get('/fund-transfer/{id}', 'AccountController@getFundTransfer');
            Route::post('/fund-transfer', 'AccountController@postFundTransfer');
            Route::get('/cheque-list', 'AccountController@getChequeList');
            Route::post('/cheque-deposit', 'AccountController@postChequeDeposit');
            Route::get('/cheque-deposit', 'AccountController@getChequeDeposit');
            Route::get('/deposit/{id}', 'AccountController@getDeposit');
            Route::post('/deposit', 'AccountController@postDeposit');
            Route::get('/notes/{id}', 'AccountController@getNotes');
            Route::get('/reconcile/{id}', 'AccountController@reconcile');
            Route::get('/close/{id}', 'AccountController@close');
            Route::get('/disabled-account', 'AccountController@disabledAccount');
            Route::get('/disabled-status/{id}', 'AccountController@disabledStatus');
            Route::get('/delete-account-transaction/{id}', 'AccountController@destroyAccountTransaction');
            Route::get('/get-account-balance/{id}', 'AccountController@getAccountBalance');
            Route::get('/income-statement', 'AccountReportsController@incomeStatement');
            Route::get('/balance-sheet', 'AccountReportsController@balanceSheet');
            Route::get('/trial-balance', 'AccountReportsController@trialBalance');
            Route::get('/payment-account-report', 'AccountReportsController@paymentAccountReport');
            Route::get('/link-account/{id}', 'AccountReportsController@getLinkAccount');
            Route::post('/link-account', 'AccountReportsController@postLinkAccount');
            Route::get('/check_account_number', 'AccountController@checkAccountNumber');
            Route::get('/cash-flow', 'AccountController@cashFlow');
            Route::post('/import', 'AccountController@postImportAccounts');
            Route::get('/import', 'AccountController@getImportAccounts')->name('accounts.import');
            Route::get('/main-account-book/{id}', 'AccountController@getMainAccountBook');
            Route::get('/main-account-balance/{id}', 'AccountController@getAccountBalanceMain');
            Route::get('/list-deposit-transfer', 'AccountController@listDepositTransfer');
            Route::get('/edit-deposit-transfer/{id}', 'AccountController@editDepositTransfer');
            Route::post('/update-deposit-transfer/{id}', 'AccountController@updateDepositTransfer');
        });

        Route::resource('default-account', 'DefaultAccountController');
        Route::resource('default-account-types', 'DefaultAccountTypeController');
        Route::get('default-account-group/get-account-groups-by-type/{type_id}', 'DefaultAccountGroupController@getDefaultAccountGroupByType');
        Route::resource('default-account-group', 'DefaultAccountGroupController');
        Route::get('get-account-groups/{type_id}', 'AccountGroupController@getAccountGroupByType');
        Route::resource('account-groups', 'AccountGroupController');
        Route::resource('account-types', 'AccountTypeController');


        Route::get('/site-settings', ['as' => 'site_settings.view', 'uses' => 'SiteSettingController@viewPage']);
        Route::post('/update-site-settings', ['as' => 'site_settings.update_settings', 'uses' => 'SiteSettingController@updateSettings']);
        Route::get('/help/view', ['as' => 'site_settings.help_view', 'uses' => 'SiteSettingController@help']);
        Route::post('/help/update', ['as' => 'site_settings.help_update', 'uses' => 'SiteSettingController@helpUpdate']);
        Route::post('/getcurrency', ['as' => 'site_settings.getcurrency', 'uses' => 'SiteSettingController@getCurrencyCode']);



        //Restaurant module
        Route::group(['prefix' => 'modules'], function () {
            Route::resource('tables', 'Restaurant\TableController');
            Route::resource('modifiers', 'Restaurant\ModifierSetsController');

            //Map modifier to products
            Route::get('/product-modifiers/{id}/edit', 'Restaurant\ProductModifierSetController@edit');
            Route::post('/product-modifiers/{id}/update', 'Restaurant\ProductModifierSetController@update');
            Route::get('/product-modifiers/product-row/{product_id}', 'Restaurant\ProductModifierSetController@product_row');

            Route::get('/add-selected-modifiers', 'Restaurant\ProductModifierSetController@add_selected_modifiers');

            Route::get('/kitchen', 'Restaurant\KitchenController@index');
            Route::get('/kitchen/mark-as-cooked/{id}', 'Restaurant\KitchenController@markAsCooked');
            Route::post('/refresh-orders-list', 'Restaurant\KitchenController@refreshOrdersList');
            Route::post('/refresh-line-orders-list', 'Restaurant\KitchenController@refreshLineOrdersList');

            Route::get('/orders', 'Restaurant\OrderController@index');
            Route::get('/orders/mark-as-served/{id}', 'Restaurant\OrderController@markAsServed');
            Route::get('/data/get-pos-details', 'Restaurant\DataController@getPosDetails');
            Route::get('/orders/mark-line-order-as-served/{id}', 'Restaurant\OrderController@markLineOrderAsServed');
        });

        Route::get('bookings/get-todays-bookings', 'Restaurant\BookingController@getTodaysBookings');
        Route::resource('bookings', 'Restaurant\BookingController');

        Route::resource('types-of-service', 'TypesOfServiceController');
        Route::get('sells/edit-shipping/{id}', 'SellController@editShipping');
        Route::put('sells/update-shipping/{id}', 'SellController@updateShipping');
        Route::get('shipments', 'SellController@shipments');

        Route::resource('warranties', 'WarrantyController');

        Route::get('prescription/getPrescriptions/{patient_id}', 'PrescriptionController@getPrescriptions');
        Route::get('patient/getPatient', 'PatientController@getPatient');
        Route::resource('patient', 'PatientController');
        Route::get('prescription-enterAmount/{id}', 'PrescriptionController@enterAmount');
        Route::post('prescription-updateAmount', 'PrescriptionController@updateAmount');
        Route::post('prescription-upload', 'PrescriptionController@upload');
        Route::get('image-modal', 'PrescriptionController@imageModal');
        Route::resource('prescription', 'PrescriptionController');
        Route::resource('hospital', 'HospitalController');
        Route::post('get_doctor', 'DoctorController@getDocorts');
        Route::resource('doctor', 'DoctorController');
        Route::resource('allergies', 'AllergiesController');
        Route::post('medicine-upload', 'MedicineController@upload');
        Route::resource('medicine', 'MedicineController');
        Route::get('test-enterAmount/{id}', 'TestController@enterAmount');
        Route::post('test-updateAmount', 'TestController@updateAmount');
        Route::post('test-upload', 'TestController@upload');
        Route::resource('test', 'TestController');
        Route::resource('family-members', 'FamilyController');
        Route::resource('sample-medical-product-import', 'ImportMedicalProductController');
        Route::post('massSavePharmacy', 'SampleMedicalProductController@massSavePharmacy');
        Route::resource('sample-medical-product-list', 'SampleMedicalProductController');
        Route::resource('pharmacy-products', 'PharmacyProductController');
        Route::resource('patient-payments', 'PatientPaymentController');


        Route::get('/clear_data/{type}', 'TempController@clearData');
        Route::post('/save_add_pos_data', 'TempController@saveAddPosTemp');
        Route::post('/save_sale_temp_data', 'TempController@saveAddSaleTemp');
        Route::post('/save_add_expense_data', 'TempController@saveAddExpenseTemp');
        Route::post('/save_purchase_temp_data', 'TempController@saveAddPurchaseTemp');
        Route::post('/save_sale_return_temp_data', 'TempController@saveSaleReturnTemp');
        Route::post('/save_stock_transfer_temp_data', 'TempController@saveStockTransferTemp');
        Route::post('/save_stock_Adjustment_temp_data', 'TempController@saveStockAdjustmentTemp');


        Route::get('customer-payment', 'CustomerSellController@paymentShow');
        Route::resource('customer-sales', 'CustomerSellController');
        Route::resource('customer-sell-return', 'CustomerSellReturnController');
        Route::get('customer-order-list', 'CustomerOrderController@getOrders');
        Route::resource('customer-order', 'CustomerOrderController');

        //common controller for document & note
        Route::get('get-document-note-page', 'DocumentAndNoteController@getDocAndNoteIndexPage');
        Route::post('post-document-upload', 'DocumentAndNoteController@postMedia');
        Route::resource('note-documents', 'DocumentAndNoteController');


        // Cheque Writing Module
        Route::post('get-templates-uploads', 'Chequer\ChequeTemplateController@uploadImageFile');
        Route::post('get-templates-values', 'Chequer\ChequeTemplateController@getTemplateValues');
        Route::resource('cheque-templates', 'Chequer\ChequeTemplateController');
        Route::post('check-unique-cheque-no', 'Chequer\ChequeWriteController@getChequeNoUniqueOrNotCheck');
        Route::post('get-templatewise-bank-accounts', 'Chequer\ChequeWriteController@getTempleteWiseBankAccounts');
        Route::post('list-payee-temp', 'Chequer\ChequeWriteController@listOfPayeeTemp');
        Route::post('get-purchase-order-data-by-id', 'Chequer\ChequeWriteController@getPurchaseOrderDataById');
        Route::post('check-template-id', 'Chequer\ChequeWriteController@checkTemplateId');
        Route::post('get-template-cheque', 'Chequer\ChequeWriteController@getTemplatechaque');
        Route::post('get-next-cheque-no', 'Chequer\ChequeWriteController@getNextChequedNO');
        Route::resource('cheque-write', 'Chequer\ChequeWriteController');
        Route::resource('stamps', 'Chequer\ChequerStampController');
        Route::resource('cheque-numbers', 'Chequer\ChequeNumberController');
    });

    Route::middleware(['EcomApi'])->prefix('api/ecom')->group(function () {
        Route::get('products/{id?}', 'ProductController@getProductsApi');
        Route::get('categories', 'CategoryController@getCategoriesApi');
        Route::get('brands', 'BrandController@getBrandsApi');
        Route::post('customers', 'ContactController@postCustomersApi');
        Route::get('settings', 'BusinessController@getEcomSettings');
        Route::get('variations', 'ProductController@getVariationsApi');
        Route::post('orders', 'SellPosController@placeOrdersApi');
    });
});
