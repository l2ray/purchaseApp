@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}
@section('section')
    <section class="container">
        <table class="table">
            <thead>
                    <tr >
                        <th id="para">Action</th>
                        <th>Date Of Requisition Order</th>
                        <th>Purpose Of Order</th>
                        <th>Status</th>
                    </tr>
            </thead>
            <tbody>
                @foreach($reqOrders as $ro)
                    @if($ro -> hodApproved == 0 )
                    <tr class="alert alert-danger ">
                        <th><a class="btn btn-outline-success" id="btn{{$ro->id}}" onclick="show('{{$ro->id}}')">Show</a></th>
                        <td> {{$ro->reqDate}}</td>
                        <td> {{$ro->purpose}}</td>
                        <td>Sorry Your HOD is yet to approve This REquest. Still Pending.</td>
                        <td><a class="btn btn-outline-success" href="viewLPO/{{$ro->id}}" target="_blank">GENERATE LPO</a></td> <!-- ------------------------------------------------------>
                    </tr>
                    @elseif($ro -> hodApproved == -1)
                        <tr class="alert alert-warning">
                            <th><a class="btn btn-outline-success" id="btn{{$ro->id}}" onclick="show('{{$ro->id}}')">Show</a></th>
                            <td> {{$ro->reqDate}}</td>
                            <td> {{$ro->purpose}}</td>
                            <td>Sorry this request has been rejected by your HOD<br />
                                @if(array_key_exists($ro->id,$reasonsRequisionReject))
                                <button class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModalCenter" onclick="showReason('{{$reasonsRequisionReject[$ro->id]}}')">VIEW JUSTIFICATION:</button>
                               
                            @endif
                            </td>

                            <td><a class="btn btn-outline-success" href="viewLPO/{{$ro->id}}" target="_blank">GENERATE LPO</a></td> <!-- ------------------------------------------------------>                           
                        </tr>
                    @elseif($ro -> hrApproved == 0)
                    <tr class="alert alert-danger ">
                        <th><a class="btn btn-outline-success" id="btn{{$ro->id}}" onclick="show('{{$ro->id}}')">Show</a></th>
                        <td> {{$ro->reqDate}}</td>
                        <td> {{$ro->purpose}}</td>
                        <td>Please print out the LPO for CEO to Approve.</td>
                        <td><a class="btn btn-outline-success" href="viewLPO/{{$ro->id}}" target="_blank">GENERATE LPO</a></td> <!-- ------------------------------------------------------>
                    </tr>
                    @elseif($ro -> hrApproved == -1)
                        <tr class="bg-warning text-white ">
                            <th><a class="btn btn-outline-success" id="btn{{$ro->id}}" onclick="showDetails('{{$ro->id}}')">Show</a></th>
                            <td> {{$ro->reqDate}}</td>
                            <td> {{$ro->purpose}}</td>
                            <td>Sorry this request has been rejected by HR.<br />
                                @if(array_key_exists($ro->id,$reasonsRequisionReject))
                                <button class="btn btn-outline-info" data-toggle="modal" data-target="#exampleModalCenter" onclick="showReason('{{$reasonsRequisionReject[$ro->id]}}')">VIEW JUSTIFICATION:</button>
                               
                            @endif
                            </td>
                            <td><a class="btn btn-outline-success" href="viewLPO/{{$ro->id}}" target="_blank">GENERATE LPO</a></td> <!-- ------------------------------------------------------>
                        </tr>
                    @else
                    <tr class="alert alert-success">
                        <th><a class="btn btn-outline-success" id="btn{{$ro->id}}" onclick="showDetails('{{$ro->id}}')">Show</a></th>
                        <td> {{$ro->reqDate}}</td>
                        <td> {{$ro->purpose}}</td>
                        <td>Request has been processed. Please laise with admin for Delivery</td>
                        <td><a class="btn btn-outline-success" href="viewLPO/{{$ro->id}}" target="_blank">GENERATE LPO</a></td> <!-- ------------------------------------------------------>
                    </tr>
                    @endif
                    <tr >
                        <td  colspan="3">
                            <table  id="show{{$ro->id}}" style="display:none;">
                                <thead>
                                    <tr>
                                        <th>Quantity</th>
                                        <th>Description</th>
                                        <th>Product Name</th>
                                    </tr>
                                </thead>

                                <tbody>
                                    @foreach ($requisitionProducts[$ro->id] as $rp)
                                    <tr>
                                        <td>{{$rp -> productQuantity}}</td>
                                        <td>{{$rp -> productDescription}}</td>
                                        <td>{{$rp -> productName }}</td>
                                        @if(array_key_exists($rp->id,$reasons))
                                            <td>{{ $reasons[$rp->id]}}</td>
                                        
                                        @endif
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
  <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 style="text-align:center;" class="text-center modal-title" id="exampleModalLongTitle">JUSTIFICATION</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div  class="modal-body">
            <h6>This Requisition Has been rejected due to the reason(s) below</h6>
            <div class="text-center" id="rejectRes" style="text-align:center;"></div>

        </div>
        <div class="modal-footer" id="FooterReject">
        </div>
      </div>
    </div>
  </div>
    </section>
    <script>


let para = document.getElementById("para");
console.log(para.style.color);
para.style.color = "red";
showReason = (reason)=>{
    console.log(reason);
    $("#rejectRes").html(`<strong>${reason}</strong>`);
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
@endsection

