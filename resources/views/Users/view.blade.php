@extends('layout.app')
@section('section')
    <div class="container">
        <a class="btn btn-block btn-primary" href="/user/create">Create User</a>
        <table class="table">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Department</th>
                    <th>Email Address</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                @foreach($uList as $ul)
                    <tr>
                        <td>{{$ul->name}}</td>
                        <td>{{$depList[$ul->department]}}</td>
                        <td>{{$ul->email}}</td>
                    <td><a class="btn btn-primary text-white" href="/user/{{$ul->id}}/edit">Modify</a></td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
@endsection