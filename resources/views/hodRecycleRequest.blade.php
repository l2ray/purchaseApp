@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
        <table class="table">
            <thead>
            <tr>
                <th id="para">Action</th>
                <th>Purpose Of Order</th>
                <th>Date Of Requisition Order</th>
                <th>Officer Requisting</th>
                <th>Take Action</th>

            </tr>
            </thead>
            <tbody>
            @foreach($reqOrders as $ro)
                <tr>
                    <th><a class="btn btn-primary" id="btn{{$ro->id}}" onclick="show('{{$ro->id}}')">Show</a></th>
                    <td> {{$ro->reqDate}}</td>
                    <td> {{$ro->purpose}}</td>
                    <td>{{ $officerList[$ro -> officer_id] }}</td>
                    <td><button onclick="approve('{{$ro->id}}')" class="btn btn-primary">Approve</button><button onclick="recycle('{{$ro->id}}')" class="btn btn-danger">Recycle</button></td>
                </tr>
                <tr >
                    <td  colspan="5">
                        <table  id="show{{$ro->id}}" style="display:none;">
                            <thead>
                            <tr>
                                <th>Quantity</th>
                                <th>Description</th>
                                <th>Unit Price</th>
                                <th>Total</th>
                            </tr>
                            </thead>

                            <tbody>
                            @foreach ($requisitionProducts[$ro->id] as $rp)
                                <tr>
                                    <td>{{$rp -> quantity}}</td>
                                    <td>{{$rp -> description}}</td>
                                    <td>{{$rp -> unit_price }}</td>
                                    <td>{{$rp -> total_price }}</td>
                                </tr>
                            @endforeach

                            </tbody>
                        </table>
                    </td>
                </tr>
            @endforeach
            <tbody></tbody>
        </table>
    </section>
@endsection
