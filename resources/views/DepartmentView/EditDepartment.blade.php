@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
        {{-- {{Form::open(["method"=>"post","action"=>"DepartmentController@store"])}} --}}
        {{Form::model($depToModify,array("route"=>array("department.update",$depToModify->id),"method"=>"PUT"))}}
        
        <input type="hidden" name="_method" value="PATCH">
          <div class="row">
              <div class="col-lg-12">
                  {{Form::text("depName","",["class"=>"form-control","placeholder"=>"New Department Name"])}}
              </div>
              <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-6">
                            {{Form::submit("Add Department",["class"=>"form-control btn btn-success"])}}
                        </div>
                        <div class="col-lg-6">
                            <a href="/department" class="btn btn-danger btn-block">Cancel</a>
                        </div>
                    </div>
              </div>
          </div>
        {{Form::close()}}
    </section>
@endsection
