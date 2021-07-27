@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
Good...
    <section class="container">
            {{Form::model($getSupplier,array("route"=>array("supplier.update",$getSupplier->id),"method"=>"PUT"))}}
                <div class="row form-row">
                    <div class="col-lg-12">
                        {{Form::text("supName",$getSupplier->name,["class"=>"form-control","required","placeholder"=>"Suppler Name"])}}
                    </div>
                    <div class="col-lg-12">
                        {{ Form::number('pno',$getSupplier->contact, ["class"=>"form-control","required","placeholder"=>"Suppler Contact#"]) }}
                    </div>
                    <div class="col-lg-12">
                        {{ Form::textarea("Address", $getSupplier->address, ["class"=>"form-control","required","placeholder"=>"Supplier Address"])    }}
                    </div>
                    <div class="col-lg-12">
                        {{Form::submit("Submit",["class"=>"form-control btn btn-success "])}}
                    </div>
                </div>
            {{Form::close()}}
    </section>
@endsection
{{-- ENDS PURCHASE FORM --}}
