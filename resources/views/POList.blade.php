@extends('layout.app')


{"1":{"poNumber":"QC2020\/0001","reqNo":"0000000001","id":76,"hod_id":1,"dep_id":1,"officer_id":9,"reqDate":"2020-07-24 10:05:15","purpose":"Test sdfsd","supplier":2},
"7":{"poNumber":"QC2020\/0002","reqNo":"0000000002","id":77,"hod_id":7,"dep_id":7,"officer_id":14,"reqDate":"2020-09-03 16:30:34","purpose":"Test Purpose...","supplier":1}
}


@section('section')
        <div class="container">
            <div>
               <table class="table">
                   <thead>
                       <tr>
                           <th>Department Name</th>
                       </tr>
                   </thead>
                @foreach($sendData as $key => $value)
                   <tr>
                       <td>
                            {{ $dList[$key] }}
                            <a href="#" onclick="showHide({{ $key }})" id="showEye{{ $key }}"><i class="fas fa-eye"></i></a>
                            <a href="#" onclick="showHide({{ $key }})" id="hideEye{{ $key }}" style="display: none;"><i  class="fas fa-eye-slash"></i></a>
                       </td>
                       <td>
				<table class="table" id="hide{{ $key }}" style="display: none;">
                           <thead>
                                <tr>
                                    <th>Po Number</th>
                                    <th>Po Purchase Date</th>
                                    <th>Staff For</th>
                                    <th>Po Action</th>
                                </tr>
                           </thead>
                           <tbody>
                               @foreach ($value as $val)
                                    <tr>
                                        <td>{{ $val ->poNumber }}</td>
                                        <td>{{ $val -> reqDate }}</td>
                                        <td>{{$officerList[$val -> officer_id] }}</td>
                                        <td>
                                            <a href={{"po/".$val->id}} target="_blank" class="btn btn-primary">View PO</a>
                                            <a href={{"grn/".$val->id}} target="_blank" class="btn btn-success">View GRN</a>
                                            <button id="btnDisApprove{{$val->id}}" data-toggle="modal" data-target="#rejectModal" onclick="hrDisaprove('{{$val->id}}')" class="btn btn-danger">Reverse</button>
                                        </td>
                                    </tr>
                               @endforeach
                        </tbody>
                       </table>
			</td>
                   </tr>
            @endforeach
               </table>
            </div>

            <div>


                {{-- <table class="table">
                    <thead>
                        <tr>
                            <th>Po Number</th>
                            <th>Department {!! Form::open() !!}</th>
                            <th>Purchase Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                    @foreach($requisitionList as $po)
                        <tr>
                            <td>{{$po -> poNumber }}</td>
                            <td>{{$dList[$po -> dep_id ] }}</td>
                            <td>{{$officerList[$po -> officer_id] }}</td>
                            <td>
                                <a href={{"po/".$po->id}} target="_blank" class="btn btn-primary">View More</a>
                                <a href={{"grn/".$po->id}} target="_blank" class="btn btn-success">Generate GRN</a>
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                </table> --}}

            </div>
        </div>

          <!--- ------------------------------------------------------------------->
          <div class="modal fade" id="rejectModal" tabindex="-1" role="dialog" aria-labelledby="rejectModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
              <div class="modal-content">
                <div class="modal-header">
                  <h5 class="modal-title text-red" id="dismissModalLabel" >CONFIRMATION...</h5>
                  <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                  </button>
                </div>
                <div class="modal-body">
                  <p>You Are About To Reverse This PO.</p>
                  <p>Are You Sure You want To Proceed?</p>
                  
                </div>
                <div class="modal-footer" id="rejectModalFooter">
                <button>sdfsd</button>
		</div>
              </div>
            </div>
          </div>
            <!--- ------------------------------------------------------------------->

        <script>

            /*
+--------+--------+------------+-----+-------------+------------+-------------+
| dep_id | hod_id | reqNo      | id  | hodApproved | hrApproved | poNumber    |
+--------+--------+------------+-----+-------------+------------+-------------+
|      8 |      8 | 0000000025 | 136 |           1 |          1 | QC2021/0046 |
|      8 |      8 | 0000000033 | 135 |           1 |          1 | QC2021/0045 |


mysql> select id,quantity,description,unit_price,total_price,requisitionId from product_orders order by id desc limit 10;
+----+----------+-------------------------------------------------------+------------+-------------+---------------+
| id | quantity | description                                           | unit_price | total_price | requisitionId |
+----+----------+-------------------------------------------------------+------------+-------------+---------------+
| 71 |       12 | sssaaabbbkkk                                          |     456.00 |     5472.00 |           136 |
| 70 |       32 | 10.0M LC-LC OS2 DUPLEX FIBRE OPTIC PATCH LEAD  YELLOW |     334.00 |    10688.00 |           135 |
| 69 |       12 | Test Product 2                                        |     324.00 |     3888.00 |           134 |
| 68 |      430 | Test Product 2                                        |      34.00 |    14620.00 |           133 |
| 67 |     3333 | tree                                                  |       2.00 |     6666.00 |           132 |
| 66 |        3 | ew                                                    |      54.00 |      162.00 |           131 |
| 65 |        2 | "10 Way Distrubution Box "                            |      34.00 |       68.00 |           131 |
| 64 |        4 | 100A Double Pole Breaker                              |      23.00 |       92.00 |           130 |
| 63 |        1 | 10 KVA Stabilizer                                     |     435.00 |      435.00 |           130 |
| 62 |        3 | 100A Double Pole Breaker                              |      43.00 |      129.00 |           129 |
+----+----------+-------------------------------------------------------+------------+-------------+---------------+
10 rows in set (0.00 sec)


            */

const  hrDisaprove = (id)=>{
          console.log(`ID: ${id}`)
          $("#rejectModalFooter").html(` <button type="button" class="btn btn-secondary" data-dismiss="modal">No</button>
          <button type="button" class="btn btn-danger" onclick="decline('${id}')"  data-dismiss="modal" >Yes</button>`);
            // const flag = confirm ("You are about to reject this request. Are you sure you want to proceed?");
            // if(flag){
            //     $.get(`/api/hrDisApproveRequest/${id}`,function(data){
            //             alert("DATA HAS SUCCESSFULLY Disapproved. \nTHANK YOU.");
            //             location.reload();
            //         });
            // }
        }
// CONTINUE WITH PO REVERSE...
        const  decline = (id)=>{
	console.log("Sorry");
            // alert("Confirmed. "+id);
           // const reasonReject = document.getElementById("rejectRes").value;
            // console.log(reasonReject);
            console.log("YOu are in Reversing... "+id);
            // document.getElementById("rejectRes").value = "";
                 $.get(`api/reversepo/${id}`,function(data){
                     console.log(data);
                     location.reload();
                 });
        }
        // Primary DNS 196.223.151.25

            const showHide = (id)=>{
                const ref = `hide${id}`;
                const showHide = document.getElementById(ref);
                const status = (showHide.style.display);
               // id="showEye $key "
               // id="hideEye $key"
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

@endsection
