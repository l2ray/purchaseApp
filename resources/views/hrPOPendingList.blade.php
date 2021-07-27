@extends('layout.app')

@section('section')
    <section class="container">
	<table class="table">
		<tr><th>Department</th></tr>

		@foreach($departments as $key => $val)
			<tr>
				<td>{{$dList[$key]}}
				 <a href="#" onclick="showHide({{ $key }})" id="showEye{{ $key }}"><i class="fas fa-eye"></i></a>
                            <a href="#" onclick="showHide({{ $key }})" id="hideEye{{ $key }}" style="display: none;"><i  class="fas fa-eye-slash"></i></a>

				</td>

			<td>
				<table class="table" id="hide{{ $key }}" style="display: none;">
					<thead>
						<tr>
							<th>Action</th><th>Purpose of Order</th><th>Date of Requisition Order</th><th>Officer Requisting</th><th>Take Action</th>
						</tr>
					</thead>
					@foreach($val as $data)
						<tr>
							<th><a class="btn btn-primary" id="btn{{$data->id}}" onclick="show('{{$data->id}}')">Show</a></th>
							<td>{{$data->purpose}}</td>
							<td>{{$data->reqDate}}</td>
							<td>{{$officerList[$data->officer_id]}}</th>
							<td><a style="display:none" id="btnApprove{{$data->id}}" href="/hrPO/{{$data->id}}"  class="btn btn-primary">Approve To Generate Po</a>
                            <button style="display:none" id="btnDisApprove{{$data->id}}" data-toggle="modal" data-target="#rejectModal" onclick="hrDisaprove('{{$data->id}}')" class="btn btn-danger">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Decline&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</button>
</td>
						</tr>
						<tr>
						<td></td>
						<td colspan="4">
							<table  id="show{{$data->id}}" style="display:none;">

						<thead>
                                    <tr>
                                        <th>Quantity</th>
                                        <th>Description</th>
                                        <th>Product Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>

								<tbody>

									@foreach ($requisitionProducts[$data->id] as $rp)
                                    <tr id="itemRow{{$rp -> id}}">
                                        <td>{{$rp -> productQuantity}}</td>
                                        <td>{{$rp -> productDescription}}</td>
                                        <td>{{$rp -> productName }}</td>
                                        <th>
                                            @if($rp -> hodApproveStatus == 0)
                                                <span >REJECTED</span>
                                            @else
                                            <button  type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter" onclick="rejectItem({{$rp -> id}})" id="rejectItem{{$rp -> id}}"> Reject</button>
                                            {{-- <input data-toggle="modal" data-target="#exampleModalCenter" /> --}}

                                            @endif
                                        </th>
                                        @if(count($requisitionProducts[$data->id]) > 1)
                                            <th>
                                                <select class="form-control" id="item{{$rp -> id}}" onclick="addItems('e',{{$rp -> id}})" class="fomr-control">
                                                    @foreach($supplierList as $s)
                                                        <option value="{{$s->id}}">{{ $s->name }}</option>
                                                    @endforeach
                                                </select>
                                            </th>
                                        @endif
                                    </tr>
                                @endforeach
                                @if( count($requisitionProducts[$data->id])> 1)
                                    <tr>
                                        <td colspan="4">
                                            <a onclick="generatePO({{$data->id}})" class="btn btn-block btn-primary">Generate PO</a>
                                        </td>
                                    </tr>
                                @endif
								</tbody>
							</table>
						</td>
						</tr>
					@endforeach
				</table>
            </td>
			</tr>
		@endforeach
	</table>
	<!--table class="table">
            <thead>
                <tr>
                    <th id="para">Action</th>
                    <th>Purpose Of Order</th>
                    <th>Date Of Requisition Order</th>
                    <th>Officer Requisting</th>
                    <th>Take Action</th>

                </tr>
            </thead>
            <tbody>
                @foreach($reqOrders as $ro)
                   <tr>
                       <th><a class="btn btn-primary" id="btn{{$ro->id}}" onclick="show('{{$ro->id}}')">Show</a></th>
                       <td> {{$ro->reqDate}}</td>
                       <td> {{$ro->purpose}}</td>
                       <td>{{ $officerList[$ro -> officer_id] }}</td>
                       <td>
                            <a style="display:none" id="btnApprove{{$ro->id}}" href="/hrPO/{{$ro->id}}"  class="btn btn-primary">Approve To Generate Po</a>
                            <button style="display:none" id="btnDisApprove{{$ro->id}}" data-toggle="modal" data-target="#rejectModal" onclick="hrDisaprove('{{$ro->id}}')" class="btn btn-danger">Decline</button>
                        </td>
                   </tr>
                    <tr >
                        <td  colspan="5">
                            <table  id="show{{$ro->id}}" style="display:none;">
                                <thead>
                                    <tr>
                                        <th>Quantity</th>
                                        <th>Description</th>
                                        <th>Product Name</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                    <h1></h1>
                                <tbody>
                                    @foreach ($requisitionProducts[$ro->id] as $rp)
                                    <tr>
                                        <td>{{$rp -> productQuantity}}</td>
                                        <td>{{$rp -> productDescription}}</td>
                                        <td>{{$rp -> productName }}</td>
                                        <th>
                                            @if($rp -> hodApproveStatus == 0)
                                                <span >REJECTED</span>
                                            @else
                                            <button  type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter" onclick="rejectItem({{$rp -> id}})" id="rejectItem{{$rp -> id}}"> Reject</button>


                                            @endif
                                        </th>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </td>
                    </tr>
                @endforeach
            <tbody></tbody>
        </table-->
        <br /><br/><br/>

        <!-- Button trigger modal -->


  <!--- ------------------------------------------------------------------->
          <div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title text-red" id="dismissModalLabel" >ATTENTION</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>You are about to Decline this request. Please State your reason to Proceed.</p>
                  <textarea id="rejectRes" placeholder="Reason for Rejection" class="form-control" cols="50" rows="5"></textarea>
                </div>
                <div class="modal-footer" id="rejectModalFooter">
                <button>sdfsd</button>
		</div>
              </div>
            </div>
          </div>
            <!--- ------------------------------------------------------------------->

  <!-- Modal -->
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Reject Product</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div  class="modal-body">
            <p>Please State you reason for Rejecting this Item.</p>
            <textarea id="rejectSingleProduct" placeholder="Reason for Rejection" class="form-control" cols="50" rows="5"></textarea>
        </div>
        <div class="modal-footer" id="FooterReject">
        </div>
      </div>
    </div>
  </div>
        <script>
            verify = (inputId)=>{
                const reasonReject = document.getElementById("rejectSingleProduct").value;
                $.get(`/approveRejectProductHR/${inputId}/0/${reasonReject}/2`,function(data){
                        $("#rejectSingleProduct").html("")
                    });
                      document.getElementById(`rejectSingleProduct`).value="";
                      $(`#rejectItem${inputId}`).prop('disabled', true);
                     $(`#rejectItem${inputId}`).html("Rejected");
            }

            rejectItem = (inputId)=>{
                console.log(`Input Id ${inputId}`);
             $("#FooterReject").html(`<button type="button"  class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="verify('${inputId}')">Confirm</button>`)
            }

            let para = document.getElementById("para");
    console.log(para.style.color);
    para.style.color = "red";
///////////////////////////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~`


///////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

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
      /*  hrDisaprove = (id)=>{
            $("#rejectModalFooter").html(` <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger" onclick="decline('${id}')"  data-dismiss="modal" >Decline</button>`);
            // const flag = confirm ("You are about to reject this request. Are you sure you want to proceed?");
            // if(flag){
            //     $.get(`/api/hrDisApproveRequest/${id}`,function(data){
            //             alert("DATA HAS SUCCESSFULLY Disapproved. \nTHANK YOU.");
            //             location.reload();
            //         });
            // }
        }*/


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
<script>

        let store = [];
        let supplierList = [];
        let items = "";
        const addItems = (input,idNum)=>{
          //console.log("ItemId => "+idNum);
          const hideRow = document.getElementById("itemRow"+idNum);
          hideRow.style.display="none";
          const currentSelectItem = document.getElementById("item"+idNum);
          const supplierId = currentSelectItem.value;
          let supplierN = "s"+supplierId;
          if(supplierList.length == 0){
              supplierList.push(supplierId);
              store.push(idNum);
              items +=idNum+":";
          }
          else{
            if(!supplierList.includes(supplierId)){
              supplierList.push(supplierId);
            }
            items +=idNum+":";
            store.push(idNum);
          }
        }
        const generatePO = (generalPoId)=>{
            if(supplierList.length == 0){
                alert("SORRY PLEASE SELECT ATLEAST AN ITEM TO GENERATE FROM THIS OPTION OTHER WISE USE THE (Approve To Generate Po) OPTION.\nTHANK YOU.")
            }
            else if(supplierList.length>1){
                alert("Sorry The Items you select must come from the same supplier to successfully generate a PO. Thank you");
            }
            else{
            console.log("================== Items to ge generated =====================");
            console.log("Pending PO Id => "+generalPoId);
            console.log("STORE => "+store);
            console.log("Items to process => "+ items);
            console.log("SupplierList => "+supplierList);
            const supId = supplierList[0];
             store = [];
             supplierList = [];
             const tmpItem = items;
             items = "";
            //window.open("http://www.google.com","_blank");
            window.open(`http://localhost:8000/viewSpecific/${generalPoId}/${tmpItem}/${supId}`,"_blank");
            //window.open(`http://po.app.qcell.gm/viewSpecific/${generalPoId}/${tmpItem}/${supId}`,"_blank");
            }
        }

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
const  decline = (id)=>{
	console.log("Sorry");
            // alert("Confirmed. "+id);
            const reasonReject = document.getElementById("rejectRes").value;
            // console.log(reasonReject);
            console.log("YOu arein decline"+id);
            document.getElementById("rejectRes").value = "";
                $.get(`/hodDisApproveRequest/${id}/${reasonReject}/2/2`,function(data){
                    location.reload();
                });
        }

const  hrDisaprove = (id)=>{
            $("#rejectModalFooter").html(` <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger" onclick="decline('${id}')"  data-dismiss="modal" >Decline</button>`);
            // const flag = confirm ("You are about to reject this request. Are you sure you want to proceed?");
            // if(flag){
            //     $.get(`/api/hrDisApproveRequest/${id}`,function(data){
            //             alert("DATA HAS SUCCESSFULLY Disapproved. \nTHANK YOU.");
            //             location.reload();
            //         });
            // }
        }

            const showHide = (id)=>{
                const ref = `hide${id}`;
                const showHide = document.getElementById(ref);
                const status = (showHide.style.display);
<<<<<<< HEAD
               // id="showEye key }}"
               // id="hideEye key }}"
=======
               // id="showEye $key "
               // id="hideEye$key"
>>>>>>> fd3d9cfab8b06c48ef643413c57052d4f0f91ff1
                if(status === "none"){
                    showHide.style.display = "block";

                    // showEye hideEye
                    console.log(document.getElementById("showEye"+id));
                     //.style.display = "none";
                     document.getElementById("showEye"+id).style.display="none";
                     document.getElementById("hideEye"+id).style.display = "inline";

                }
                else{
                    showHide.style.display = "none";
                    document.getElementById("showEye"+id).style.display = "inline";
                    document.getElementById("hideEye"+id).style.display = "none";
                }

            }
        </script>

    </section>
@endsection
