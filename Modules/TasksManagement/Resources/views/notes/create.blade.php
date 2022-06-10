<div class="modal-dialog" role="document" style="width: 55%;">
  <div class="modal-content">

    {!! Form::open(['url' => action('\Modules\TasksManagement\Http\Controllers\NoteController@store'), 'method' =>
    'post', 'id' => 'note_form' ])
    !!}
    <div class="modal-header">
      <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
          aria-hidden="true">&times;</span></button>
      <h4 class="modal-title">@lang( 'tasksmanagement::lang.add_note' )</h4>
    </div>

    <div class="modal-body">
      <div class="col-md-4">
        <div class="form-group">
          {!! Form::label('date_and_time', __( 'tasksmanagement::lang.date_and_time' )) !!}
          {!! Form::text('date_and_time', date('m/d/Y H:i:s'), ['class' => 'form-control', 'required', 'placeholder' =>
          __( 'tasksmanagement::lang.date_and_time'), 'readonly']);
          !!}
        </div>
      </div>

      <div class="col-md-4">
        <div class="form-group">
          {!! Form::label('group_id', __( 'tasksmanagement::lang.note_group' )) !!}
          {!! Form::select('group_id', $note_groups, null, ['class' => 'form-control group_id', 'id' =>
          'group_id', 'placeholder' => __( 'tasksmanagement::lang.please_select' )]);
          !!}
        </div>
      </div>

      <div class="col-md-4">
        <div class="form-group">
          {!! Form::label('note_id', __( 'tasksmanagement::lang.note_id' )) !!}
          {!! Form::text('note_id', $note_id, ['class' => 'form-control', 'required', 'placeholder' => __(
          'tasksmanagement::lang.note_id' ), 'readonly']);
          !!}
        </div>
      </div>

      <div class="col-md-12">
        <div class="form-group">
          {!! Form::label('note_heading', __( 'tasksmanagement::lang.note_heading' )) !!}
          {!! Form::text('note_heading', null, ['class' => 'form-control', 'required', 'placeholder' => __(
          'tasksmanagement::lang.note_heading' )]);
          !!}
        </div>
      </div>

      <div class="clearfix"></div>
      <div class="col-xs-12">
        <div class="form-group">
          {!! Form::label('note_details', __('tasksmanagement::lang.note_details') . ':') !!}
          {!! Form::textarea('note_details', '', ['class' => 'form-control','placeholder' =>
          __('tasksmanagement::lang.note_details')]); !!}
        </div>
      </div>

      <div class="col-md-12">
        <div class="form-group">
          {!! Form::label('note_footer', __( 'tasksmanagement::lang.note_footer' )) !!}
          {!! Form::text('note_footer', null, ['class' => 'form-control', 'placeholder' => __(
          'tasksmanagement::lang.note_footer' )]);
          !!}
        </div>
      </div>

      <div class="col-md-4">
        <div class="form-group">
          {!! Form::label('show_on_top_section', __( 'tasksmanagement::lang.show_on_top_section' )) !!}
          {!! Form::select('show_on_top_section', ['no' => 'No', 'yes'=> 'Yes'], null, ['class' => 'form-control',
          'required', 'placeholder' => __(
          'tasksmanagement::lang.please_select' )]);
          !!}
        </div>
      </div>

      <div class="col-md-2">
        <div class="form-group">
          {!! Form::label('color', __( 'tasksmanagement::lang.color' )) !!}
          {!! Form::text('color-picker', null, ['class' => 'form-control color-picker', 'id' =>
          'color-picker', 'placeholder' => __( 'tasksmanagement::lang.color' )]);
          !!}
          {!! Form::hidden('color', '#03C74D', ['id' => 'color']) !!}
        </div>
      </div>

      <div class="col-md-6">
        <div class="form-group">
          {!! Form::label('shared_with_users', __( 'tasksmanagement::lang.shared_with_users' )) !!}
          {!! Form::select('shared_with_users[]', $users , null, ['class' => 'form-control select2', 'multiple', 'style'
          => 'width: 100%;']);
          !!}
        </div>
      </div>

    </div>

    <div class="modal-footer">
      <button type="submit" class="btn btn-primary" id="save_note_btn">@lang( 'messages.save' )</button>
      <button type="button" class="btn btn-default" data-dismiss="modal">@lang( 'messages.close' )</button>
    </div>

    {!! Form::close() !!}

  </div><!-- /.modal-content -->
</div><!-- /.modal-dialog -->

<script>
  $('#group_id').change(function(){
    let group_id = $(this).val();
    $.ajax({
      method: 'get',
      url: "{{action('\Modules\TasksManagement\Http\Controllers\NoteController@getNoteId')}}",
      data: { group_id },
      success: function(result) {
        $('#note_id').val(result.note_id);
      },
    });
  });

  if ($('#note_details').length) {
      tinymce.init({
          selector: 'textarea#note_details',
      });
  }

    const pickr = Pickr.create({
    el: '.color-picker',
    theme: 'classic', // or 'monolith', or 'nano'
    default: '#03C74D',
    position: 'top-middle',
    swatches: [
        'rgba(244, 67, 54, 1)',
        'rgba(233, 30, 99, 0.95)',
        'rgba(156, 39, 176, 0.9)',
        'rgba(103, 58, 183, 0.85)',
        'rgba(63, 81, 181, 0.8)',
        'rgba(33, 150, 243, 0.75)',
        'rgba(3, 169, 244, 0.7)',
        'rgba(0, 188, 212, 0.7)',
        'rgba(0, 150, 136, 0.75)',
        'rgba(76, 175, 80, 0.8)',
        'rgba(139, 195, 74, 0.85)',
        'rgba(205, 220, 57, 0.9)',
        'rgba(255, 235, 59, 0.95)',
        'rgba(255, 193, 7, 1)'
    ],

    components: {

        // Main components
        preview: true,
        opacity: true,
        hue: true,

        // Input / output Options
        interaction: {
            hex: true,
            input: true,
            clear: true,
            save: true,
            useAsButton: false,
        }
    }
  }).on('save', (color, instance) => {
      $('#color').val(color.toHEXA().toString());
  });

  $('.select2').select2();
</script>