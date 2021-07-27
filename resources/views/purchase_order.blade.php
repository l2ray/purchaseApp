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
            <p class="text-right"><b>PO# <span>{{$poNumber}}</span></b></p>
            {{-- <p class="text-right"><b>PRN#: <span>{{$po->reqNo}}</span></b></p> --}}
        </div>  
    </div>
    <br>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
            <h3 class="text-center"> <strong>Purchase Order</strong> </h3>
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
                <legend>Date</legend>
                <div class="">
                    <h6 class="text-right">{{$finalDate}}</h6>
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
                        <th scope="col">Unit Price</th>
                        <th scope="col">Total</th>
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
                        <td>{{$currencyUsed}}{{$pList->unit_price}}</td>
                        <td>{{$currencyUsed}}{{$pList->total_price}}</td>
                        @php
                            $total = $total + $pList ->total_price;
                        @endphp
                    </tr>
                   
                @endforeach
                <tr>
                    <td colspan="4">{{$poNote}}</td>
                </tr>
                    @php
                        $vat = 0.0;
                        $tmpVat = 0.0;
                        if($po -> vatApplicable == 1 ){
                            $tmpVat = 0.15 * $total;
                            $vat = number_format($tmpVat,2);
                        }
                        $money = number_format($total, 2);
                        if($po ->  discountApplicable == 1 ){
                            $amountCharged = ($total + $tmpVat) - $discountAmount  ;
                        }
                        else{
                        $amountCharged = ($total + $tmpVat)  ;
                        }
                        $finalTotal = number_format($amountCharged,2);
                    @endphp
                   @if($po -> discountApplicable == 1)
                   <tr>
                    <td colspan="2" rowspan="3">
                        <h4 class="text-center">Discount Details</h4>
                        <strong>Discount: </strong>{{$currencyUsed}}{{$discountAmount ?? ""}}
                    </td>
                    {{-- <td>s</td> --}}
                    <td scope="row">Sub Total</td>
                    <td>{{$currencyUsed}}{{$money}}</td>
                </tr>
                <tr>
                    {{-- <td></td>
                    <td></td> --}}
                    <td scope="row">15% VAT</td>
                    <td>{{$currencyUsed}}{{ $vat }}</td>
                </tr>
                                  <tr>
                    {{-- <td></td>
                    <td></td> --}}
                    <th scope="row">TOTAL</th>
                    <td>{{$currencyUsed}}{{$finalTotal}}</td>
                    </tr>
                   @else
                   <tr>
                    <td >
                    </td>
                    <td></td>
                    <td scope="row">Sub Total</td>
                    <td>{{$currencyUsed}}{{$money}}</td>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td scope="row">15% VAT</td>
                    <td>{{$currencyUsed}}{{ $vat }}</td>
                </tr>
                                  <tr>
                    <td></td>
                    <td></td>
                    <th scope="row">TOTAL</th>
                    <td>{{$currencyUsed}}{{$finalTotal}}</td>
                    </tr>
                   @endif
                </tbody>
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-6 col-lg-6">
            <fieldset class="border form-group p-3">
                <legend class="w-auto">Payment Details</legend>
                <div class="form-check">
                    <input class="form-check-input" type="radio" name="cash" id="cash" value="cash" checked>
                    <label class="form-check-label" for="cash">
                      Cash
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="cheque" id="cheque" value="cheque">
                    <label class="form-check-label" for="cheque">
                      Cheque
                    </label>
                  </div>
                  <div class="form-check">
                    <input class="form-check-input" type="radio" name="credit_card" id="credit_card" value="credit card" >
                    <label class="form-check-label" for="credit_card">
                      Credit Card
                    </label>
                  </div>
                
            </fieldset>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12">
             <p>SINCERELY YOURS</p> 
             <br><br>
             &sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;&sdot;
             <p>MUHAMMED JAH <br>  MANAGING DIRECTOR</p>  
@include('layout.print')
<br />
<br />
<br />

        </div>
    </div>
</section>

@endsection
