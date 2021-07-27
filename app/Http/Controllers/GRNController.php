<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\PO;
use App\Supplier;
use App\RequisitionOrder;
use App\ProductOrder;
use App\Discount;
use App\CurrencyType;
use Illuminate\Support\Facades\Session;

class GRNController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
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
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $po = RequisitionOrder::find($id);
        $supplier = Supplier::find($po -> supplier);
        $poTmpDate = $po -> created_at;
        $dataMassage = explode("-",explode(" ",$poTmpDate)[0]);
        $year = $dataMassage[0];
        $tmpMonth = $dataMassage[1];
        $tmpDay = $dataMassage[2];
        $month = "";
        switch($tmpMonth){
            case 01:
                $month = "January";
            break;
            case 02: 
                $month = "Febraury";
            break;
            case 03: 
                $month = "March";
            break;
            case 04: 
                $month = "April";
            break; 
            case 05: 
                $month = "May";
            break; 
            case 06: 
                $month = "June";
            break;
            case 07:
                $month = "July";
            break;
            case 8:
                $month = "August";
            break;
            case 9:
                $month = "September";
            break;
            case 10:
                $month = "October";
            break;
            case 11:
                $month = "November";
            break;
            case 12:
                $month = "December";
            break;
        }
        $day = "";
        switch($tmpDay){
            case 1:case 21: case 31:
                $day = $tmpDay."st";
            break;
            case 2: case 22:
                $day = $tmpDay."nd";
            break;
            case 3: case 23:
                $day = $tmpDay."rd";
            break;
            default:
                $day = $tmpDay."th";
        }
        $finalDate = $day." ".$month.", ".$year; 
        $currencyUsed = CurrencyType::find($po -> currencyId)->currency;
        $requisitionOrder = RequisitionOrder::find($po->reqOrderId);
        $prod = ProductOrder::where("requisitionId","=",$po->id)->get();
        $discountAmount = 0;
        if($po -> discountApplicable == 1){
            $discountAmount = Discount::where("requisitionId","=",$po -> id)->get(["discountAmount"])[0]->discountAmount;
        }
        $productList = array();
        $data = array("discountAmount"=>$discountAmount,"purpose"=>"Purpose","currencyUsed"=>$currencyUsed,"supplierDetail"=>$supplier,"finalDate"=>$finalDate,"poNumber"=>$po->poNumber,"prodLst"=>$prod,"po"=>$po);
        return view("grn",$data);
       
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
