<?php

namespace App\Http\Controllers;

use App\justifyReasonRequision;
use App\JustifyRejection;
use App\PendingRequest;
use App\pendingRequisitionRequest;
use App\ProductOrder;
use App\RequisitionOrder;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class RequisitionOrderController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        
  	if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $userId = Session::get("userId");
        $justificationList = JustifyRejection::all(['reason','product_id']);
        $justifyRequisionReject = justifyReasonRequision::where("userId","=",Session::get("userId"))->get(['reason','actionBy','Product_Id']);
        $reasons = array();
        $reasonsRequisionReject =  array();
        foreach($justifyRequisionReject as $jrr){
            $reasonsRequisionReject[$jrr -> Product_Id] = $jrr -> reason;
        }
        foreach($justificationList as $jL){
            $reasons[$jL -> product_id] = $jL -> reason;
        }


        // return $justificationList;
        $requisitionOrders = pendingRequisitionRequest::orderby('id','desc')->where("officer_id","=",$userId)->get(["purpose","id","reqDate","hrApproved", "hodApproved"]);
        $requisitionProducts = array();
        foreach($requisitionOrders as $ro){
            $productOrder = PendingRequest::where("requisitionId","=",$ro->id)->get(["productQuantity","productDescription","productName","id"]);
            if(array_key_exists($ro->id,$requisitionProducts)){
                array_push($requisitionOrders[$ro->id],$productOrder);
            }
            else{
                $requisitionProducts[$ro->id]=$productOrder;
            }
        }
        $data = array("reasonsRequisionReject"=>$reasonsRequisionReject,"reasons"=>$reasons,"reqOrders"=>$requisitionOrders,"requisitionProducts"=>$requisitionProducts);
        return view("RequisitionOrders",$data);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
    }
}
