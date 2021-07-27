<?php

namespace App\Http\Controllers;

use App\CurrencyType;
use App\HOD;
use App\justifyReasonRequision;
use App\JustifyRejection;
use App\OfficerRequicision;
use App\PendingRequest;
use App\Department;
use App\newProduct;
use App\pendingRequisitionRequest;
use App\PO;
use App\Discount;
use App\User;
use Illuminate\Http\Request;
use App\ProductOrder;
use App\RequisitionOrder;
use App\SubDep;
use App\Supplier;
use App\repo;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\DB;

class miscellaneousController extends Controller
{


    ////////// REPORTING SECTION    
        public function expPerDep(Request $r){
            // return $r;
            // $requisitionOrderList = RequisitionOrder::where("dep_id","=",$r->depId)->where("created_at","=",$r->from)->get(["id"]);
            $start = $r->from ." 00:00:00";
            $end = $r->end. " 23:59:59";
            $departName = Department::find($r->depId);
            $requisitionOrderList = DB::table('requisition_orders')->select("id")->where("dep_id","=",$r->depId)->where("created_at",">=",$start)->where("created_at","<=",$end)->get();
            
            $totalItems = 0; 
            for($i =0; $i < count($requisitionOrderList); $i++){
                    $curId = $requisitionOrderList[$i]->id;
                    $curProductOrderLst = ProductOrder::where('requisitionId',"=",$curId)->get(['quantity','unit_price','total_price']);
                    for($x = 0; $x < count($curProductOrderLst); $x++){
                        $c = $curProductOrderLst[$x];
                        $totalItems += $c->total_price;
                    }
                    
            }
            $data = array("depName"=>$departName->department_name,'totalItems'=>$totalItems,'start'=>$r->from,'end'=>$r->end);
            return view("ReportView.expPerDepRes",$data);

        }
        public function expPerDepView(){
            $depList = Department::all(['id','department_name']);
            $data = array("depList"=>$depList);
            return view("ReportView.expPerDep",$data);
        }
    ///////// END REPORTING SECTION
    public function grnList(){
        $grnList = pendingRequisitionRequest::all(['id','dep_id','officer_id','purpose','lpoNo']);
        $userList = [];
        $depList = [];
        $subDeplist=[];
        $subDepId = [];
        $d = Department::all(['id','department_name']);
        foreach(SubDep::all() as $s){
            $subDeplist[$s->id] = $s -> subDepName;
        }
        $u = User::all(['name',"uId","subDep"]);
        
        foreach($u as $user){ 
            $userList[$user->uId] = $user->name;
            $subDepId[$user->uId] = $user->subDep;
        } 
        foreach($d as $dep){
            $depList[$dep->id] = $dep-> department_name;
        }
        // return $userList;
        $data = array("subDepId"=>$subDepId,"subDeplist"=>$subDeplist,"userList"=>$userList,"depList"=>$depList,"grnList"=>$grnList);
        return view('grnList',$data);
        return $grnList;
        return "OK...";
    }

    public function reversePO($id){
        $reqOrderToReverse = RequisitionOrder::find($id);
        $newRepo = new Repo();
        $newRepo -> poNumber = $reqOrderToReverse->poNumber; 
        $newRepo -> lpoNumber = $reqOrderToReverse->reqNo;
        $newRepo->save();

        // Moving back to pending requisition
        $pendingRequisition = pendingRequisitionRequest::where("lpoNo","=",$reqOrderToReverse->reqNo)->update(["hrApproved" => 0]);//->get();
        $pendingRequisitionId = pendingRequisitionRequest::where("lpoNo","=",$reqOrderToReverse->reqNo)->get(["id"])[0]["id"];
        //return $pendingRequisitionId;
        
        // Returning Items back...
        $requestProducts = ProductOrder::where("requisitionId","=",$id)->get(); 
       // return $pendingRequisitionId;
        pendingRequest::where("requisitionId","=",$pendingRequisitionId)->update(["hrApprovedStatus"=>1]);
        $reqOrderToReverse->delete();
        return response()->json("{'status':200,'data':'Success...'}", 200);
        
    }
    //
    public function hodApprove($id){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        // $requisisionOrders = RequisitionOrder::find($id);
        $requisisionOrders = pendingRequisitionRequest::find($id);
        $requisisionOrders -> hodApproved = 1;
    $officerId = $requisisionOrders -> officer_id;

    $officerEmail = User::where('uId','=',$officerId)->get(['email','name','department']);
    //$hodName = HOD::where('departmentId','=',$officerEmail[0]['department'])->get(['name'])[0]['name'];

    $hodId = Session::get("userId"); //User::where('name','=',$hodName)->where('status','=','2')->get(['uId'])[0]['uId'];
    $requisisionOrders -> approvedBy = $hodId;
    $requisisionOrders -> save();
	//// Send Email
         $emailSalutation = "Dear ".$officerEmail[0]['name'];
	$emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from ".Session::get("uName")." in your Department";
       $emailBodyPostfix = "Please find time to review the Application. Thank you";
	$data2 = array('name'=>"Lamin O. Touray","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
	$name = $officerEmail[0]['name']; //Session::get("uName");

         $emailSalutation = "Dear ".$officerEmail[0]['name'];
	$emailBodyPrefix = "This is to confirm that your HOD has approved your PRN requests. You can now go ahead with the request. Thank you.";
	$emailBodyPostfix = " ";
	$to_email = $officerEmail[0]['email'];//$request->hodEmail; //Session::get("hodEmail");//"revolutiongambia@gmail.com";
         $to_name = $name;
	 $data2 = array('name'=>"$name","msgHeader"=>"PRN Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
         Mail::send("sendMail", $data2, function($message) use ($to_name, $to_email) {$message->to($to_email, $to_name)->subject("Qcell PO App");$message->from("lamin.touray1@qcell.gm","Test Mail"); });
/////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//////////////////////////////////////////////////////////////////////
	return \Response::json("1");
    }
    public function cachedData(){
        $cachedData = newProduct::all();
        return $cachedData;
    }
    public function viewLPO($id){
		 $descriptionQuantity = array();
	         $quantityContainer = array();
        $pendingLPO = pendingRequisitionRequest::find($id);
        $approvedBy = $pendingLPO-> approvedBy;
        $hodName = '';
        if($approvedBy != 0){
            $hodName = User::where('uId','=',$approvedBy)->get(['name'])[0]['name'];
        }
		//return $pendingLPO;
		$requestItems = PendingRequest::where('requisitionId','=',$pendingLPO->id)->get(['productDescription','productQuantity']);
		for($i = 0; $i < count($requestItems); $i++){
			array_push($quantityContainer,$requestItems[$i] -> productQuantity);
			array_push($descriptionQuantity,$requestItems[$i] -> productDescription);
		}
	//	return $descriptionQuantity;
//	return $pendingLPO;
	    $departmentName = Department::find($pendingLPO->dep_id)->department_name;
		$date = explode(" ",$pendingLPO -> reqDate)[0];
		$purpose = $pendingLPO -> purpose;
		$lpoNo   = $pendingLPO -> lpoNo;
	//	return $lpoNo;
	$officerName = User::where('uId','=',$pendingLPO->officer_id)->get(['name'])[0]->name;
	  //return $officerName;
            //$departmentName = Department::find($depId)->department_name;//->department_name;
            $data = array("hodName"=>$hodName,"lpoNo"=>$lpoNo,"officerName"=>$officerName,"departnemtName"=>$departmentName,"date"=>$date,"purpose"=>$purpose, "quantityContainer"=>$quantityContainer,"descriptionQuantity"=> $descriptionQuantity);
           // return $ro->lpoNo;
            if($approvedBy == 0){
                return view('unAuthorized',$data);
            } //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
            return view("lpo",$data);
    }
    public function hodDisApprove($id,$reason,$flag,$status){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $requisisionOrders = pendingRequisitionRequest::find($id);
        // $requisisionOrders = RequisitionOrder::find($id);
        $justifyRejectionRequisition = new justifyReasonRequision();
        $justifyRejectionRequisition -> Product_Id = $id;
        $justifyRejectionRequisition -> reason = $reason;
        $justifyRejectionRequisition -> actionBy = $flag;  // Flag Signifies where the action is executed by HOD Or HR
        $justifyRejectionRequisition -> officerId = Session::get("userId");
        $justifyRejectionRequisition -> userId = $requisisionOrders->officer_id;
        $justifyRejectionRequisition -> save();

       $emailBodyPrefix = "";
        if($status == 1){
            $requisisionOrders -> hodApproved = -1;
            $requisisionOrders -> hrApproved = -1;
	    $emailBodyPrefix = "This is to confirm that your HOD has reject your PRN request With the Following Reason: {".$reason."}Thank you.";
        }
        else{
            $requisisionOrders -> hrApproved = -1;
	    $emailBodyPrefix = "This is to confirm that HR has reject your PRN request With With the Following Reason:: {".$reason."}Thank you.";
        }
        $requisisionOrders -> save();
	$officerId = $requisisionOrders -> officer_id;
		 $officerEmail = User::where('uId','=',$officerId)->get(['email','name']);
         //return $officerEmail[0]['email'].$officerEmail[0]['name'];
         //// Send Email
          $emailSalutation = "Dear ".$officerEmail[0]['name'];
         //$emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from ".Session::get("uName")." in your Department";
        $emailBodyPostfix = "Please find time to review the Application. Thank you";
         $data2 = array('name'=>"Lamin O. Touray","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
         $name = $officerEmail[0]['name']; //Session::get("uName");

          $emailSalutation = "Dear ".$officerEmail[0]['name'];
        // $emailBodyPrefix = "Your HOD has approved this Purchase Order Request of yours.Please wait for HR To act on it. Thank you.";
         $emailBodyPostfix = " ";
         $to_email = $officerEmail[0]['email'];//$request->hodEmail; //Session::get("hodEmail");//"revolutiongambia@gmail.com";
          $to_name = $name;
         $data2 = array('name'=>"$name","msgHeader"=>"PO Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
          Mail::send("sendMail", $data2, function($message) use ($to_name, $to_email) {$message->to($to_email, $to_name)->subject("Qcell PO App");$message->from("lamin.touray1@qcell.gm","Test Mail"); });
 /////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//////////////////////////////////////////////////////////////////////

        return \Response::json("1");
    }
    public function hrApprove($id){
        if(Session::get("appStatus") != 1){

            return redirect("/login");
        }
        $requisisionOrders = RequisitionOrder::find($id);
        $requisisionOrders -> hrApproved = 1;
        $requisisionOrders -> save();

        $lastPOS = PO::all()->last()->poNumber;
        $lastPOSMassage = explode("/",$lastPOS)[1];
        $posNumber = "QC".date("Y");
        $finalNum = "";
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
        // return $finalNum;
        $finalPONumber = $posNumber."/".$finalNum; //$lastPOSMassage;


        $poRec = new PO();
        $poRec -> poNumber = "$finalPONumber";
        $poRec -> supplierId = 1;
        $poRec -> reqOrderId = $id;
         $poRec -> save();
        return \Response::json("1");
    }
    public function hrDisApprove($id){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $requisisionOrders = RequisitionOrder::find($id);
        $requisisionOrders -> hrApproved = -1;
        $requisisionOrders -> save();
        return \Response::json("1");
    }
    public function generateSubItem($pendingPoId,$itemList,$supId){
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $itemsList = explode(":",$itemList);
        $pendingRequest = array();
        $pendingRequisitionRequest = PendingRequisitionRequest::find($pendingPoId);
        $currencyList = CurrencyType::all(["currency","currencyAbbreviation","id","currencyName"]);
        $allSupplier = Supplier::all(["id","name"]);
        $supp = Supplier::find($supId);
        $suppId = $supp->id;
        $suppName = $supp -> name;
        for($i = 0; $i < count($itemsList) -1; $i++){
            $curId = $itemsList[$i];
            $pendingReqst = PendingRequest::where("id","=",$curId)->where("hrApprovedStatus","=",1)->get(["productDescription","productName","productQuantity"]);
            array_push($pendingRequest,$pendingReqst);
        }
        //return $pendingRequest;
        $officerList = array();
        $depList = array();
	$hodName = HOD::find($pendingRequisitionRequest -> hod_id)->name;
	$lpoNo = $pendingRequisitionRequest -> lpoNo;
        foreach(Department::all("id","department_name") as $d){
            $depList[$d -> id]= $d ->department_name;
        }
        foreach( OfficerRequicision::all(["id","name"]) as $ol){
            $officerList[$ol -> id] = $ol -> name;
        }
	$data = array("suppName"=>$suppName,"suppId"=>$suppId,"lpoNo"=>$lpoNo,"currencyList"=>$currencyList,"sList"=>$allSupplier,"id"=> $pendingPoId,"hodName"=>$hodName,"depList"=>$depList,"pendingRequest" => $pendingRequest,"officerList"=>$officerList,"pendingRR"=>$pendingRequisitionRequest);
        return view("generateCustomPo",$data);

    }

    //////////////////////////////////////////////////////////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    public function storeCustom(Request $request)
    {
      //  return $request;
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }

       // return  $request->all();

        //$lastPOS = RequisitionOrder::all()->last()->poNumber;
        $lastPOS = RequisitionOrder::where("poNumber","!=","")->orderBy('poNumber', 'DESC')->get(["poNumber"]);
        $finalNum = "0001";
        $posNumber = "QC".date("Y");
        $finalPONumber = "";
        if(count($lastPOS) >0){
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
        // return $finalNum;
        $finalPONumber = $posNumber."/".$finalNum; //$lastPOSMassage;

        }
        else{
            $finalPONumber = $posNumber."/".$finalNum; //$lastPOSMassage;
            $lastPOS = $finalPONumber ;//RequisitionOrder::where("poNumber","!=","")->orderBy('poNumber', 'DESC')->get(["poNumber"])[0]->poNumber;
        }

        $lastLPONo = pendingRequisitionRequest::where("lpoNo","!=","0")->orderBy('lpoNo', 'DESC')->get(["lpoNo"]);
        if(count($lastLPONo)>0){
            $lastLPONo = pendingRequisitionRequest::where("lpoNo","!=","0")->orderBy('lpoNo', 'DESC')->get(["lpoNo"])[0]->lpoNo;
        }
        else{
            $lastLPONo =0;// pendingRequisitionRequest::where("lpoNo","!=","0")->orderBy('lpoNo', 'DESC')->get(["lpoNo"])[0]->lpoNo;
        }
        
        $nextLpoNo = $lastLPONo+1;
        ///                                             VISIT LATER
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
       
        $pendingRequisision = pendingRequisitionRequest::find($request->updateId);// -----------------
        $newPendingRequisitionOrder = new pendingRequisitionRequest();
        $newPendingRequisitionOrder->hod_id = $pendingRequisision->hod_id;
        $newPendingRequisitionOrder -> dep_id = $pendingRequisision->dep_id;
        $newPendingRequisitionOrder -> officer_id = $pendingRequisision->officer_id;
        $newPendingRequisitionOrder -> purpose = $pendingRequisision -> purpose;
        $newPendingRequisitionOrder -> hodApproved = $pendingRequisision -> hodApproved;
        $newPendingRequisitionOrder -> reqDate = $pendingRequisision -> reqDate;
        $newPendingRequisitionOrder -> hrApproved  = 1;
        $newPendingRequisitionOrder -> delivered = 0;
        $newPendingRequisitionOrder -> lpoNo = $nextLpoNo;
        $newPendingRequisitionOrder -> approvedBy = $pendingRequisision -> approvedBy;
        $newPendingRequisitionOrder -> hodToActOn = $pendingRequisision -> hodToActOn;
        $newPendingRequisitionOrder ->save();//~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ Continue...

        //$newProductOrderSave = new ProductOrder();

    //$pendingRequisision -> hrApproved = 1; // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ To Be update later;
    $lpoNumber = $pendingRequisision -> lpoNo;
       // $pendingRequisision -> save();//...........................
        $inputFields = $request->all();
        $totalItem = count($inputFields)-11;
        $totalIterate = $totalItem/4;
        $descCount = 1;
        $quantCount = 1;
        $unitPCount = 1;
        $output = "Good";
        /////////////////// SAVE Requisition Order Record ///////////////////////
        $depId = $inputFields["depId"];
        $hodId = $inputFields["head_of_department"];
        $officerId = $inputFields["officerId"];
        $purpose =$inputFields["purpose"];
        $dateTime = date("Y-m-d H:i:s");
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
        $ro -> reqNo = $nextLpoNo;// $nextLpoNo;
        $ro -> supplier = $request -> supplierId;
        $ro -> supplierId = $request -> supplierId;
        $ro -> poNumber = "$finalPONumber";
        $ro -> hodApproved = 1;
        $ro -> hrApproved = 1; // ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~```` Come Back to check for something later
        $ro -> delivered = 0;
        $ro -> save(); 

        if($request->discountAmount >= 1){
            $saveDiscount = new Discount();
            $saveDiscount  -> discountAmount = $request-> discountAmount;
            $saveDiscount -> requisitionId = $ro -> id;
            $saveDiscount -> save();  
        }
        $lastId = $ro->id;
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
//to be revert back;//$currentPendingProduct = PendingRequest::where('requisitionId','=',$request->updateId)->where('productName','=',$description)->where('productQuantity','=',$quantity)->get();
            $currentPendingProduct = PendingRequest::where('requisitionId','=',$request->updateId)->where('productName','=',$description)->where('productDescription','=',$description)->get();
            $updatePendingProduct =PendingRequest::find($currentPendingProduct[0]->id);
            if($updatePendingProduct ->productQuantity != $quantity){
                $updatePendingProduct ->productQuantity = $quantity;
            }
            $updatePendingProduct -> hrApprovedStatus = -1;  /// #######################################################
            $updatePendingProduct -> requisitionId = $newPendingRequisitionOrder->id;
            
            //return $updatePendingProduct;
            $updatePendingProduct -> save();



            $productOrder = new ProductOrder();
            $productOrder -> description = $description;
            $productOrder -> quantity = $quantity;
            $productOrder -> total_price = $totalPrice;
            $productOrder -> unit_price = $unitPrice;
            $productOrder -> requisitionId = $ro->id;  
            $productOrder -> save();


        }
        
        return redirect("/po/".$ro->id);

        ///  SAVING REQUISITION ORDERS... 

        if($request->discountAmount >= 1){
            if(Session::get("appStatus") != 1){
                return redirect("/login");
            }

            //^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

            // ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
            
           
            /////////////////// END SAVE Requisition Order Record ///////////////////////
            ////////////////// Save Discount if Any ////////////////////////
            // "discountAmount":null
            ///////////////// End Save Discount if Any ////////////////////
            ////////// END SAVE PRODUCTS FOR REQUEST ORDER ////////////////////////
            
            return redirect("/requisitionOrder");
            return $totalItem;//explode(",",$inputFields);
            $productList = array(["description"=>"APC Ups Battery","quantity"=>2,"unit_price"=>7400.23,"total_price"=>14800.46],
                ["description"=>"Dell Keyboard","quantity"=>1,"unit_price"=>700.23,"total_price"=>1400.46]);

            $ro -> discountApplicable = 1;
        }
        else{
            $ro -> discountApplicable = 0;
        }
        $lastId = $ro->id;
        

    }

    //////////////////////////////////////////////////////////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

public function hrPendingList(){
    if(Session::get("appStatus") != 1){
        return redirect("/login");
    }
   //         return $userId;
            $requisitionOrders = pendingRequisitionRequest::orderby('id','desc')->// RequisitionOrder::
            where("hrApproved","=",0)->
            where("hodApproved","=",1)->
            get(["purpose","id","dep_id","reqDate","officer_id"]);
            $allOfficers = OfficerRequicision::all(["id","name"]);
            $officerList = array();
        $departmentList = array();
        $supplierList = Supplier::all();
            //$officerList = array();
            $sendData = array();
            foreach($requisitionOrders as $rls){
            if(array_key_exists($rls->dep_id,$departmentList)){
                array_push($departmentList[$rls->dep_id],$rls);
            }
            else{
                $departmentList[$rls->dep_id]=array($rls);
            }
        }
	$dList = array();
	foreach(Department::all(["id","department_name"]) as $d){
            $dList[$d->id] = $d -> department_name;
        }
//return $dList;
            foreach($allOfficers as $ao){
                $officerList[$ao->id] = $ao -> name;
            }
           // return $officerList;
            $requisitionProducts = array();
            foreach($requisitionOrders as $ro){
                // $productOrder = ProductOrder::where("requisitionId","=",$ro->id)->get(["quantity","description","unit_price","total_price"]);
                $productOrder = PendingRequest::where("requisitionId","=",$ro->id)->where("hodApproveStatus","=",1)->where("hrApprovedStatus","=",1)->get(["id","productQuantity","hodApproveStatus","productDescription","productName"]);
                if(array_key_exists($ro->id,$requisitionProducts)){
                    array_push($requisitionOrders[$ro->id],$productOrder);
                }
                else{
                    $requisitionProducts[$ro->id]=$productOrder;
                }
            }
            $data = array("supplierList"=>$supplierList, "dList"=>$dList,"departments"=> $departmentList,"officerList"=>$officerList,"reqOrders"=>$requisitionOrders,"requisitionProducts"=>$requisitionProducts);
        //  return $requisitionOrders;
    return view("hrPOPendingList",$data);
}

    public function generateLPO(){
        return view("pdfview");
    }

    public function pendingRequest(){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $userId = Session::get("userId");
            //   return $userId;
// select * from pending_requisition_requests where hodApproved != -1 and hrApproved = 0 and officer_id = 2 O
                $requisitionOrders = pendingRequisitionRequest::orderBy('id', 'DESC')->// RequisitionOrder::
                where("hodApproved","!=",-1)->
                where("hrApproved","=",0)->
                where("officer_id","=",$userId)->
                get(["purpose","id","reqDate","hrApproved", "hodApproved"]);
                $requisitionProducts = array();

                $hodList = User::where('status','=',2)->get(['name','id',]);

                foreach($requisitionOrders as $ro){
                    // $productOrder = ProductOrder::where("requisitionId","=",$ro->id)->get(["quantity","description","unit_price","total_price"]);
                    $productOrder = PendingRequest::where("requisitionId","=",$ro->id)->get(["productQuantity","productDescription","productName"]);
                    if(array_key_exists($ro->id,$requisitionProducts)){
                        array_push($requisitionOrders[$ro->id],$productOrder);
                    }
                    else{
                        $requisitionProducts[$ro->id]=$productOrder;
                    }
                }

                // return $requisitionProducts;
                // return $requisitionOrders;
                $data = array("hodList"=>$hodList,"reqOrders"=>$requisitionOrders,"requisitionProducts"=>$requisitionProducts);
            //  return $requisitionOrders;
                return view("pendingRequisitionList",$data);
                // 5885015
    }
    public function hodRequest2($hodId,$pendingRequisitionId){
         $pendingRequisition = pendingRequisitionRequest::find($pendingRequisitionId);
         $pendingRequisition -> hodToActOn = $hodId;

         $pendingRequisition -> save();
         $hodToActEmail = User::find($hodId)->email;
         $officerIdRequesting = User::where('uId','=',$pendingRequisition -> officer_id) -> get(['name'])[0]->name;
         $departmentRequestingId = Department::find($pendingRequisition -> dep_id)->department_name;
         $msgNotify = "Dear ... There is a pending Request for approval from ".$officerIdRequesting." in ".$departmentRequestingId." Department for you to act on his/her Hod's behalf. Thank you.";

         //// Send Email
         $emailSalutation = "May I Seek Your Attention Please.";
	$emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from ".Session::get("uName")." in your Department";
       $emailBodyPostfix = "Please find time to review the Application. Thank you";
	$data2 = array('name'=>"Lamin O. Touray","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
	$name = $officerIdRequesting;//$officerEmail[0]['name']; //Session::get("uName");

         $emailSalutation = "May I Seek Your Attention Please.";
	$emailBodyPrefix = "This is to confirm that your HOD has approved your PRN request. You can now go ahead with the request. Thank you.";
	$emailBodyPostfix = " ";
	$to_email =$hodToActEmail;// $officerEmail[0]['email'];//$request->hodEmail; //Session::get("hodEmail");//"revolutiongambia@gmail.com";
         $to_name = $name;
	 $data2 = array('name'=>"$name","msgHeader"=>"PO Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$msgNotify ,"emailBodyPostfix"=>$emailBodyPostfix );
         Mail::send("sendMail", $data2, function($message) use ($to_name, $to_email) {$message->to($to_email, $to_name)->subject("Qcell PO App");$message->from("lamin.touray1@qcell.gm","Test Mail"); });
/////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~//////////////////////////////////////////////////////////////////////

         //return ["response"=>$hodToActEmail];
         // Message for Email Body.
         return ['response'=>200];
    }

    public function hodRejectItem($id,$status,$reason,$flag){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $saveReason  = new JustifyRejection();
        $saveReason -> reason = $reason;
        $saveReason -> product_id = $id;
        $saveReason -> officerId = Session::get("userId");
        $saveReason -> actionBy = $flag;  // Flag Signifies where the action is executed by HOD Or HR
        $saveReason -> save();
        $productToOrder = PendingRequest::find($id);
        $productToOrder -> hodApproveStatus = $status;
        $productToOrder -> hrApprovedStatus = $status;
        $productToOrder -> save();
        return ["response"=>201];
    }

   public function passwordReset(){
        return view("passwordReset");
    }
    public function updatePassword(Request $request){
        if($request->password == $request -> cPassword){
            $tmp = User::where("uId","=",Session::get("userId"))->get();
            $updateUser = User::find($tmp[0]->id);
            $updateUser -> password = $request ->password;
            $updateUser -> uPassword = $request ->password;
            $updateUser -> hasChangedPassword = 1;
            $updateUser->save();

            return redirect("/login");
        }
        else{
            return redirect()->back()->withErrors(["Sorry Please check your credentials. The Password and Confirm Password has to be the same.. "])->withInput();
        }

    }


    public function hrRejectItem($id,$status,$reason,$flag){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $saveReason  = new JustifyRejection();
        $saveReason -> reason = $reason;
        $saveReason -> product_id = $id;
        $saveReason -> officerId = Session::get("userId");
        $saveReason -> actionBy = $flag;  // Flag Signifies where the action is executed by HOD Or HR
        $saveReason -> save();
        $productToOrder = PendingRequest::find($id);
        $productToOrder -> hrApprovedStatus = $status;
        $productToOrder -> save();
        return ["response"=>201];

    }

    public function hodListToApprove(){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $depId = Session::get("depId");
                $requisitionOrders = pendingRequisitionRequest::orderby('id','desc')->// RequisitionOrder::
                where("dep_id","=",$depId)->
                where("hodApproved","=",0)->
                get(["purpose","id","reqDate","officer_id"]);
                $allOfficers = OfficerRequicision::all(["id","name"]);
                $officerList = array();
                foreach($allOfficers as $ao){
                    $officerList[$ao->id] = $ao -> name;
                }
                $requisitionProducts = array();
                foreach($requisitionOrders as $ro){
                    // $productOrder = ProductOrder::where("requisitionId","=",$ro->id)->get(["productQuantity","productDescription","productName"]);
                    $productOrder = PendingRequest::where("requisitionId","=",$ro->id)->where("hodApproveStatus","=","1")->get(["id","productQuantity","productDescription","productName","hodApproveStatus"]);
                    if(array_key_exists($ro->id,$requisitionProducts)){
                        array_push($requisitionOrders[$ro->id],$productOrder);
                    }
                    else{
                        $requisitionProducts[$ro->id]=$productOrder;
                    }
                }
                $data = array("officerList"=>$officerList,"reqOrders"=>$requisitionOrders,"requisitionProducts"=>$requisitionProducts);
            //  return $requisitionOrders;
                return view("hodApproveList",$data);
    }

    public function hodListToApproveOthers(){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
       // return "<h1>LLLLL????</h1>";
        //$depId = Session::get("depId");
                $sessionUserId = Session::get('userId');
                // return $sessionUserId;
                $userId = User::where("uId",'=',$sessionUserId)->get(['id'])[0]['id'];
                $requisitionOrders = pendingRequisitionRequest::orderby('id','desc')->// RequisitionOrder::
                where("hodToActOn","=",$userId)->
                where("hodApproved","=",0)->
                get(["purpose","id","reqDate","officer_id"]);
                $allOfficers = OfficerRequicision::all(["id","name"]);
                $officerList = array();
                foreach($allOfficers as $ao){
                    $officerList[$ao->id] = $ao -> name;
                }
                $requisitionProducts = array();
                foreach($requisitionOrders as $ro){
                    // $productOrder = ProductOrder::where("requisitionId","=",$ro->id)->get(["productQuantity","productDescription","productName"]);
                    $productOrder = PendingRequest::where("requisitionId","=",$ro->id)->where("hodApproveStatus","=","1")->get(["id","productQuantity","productDescription","productName","hodApproveStatus"]);
                    if(array_key_exists($ro->id,$requisitionProducts)){
                        array_push($requisitionOrders[$ro->id],$productOrder);
                    }
                    else{
                        $requisitionProducts[$ro->id]=$productOrder;
                    }
                }
                $data = array("officerList"=>$officerList,"reqOrders"=>$requisitionOrders,"requisitionProducts"=>$requisitionProducts);
            //  return $requisitionOrders;
                return view("hodApproveListOthers",$data);
    }

    public function hodRecycleData($id){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $requisisionOrders = RequisitionOrder::find($id);
        $requisisionOrders -> hodApproved = 0;
        $requisisionOrders -> save();
        return \Response::json("1");
    }
    public function hodListToRecycle(){
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $userId = Session::get("depId");
        //        return $userId;
        $requisitionOrders = RequisitionOrder::
        where("dep_id","=",$userId)->
        where("hodApproved","=",-1)->
        get(["purpose","id","reqDate","officer_id"]);

        $allOfficers = OfficerRequicision::all(["id","name"]);
        $officerList = array();
        foreach($allOfficers as $ao){
            $officerList[$ao->id] = $ao -> name;
        }
        //return $officerList;


        $requisitionProducts = array();
        foreach($requisitionOrders as $ro){
            $productOrder = ProductOrder::where("requisitionId","=",$ro->id)->get(["quantity","description","unit_price","total_price"]);
            if(array_key_exists($ro->id,$requisitionProducts)){
                array_push($requisitionOrders[$ro->id],$productOrder);
            }
            else{
                $requisitionProducts[$ro->id]=$productOrder;
            }
        }
        // return $requisitionProducts;
        // return $requisitionOrders;
        $data = array("officerList"=>$officerList,"reqOrders"=>$requisitionOrders,"requisitionProducts"=>$requisitionProducts);
        //  return $requisitionOrders;
        return view("hodRecycleRequest",$data);
    }
    public function fetchHod($depId){
        // if(Session::get("appStatus") != 1){
        //     return redirect("/login");
        // }
        $departmentHead = HOD::where("departmentId","=","$depId")->get(["id","name"]);

        return \Response::json($departmentHead);
    }
    public function fetchSubDep ($id){
        $subDep = SubDep::where("depId","=",$id)->get(["subDepName","id"]);
        return \Response::json($subDep);
    }
    public function fetchStaff($subDep){
        $reqOfficers = OfficerRequicision::where("subDep","=",$subDep)->get(['id','name']);
        return \Response::json($reqOfficers);
    }

}
