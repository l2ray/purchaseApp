@extends('layout.app')

@section('section')
<section id="print-here" class="container pt-5">
    <div class="row">
        <div class="col-sm-6 col-md-3 col-lg-3">
            <a href="requisitionOrder">
                <img src="{{asset('images/logo.jpg')}}" class="rounded float-left img-fluid" width="100" alt="...">
            </a>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-6">
            <h1 class="text-center">QCELL LIMITED</h1>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-lg-12 col-md-12">
            <h4 class="text-center"><b>PURCHASE REQUISITION NOTE</b> <span class="text-danger"><i>{{$lpoNo}} </i></span></h4>
        </div>
        <div class="col-sm-12 col-md-12-col-lg-12">
            <p><b>Officer Making Requisition : </b> {{$officerName}} </p>
            <p><b>Department / Unit : </b> {{$departnemtName}} </p>
            <p><b>HOD Authorization : </b>........................................................................................................................................</p>
        <p><b>Date : </b> {{$date}}</p> 
        </div>
    </div>

    <table class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                <th>Quantity</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            @for($i = 0; $i < count($quantityContainer); $i++)  
            <tr>
                <td>{{$quantityContainer[$i]}}</td>
                <td>{{$descriptionQuantity[$i]}}</td>
            </tr>
            @endfor
        </tbody>

    </table>
<div class="row">
    <div class="col-sm-12 col-md-12 col-lg-12">
    <p><b>Purpose : </b> <u><strong style="font-size: 25px;">{{$purpose}}</strong></u></p>
    </div>
    <br/><br/><br/><br/>
    <div class="col-sm-12 col-md-6 col-lg-6">
        <p><b> Authorized by : ..............................................................................</b> </p>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-6">
        <p><b>Received by : ...............................................................................</b> </p>
    </div>
    <br/><br/><br/><br/>
    <div class="col-sm-12 col-md-6 col-lg-6">
    <p><b>Inputted by : &nbsp;&nbsp;&nbsp;&nbsp;...............................................................................</b></p>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-6">
    <p><b>Date : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...............................................................................</b></p>

    </div>

</div>
@include('layout.print')
<br />
<br />
<br />
</section>
 @endsection 
