<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">
    <title>Print</title>
</head>
<body>

    <section class="p-0" id="report-section">
        <h5 class="pb-1 text-center" id="report_table_header">REPORT ON PURCHASE ACTIVITIES FOR {{$for}}</h5>
        <h5 class="pb-1 text-center">From {{ \Carbon\Carbon::parse($from_date)->format('D d-M-Y')}} To {{ \Carbon\Carbon::parse($to_date)->format('D d-M-Y')}}</h5>
        <table id="report-table" class="table table-striped table-bordered">
            <thead class="" style="background-color: #ffa726">
            <tr>
            <th scope="col">Date</th>
            <th scope="col">Description</th>
            <th scope="col">LPO</th>
            <th scope="col">Qty</th>
            <th scope="col">Unit Price</th>
            <th scope="col">Total</th>
            <th scope="col">Purpose</th>
            </tr>
            </thead>
            <tbody id="report_table_body">
                @php
                    $total_expense = 0;
                @endphp
                @foreach ($ro as $unit)
                @foreach ($unit->productorders as $item)
                <tr>
                    <td>{{ \Carbon\Carbon::parse($unit->created_at)->format('d/M/Y')}}</td>
                    <td>{{$item->description}}</td>
                    <td>{{$unit->poNumber}}</td>
                    <td>{{$item->quantity}}</td>
                    <td>{{$item->unit_price}}</td>
                    <td>{{$item->total_price}}</td>
                    <td>{{$unit->purpose}}</td>
                </tr>
                @php
                    $total_expense = $total_expense + $item->total_price;
                @endphp
                    
                @endforeach                    
                @endforeach
            </tbody>
            <tfoot>
                <tr>
                <th></th>
                <th scope="row">Total Expenses</th>
                <th colspan="3"></th>
                <th scope="row" id="total_expense">{{number_format($total_expense,2)}}</th>
                <th></th>
                </tr>
            </tfoot>
        </table>


    </section>
    
</body>
</html>