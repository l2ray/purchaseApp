@extends('layout.app')
@section('section')
    <section class="container">


<table id="dtBasicExample" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
  <thead>
    <tr>
      <th class="th-sm">Staff Name
      </th>
      <th class="th-sm">Purpose
      </th>
      <th class="th-sm">GRN #
      </th>
      <th class="th-sm">Department
      </th>
    </tr>
  </thead>
  <tbody>
    @foreach($grnList as $gList)
    @php
      $subDep = $subDepId[$gList->officer_id];
    @endphp
      <tr style='cursor: pointer; cursor: hand;' onclick="window.location='/viewLPO/{{ $gList->id }}'" id="tRow">
        <td>{{ $userList[$gList->officer_id] }}</td>
        <td>{{ $gList->purpose }}</td>
        <td>{{ $gList->lpoNo }}</td>
        <td>{{ $depList[$gList->dep_id] }} / {{ $subDeplist[$subDep] }}</td>
      </tr>
    @endforeach
     </tbody>
  <tfoot>
    <tr>
      <th>Staff Name
      </th>
      <th>Purpose
      </th>
      <th>GRN #
      </th>
      <th>Department
      </th>
    </tr>
  </tfoot>
</table>
<script>

$(document).ready(function () {
$('#dtBasicExample').DataTable();
$('.dataTables_length').addClass('bs-select');
});
</script>
@endsection