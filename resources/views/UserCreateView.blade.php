@extends('layout.app')

@section('section')
    <div class="container">
        @if ($errors->any())
            <i class="bg-danger">{{ $errors->first() }}</i>
        @endif
        {{Form::open(["method"=>"post","action"=>"UserController@store"])}}
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="inputEmail4">Email</label>
                    <input required name="email" type="email" placeholder="user@qcell.gm" class="form-control form-control-lg" id="inputEmail4">
                </div>

                <div class="form-group col-md-6">
                    <label for="name">Name</label>
                    <input required name="name" type="text" placeholder="Actual Name" class="form-control form-control-lg" id="name">
                </div>

            </div>
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="status">Status</label>
                    <select required name="status" id="status" class="form-control form-control-lg">
                        <option selected>Choose...</option>
                        <option value="1">Normal User</option>
                        <option value="2">HOD</option>
                        <option value="3">Hr Personnel</option>
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="status">Authority to Act on Request</label>
                    <select required name="authToAct" id="authToAct" class="form-control form-control-lg">
                        <option selected>Choose...</option>
                        <option value="1">Yes</option>
                        <option value="0">No</option>
                    </select>
                </div>

            </div>
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="password">Password</label>
                    <input required name="password" type="password" placeholder="Password" class="form-control form-control-lg" id="password">
                </div>
                <div class="form-group col-md-6">
                    <label for="conPassword">Confirm Password</label>
                    <input required name="conPassword" type="password" placeholder="Confirm Password" class="form-control form-control-lg" id="conPassword">
                </div>
                <div class="form-group col-md-6">
                    <label for="department">Department</label>
                    <select required name="dep" id="departments" class="form-control form-control-lg">
                        <option selected>Choose...</option>
                        @foreach($dep as $d)
                            <option value={{$d->id}}>{{$d->department_name}}</option>
                        @endforeach
                    </select>
                </div>
                <div class="form-group col-md-6">
                    <label for="department">Sub Department *</label>
                    <select class="form-control form-control-lg" id="subDepartments" name="subDepartment" required>


                    </select>
                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
            </div>

            <button type="submit" class="btn btn-primary">Create User</button>
        {{Form::close()}}
    </div>
    <script>
        // [{"subDepName":"Front Desk","depId":2},{"subDepName":"Care Center","depId":2},{"subDepName":"Call Center","depId":2}]
            //  document.getElementById("status");

              $("#status").change(()=>{
                    const statusId = $("#status").val();
                    console.log(statusId);
                    if(statusId == 2){
                        $("#authToAct").val("1");
                    }
                    else{
                        $("#authToAct").val("0");
                    }
                });

                $("#departments").click(()=>{
                    console.log("sdfs");
                    const depId = $( "#departments" ).val();

                    var options = [];
                            options.push('<option value="-1">Pease Select Your Sub Department</option>');
                  $.get(`/api/fetchSubDep/${depId}`,(result)=>{
                      for (var i = 0; i < result.length; i++) {
                          var option = '<option value="'+result[i].id+ '">'+result[i].subDepName+ '</option>'
                            options.push(option);
                        }
                       // console.log(options);
          $("#subDepartments").html(options.join(''));
                  })
                });
    </script>
@endsection
