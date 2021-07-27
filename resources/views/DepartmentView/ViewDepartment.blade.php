@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
        {{Form::open(["method"=>"post","action"=>"DepartmentController@store"])}}
          <div class="row">
              <div class="col-lg-12">
                  {{Form::text("depName","",["class"=>"form-control","placeholder"=>"Department Name"])}}
              </div>
              <div class="col-lg-12">
                  {{Form::submit("Add Department",["class"=>"form-control btn btn-success"])}}
              </div>
          </div>
            <div class="row">
                <div class="col-lg-12">
               <table class="table">
                   <thead>
                        <tr>
                            <th>Department Name</th>
                            <th>Action</th>
                        </tr>
                   </thead>
                   <tbody>
                        @foreach($depList as $d)
                            <tr>
                                <td>{{$d -> department_name}}</td>

                            <td><a href="department/{{$d -> id}}/edit" class="btn btn-primary text-white">Modify</a></td>
                            </tr>
                            @endforeach
                   </tbody>
               </table>
                </div>
            </div>
        {{Form::close()}}
    </section>
@endsection
