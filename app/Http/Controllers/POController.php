<?php

namespace App\Http\Controllers;

use App\CurrencyType;
use App\Department;
use App\User;
use App\Discount;
use App\ProductOrder;
use App\RequisitionOrder;
use App\Supplier;
use App\repo;
use Illuminate\Http\Request;
use App\PO;
use App\HOD;
use App\OfficerRequicision;
use App\pendingRequisitionRequest;
use \Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Mail;
class POController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

    }
    public function index2(){
return "indx";
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
      //  return $request;
        
        //SELECT poNumber FROM `requisition_orders` where poNumber != "" order by poNumber DESC limit 1
         //return $request;
        
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $pendingRequisision = pendingRequisitionRequest::find($request->updateId);
        $nextLpoNo = "";
        $finalPONumber = "";
        $curLPO = $pendingRequisision-> lpoNo;
        $lpoInRepo = repo::where("lpoNumber","=",$curLPO)->get();
        if(count($lpoInRepo) >0){
            $nextLpoNo = $lpoInRepo[0]->lpoNumber;
            $finalPONumber =  $lpoInRepo[0]->poNumber;
            repo::find($lpoInRepo[0]->id)->delete();
        }else{
        
            $lastLPONo = RequisitionOrder::where("reqNo","!=","0")->orderBy('reqNo', 'DESC')->get(["reqNo"]);
            if(count($lastLPONo) == 0){
                $nextLpoNo = "0000000001";
            }
            else{
                $lastLPONo = RequisitionOrder::where("reqNo","!=","0")->orderBy('reqNo', 'DESC')->get(["reqNo"])[0]->reqNo;
                $nextLpoNo = $lastLPONo+1;
    
                // 0000006489 6490
    
                if($nextLpoNo < 10){
                    $nextLpoNo = "000000000".$nextLpoNo;
                }
                else if($nextLpoNo < 100){
                    $nextLpoNo = "00000000".$nextLpoNo;
                }
                else if($nextLpoNo < 1000){
                    $nextLpoNo = "0000000".$nextLpoNo;
                }
                else if($nextLpoNo < 10000){
                    $nextLpoNo = "000000".$nextLpoNo;
                }
                else if($nextLpoNo < 100000){
                    $nextLpoNo = "00000".$nextLpoNo;
                }
                else if($nextLpoNo < 1000000){
                    $nextLpoNo = "0000".$nextLpoNo;
                }
                else if($nextLpoNo < 10000000){
                    $nextLpoNo = "000".$nextLpoNo;
                }
    
                else if($nextLpoNo < 100000000){
                    $nextLpoNo = "00".$nextLpoNo;
                }
    
                else if($nextLpoNo < 1000000000){
                    $nextLpoNo = "0".$nextLpoNo;
                }
    
            }
    
            $lastPOS = RequisitionOrder::all()->last();
            $finalNum = "";
            if($lastPOS){
                $lastPOS = RequisitionOrder::all()->last()->poNumber;
                $lastPOS = RequisitionOrder::where("poNumber","!=","")->orderBy('poNumber', 'DESC')->get(["poNumber"])[0]->poNumber;
                $lastPOSMassage = explode("/",$lastPOS)[1];
    
    
                $tmp = $lastPOSMassage +1;
                if($tmp < 10 ){
                    $finalNum = "000$tmp";
                }
                else if($tmp < 100){
                    $finalNum = "00$tmp";
                }
                else if($tmp < 1000){
                    $finalNum = "0$tmp";
                }
                else{
                    $finalNum = $tmp;
                }
            }
            else{
                $finalNum = "0001";
            }
            $posNumber = "QC".date("Y");
            // return $finalNum;
            $finalPONumber = $posNumber."/".$finalNum; //$lastPOSMassage;

        }

        //////
        $pendingRequisision = pendingRequisitionRequest::find($request->updateId);
        $pendingRequisision -> hrApproved = 1;
        $pendingRequisision -> save();//...........................
        $inputFields = $request->all();
        //   return $inputFields;
        $totalItem = count($inputFields)-11;
        // return $totalItem;
        $totalIterate = $totalItem/4;
        // return "TotalIterate $totalIterate";
        $descCount = 1;
        $quantCount = 1;
        $unitPCount = 1;
        $output = "Good";
        // return $totalIterate."=>";
        /////////////////// SAVE Requisition Order Record ///////////////////////
        $depId = $inputFields["depId"];
       // $h = HOD::where("departmentId","=",$depId)->get(["id"])[0]->id;
        //return $inputFields;
        $hodId = $inputFields["head_of_department"];
        $officerId = $inputFields["officerId"];
        $purpose =$inputFields["purpose"];
        $dateTime = date("Y-m-d H:i:s");
        //$date = '2020-06-17 23:44:20';
        $ro = new RequisitionOrder;
        $ro -> currencyId = explode(":",$request->currencyUsed)[0];
        $ro -> vatApplicable = $request-> vatApplicable;
        $ro -> reqDate = $request -> poDate. " 16:30:34";
        $ro -> created_at = $request -> poDate. " 16:30:34";
        $ro -> purpose = $purpose;
        $ro -> reqDate = $dateTime;//"2020-06-17 23:44:20";
        $ro -> officer_id = $officerId;
        $ro -> dep_id = $depId;
        $ro -> hod_id = $hodId;
        if($request->discountAmount >= 1){
            $ro -> discountApplicable = 1;
        }
        else{
            $ro -> discountApplicable = 0;
        }
        $ro -> poStatus = 1;
        $ro -> reqNo = $nextLpoNo;
        $ro -> supplier = $request -> supplierId;
        $ro -> supplierId = $request -> supplierId;
        $ro -> poNumber = "$finalPONumber";
        // return $finalNum;
        $ro -> hodApproved = 1;
        $ro -> hrApproved = 1;
        $ro -> delivered = 0;
        $ro -> reqNotes = $request -> reqNotes;
        $ro -> save();
        /////////////////// END SAVE Requisition Order Record ///////////////////////
        ////////////////// Save Discount if Any ////////////////////////
        // "discountAmount":null
        if($request->discountAmount >= 1){
            $saveDiscount = new Discount();
            $saveDiscount  -> discountAmount = $request-> discountAmount;
            $saveDiscount -> requisitionId = $ro -> id;
            $saveDiscount -> save();
        }
        ///////////////// End Save Discount if Any ////////////////////
        $lastId = $ro->id;
        //   SAVE Purchase Order Record /////
        
        ///////// End SAve Purchase Order Record ///
        ///////////////// SAVE PRODUCTS FOR REQUEST ORDER ///////////////////////
        for($start = 1; $start <=$totalIterate; $start++){
            $descriptionTracker = "description$descCount";
            $quantityTracker = "quantity$quantCount";
            $uPTracker = "unit_price$unitPCount";
            $descCount++;
            $quantCount++;
            $unitPCount++;
            $totalCost = $inputFields[$uPTracker]*$inputFields[$quantityTracker];
          //  $output.= "Description => ".." : Quantity => ".." : Unit Price => ".." : TotalPrice => "."<hr />" ;
            $description = $inputFields[$descriptionTracker];
            $quantity = $inputFields[$quantityTracker];
            $unitPrice = $inputFields[$uPTracker];
            $totalPrice = $totalCost;
            $productOrder = new ProductOrder();
            $productOrder -> description = $description;
            $productOrder -> quantity = $quantity;
            $productOrder -> total_price = $totalPrice;
            $productOrder -> unit_price = $unitPrice;
            $productOrder -> requisitionId = $lastId;
            $productOrder -> save();
        }

	        //// Send Email

        $emailSalutation = "May I Seek Your Attention Please.";
        $emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from ".Session::get("uName")." in your Department";
        $emailBodyPostfix = "Please find time to review the Application. Thank you";

        $data2 = array('name'=>"Lamin O. Touray","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );

        ///////////////////////////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~
	$userEmailName = User::where('uId','=',$request->officerId)->get(['name','email'])[0];
        $name = $userEmailName['name'];
        $emailSalutation = "May I Seek Your Attention Please.";
        $emailBodyPrefix = "Dear $name Your purchase order has successfully been approved by HR. The Department will contact you later for delivery. Thank you.t";
        $emailBodyPostfix = "";
        $to_email = $userEmailName['email']; //$request->hodEmail; //Session::get("hodEmail");//"revolutiongambia@gmail.com";

        $to_name = "Lain";
        $data2 = array('name'=>"$name","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
         Mail::send("sendMail", $data2, function($message) use ($to_name, $to_email) {

             $message->to($to_email, $to_name)->subject("Qcell PO App");

            $message->from("lamin.touray1@qcell.gm","Test Mail");
         });

///////////////////////  End Send Mail...
        ////////// END SAVE PRODUCTS FOR REQUEST ORDER ////////////////////////
        return redirect("/po/".$ro->id);
        return redirect("/requisitionOrder");
        return $totalItem;//explode(",",$inputFields);
        $productList = array(["description"=>"APC Ups Battery","quantity"=>2,"unit_price"=>7400.23,"total_price"=>14800.46],
            ["description"=>"Dell Keyboard","quantity"=>1,"unit_price"=>700.23,"total_price"=>1400.46]);

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
        $po = RequisitionOrder::find($id);
        $supplier = Supplier::find($po -> supplier);
        $poTmpDate = $po -> created_at;
        $poNote = $po -> reqNotes;
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

        //$supplier = Supplier::find($po->supplierId);
        $requisitionOrder = RequisitionOrder::find($po->reqOrderId);
        $prod = ProductOrder::where("requisitionId","=",$po->id)->get();
        $discountAmount = 0;
        if($po -> discountApplicable == 1){
            $discountAmount = Discount::where("requisitionId","=",$po -> id)->get(["discountAmount"])[0]->discountAmount;
        }
        $productList = array();
        $data = array("poNote"=>$poNote,"discountAmount"=>$discountAmount,"currencyUsed"=>$currencyUsed,"supplierDetail"=>$supplier,"finalDate"=>$finalDate,"poNumber"=>$po->poNumber,"prodLst"=>$prod,"po"=>$po);
        return view("purchase_order",$data);
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
