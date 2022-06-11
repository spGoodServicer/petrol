@can('hr.access')
<li class="nav-item treeview {{ in_array($request->segment(1), ['hr']) ? 'active active-sub' : '' }}"
    style="background: #00C0EF;">
    <a href="#" class="nav-link">
        <i class="fa fa-handshake-o nav-icon"></i>
        <p class="title">@lang('hr::lang.hr_module') <i class="right fas fa-angle-left"></i></p>
    </a>
    <ul class="nav nav-treeview">
        @if($hr_module)
        @can('hr.employee')
        @if($employee)
        <li class="nav-item {{ $request->segment(1) == 'hr' && $request->segment(2) == 'employee' ? 'active' : '' }}">
            <a href="{{action('\Modules\HR\Http\Controllers\EmployeeController@index')}}" class="nav-link">
                <i class="fa fa-users"></i>
                <p>
                    @lang('hr::lang.employee')
                </p>
            </a>
        </li>
        @endif
        @if($attendance)
        <li class="nav-item {{ $request->segment(2) == 'attendance' ? 'active active-sub' : '' }}">
            <a href="{{action('\Modules\HR\Http\Controllers\AttendanceController@index')}}" class="nav-link">
                <i class="fa fa-thumbs-o-up"></i>
                <p>
                    @lang('hr::lang.attendance')
                </p>
            </a>
        </li>
        @endif
        @if($late_and_over_time)
        <li
            class="{{ $request->segment(2) == 'attendance' && $request->segment(3) == 'get-late-and-overtime' ? 'active active-sub' : '' }}">
            <a href="{{action('\Modules\HR\Http\Controllers\AttendanceController@getLateOvertime')}}" class="nav-link">
                <i class="fa fa-clock-o"></i>
                <p>
                    @lang('hr::lang.late_and_overtime')
                </p>
            </a>
        </li>
        @endif

        @can('hr.payroll')
        @if($payroll)
        <li class="nav-item {{ $request->segment(2) == 'payroll' ? 'active active-sub' : '' }}">
            <a href="{{action('\Modules\HR\Http\Controllers\PayrollPaymentController@index')}}" class="nav-link">
                <i class="fa fa-briefcase"></i>
                <p>
                    @lang('hr::lang.payroll')
                </p>
            </a>

        </li>
        @endif
        @endcan

        @can('hr.reports')
        @if($hr_reports)
        <li class="nav-item {{ $request->segment(2) == 'report' ? 'active' : '' }}">
            <a href="{{action('\Modules\HR\Http\Controllers\ReportController@index')}}" class="nav-link">
                <i class="fa fa-file-alt"></i>
                <p>
                    @lang('hr::lang.reports')
                </p>
            </a>
        </li>
        @endif
        @endcan

        @can('hr.notice_board')
        @if($notice_board)
        <li class="nav-item {{ $request->segment(2) == 'notice-board' ? 'active' : '' }}">
            <a href="{{action('\Modules\HR\Http\Controllers\NoticeBoardController@index')}}" class="nav-link">
                <i class="fa fa-file-o nav-icon"></i>
                <p>
                    @lang('hr::lang.notice_board')
                </p>
            </a>
        </li>
        @endif
        @endcan
        @endif

        <!-- Hr Settings  -->
        @can('hr.settings')
        @if($hr_settings)
        <li class="nav-item {{ $request->segment(2) == 'settings' ? 'active active-sub' : '' }}">
            <a href="{{action('\Modules\HR\Http\Controllers\HrSettingsController@index')}}" class="nav-link">
                <i class="fa fa-cogs nav-icon"></i>
                <p>
                    @lang('hr::lang.hr_settings')
                </p>
            </a>
        </li>
        @endif
        @endcan
    </ul>
    @endif
</li>
@endcan