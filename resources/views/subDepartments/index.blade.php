@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
        <table class="table">
            {{Form::open(["method"=>"post","action"=>"SubDepartmentController@store"])}}
              <div class="row form-row">
                <div class="col-lg-4"><input type="text" required class="form-group form-control" placeholder="SubDepartmentName" name="subDep" /></div>
                <div class="col-lg-4">
                    <select name="depId" class="form-group form-control">
                        @foreach($depList as $key => $val)
                            <option value='{{$key}}'>{{$val}}</option>
                        @endforeach
                    </select>
                </div>
                    <div class="form-row row">
                        <input type="submit" class="form-control form-group" value="Submit" />
                    </div>
              </div>
            {{Form::close()}}
            <thead>
                <tr>
                    <th id="para">SubDepName</th>
                    <th>Department</th>

                </tr>
            </thead>
            <tbody>
                @foreach($subDep as $sd)
                    <tr>
                        <td>{{$sd -> subDepName}}</td>
                        <td>{{$depList[$sd -> depId] }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </section>
@endsection