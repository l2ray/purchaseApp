@extends('layout.app')

@section('section')
    <section class="container">
        <div class="row">
            <div class="col-sm-6 col-md-2 col-lg-2">
            <img src="{{asset('images/logo.jpg')}}" class="rounded float-left img-fluid" alt="">
            </div>
            <div class="col-sm-6 col-md-10 col-lg-10">
                <div class="text-center">
                    <h4>QCELL LIMITED, QCell House</h4>
                    <h5>Kairaba Avenue, PO Box 3460, Serekunda, The Gambia, West Africa</h5>
                    <h5>Tel: (220) 333-3111</h5>
                    <h5>Email: info@qcell.gm Web:http://wwww.qcell.gm</h5>
                    <hr>
                </div>

            </div>
        </div>   
        
    </section>
    <section class="container">
        <h4 class="text-center"><strong>PAYMENT REQUEST FORM</strong></h4>
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6"><p class="float-left"><strong>Date:</strong>&nbspJune 2020</p></div>
            <div class="col-sm-12 col-md-6 col-lg-6"><p class="float-right"><strong>No:</strong>&nbspQC2311</p></div>
        </div>
        <p class=""><strong>Payee:</strong>&nbspBakary</p>
        <p class=""><strong>Department:</strong>&nbspAdmin</p>
        <p class=""><strong>Amount:</strong>&nbsp20,000</p>
        <p class=""><strong>Amount in words</strong>&nbspTwenty thousand dalasi only</p>

    </section>

    <section class="container">
        <table class="table table-dark table-striped table-hover">
            <thead>
                <tr>
                <th scope="col">Quantity</th>
                <th scope="col">Description</th>
                <th scope="col">Unit Price</th>
                <th scope="col">Amount</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                <th scope="row">2</th>
                <td>Something Something</td>
                <td>15</td>
                <td>30</td>
                </tr>
            </tbody>
        </table>
    </section>
    <section class="container">
        <p><strong>Authorized by:</strong>&nbsp</p>
        <p><strong>Paid by:</strong>&nbsp</p>
        <p><strong>Received by: </strong>&nbsp</p>
        <p><strong>Name (if different from above)</strong>&nbsp</p>
    </section>

@endsection