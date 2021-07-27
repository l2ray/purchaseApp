@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}
@section('section')
    <section class="container">
        <div class="row">
            <div class="col-sm-6 col-md-3 col-lg-3">
                <img src="{{asset('images/po.png')}}" class="float-left img-fluid" alt="...">

            </div>
	</div>
        <form method="POST" action='/storeCustomPoItems'>
            <input type="hidden" name="_token" value="{{ csrf_token() }}">
        <fieldset class="form-group border p-3">
            <legend class="w-auto">Supplierssss</legend>

            <div class="form-row">
                <input type="number" name="updateId"  hidden value="{{$id}}" />

                <div class="form-group col-lg-12">
                    <label for="officerName">Supplier's Name *</label>
                    <select  class="form-control form-control-lg"  name="supplierId" required>
                        <option value={{$suppId}}>{{$suppName}}</option>
                    </select><small id="officerNameHelp" class="form-text text-muted">Your help</small>
                </div>


            </div>

        </fieldset>

        <fieldset class="form-group border p-3">
            <legend class="w-auto">Officer making requisition</legend>
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="officerName">Officer's Name *</label>
                    <input type="text" id="officerName" disabled value="{{$officerList[$pendingRR->officer_id]}}" name="officerName" class="form-control form-control-lg" aria-describedby="officerNameHelp" required>
                <input type="number" name="officerId" readonly hidden value="{{$pendingRR -> officer_id}}"/>
                    <small id="officerNameHelp" class="form-text text-muted">Your help</small>
                </div>

                <div class="form-group col-md-6">
                    <label for="department">Department *</label>
                    <input type="text" id="officerName" disabled value="{{$depList[$pendingRR->dep_id]}}" name="officerName"class="form-control form-control-lg" aria-describedby="officerNameHelp" required>
                <input type="number" name="depId" hidden value="{{$pendingRR -> dep_id }}"/>
                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>

                <div class="form-group col-md-6">
                    <label for="head_of_department">Head of Department</label>
                    <input type="text" value="{{$hodName}}" id="head_of_department" name="head_of_department" class="form-control form-control-lg" disabled>
                <input type="number" hidden value="{{$pendingRR->hod_id}}" name="head_of_department" readonly name="supId" id="supId" required/>
                </div>

                <div class="form-group col-md-6">
                    <label for="purpose">Purpose</label>
                <textarea type="text" id="purpose" readonly class="form-control" name="purpose" aria-describedby="purposeHelp">{{$pendingRR->purpose}}</textarea>
                    <small id="purposeHelp" class="form-text text-muted">
                        optional
                    </small>
                </div>



            </div>
        </fieldset>

        <fieldset class="form-group border p-3">
            <legend class="w-auto"> </legend>
            <div class="form-row">

                <div class="form-group col-md-6">
                    <label for="officerName">Vat Applicable *</label>
                    <select name="vatApplicable" class="form-control form-control-lg" >
                        <option value="1">Yes</option>
                        <option value="0">No</option>
                    </select>

                </div>

                <div class="form-group col-md-6">
                    <label for="department">Make Disount ? <input type="checkbox" onclick="checkBox()" value="1" id="vatApplied" /></label>
                    <input onblur="makeDiscount()" type="number" id="discountAmount"  name="discountAmount" readonly placeholder="DISCOUNT AMOUNT IF APPLICABLE" class="form-control form-control-lg" aria-describedby="officerNameHelp">

                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="department">Requisition Date </label>
                    <input type="date" id="poDate" required name="poDate" class="form-control form-control-lg">
                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="department">Requisition Date </label>
                    <input type="text" id="totalTracker"   readonly class="form-control form-control-lg">

                    <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                </div>
                <div class="form-group col-md-6">
                    <label for="officerName">Currency Type *</label>
                    <select id="currencyUsed" name="currencyUsed" class="form-control form-control-lg" >
                        @foreach($currencyList as $cL)
                    <option value="{{$cL->id}}:{{$cL->currency}}">{{$cL ->currencyName}} ({{$cL ->currencyAbbreviation}} {{$cL ->currency}})</option>
                        @endforeach
                    </select>
                </div>
            </div>
        </fieldset>
        <fieldset class="form-group border p-3">
            <legend class="w-auto">Items</legend>
                @php
                    $count = 1;
                @endphp
            <div id="items">
                @foreach($pendingRequest as $pR )
                <div class='form-row'>
                    <div class='form-group col-md-2'>
                        <label for='quantity'>Quantity *</label>
                        <input type='number' value="{{$pR[0]->productQuantity}}" id='quantity{{$count}}' name='quantity{{$count}}'  class='form-control form-control-lg' aria-describedby='quantityHelp'>
                        <small id='quantityHelp' class='form-text-muted'>Your help</small>
                        </div>
                        <div class='form-group col-md-2'>
                            <label for='quantity'>Unit Price *</label>
                            <input type='number' id='unit_price{{$count}}'   required name='unit_price{{$count}}' class='form-control form-control-lg' aria-describedby='quantityHelp'>
                            <small id='quantityHelp' class='form-text-muted'>Your help</small>
                            </div>
                        <div class='form-group col-md-3'>
                        <label for='unit_price'>Product Name*</label>
                        <input type='text' value="{{$pR[0] -> productName}}" name='pName{{$count}}' readonly class='form-control form-control-lg' aria-describedby='pName_Help'>
                        <small id='unit_price_Help' class='form-text-muted'>product Name</small>
                        </div>

                        <div class='form-group col-md-5'>
                        <label for='description'>Description</label>
                        <textarea type='text' id='description' value="sdsd" name='description{{$count}}' class='form-control form-control-lg' rows='2' aria-describedby='descriptionHelp' readonly>{{$pR[0] -> productDescription}}</textarea>
                        <small id='descriptionHelp' class='form-text-muted'>description of item</small>
                        </div>
                    @php
                        $count = $count +1;
                    @endphp
                @endforeach
                <input id="unitPriceCount" hidden type="number" value={{$count-1}} />
            </div>
        </fieldset>
        <button type="submit" class="btn btn-lg align-bottom btn-success form-control">submitsss</button>
        <br/> <br/><br/><br/><br/>
        </form>
    </section>
    <script>
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
    </script>
@endsection
{{-- ENDS PURCHASE FORM --}}
