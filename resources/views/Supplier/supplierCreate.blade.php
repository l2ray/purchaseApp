@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
            {{Form::open(["method"=>"post","action"=>"SupplierController@store"])}}
                <div class="row form-row">
                    <div class="col-lg-12">
                        {{Form::text("supName","",["class"=>"form-control","required","placeholder"=>"Suppler Name"])}}
                    </div>
 			<div class="col-lg-12">
                        {{ Form::number('pno','', ["class"=>"form-control","required","placeholder"=>"Suppler Contact#"]) }}
                    </div>
                    <div class="col-lg-12">
                        {{ Form::textarea("Address", "", ["class"=>"form-control","required","placeholder"=>"Supplier Address"])    }}
                    </div>
                    <div class="col-lg-12">
                        {{Form::submit("Submit",["class"=>"form-control btn btn-success "])}}
                    </div>
                </div>
            {{Form::close()}}
    </section>
@endsection
{{-- ENDS PURCHASE FORM --}}
