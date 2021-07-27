@extends('layout.app')

@section('section')
<section class="container">
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-6">
            <div class="row">
                <div class="col-sm-6 col-md-3 col-lg-3">
                    <img src="{{asset('images/logo.jpg')}}" class="rounded float-left img-fluid" alt="...">
                </div>
                <div class="col-sm-6 col-md-9 col-lg-9">
                    <h4>QCELL LIMITED</h4>
                    <p>QCELL HOUSE <br> KAIRABA AVENUE, S/KUNDA, THE GAMBIA <br> (220) 4378430 fax (220) 4378406</p>  
                </div>
            </div>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-6">
            <p class="text-right"><b>GRN #: <span>{{$poNumber}}</span></b></p>
            <p class="text-right"><b>PO#: <span>{{$poNumber}}</span></b></p>
            
        </div>  
    </div>
    <br>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h3 class="text-center"> <strong>GRN</strong> </h3>
            <hr class="text-primary">
            <hr>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-6">
            <fieldset class="border form-group p-3">
                <legend class="w-auto">SUPPLIER</legend>
                <h6><b>Name</b>: {{$supplierDetail -> name ?? " "}}</h6>
		<h6><b>Contact</b>: {{$supplierDetail -> contact }} </h6>
                <h6><b>Address</b>: {{$supplierDetail -> address ?? " "}}</h6>
            </fieldset>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-6">
            
            <fieldset class="border form-group p-3">
                <legend>.</legend>
                <div class="">
                    <ul class="list-inline">
                        <li class="list-inline-item"><strong>Received by:</strong></li>
                        <li class="list-inline-item"></li>
                    </ul>                    
                    <ul class="list-inline">
                        <li class="list-inline-item"><strong>Name: .....................................................................</strong></li>
                        <li class="list-inline-item"></li>
                    </ul>
                    <ul class="list-inline">
                        <li class="list-inline-item"><strong>Date:</li>
                        <li class="list-inline-item">.....................................................................</strong></li>
                    </ul>
                    <ul class="list-inline">
                        <li class="list-inline-item"><strong>Signature: ..............................................................</strong></li>
                        <li class="list-inline-item"></li>
                    </ul>
                </div>
            </fieldset>
        </div>        
    </div>
    <div class="row">
        <div class="col-sm- 12 col-md-12 col-lg-12">
            <table class="table table-striped table-hover">
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">Qty</th>
                        <th scope="col">Description</th>
                    </tr>
                </thead>
                <tbody>
                    @php
                        $total = 0;
                    @endphp
                    @foreach($prodLst as $pList)
                    <tr>
                        <td>{{$pList->quantity}}</td>
                        <td>{{$pList->description}}</td>
                    </tr>
                @endforeach
                   
                   
                </tbody>
            </table>
        </div>
    </div>

     
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h6 class="text-center">Purpose: {{$purpose}}</h6>
        </div>
@include('layout.print')
<br/><br/><br /><br /><br />
    </div>


        </div>
    </div>
</section>

@endsection







