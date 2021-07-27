@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
        <a href="/supplier/create" class="btn btn-block text-white btn-primary">Add Supplier</a>
        <table class="table">
            <thead>
                <tr>
                    <th>Supplier Name</th>
                    <th>Supplier Address</th>
		    <th>Supplier Contact</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
               @foreach($supList as $sL)
               <tr>
                    <td>{{$sL -> name }}</td>
                    <td>{{ $sL -> address}} </td>
		    <td>{{ $sL -> contact}} </td>
                    <td><a href="supplier/{{ $sL -> id }}/edit" class="btn btn-primary text-white">Modify</a></td>
                </tr>
               @endforeach
                
            </tbody>
        </table>
    </section>
@endsection
{{-- ENDS PURCHASE FORM --}}
