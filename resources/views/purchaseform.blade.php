@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
<section class="container">
    <div class="row">
        <div class="col-sm-6 col-md-3 col-lg-3">
            <h4>Purchase form</h4>
            <img src="{{asset('images/po.png')}}" class="float-left img-fluid" alt="..." height="100px" width="100px">
        </div>
    </div>
    {{Form::open(['method'=>'post','action'=>'ProductOrderController@store'])}}
{{--    <fieldset class="form-group border p-3">--}}
{{--                <legend class="w-auto">Supplier</legend>--}}

{{--                <div class="form-row">--}}

{{--                <div class="form-group col-md-6">--}}
{{--                    <label for="supplier">Name/Title</label>--}}
{{--                    <input type="text" id="supplier" name="supplier" class="form-control form-control-lg" aria-describedby="supplierHelp">--}}
{{--                    <small id="supplierHelp" class="form-text text-muted">--}}
{{--                        Your help--}}
{{--                    </small>--}}
{{--                </div>--}}



{{--                <div class="form-group col-md-6">--}}
{{--                    <label for="address">Address</label>--}}
{{--                    <textarea type="text" id="address" class="form-control" aria-describedby="addressHelp"> </textarea>--}}
{{--                    <small id="addressHelp" class="form-text text-muted">--}}
{{--                        Your help--}}
{{--                    </small>--}}
{{--                </div>--}}

{{--                </div>--}}

{{--            </fieldset>--}}

            <fieldset class="form-group border p-3">
                <legend class="w-auto">Officer making requisition</legend>
                <div class="form-row">
                    <input type="text" hidden name="hodEmail" value="{{$hodEmail[0]->email}}"/>
                    <div class="form-group col-md-6">
                        <label for="officerName">Officer's Name *</label>
                        <input type="text" readonly id="officerName" name="officerName" value="{{$userDetail->name}}" class="form-control form-control-lg" aria-describedby="officerNameHelp" required>
                       <input type="number" readonly name="userId" hidden  value="{{$userDetail->id}}" />
                        <small id="officerNameHelp" class="form-text text-muted">Your help</small>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="department">Department *</label>
                        <input type="text" readonly class="form-control form-control-lg" value="{{$department->department_name}}" />
                        <input type="number" readonly name="departmentId" hidden value="{{$department->id}}" />
{{--
<select class="form-control form-control-lg" id="department" name="department" required>--}}
{{--                            @foreach($dep ?? '' as $d)--}}
{{--                                <option value={{$d->id}}>{{$d->department_name}}</option>--}}
{{--                            @endforeach--}}


{{--                        </select>--}}
                        <small id="departmentHelp" class="form-text text-muted">Your Help</small>
                    </div>

                    <div class="form-group col-md-6">
                        <label for="head_of_department">Head of Department</label>
                        <input type="text" id="head_of_department" value="{{$hodDetail->name}}" name="head_of_department" class="form-control form-control-lg" disabled>
                        <input  type="text" id="receipt_number" hidden value="{{$hodDetail->id}}" readonly name="hodId" class="form-control form-control-lg">
                    </div>

                    <div class="form-group col-md-6">
                        <label for="purpose">Purposes</label>
                        <textarea required type="text" id="purpose" class="form-control" name="purpose" aria-describedby="purposeHelp"></textarea>
                        <small id="purposeHelp" class="form-text text-muted">
                            optional
                        </small>
                    </div>
                </div>
            </fieldset>

            <fieldset class="form-group border p-3">
                <legend class="w-auto">Items</legend>
                <div id="items">

			<div id="loadingSection">
				<p>Loading...</p>
				<img width="50" src="https://upload.wikimedia.org/wikipedia/commons/c/c7/Loading_2.gif" />

			</div>
		 </div>
            </fieldset>
	   <div class='row'>
            <div class="form-group col-md-12 col-lg-12 align-self-center">
                <button class="btn btn-outline-info ml-3" style="display: block" id="add_item">Add Product</button>
            </div>
		</div>
            <button type="submit" class="btn btn-lg align-bottom btn-success">submit</button>






    </form>
    <br /><br /><br />
    <script>


        let para = document.getElementById("para");
console.log(para.style.color);
para.style.color = "red";
    show = (input)=>{

        // console.log(`btnDisApprove${input}`);
        let disApproveBtn = document.getElementById(`btnDisApprove${input}`);
       let approveBtn = document.getElementById("btnApprove"+input);
        //console.log(approveBtn.style+" => "+disApproveBtn);

    let showTable = document.getElementById("show"+input);
        let changeText = document.getElementById("btn"+input);
    const flag = showTable.style.display;
    if(flag === "none"){

        showTable.style.display="block";
       approveBtn.style.display="block";
       disApproveBtn.style.display="block";
        changeText.innerHTML ="Hide";
    }
    else{

        showTable.style.display="none";
       disApproveBtn.style.display="none";
       approveBtn.style.display="none";
        changeText.innerHTML ="Show";
    }
    }

    showDetails = (input)=>{
        // console.log(`btnDisApprove${input}`);
        //let disApproveBtn = document.getElementById(`btnDisApprove${input}`);
       // let approveBtn = document.getElementById("btnApprove"+input);
        //console.log(approveBtn.style+" => "+disApproveBtn);

    let showTable = document.getElementById("show"+input);
        //let changeText = document.getElementById("btn"+input);
    const flag = showTable.style.display;
    if(flag === "none"){

        showTable.style.display="block";
       // approveBtn.style.display="block";
       // disApproveBtn.style.display="block";
        changeText.innerHTML ="Hide";
    }
    else{

        showTable.style.display="none";
       // disApproveBtn.style.display="none";
       // approveBtn.style.display="none";
        changeText.innerHTML ="Show";
    }
    }
    approve = (id)=>{
        //alert(id);
            const flag = confirm("ARE YOU SURE YOU WANT TO APPROVE THIS REQUEST AS A HOD?");
            if(flag){
                $.get(`/hodApproveRequest/${id}`,function(data){
                    alert("Request Successfully Approved.");
                    location.reload();
                });
            }
    }
    disaprove = (id)=>{
        const flag = confirm("ARE YOU SURE YOU WANT TO DECLINE THIS REQUEST AS A HOD?");
        if(flag){
            $.get(`/hodDisApproveRequest/${id}`,function(data){
                alert("Request Successfully Approved.");
                location.reload();
            });
        }

    }
        recycle = (id)=>{
            const flag = confirm("ARE YOU SURE YOU WANT TO RESTORE THIS DATA?");
            if(flag){
                $.get(`/hodRecycleData/${id}`,function(data){
                    alert("DATA HAS SUCCESSFULLY BEEN RECYCLED. \nTHANK YOU.");
                    location.reload();
                });
            }

        }
    hrDisaprove = (id)=>{
        const flag = confirm ("You are about to reject this request. Are you sure you want to proceed?");
        if(flag){
            $.get(`/api/hrDisApproveRequest/${id}`,function(data){
                    alert("DATA HAS SUCCESSFULLY Disapproved. \nTHANK YOU.");
                    location.reload();
                });
        }
    }

    hrApprove = (id)=>{
        const flag = confirm ("You are about to Approve (Accept) this Request. Are you sure you want to proceed?");
        if(flag){
            $.get(`/api/hrApproveRequest/${id}`,function(data){
                    alert("Request HAS SUCCESSFULLY Approved. \nTHANK YOU.");
                    location.reload();
                });
        }
    }




</script>
{{--<script src="{{asset('js/purchase_form.js')}}"></script>--}}

</section>

@endsection
{{-- ENDS PURCHASE FORM --}}
