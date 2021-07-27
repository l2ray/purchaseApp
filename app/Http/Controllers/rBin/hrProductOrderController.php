<?php

namespace App\Http\Controllers;
use App\CurrencyType;
use Illuminate\Http\Request;
use App\HOD;
use App\Department;
use App\OfficerRequicision;
use App\PendingRequest;
use App\PO;
use App\ProductOrder;
use App\RequisitionOrder;
use App\pendingRequisitionRequest;
use App\Supplier;
use App\Discount;
use App\newProduct;
use Illuminate\Support\Facades\Session;

class hrProductOrderController extends Controller
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
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
$departments = Department::all();
$allSupplier = Supplier::all(["id","name"]);
$users = OfficerRequicision::all(["id","name"]);
        $userId = Session::get("userId");
        $userDetail = OfficerRequicision::find($userId);
        $currencyList = CurrencyType::all(["currency","currencyAbbreviation","id","currencyName"]);
// return $userDetail->name;
// $departmentName = Department::find($userDetail[0]->departmentId );
//return $userDetail;
                $departmentDetail =  Department::find($userDetail->departmentId);

                $hod = HOD::where("departmentId","=",$departmentDetail->id)->get(["id","name"])[0];

                // return "Good";
                //        return $hod;
                // return $departmentName;

                $data = array("currencyList"=>$currencyList,"sList"=>$allSupplier,"users"=>$users,"hodDetail"=>$hod,"dep"=>$departments,"department"=>$departmentDetail,"userDetail"=>$userDetail);
                //        $data = array();

                return view("hrProductOrder",$data);
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
        $inputFields = $request->all();
//        return $inputFields;
        //return count($inputFields);
        $totalItem = count($inputFields) -9;
        return $totalItem;
        $totalIterate = $totalItem/3;
        $descCount = 1;
        $quantCount = 1;
        $unitPCount = 1;
        $output = "Good";
        /////////////////// SAVE Requisition Order Record ///////////////////////
        $requisitionNumber = 0;//$inputFields["receipt_number"];
        $depId = $inputFields["departmentId"];
        $h = HOD::where("departmentId","=",$depId)->get(["id"])[0]->id;
        //return $inputFields;
        $hodId = $inputFields["hodId"];
        $officerId = $inputFields["userId"];
        $purpose =$inputFields["purpose"];
        $dateTime = date("Y-m-d H:i:s");
        //$date = '2020-06-17 23:44:20';

        $ro = new RequisitionOrder;
        $ro -> purpose = $purpose;
        $ro -> reqDate = $dateTime;//"2020-06-17 23:44:20";
        $ro -> officer_id = $officerId;
        $ro -> dep_id = $depId;
        $ro -> hod_id = $hodId;
        $ro -> reqNo = $requisitionNumber;
        $ro -> hodApproved = -1;
        $ro -> hrApproved = -1;
        $ro -> delivered = -1;
        $ro -> save();

        /////////////////// END SAVE Requisition Order Record ///////////////////////

        $lastId = RequisitionOrder::all()->last()->id;
        //   SAVE Purchase Order Record /////
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
            $poRec -> reqOrderId = $lastId;
            //$poRec -> save();
        ///////// End SAve Purchase Order Record ///

        ///////////////// SAVE PRODUCTS FOR REQUEST ORDER ///////////////////////
        for($start = 1; $start <=$totalIterate; $start++){
            $descriptionTracker = "description$descCount";
            $quantityTracker = "quantity$quantCount";
            $uPTracker = "unit_price$unitPCount";
            $descCount++;
            $quantCount++;
            $unitPCount++;
            $totalCost = $inputFields[$uPTracker]*$inputFields[$quantityTracker] ;
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
        ////////// END SAVE PRODUCTS FOR REQUEST ORDER ////////////////////////

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
        $pendingRequisitionRequest = PendingRequisitionRequest::find($id);
        $currencyList = CurrencyType::all(["currency","currencyAbbreviation","id","currencyName"]);
        $allSupplier = Supplier::all(["id","name"]);
        $pendingRequest = PendingRequest::where("requisitionId","=",$id)->where("hrApprovedStatus","=",1)->get(["productDescription","productName","productQuantity"]);
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
        // return $officerList;
	$data = array("lpoNo"=>$lpoNo,"currencyList"=>$currencyList,"sList"=>$allSupplier,"id"=> $id,"hodName"=>$hodName,"depList"=>$depList,"pendingRequest" => $pendingRequest,"officerList"=>$officerList,"pendingRR"=>$pendingRequisitionRequest);
        // return $pendingRequisitionRequest;
        return view("generatePO",$data);
        //{"id":1,"hod_id":2,"dep_id":1,"officer_id":2,"reqDate":"2020-06-30 10:08:32","purpose":"Test Purpose...","hodApproved":1,"hrApproved":0,"delivered":0,
        //"created_at":"2020-06-30T10:08:32.000000Z","updated_at":"2020-06-30T11:22:58.000000Z"}
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

    public function hrPurchaseStore(Request $request){
        // return $request;

        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }

        $finalNum = "";
        $tmp = 0;
        $requisitionList =  count(RequisitionOrder::all());//"<h1>GOOD...</h1>";
        if($requisitionList == 0){
            $nextLpoNo = 1;
            $tmp = 1;
        }
        else{
            $lastPOS = RequisitionOrder::all()->last()->poNumber;
            $lastPOS = RequisitionOrder::where("poNumber","!=","")->orderBy('poNumber', 'DESC')->get(["poNumber"])[0]->poNumber;
            $lastLPONo = RequisitionOrder::where("reqNo","!=","0")->orderBy('reqNo', 'DESC')->get(["reqNo"])[0]->reqNo;
            $nextLpoNo = $lastLPONo+1;
            $lastPOSMassage = explode("/",$lastPOS)[1];
            $tmp = $lastPOSMassage +1;
        }
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
        $posNumber = "QC".date("Y");
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

        //////
        // $pendingRequisision = pendingRequisitionRequest::find($request->updateId);
        // $pendingRequisision -> hrApproved = 1;
        // $pendingRequisision -> save();//...........................
        $inputFields = $request->all();
        //   return $inputFields;
        $totalItem = count($inputFields)-11;
        // return $totalItem;
        $totalIterate = $totalItem/4;
        // return "TotalIterate $totalIterate";
        $descCount = 1;
        $quantCount = 1;
        $unitPCount = 1;
        $pFromStoreCount = 1;
        $output = "Good";
        // return $totalIterate."=>";
        /////////////////// SAVE Requisition Order Record ///////////////////////
        $requisitionNumber = 0;//$inputFields["receipt_number"];
        $depId = $inputFields["department"];
        $hodId = $inputFields["supId"];
        $officerId = $inputFields["user"];
        $purpose =$inputFields["purpose"];
        $dateTime = date("Y-m-d H:i:s");
        //$date = '2020-06-17 23:44:20';
        $ro = new RequisitionOrder;
        $ro -> purpose = $purpose;
        // $ro -> reqDate = $dateTime;//"2020-06-17 23:44:20";
        $ro -> officer_id = $officerId;
        $ro -> currencyId = explode(":",$request->currencyUsed)[0];
        $ro -> vatApplicable = $request-> vatApplicable;
        $ro -> dep_id = $depId;
        $ro -> hod_id = $hodId;
        $ro -> reqDate = $request -> poDate. " 16:30:34";
        $ro -> created_at = $request -> poDate. " 16:30:34";
        $ro -> poStatus = 1;
        $ro -> supplier = $inputFields["supplierId"];
        $ro -> supplierId = 1;

        if($request->discountAmount >= 1){
            $ro -> discountApplicable = 1;
        }
        else{
            $ro -> discountApplicable = 0;
        }
// SELECT poNumber FROM `requisition_orders` where poNumber != "" order by poNumber DESC limit 1
        // return $request;
        // This is the reason we couldn't make any significant progress as a nation

        if($request -> manualPONum == null){
            $ro -> poNumber = "$finalPONumber";
        }
        else{ // asd
            $checkPoExist = $request -> manualPONum;
            $flag = count(RequisitionOrder::where("poNumber","=","$checkPoExist")->get());
            // return $request;
            if($flag == 0){
                $ro -> poNumber = $request -> manualPONum;
            }
            else{
                ///
                return redirect()->back()->withErrors(["Sorry The PO Number you just entered already exists in the System.\nA duplicate is not accepted. Please try a different one. Thank you."])->withInput($request->all());
            }
        }

/*
you don't get the trick deh do you


*/

        // return $finalNum;
        $ro -> reqNo = $nextLpoNo;
        $ro -> hodApproved = 1;
        $ro -> hrApproved = 1;
        $ro -> delivered = 0;
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
        $lastId = $ro -> id;

        //   SAVE Purchase Order Record /////

        ///////// End SAve Purchase Order Record ///

        ///////////////// SAVE PRODUCTS FOR REQUEST ORDER ///////////////////////
        for($start = 1; $start <=$totalIterate; $start++){
            $descriptionTracker = "description$descCount";
            $quantityTracker = "quantity$quantCount";
            $uPTracker = "unit_price$unitPCount";
            $pFromStoreTracker = "storeProduct$pFromStoreCount";
            $descCount++;
            $quantCount++;
            $unitPCount++;
            $pFromStoreCount++;
            $totalCost = $inputFields[$uPTracker]*$inputFields[$quantityTracker] ;
          //  $output.= "Description => ".." : Quantity => ".." : Unit Price => ".." : TotalPrice => "."<hr />" ;
            $description = $inputFields[$descriptionTracker];
            $quantity = $inputFields[$quantityTracker];
            $unitPrice = $inputFields[$uPTracker];
            $currentProductFromStore = $inputFields[$pFromStoreTracker];
            $totalPrice = $totalCost;
            $productOrder = new ProductOrder();
            if($currentProductFromStore == "cant"){
                $productOrder -> description = $description;
            }
            else{
                $productOrder -> description = $currentProductFromStore;
                $checkProductCount = count(newProduct::where("productName","=",$currentProductFromStore)->get());
                if($checkProductCount == 0){
                    $saveProduct = new newProduct();
                    $saveProduct -> productName = $currentProductFromStore;
                    $saveProduct -> save();
                }
            }
            $productOrder -> quantity = $quantity;
            $productOrder -> total_price = $totalPrice;
            $productOrder -> unit_price = $unitPrice;
            $productOrder -> requisitionId = $lastId;
            $productOrder -> save();
        }
        ////////// END SAVE PRODUCTS FOR REQUEST ORDER ////////////////////////
        return redirect("/po/".$ro->id);
        return redirect("/requisitionOrder");
        // return redirect("/requisitionOrder");
        return $totalItem;//explode(",",$inputFields);
        $productList = array(["description"=>"APC Ups Battery","quantity"=>2,"unit_price"=>7400.23,"total_price"=>14800.46],
            ["description"=>"Dell Keyboard","quantity"=>1,"unit_price"=>700.23,"total_price"=>1400.46]);
        return $request;
    }
}
