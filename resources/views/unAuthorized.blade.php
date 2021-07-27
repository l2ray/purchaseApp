<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="shortcut icon" type="image/png" href="{{asset('images/po.png')}}" />
    <link rel="stylesheet" type="css/text" href="{{asset('css/Chart.css')}}" />
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ" crossorigin="anonymous">

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/dt-1.10.21/fh-3.1.7/sp-1.1.1/datatables.css"/>
    <script src="https://code.jquery.com/jquery-3.5.1.js" integrity="sha256-QWo7LDvxbWT2tbbQ97B53yJnYU3WhH/C8ycbRAkjPDc=" crossorigin="anonymous"></script>

    <title>Purchase</title>
    <style>
        body{

        }
    footer {
position:fixed;
        left: 0;
        bottom: 0;
        width: 100%;
        color: white;
        text-align: center;
        margin-top:5px;
    }

    </style>

</head>
<body>
     <!--Main Layout-->
     <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="/">Purchase</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav mr-auto">


            <li class="nav-item active p-3">
                <a class="btn btn-outline-success my-2 my-sm-0" href="/productOrder/create">Request <span class="sr-only">(current)</span></a>
            </li>

            <li class="nav-item p-3">
                <a class="btn btn-outline-success my-2 my-sm-0" href="/pendingRequest">My Pending Request</a>
            </li>
            @if(Session::get("status") == 2)
                <li class="nav-item">
                    <a class="btn btn-outline-success my-2 my-sm-0" href="/awaitingList">Staff Pending Request</a>
                </li>
                <li class="nav-item">
                    <a class="btn btn-outline-success my-2 my-sm-0 " href="/hodListToRecycle"  >Recycle Bin</a>
                </li>
            @endif
            <!--li class="nav-item active p-3">
                <a class="btn btn-outline-success my-2 my-sm-0" href="/productOrder/create">Request <span class="sr-only">(current)</span></a>
            </li-->
            <li class="nav-item p-3">
                <a class="btn btn-outline-success my-2 my-sm-0 " href="/requisitionOrder"  >Requisition List</a>
            </li>
            @if(Session::get("status") == 3)
            <li class="nav-item dropdown p-3">
                <a href="#" class=" dropdown-toggle btn btn-outline-success my-2 my-sm-0" data-toggle="dropdown">Configuration</a>
                <div class="dropdown-menu">
                    <a href="/department" class="dropdown-item btn btn-outline-success my-2 my-sm-0">Departments</a>
                    <a href="/user" class="dropdown-item">Users</a>
                    <a href="/supplier" class="dropdown-item">Supplier</a>
                    <a href="/currencylist" class="dropdown-item">View Currency Type</a>
                </div>
            </li>

            <li class="nav-item dropdown p-3">
                <a href="#" class=" dropdown-toggle btn btn-outline-success my-2 my-sm-0" data-toggle="dropdown">HR</a>
                <div class="dropdown-menu">
                    <a href="/hrPO/create" class="dropdown-item">Create Purchase Order</a>
                    <a href="/poLst" class="dropdown-item">View Purchase Orders </a>
                    <a href="/hrPOPendingList" class="dropdown-item">View Pending Request</a>
                </div>
            </li>
            <li class="nav-item p-3">
                <a class="btn btn-outline-success my-2 my-sm-0 " href="/report"  >Reports</a>
            </li>
            @endif


          </ul>

          <ul  class="navbar-nav nav-flex-icons">
            <li class="nav-item dropdown p-3">
                <a class="nav-link dropdown-toggle btn btn-outline-success" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                  Support
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                  <a class="dropdown-item" href="#">Lamin O. Touray</a>
                  <div class="dropdown-divider"></div>
                  <a class="dropdown-item" href="#">Sulayman M.J</a>

                </div>
            </li>
            <li class="nav-item p-3"><a class="btn btn-outline-danger my-2 my-sm-0"" href="/login">Log-out</a></li>
        </ul>
        </div>
      </nav>
    </header>
    <main class="mt-5 pt-5">



<section id="print-here" class="container pt-5">

    <div class="row">
        <div class="col-sm-6 col-md-3 col-lg-3">
            <a href="requisitionOrder">
                <img src="{{asset('images/logo.jpg')}}" class="rounded float-left img-fluid" width="100" alt="...">
            </a>
        </div>
        <div class="col-sm-12 col-md-6 col-lg-6">
            <h1 class="text-center">QCELL LIMITED</h1>
        </div>
    </div>
    <div  class="row">
        <div class="col-sm-12 col-lg-12 col-md-12">
            <h4 class="text-center"><b>PURCHASE REQUISITION NOTE</b> <span class="text-danger"><i>{{$lpoNo}} </i></span></h4>
        </div>
        <div class="col-sm-12 col-md-12-col-lg-12">
            <p><b>Officer Making Requisition : </b> {{$officerName}} </p>
            <p><b>Department / Unit : </b> {{$departnemtName}} </p>
            <div class='row'>
                <div class='col-lg-3'>
                    <p><b>HOD Authorization : </b>.........</p>

                </div>
                <div class='col-lg-9'>
                    <img src="{{asset('images/unauthorized.jpg')}}" class="rounded float-left img-fluid" width="200" alt="...">
                </div>
            </div>
             <p><b>Date : </b> {{$date}}</p>
        </div>
    </div>

    <table class="table table-bordered table-striped table-hover">
        <thead>
            <tr>
                <th>Quantity</th>
                <th>Description</th>
            </tr>
        </thead>
        <tbody>
            @for($i = 0; $i < count($quantityContainer); $i++)
            <tr>
                <td>{{$quantityContainer[$i]}}</td>
                <td>{{$descriptionQuantity[$i]}}</td>
            </tr>
            @endfor
        </tbody>

    </table>
<div class="row">
    <div class="col-sm-12 col-md-12 col-lg-12">
    <p><b>Purpose : </b> <u><strong style="font-size: 25px;">{{$purpose}}</strong></u></p>
    </div>
    <br/><br/><br/><br/>
    <div class="col-sm-12 col-md-6 col-lg-6">
        <p><b> Authorized by : ..............................................................................</b> </p>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-6">
        <p><b>Received by : ...............................................................................</b> </p>
    </div>
    <br/><br/><br/><br/>
    <div class="col-sm-12 col-md-6 col-lg-6">
    <p><b>Inputted by : &nbsp;&nbsp;&nbsp;&nbsp;...............................................................................</b></p>
    </div>
    <div class="col-sm-12 col-md-6 col-lg-6">
    <p><b>Date : &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;...............................................................................</b></p>

    </div>

</div>
@include('layout.print')
<br />
<br />
<br />
</section>
</main>
<footer class="footer bg-dark mt-3">
  <div class="text-center">
    <h5 class="">&copy; QCell SWAT 2020 - </h5>
  </div>
</footer>

<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

{{-- DATATABLES --}}
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/dt-1.10.21/fh-3.1.7/sp-1.1.1/datatables.js"></script>

{{-- Custom files --}}
<script src="{{asset('js/purchase_form.js')}}"></script>
<script src="{{asset('js/print.min.js')}}"></script>
<script type="text/javascript" >
function preventBack(){window.history.forward();}
setTimeout("preventBack()", 0);
window.onunload=function(){null};
</script>
</body>
</html>

