@extends('layout.app')
{{-- BEGINS PURCHASE FORM --}}

@section('section')
    <section class="container">
        <table class="table">
            <thead>
                <tr>
                    <th id="para">Action</th>
                    <th>Purpose Of Order</th>
                    <th>Date Of Requisition Order</th>
                    <th>Status</th>
                </tr>
            </thead>
            <tbody>
                @foreach($reqOrders as $ro)

                        <tr class="alert alert-danger">
                            <th><a class="btn btn-outline-success" id="btn{{$ro->id}}" onclick="show('{{$ro->id}}')">Show</a></th>
                            <td> {{$ro->purpose}}</td>
                            <td> {{$ro->reqDate}}</td>
                            @if($ro -> hodApproved == 0)
                                <td>Sorry Your Hod is yet to approve This Request. Still Pending.</td>
                                <td>
                                    <button onclick="showOptions({{ $ro -> id }})" id="othersAct{{ $ro->id }}" class="btn btn-outline-success" href="#" target="_blank">LET OTHERS ACT<br /> ON THIS<br /></button>
                                    <select class="selectpicker form-control" style="display:none;"  id="hodSel{{ $ro -> id }}" onclick="confirmHod({{ $ro -> id }})">
                                        @foreach($hodList as $h)
                                            <option value={{ $h ->id }}>{{ $h -> name }}</option>
                                        @endforeach
                                    </select>
                                </td>

                                <td id="col{{ $ro -> id }}" style="display: none;">

                                </td>
                                @else
                                <td>Sorry Hr is yet to approve This REquest. Still Pending.</td>
                                <td>
                                    <td id="colhr{{ $ro -> id }}" style="display: none;">

                                    </td>

                                </td>
                            @endif
                            </tr>
                        <tr >

                        <td  colspan="5">
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
                                    </tr>
                                @endforeach

                                </tbody>
                            </table>
                        </td>
                    </tr>
                @endforeach
            <tbody></tbody>
        </table>

        <script>

            const showOptions = (rowId)=>{ // Function to give the option to choose other hods...
                document.getElementById("othersAct"+rowId).style.display = "none";
                document.getElementById("hodSel"+rowId).style.display = "block";
              //  let currentRow = document.getElementById("col"+rowId);
                //currentRow.style.display = "block";
                //alert(rowId);
            }

            const confirmHod = (requisitionId)=>{ // to Confirm Hod Selected to act on.
                let selectedHod = document.getElementById("hodSel"+requisitionId);
                const hodId = (selectedHod.value);
                if(confirm("Are you sure you want this HOD To Act on your Request? ")){
                    $.get(`/api/hodpproverequest2/${hodId}/${requisitionId}`,function(data){
                        if(data.response === 200){
                            //console.log(data.response);
                            alert("Your Request has been forwarded to this HOD for Approval.\nThank you.")
                        }
                    });
                }
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
    </section>
@endsection
