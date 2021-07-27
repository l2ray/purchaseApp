<?php

namespace App\Http\Controllers;

use App\CurrencyType;
use App\Department;
use App\Discount;
use App\ProductOrder;
use App\RequisitionOrder;
use App\Supplier;
use Illuminate\Http\Request;
use App\PO;
use App\HOD;
use App\OfficerRequicision;
use App\pendingRequisitionRequest;
use \Illuminate\Support\Facades\Session;

class testCTRL extends Controller
{
    //
    public function index(){
       //  return "CYZ";
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $poList = PO::all();
        $requisitionLists = RequisitionOrder::orderby('id','desc')->where("poStatus","=",1)->get(["poNumber","reqNo","id","hod_id","dep_id","officer_id","reqDate","purpose","supplier"]);
        // return $requisitionList;


        $departmentList = array();
        $officerList = array();
        $sendData = array();
        foreach($requisitionLists as $rls){
            if(array_key_exists($rls->dep_id,$sendData)){
                array_push($sendData[$rls->dep_id],$rls);
            }
            else{
                $sendData[$rls->dep_id]=array($rls);
            }
        }
        // return $sendData;
        // {"poNumber":"QC2020\/0001","reqNo":"0000000001","id":76,
        //     "hod_id":1,"dep_id":1,"officer_id":9,
        //     "reqDate":"2020-07-24 10:05:15","purpose":"Test sdfsd",
        //     "supplier":2}
        foreach(Department::all(["id","department_name"]) as $d){
            $departmentList[$d->id] = $d -> department_name;
        }
        foreach(OfficerRequicision::all() as $o){
            $officerList[ $o -> id ] = $o -> name ;
        }
        $supplier = Supplier::all(["name"]);

        //   return $supplier[0];
       $data = array("sendData"=>$sendData,"officerList"=>$officerList,"requisitionList" => $requisitionLists,"poList" => $poList,"dList"=>$departmentList);
       // return $sendData[1];
       return view("POList",$data);
    }
}
