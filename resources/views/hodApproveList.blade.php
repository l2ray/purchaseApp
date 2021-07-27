

@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')

<!---------------------- -->



    <section class="container">
        <table class="table">
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
                       <td><button data-toggle="modal" data-target="#exampleModal" onclick="approve('{{$ro->id}}')" class="btn btn-primary">Approve</button>
                        <button onclick="disaprove('{{$ro->id}}')" data-toggle="modal" data-target="#rejectModal" class="btn btn-danger">Decline</button></td>
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

                                <tbody>
                                    @foreach ($requisitionProducts[$ro->id] as $rp)
                                    <tr>
                                        <td>{{$rp -> productQuantity}}</td>
                                        <td>{{$rp -> productDescription}}</td>
                                        <td>{{$rp -> productName }}</td>
                                        <th>
                                            <button  type="button" class="btn btn-danger" data-toggle="modal" data-target="#rejectSingleProduct" onclick="rejectProduct({{$rp -> id}})" id="rejectItem{{$rp -> id}}"> Reject</button>
{{--                                            
                                            <span id="reject{{$rp -> id}}" >REJECT</span> 
                                            <input onclick="rejectItem({{$rp -> id}})"type="checkbox" id="rejectItem{{$rp -> id}}" value="sd" /> --}}
                                        
                                            
                                        </th>
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </td>
                    </tr>
                @endforeach
            <tbody></tbody>
        </table>
          <!-- Modal -->
  <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title text-red" id="exampleModalLabel" >ATTENTION</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>You are about approve this Requisition</p>
          <p>Click on approve to confirm this action.</p>
          <p>Thank you</p>
        </div>
        <div class="modal-footer" id="modalFooter">
         
        </div>
      </div>
    </div>
  </div>

<!----------------------  -->

          <!-- Modal -->
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
                </div>
              </div>
            </div>
          </div>
        
        <!----------------------  -->
        <div class="modal fade" id="rejectSingleProduct" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title" id="exampleModalLongTitle">Modal title</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div  class="modal-body">
                    <p>Please State you reason for Rejecting this Item.</p>
                    <textarea id="srejectRes" placeholder="Reason for Rejection" class="form-control" cols="50" rows="5"></textarea>
                </div>
                <div class="modal-footer" id="FooterReject">
                </div>
              </div>
            </div>
          </div>
        
        <script>

        verifyRejectProduct = (inputId)=>{
              //  console.log(`Okay. ${inputId}`);
                const reasonReject = document.getElementById("srejectRes").value;
                // console.log(reasonReject);

                /////
                $.get(`/approveRejectProduct/${inputId}/0/${reasonReject}/1`,function(data){
                        // alert("Product Successfully Rejected.");
                        // location.reload();
                        $("#srejectRes").html("")
                        // console.log(data);
                    });
                     $(`#rejectItem${inputId}`).prop('disabled', true); 
                     $(`#rejectItem${inputId}`).html("Rejected");
            }

            rejectProduct = (inputId)=>{
                // console.log(`Input Id ${inputId}`);
             $("#FooterReject").html(`<button type="button"  class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="verifyRejectProduct('${inputId}')">Confirm</button>`)
            }

            rejectItem = (inputId)=>{
                // http://localhost:8000/approveRejectProduct/1/0
               var currentCheckBox = document.getElementById(`rejectItem${inputId}`);
               if(currentCheckBox.checked){
                  const flag =  confirm("You're about Reject this product as a hod. Are you sure you want to proceed?");
                  if(flag){
                    $.get(`/approveRejectProduct/${inputId}/0`,function(data){
                        alert("Product Successfully Rejected.");
                        // location.reload();
                    });
                     currentCheckBox.style.display="none";
                     document.getElementById(`reject${inputId}`).innerHTML="REJECTED";
                  }
                  else{
                      currentCheckBox.checked = false;
                  }
               }
               else{
                   alert("You are...");
               }
                console.log("The ID to be processed is "+inputId);
            }


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
        verify = (id)=>{
            // alert("Confirmed. "+id);
            $.get(`/hodApproveRequest/${id}`,function(data){
                        location.reload();
                    });
        }
        decline = (id)=>{
            // alert("Confirmed. "+id);
                $.get(`/hodDisApproveRequest/${id}`,function(data){
                    location.reload();
                });
        }

        approve = (id)=>{
            //alert("sd")
             $("#modalFooter").html(` <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-primary" onclick="verify('${id}')"  data-dismiss="modal" >Approve</button>`)
            //alert(id);
                // const flag = confirm("ARE YOU SURE YOU WANT TO APPROVE THIS REQUEST AS A HOD?");
                // if(flag){
                //    
                // }
        }

        disaprove = (id)=>{

            $("#rejectModalFooter").html(` <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
          <button type="button" class="btn btn-danger" onclick="decline('${id}')"  data-dismiss="modal" >Decline</button>`);
            // const flag = confirm("ARE YOU SURE YOU WANT TO DECLINE THIS REQUEST AS A HOD?");
            // if(flag){
            //     $.get(`/hodDisApproveRequest/${id}`,function(data){
            //         alert("Request Successfully Approved.");
            //         location.reload();
            //     });
            // }
    
        decline = (id)=>{
            // alert("Confirmed. "+id);
            const reasonReject = document.getElementById("rejectRes").value;
            // console.log(reasonReject);
            console.log("YOu arein decline");
            document.getElementById("rejectRes").value = "";
                $.get(`/hodDisApproveRequest/${id}/${reasonReject}/1/1`,function(data){
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
    </section>
@endsection