@extends('layout.app')

@section('section')
    <div class="container">
       <h1 class="text-center">Currency List</h1>
      <form action="{{ url('expperdep') }}" method="post">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <input type="date" id="from" name="from" />
        <input type="date" id="end" name="end" />
        
        <select name="depId">
          @foreach($depList as $d)
            <option value="{{ $d->id }}">{{ $d->department_name }}</option>
          @endforeach
        </select>
        <input type="submit" value="Generate Report" />
      </form>
    </div>
@endsection