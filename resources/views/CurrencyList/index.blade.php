@extends('layout.app')

@section('section')
    <div class="container">
       <h1 class="text-center">Currency List</h1>
      
       <table class="table">
            <thead >
                <tr>
                    <th>Currency Name</th>
                    <th>Currency Symbol</th>
                </tr>
            </thead>
            <tbody>
                @foreach($curList as $cL)
                <tr>
                <td>{{$cL->currencyName}}</td>
                    <td>{{$cL -> currency}}</td>
                </tr>
                @endforeach
            </tbody>
       </table>
    </div>
@endsection