<li class="nav-item {{ in_array($request->segment(1), ['tasks-management']) ? 'active active-sub' : '' }}">
    <a class="nav-link" href="#"><i class="fa fa-list-alt"></i> <p>@lang('tasksmanagement::lang.tasks_management')<i class="right fas fa-angle-left"></i></p>
    </a>
    <ul class="nav nav-treeview">
        @if($notes_page)
        <li class="nav-item {{ $request->segment(1) == 'tasks-management' && $request->segment(2) == 'notes' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\TasksManagement\Http\Controllers\NoteController@index')}}"><i
                    class="fa fa-file-alt-o"></i><p>@lang('tasksmanagement::lang.notes')</p></a>
        </li>
        @endif
        @if($tasks_page)
            @can('tasks_management.tasks')
            <li class="nav-item {{ $request->segment(1) == 'tasks-management' && $request->segment(2) == 'tasks' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('\Modules\TasksManagement\Http\Controllers\TaskController@index')}}"><i
                        class="fa fa-check"></i><p>@lang('tasksmanagement::lang.list_tasks')</p></a>
            </li>
            @endcan
        @endif
        @if($reminder_page)
            @can('tasks_management.reminder')
                <li class="nav-item {{ $request->segment(1) == 'tasks-management' && $request->segment(2) == 'reminders' ? 'active' : '' }}">
                <a class="nav-link" href="{{action('\Modules\TasksManagement\Http\Controllers\ReminderController@index')}}"><i
                    class="fa fa-bell-o"></i><p>@lang('tasksmanagement::lang.reminders')</p></a>
                </li>
            @endcan
        @endif
        <li class="nav-item {{ $request->segment(1) == 'tasks-management' && $request->segment(2) == 'settings' ? 'active' : '' }}">
            <a class="nav-link" href="{{action('\Modules\TasksManagement\Http\Controllers\SettingsController@index')}}"><i
                    class="fa fa-cogs"></i><p>@lang('tasksmanagement::lang.settings')</p></a>
        </li>

    </ul>
</li>