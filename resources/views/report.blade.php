@extends('layout.app')

    @section('section')
    <section class="container p-5">
        <div class="row">
            <div class="col-sm-12 col-md-12 col-lg-12 d-flex justify-content-center">
                <form class="form-inline">
                  <label class="sr-only" for="department_unit">Department/Unit</label>
                  <div class="input-group mb-2 mr-sm-2">
                    <div class="input-group-prepend">
                      <div class="input-group-text">Department/Unit</div>
                    </div>
                      <Select type="date" id="department_unit" name="department_unit" class="form-control">
                      </Select>
                  </div>

                    <label class="sr-only" for="from_month">From</label>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">From</div>
                      </div>
                        <input type="date" id="from_date" name="from_date" max="3000-12-31" min="2000-01-01" class="form-control">
                    </div>

                    <label class="sr-only" for="to_month">To</label>
                    <div class="input-group mb-2 mr-sm-2">
                      <div class="input-group-prepend">
                        <div class="input-group-text">To</div>
                      </div>
                        <input type="date" id="to_date" name="to_date" max="3000-12-31" min="2000-01-01" class="form-control">
                    </div>
                                  
                    <a class="btn btn-secondary mb-2" id="report">Report</a>
                  </form>

                  
            </div>
        </div>
    </section>
    <section class="p-3" id="report-section">
        <h4 class="d-flex justify-content-center pb-4" id="report_table_header"></h4>
        <table id="report-table" class="table table-striped table-bordered">
            <thead class="" style="background-color: #ffa726">
            <tr>
            <th scope="col">Date</th>
            <th scope="col">Description</th>
            <th scope="col">LPO No.</th>
            <th scope="col">Qty</th>
            <th scope="col">Unit Price</th>
            <th scope="col">Total</th>
            <th scope="col">Purpose</th>
            </tr>
            </thead>
            <tbody id="report_table_body">

            </tbody>
            <tfoot>
                <tr>
                <th></th>
                <th scope="row">Total Expenses</th>
                <th colspan="3"></th>
                <th scope="row" id="total_expense"></th>
                <th></th>
                </tr>
            </tfoot>
        </table>
        <script src="{{asset('js/moment-with-locales.min.js')}}"></script>
        <script src="{{asset('js/report.js')}}"></script>

    </section>
    <section class="container">
      <div class="row">
        <div class="col-sm-12 col-md-12 col-lg-12" id="export_to_pdf_div">
        </div>
      </div>
    </section>
    @endsection