@extends('layouts.app')

@section('title', __( 'user.edit_user' ))

@section('content')

<!-- Content Header (Page header) -->
<section class="content-header">
  <h1>@lang( 'user.edit_user' )</h1>
</section>

<!-- Main content -->
<section class="content">
  {!! Form::open(['url' => action('ManageUserController@update', [$user->id]), 'method' => 'PUT', 'id' =>
  'user_edit_form' ]) !!}
  <div class="row">
    <div class="col-md-12">
      @component('components.widget', ['class' => 'box-primary'])
      <div class="col-md-2">
        <div class="form-group">
          {!! Form::label('surname', __( 'business.prefix' ) . ':') !!}
          {!! Form::text('surname', $user->surname, ['class' => 'form-control', 'placeholder' => __(
          'business.prefix_placeholder' ) ]); !!}
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          {!! Form::label('first_name', __( 'business.first_name' ) . ':*') !!}
          {!! Form::text('first_name', $user->first_name, ['class' => 'form-control', 'required', 'placeholder' => __(
          'business.first_name' ) ]); !!}
        </div>
      </div>
      <div class="col-md-5">
        <div class="form-group">
          {!! Form::label('last_name', __( 'business.last_name' ) . ':') !!}
          {!! Form::text('last_name', $user->last_name, ['class' => 'form-control', 'placeholder' => __(
          'business.last_name' ) ]); !!}
        </div>
      </div>
      <div class="clearfix"></div>
      <div class="col-md-12">
        <div class="form-group">
          {!! Form::label('email', __( 'business.email' ) . ':*') !!}
          {!! Form::text('email', $user->email, ['class' => 'form-control', 'required', 'placeholder' => __(
          'business.email' ) ]); !!}
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          {!! Form::label('password', __( 'business.password' ) . ':') !!}
          {!! Form::password('password', ['class' => 'form-control', 'placeholder' => __( 'business.password' ) ]); !!}
          <p class="help-block">@lang('user.leave_password_blank')</p>
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
          {!! Form::label('confirm_password', __( 'business.confirm_password' ) . ':') !!}
          {!! Form::password('confirm_password', ['class' => 'form-control', 'placeholder' => __(
          'business.confirm_password' ) ]); !!}
        </div>
      </div>
      <div class="clearfix"></div>
      <div class="col-md-6">
        {!! Form::label('language', __( 'lang_v1.language' ) . ':*') !!}
        <select class="form-control" name="language">
          @foreach(config('constants.langs') as $key => $val)
          <option value="{{$key}}" @if( $user->language == $key) selected @endif >
            {{$val['full_name']}}
          </option>
          @endforeach
        </select>
      </div>

      <div class="clearfix"></div>
      <div class="col-md-4">
        <div class="form-group">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('is_active', $user->status, $is_checked_checkbox, ['class' => 'input-icheck status']);
              !!} {{ __('lang_v1.status_for_user') }}
            </label>
            @show_tooltip(__('lang_v1.tooltip_enable_user_active'))
          </div>
        </div>
      </div>

      @endcomponent
    </div>

    @if($member_module_permission)
    <div class="col-md-12">
      @component('components.widget', ['title' => __('lang_v1.roles_and_permissions')])
      <div class="col-md-6">
        <div class="form-group">
          {!! Form::label('role', __( 'user.role' ) . ':*') !!}
          @show_tooltip(__('lang_v1.admin_role_location_permission_help'))
          {!! Form::select('role', $roles, !empty($user->roles) ? $user->roles->first()->id : null, ['class' =>
          'form-control select2']); !!}
        </div>
      </div>
      <div class="clearfix"></div>
      <div class="col-md-3">
        <h4>@lang( 'member::lang.access_balamandala' ) @show_tooltip(__('tooltip.access_locations_permission'))</h4>
      </div>

      <div class="col-md-3 check_group">
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('access_all_balamandalaya', 'access_all_balamandala', false,
              ['class' => 'input-icheck check_all']); !!} {{ __( 'member::lang.all_balamandala' ) }}
            </label>
          </div>
        </div>
        @foreach($bala_mandalaya_areas as $bala_mandalaya)
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('bala_mandalaya_permissions[]', 'balamandalaya.' . $bala_mandalaya->id,
              $user->hasPermissionTo('balamandalaya.' . $bala_mandalaya->id),
              [ 'class' => 'input-icheck']); !!} {{ $bala_mandalaya->balamandalaya }}
            </label>
          </div>
        </div>
        @endforeach
      </div>

      <div class="col-md-3 check_group">
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('access_all_gramaseva_vasama', 'access_all_gramaseva_vasam', false,
              ['class' => 'input-icheck check_all']); !!} {{ __( 'member::lang.all_gramaseva_vasam' ) }}
            </label>
          </div>
        </div>
        @foreach($gramasevaka_areas as $gramasevaka_area)
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('gramaseva_vasama_permissions[]', 'gramaseva_vasama.' . $gramasevaka_area->id,
              $user->hasPermissionTo('gramaseva_vasama.' . $gramasevaka_area->id),
              [ 'class' => 'input-icheck']); !!} {{ $gramasevaka_area->gramaseva_vasama }}
            </label>
          </div>
        </div>
        @endforeach
      </div>

      <div class="col-md-3 check_group">
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('access_all_member_group', 'access_all_member_group', false,
              ['class' => 'input-icheck check_all']); !!} {{ __( 'member::lang.all_member_group' ) }}
            </label>
          </div>
        </div>
        @foreach($member_groups as $member_group)
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('member_group_permissions[]', 'member_group.' . $member_group->id,
              $user->hasPermissionTo('member_group.' . $member_group->id),
              [ 'class' => 'input-icheck']); !!} {{ $member_group->member_group }}
            </label>
          </div>
        </div>
        @endforeach
      </div>
      @endcomponent
    </div>
    @else
    <div class="col-md-12">
      @component('components.widget', ['title' => __('lang_v1.roles_and_permissions')])
      <div class="col-md-6">
        <div class="form-group">
          {!! Form::label('role', __( 'user.role' ) . ':*') !!}
          @show_tooltip(__('lang_v1.admin_role_location_permission_help'))
          {!! Form::select('role', $roles, !empty($user->roles) ? $user->roles->first()->id : null, ['class' =>
          'form-control select2']); !!}
        </div>
      </div>
      <div class="clearfix"></div>
      <div class="col-md-3">
        <h4>@lang( 'role.access_locations' ) @show_tooltip(__('tooltip.access_locations_permission'))</h4>
      </div>
      <div class="col-md-9">
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('access_all_locations', 'access_all_locations', !is_array($permitted_locations) &&
              $permitted_locations == 'all',
              [ 'class' => 'input-icheck']); !!} {{ __( 'role.all_locations' ) }}
            </label>
            @show_tooltip(__('tooltip.all_location_permission'))
          </div>
        </div>
        @foreach($locations as $location)
        <div class="col-md-12">
          <div class="checkbox">
            <label>
              {!! Form::checkbox('location_permissions[]', 'location.' . $location->id, is_array($permitted_locations)
              && in_array($location->id, $permitted_locations),
              [ 'class' => 'input-icheck']); !!} {{ $location->name }}
            </label>
          </div>
        </div>
        @endforeach
      </div>
      <div class="clearfix"></div>
      @php
      if(!empty($user->user_store)){
      $user_store = json_decode($user->user_store);
      }else{
      $user_store = [];
      }
      @endphp
      <div class="col-md-6">
        <div class="form-group">
          {!! Form::label('user_store', __('store.assign_store'), '') !!}@show_tooltip(__('lang_v1.multiple_select'))
          <select name="user_store[]" class="form-control" id="user_store" multiple>
            @foreach ($store as $key => $value)
            <option value="{{$key}}" @if(in_array($key,$user_store)) selected @endif>{{$value}}</option>
            @endforeach
          </select>
        </div>
      </div>
      @endcomponent
    </div>
    @endif
  </div>

  <div class="row">
    <div class="col-md-12">
      @component('components.widget', ['title' => __('sale.sells')])

      <div class="col-md-4">
        <div class="form-group">
          {!! Form::label('cmmsn_percent', __( 'lang_v1.cmmsn_percent' ) . ':') !!}
          @show_tooltip(__('lang_v1.commsn_percent_help'))
          {!! Form::text('cmmsn_percent', !empty($user->cmmsn_percent) ? @num_format($user->cmmsn_percent) : 0, ['class'
          => 'form-control input_number', 'placeholder' => __( 'lang_v1.cmmsn_percent' )]); !!}
        </div>
      </div>

      <div class="col-md-4">
        <div class="form-group">
          {!! Form::label('max_sales_discount_percent', __( 'lang_v1.max_sales_discount_percent' ) . ':') !!}
          @show_tooltip(__('lang_v1.max_sales_discount_percent_help'))
          {!! Form::text('max_sales_discount_percent', !is_null($user->max_sales_discount_percent) ?
          @num_format($user->max_sales_discount_percent) : null, ['class' => 'form-control input_number', 'placeholder'
          => __( 'lang_v1.max_sales_discount_percent' ) ]); !!}
        </div>
      </div>
      <div class="clearfix"></div>
      <div class="col-md-4">
        <div class="form-group">
          <div class="checkbox">
            <br />
            <label>
              {!! Form::checkbox('selected_contacts', 1,
              $user->selected_contacts,
              [ 'class' => 'input-icheck', 'id' => 'selected_contacts']); !!}
              {{ __( 'lang_v1.allow_selected_contacts' ) }}
            </label>
            @show_tooltip(__('lang_v1.allow_selected_contacts_tooltip'))
          </div>
        </div>
      </div>

      <div class="col-sm-4 selected_contacts_div @if(!$user->selected_contacts) hide @endif">
        <div class="form-group">
          {!! Form::label('selected_contacts', __('lang_v1.selected_contacts') . ':') !!}
          <div class="form-group">
            {!! Form::select('selected_contact_ids[]', $contacts, $contact_access, ['class' => 'form-control select2',
            'multiple', 'style' => 'width: 100%;' ]); !!}
          </div>
        </div>
      </div>
      @endcomponent
    </div>
  </div>

  @if(!$member_module_permission)
  @include('user.edit_profile_form_part', ['bank_details' => !empty($user->bank_details) ?
  json_decode($user->bank_details, true) : null])
  @endif

  <div class="row">
    <div class="col-md-12">
      <button type="submit" class="btn btn-primary pull-right" id="submit_user_button">@lang( 'messages.update'
        )</button>
    </div>
  </div>
  {!! Form::close() !!}
  @stop
  @section('javascript')
  <script type="text/javascript">
    $(document).ready(function(){
    $('#selected_contacts').on('ifChecked', function(event){
      $('div.selected_contacts_div').removeClass('hide');
    });
    $('#selected_contacts').on('ifUnchecked', function(event){
      $('div.selected_contacts_div').addClass('hide');
    });
  });

  $('form#user_edit_form').validate({
                rules: {
                    first_name: {
                        required: true,
                    },
                    email: {
                        email: true,
                        remote: {
                            url: "/business/register/check-email",
                            type: "post",
                            data: {
                                email: function() {
                                    return $( "#email" ).val();
                                },
                                user_id: {{$user->id}}
                            }
                        }
                    },
                    password: {
                        minlength: 5
                    },
                    confirm_password: {
                        equalTo: "#password",
                    }
                },
                messages: {
                    password: {
                        minlength: 'Password should be minimum 5 characters',
                    },
                    confirm_password: {
                        equalTo: 'Should be same as password'
                    },
                    username: {
                        remote: 'Invalid username or User already exist'
                    },
                    email: {
                        remote: '{{ __("validation.unique", ["attribute" => __("business.email")]) }}'
                    }
                }
            });
  </script>
  @endsection