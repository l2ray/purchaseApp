@extends('layout.app')

@section('section')
    <div class="container">
        @if ($errors->any())
        <div class="alert alert-danger alert-dismissible fade show">
            <strong>Error!</strong> {{ $errors->first() }}
            <button type="button" class="close" data-dismiss="alert">&times;</button>
        </div>
            {{-- <i class="bg-danger"></i> --}}
        @endif
        {{-- {{Form::open(["method"=>"post","action"=>"UserController@store"])}} --}}
        {{Form::model($userToEdit,array("route"=>array("user.update",$userToEdit -> id),"method"=>"PUT"))}}
            <input type="hidden" value="PATCH" name="_method" />
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Email</label>
                    <input required name="email" value="{{$userToEdit -> email }}" type="email" placeholder="user@qcell.gm" class="form-control" id="inputEmail4">
                </div>
                <div class="form-group col-md-6">
                    <label for="name">Name</label>
                    <input required name="name" type="text" value="{{$userToEdit->name}}"  placeholder="Actual Name" class="form-control" id="name">
                </div>

            </div>



            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="department">Department</label>
                    <select required name="dep" id="department" class="form-control">
                        <option selected>Choose...</option>
                        @foreach($dep as $d)
                            <option value={{$d->id}}>{{$d->department_name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="status">Status</label>
                    <select required name="status" id="status" class="form-control">
                        <option selected>Choose...</option>
                        <option value="1">Normal User</option>
                        <option value="2">HOD</option>
                        <option value="3">Hr Personnel</option>
                    </select>
                </div>

            </div>
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="password">Password</label>
                    <input required name="password" value="{{$userToEdit->uPassword}}" type="password" placeholder="Password" class="form-control" id="password">
                </div>
                <div class="form-group col-md-6">
                    <label for="conPassword">Confirm Password</label>
                    <input required name="conPassword" value="{{$userToEdit->uPassword}}"  type="password" placeholder="Confirm Password" class="form-control" id="conPassword">
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Create User</button>
        {{Form::close()}}
    </div>
@endsection