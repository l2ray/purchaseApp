@extends('layout.app')

@section('section')
    <section class="container">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
                <form class="form-inline">                

                    <label class="sr-only" for="from_month">From Month</label>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">From</div>
                      </div>
                        <input type="date" id="from_month" name="from_month" max="3000-12-31" min="2000-01-01" class="form-control">
                    </div>

                    <label class="sr-only" for="to_month">To Month</label>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">To</div>
                      </div>
                        <input type="date" id="to_month" name="to_month" max="3000-12-31" min="2000-01-01" class="form-control">
                    </div>
                                  
                    <a class="btn btn-secondary mb-2" id="generate">Generate</a>
                  </form>

            </div>
        </div>
    </section>
    <section class="p-5" style="">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6">
                  <div id="chart1">

                  </div>
            </div>

            <div class="col-sm-12 col-md-6 col-lg-6" >
                <div id="chart2">
    
                </div>
            </div>

        </div>
    </section>

    <script>
        // let admin = {!! json_encode($admin ?? '') !!};
    </script>
    <hr>
    <section class="p-5">
        <div class="row">
            <div class="col-sm-12 col-md-6 col-lg-6">
                <h4 id="rqanalysis"></h4>
                <table id="department_table" class="table table-striped table-bordered display">
                    <thead class="thead-light">
                        <tr>
                            <th>Department</th>
                            <th>Expenses</th>
                        </tr>
                    </thead>
                    <tbody id="department_table_body">


                    </tbody>
                </table>
            </div>
        </div>

    </section>
    <hr>
    <section class="m-3 pb-5">
        <h2>Purchase Orders</h2>
        <table id="plo" class="table table-striped table-bordered display mb-5" style="width:100%">
            <thead class="thead-dark border-primary">
                <tr>
                    <th>Date</th>
                    <th>P.L.O Number</th>
                    <th>Department</th>
                    <th>Officer</th>
                    <th>P.L.O</th>
                    <th>GRN</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($ro as $item)
                <tr>
                    <td>{{$item->created_at}}</td>
                <td>{{$item->poNumber}}</td>
                <td>{{$item->departments->department_name}}</td>
                <td>{{$item->officerrequesting->name}}</td>
                <td><a href="/po/{{$item->id}}">view</a></td>
                <td><a href="/grn/{{$item->id}}">view</a></td>
                </tr>      
                @endforeach
                <tfoot>
                <tr>
                    <th>P.L.O Number</th>
                    <th>Date</th>
                    <th>Department</th>
                    <th>Officer</th>
                    <th>P.L.O</th>
                    <th>GRN</th>
                </tr>
            </tfoot>
        </table>
    </section>
    <script src="{{asset('js/Chart.bundle.js')}}"></script>
    <script src="{{asset('js/moment-with-locales.min.js')}}"></script>
    <script src="{{asset('js/custom-chart.js')}}"></script>
@endsection
