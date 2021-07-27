@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
	<div class="row">
        @if($errors->any())
        <div class="alert alert-danger alert-dismissible fade show">{{$errors->first()}}  <button type="button" class="close" data-dismiss="alert">&times;</button></div>
    @endif

            <div class="col-sm-6 col-md-3 col-lg-3">
                <img src="{{asset('images/po.png')}}" class="float-left img-fluid" alt="...">
            </div>
        </div>
        <div id="add_item"></div>
        <form method="post" action="/hrStore">
        <input type="hidden" name="_token" value="{{ csrf_token() }}">

        <fieldset class="form-group border p-3">
            <legend class="w-auto">Supplier</legend>

            <div class="form-row">
                <div class="form-group col-lg-12">
                    <label for="officerName">Supplier's Name *</label>
                    <select class="form-control form-control-lg"  name="supplierId" required>
                        @foreach($sList ?? '' as $sL)
                            <option value={{$sL->id}}>{{$sL->name}}</option>
                        @endforeach


                    </select><small id="officerNameHelp" class="form-text text-muted">Your help</small>
                </div>


            </div>

        </fieldset>

        <fieldset class="form-group border p-3">
            <legend class="w-auto">Officer making requisition</legend>
            <div class="form-row">
                <div class="form-group col-md-4">
                    <label for="department">Department *</label>
                    <select class="form-control form-control-lg" id="department" name="department" required>
                        @foreach($dep ?? '' as $d)
                            <option value={{$d->id}}>{{$d->department_name}}</option>
                        @endforeach


                    </select>
                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-4">
                    <label for="department">Sub Department *</label>
                    <select class="form-control form-control-lg" id="subDepartment" name="subDepartment" required></select>
                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-4">
                    <label for="officerName">Officer's Name *</label>
                    <select class="form-control form-control-lg" id="officerName" name="user" required></select>
                    <small id="officerNameHelp" class="form-text text-muted">Your help</small>
                </div>



                <div class="form-group col-md-6">
                    <label for="head_of_department">Head of Department</label>
                    <input type="text" id="head_of_department" required name="head_of_department" class="form-control form-control-lg" disabled>
                    <input type="number" required readonly hidden name="supId" id="supId" required/>
                </div>

                <div class="form-group col-md-6">
                    <label for="purpose">Purpose</label>
                    <textarea type="text" id="purpose" class="form-control" name="purpose" aria-describedby="purposeHelp" placeholder="Purpose" required></textarea>
                    <small id="purposeHelp" class="form-text text-muted">
                        optional
                    </small>
                </div>
            </div>
        </fieldset>

        <!-------------------  ------------------------------>
        <fieldset class="form-group border p-3">
            <legend class="w-auto"> </legend>
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="officerName">Vat Applicable *</label>
                    <select name="vatApplicable" required class="form-control form-control-lg" >
                        <option  value="1">Yes</option>
                        <option selected value="0">No</option>
                    </select>

                </div>

                <div class="form-group col-md-6">
                    <label for="department">Make Disount ? <input type="checkbox" onclick="checkBox()" value="1" id="vatApplied" /></label>
                    <input onblur="makeDiscount()" type="number" id="discountAmount"  name="discountAmount" readonly placeholder="DISCOUNT AMOUNT IF APPLICABLE" class="form-control form-control-lg" aria-describedby="officerNameHelp">

                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="department">Requisition Date </label>
                    <input type="date" id="poDate"  name="poDate" class="form-control form-control-lg" required>
                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="department"> </label>
                    <input type="text" id="totalTracker"   readonly class="form-control form-control-lg">

                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="officerName">Currency Type *</label>
                    <select id="currencyUsed" name="currencyUsed" required class="form-control form-control-lg" >
                        @foreach($currencyList as $cL)
                    <option value="{{$cL->id}}:{{$cL->currency}}">{{$cL ->currencyName}} ({{$cL ->currencyAbbreviation}} {{$cL ->currency}})</option>
                        @endforeach
                    </select>
                </div>

	<div class="form-group col-md-6">
        <label for="department">Manually Enter PO Number ? <input type="checkbox" onclick="generatePO()" id="manualGenPO" /></label>
        <input onblur="makeDiscount()" type="text" id="idManualGenPO"   name="manualPONum" readonly placeholder="PO Number if APPLICABLE" class="form-control form-control-lg" aria-describedby="officerNameHelp">

        <small id="departmentHelp" class="form-text text-muted">Your Help</small>
    </div>
	    </div>

        </fieldset>
        <!-------------------  ------------------------------>

        <fieldset class="form-group border p-3">
            <legend class="w-auto">Items</legend>

            <div id="items">
		<div id="loadingSection">
                                <p>Loading...</p>
                                <img src="https://upload.wikimedia.org/wikipedia/commons/c/c7/Loading_2.gif" width="50" />

                        </div>
            </div>
        </fieldset>

        <div class="form-group col-md-3 align-self-center">
            <a class="btn btn-outline-info ml-3" style="display: none;" id="add_itemHR">Add Product</a>
        </div>

        <button type="submit" class="btn btn-lg align-bottom btn-success">submit</button>
        </form><br/><br/><br/><br/><br/><br/>
    </section>

    <script>
// [{"subDepName":"Front Desk","depId":2},{"subDepName":"Care Center","depId":2},{"subDepName":"Call Center","depId":2}]
        $("#department").click(()=>{
            const depId = $( "#department" ).val();
            var options = [];
          $.get(`/api/fetchSubDep/${depId}`,(result)=>{
              for (var i = 0; i < result.length; i++) {
                  var option = '<option value="'+result[i].id+ '">'+result[i].subDepName+ '</option>'
                    options.push(option);
                }
                console.log(options);
   $("#subDepartment").html(options.join(''));
          })
        });
        // /api/fetchOfficers/10
        $("#subDepartment").click(()=>{
            const subDepId  = $("#subDepartment").val();
            var options = [];
            $.get(`/api/fetchOfficers/${subDepId}`,(result)=>{
                for(var i = 0; i<result.length; i++){
                var option = `<option value='${result[i].id}'>${result[i].name}</option>`;
                    options.push(option);
                }
                $("#officerName").html(options.join(''));
            });
        });
        makeDiscount = ()=>{
            let discountVal = parseInt(document.getElementById("discountAmount").value);
            let flag =document.getElementById("discountAmount");
            if(!flag.readOnly){
                const count = document.getElementById("unitPriceCount").value;
                $totalBeforeDiscount = 0;
                $totalAfterDiscount = 0;
                for(x=1; x<=count; x++){
                    let tmpUnitPrice = document.getElementById(`unit_price${x}`).value;
                    let tmpQuantity = document.getElementById(`quantity${x}`).value;
                    $totalBeforeDiscount += (parseInt(tmpUnitPrice) * parseInt(tmpQuantity));
                }
                $currencyVal = document.getElementById("currencyUsed");
                const currencySymbol = $currencyVal.options[$currencyVal.selectedIndex].value.split(":")[1];
                console.log(currencySymbol);
                $totalAfterDiscount = $totalBeforeDiscount - discountVal;
                console.log($totalAfterDiscount);
                let outPut = "Total Before Discount => "+currencySymbol+""+$totalBeforeDiscount+" : ";
                outPut += "Total After  Discount => "+currencySymbol+""+$totalAfterDiscount;
                document.getElementById("totalTracker").value=outPut;
                document.getElementById("totalTracker").style.fontSize="15px";
            }
        }
        let trackTotal = 0;
        trackPrevious = (inputId)=>{
            const tmpQuantity = document.getElementById(`quantity${inputId}`).value;
            const tmpUnitPrice = document.getElementById(`unit_price${inputId}`).value;
            let currentTotal = trackTotal;
            $prevUnitPrice = $tmpUnitPrice.value;
            console.log($prevUnitPrice);

        }

        total = (inputId)=>{
                const tmpQuantity = document.getElementById(`quantity${inputId}`).value;
                const tmpUnitPrice = document.getElementById(`unit_price${inputId}`).value;
               trackTotal += (tmpQuantity * tmpUnitPrice);
                const totalReport = document.getElementById("totalTracker");
                totalReport.value=trackTotal;
            }

        checkBox = () =>{
            const checkHandle = document.getElementById("vatApplied");
            const flag = checkHandle.checked;
            const discountVal = document.getElementById("discountAmount");
            if(flag){
                discountVal.readOnly = false;
            }
            else{
                discountVal.readOnly = true;
            }
        }

        generatePO = () =>{
            const checkHandle = document.getElementById("manualGenPO");
            const flag = checkHandle.checked;
            const discountVal = document.getElementById("idManualGenPO");
            if(flag){
                discountVal.readOnly = false;
            }
            else{
                discountVal.readOnly = true;
            }
        }
    </script>
@endsection
{{-- ENDS PURCHASE FORM --}}
