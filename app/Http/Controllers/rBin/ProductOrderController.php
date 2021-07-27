<?php

namespace App\Http\Controllers;

use App\Department;
use App\HOD;
use App\newProduct;
use App\OfficerRequicision;
use App\PendingRequest;
use App\pendingRequisitionRequest;
use App\PO;
use App\ProductOrder;
use App\RequisitionOrder;
use App\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Session;

class ProductOrderController extends Controller
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
    public function create(Request $r)
    {
     //return "This is just to verify that this is the Create Controoller function";
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
//        {"id":3,"name":"Sulayman Jawneh","departmentId":1,"created_at":"2020-06-25T10:03:17.000000Z","updated_at":"2020-06-25T10:03:17.000000Z"}
        $departments = Department::all();
        $userId = Session::get("userId");
        $depId = Session::get("depId");
        $dataMa = array("revolutiongambie@gmail.com");
        $userDetail = OfficerRequicision::find($userId);
       // return $userDetail->name;


        // $departmentName = Department::find($userDetail[0]->departmentId );
        //return $userDetail;
         $departmentDetail =  Department::find($userDetail->departmentId);
        $hod = HOD::where("departmentId","=",$departmentDetail->id)->get(["id","name"])[0];
        $hodEmail = User::where("department","=",Session::get("depId"))->where("status","=",2)->get(['email']);
//        return $hod;
       // return $departmentName;
        $data = array("hodEmail"=>$hodEmail,"hodDetail"=>$hod,"dep"=>$departments,"department"=>$departmentDetail,"userDetail"=>$userDetail);
//        $data = array();
        // admin_email();
        //////////// Email Send NOtification
            // $this->sendEmail();
        // $to_name = "Lamin O.";
        // $hodEmail ="sdf@gmail.com";//
        // $to_email = $hodEmail; //Session::get("hodEmail");//"revolutiongambia@gmail.com";
        // $data2 = array("name"=>"Ogbonna Vitalis(sender_name)", "body" => "A test mail");
        // Mail::send("sendMail", $data2, function($message) use ($to_name, $to_email) {
        //     $message->to($to_email, $to_name)->subject("Laravel Test Mail");
        //     $message->from("testmailsend363@gmail.com","Test Mail");
        // });
        //////////// End Email Send Notification
        return view("purchaseform",$data);
    }

        public function sendEmail(){
        $emailSalutation = "May I Seek Your Attention Please.";
        $emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from ".Session::get("uName")." in your Department";
        $emailBodyPostfix = "Please find time to review the Application. Thank you";

        $data2 = array('name'=>"Lamin O. Touray","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
        $apiM =  Session::get("hodEmail");
        Mail::send('sendMail', $data2, function($message) {
             $receipientEmail = Session::get("hodEmail");//Session::get("hodEmail");
            // $message->to(Session::get("hodEmail"), "QCELL ADMIN")->subject('Application Submission!');

            $message->to($receipientEmail, "s")->subject
            ('Application Submission!');

            $message->from('testmailsend363@gmail.com','QCELL JOB PORTAL');
        });
        }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        if(!isset($request -> purpose)){
            return redirect("/productOrder/create");
        }

        $inputFields = $request->all();
        $totalItem = count($inputFields) -7;
        $totalIterate = $totalItem/4;
        $descCount = 1;
        $quantCount = 1;
        $unitPCount = 1;
        $storeProductCount = 1;
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
        $date = date("Y-m-d");
        $ro = new pendingRequisitionRequest();// RequisitionOrder;

        $lastLPONo = pendingRequisitionRequest::where("lpoNo","!=","0")->orderBy('lpoNo', 'DESC')->get(["lpoNo"]);
        $nextLpoNo = "";
        if(count($lastLPONo) == 0){
            $nextLpoNo = "0000000001";
        }
      else{
        $lastLPONo = pendingRequisitionRequest::where("lpoNo","!=","0")->orderBy('lpoNo', 'DESC')->get(["lpoNo"])[0]->lpoNo;
        $nextLpoNo = $lastLPONo+1;
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
        $ro -> lpoNo = $nextLpoNo;
        $ro -> purpose = $purpose;
        $ro -> reqDate = $dateTime;//"2020-06-17 23:44:20";
        $ro -> officer_id = $officerId;

        // ///////////////////////////////----------------------------------------------------------------------------------------------------~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $ro -> dep_id = $depId;
        $ro -> hod_id = $hodId;
        //$ro -> reqNo = $requisitionNumber;
        $ro -> hodApproved = 0;
        $ro -> hrApproved  = 0;
        $ro -> delivered   = 0;
        $ro -> save(); //.......................................``````````````````````````````````````````````````````````````___________________________________________________________________
        /////////////////// END SAVE Requisition Order Record ///////////////////////)
        $lastId = pendingRequisitionRequest::all()->last()->id;
        //   SAVE Purchase Order Record /////
        // SELECT poNumber FROM `requisition_orders` where poNumber != "" order by poNumber DESC limit 1
            // $lastPOS = PO::all()->last();//->poNumber;
            // if($lastPOS){
            //     return "Its  Emppty";
            // }
            // else{
            //     return "Sorry It has something.";
            // }
            // $lastPOSMassage = explode("/",$lastPOS)[1];
            // $posNumber = "QC".date("Y");
            // $finalNum = "";
            // $tmp = $lastPOSMassage +1;
            // if($tmp < 10 ){
            //     $finalNum = "000$tmp";
            // }
            // else if($tmp < 100){
            //     $finalNum = "00$tmp";
            // }
            // else if($tmp < 1000){
            //     $finalNum = "0$tmp";
            // }
            // else{
            //     $finalNum = $tmp;
            // }
            // // return $finalNum;
            // $finalPONumber = $posNumber."/".$finalNum; //$lastPOSMassage;
            // $poRec = new PO();
            // $poRec -> poNumber = "$finalPONumber";
            // $poRec -> supplierId = 1;
            // $poRec -> reqOrderId = $ro -> id;
            //$poRec -> save();
        ///////// End SAve Purchase Order Record ///
        $descriptionQuantity = array();
        $quantityContainer = array(); //    ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        ///////////////// SAVE PRODUCTS FOR REQUEST ORDER ///////////////////////

        for($start = 1; $start <=$totalIterate; $start++){
            $descriptionTracker = "description$descCount";
            $quantityTracker = "quantity$quantCount";
            $pNameTracker = "pName$unitPCount";
            $storeProductTracker = "storeProduct$storeProductCount";

            //$totalCost = $inputFields[$uPTracker]*$inputFields[$quantityTracker] ;
          //  $output.= "Description => ".." : Quantity => ".." : Unit Price => ".." : TotalPrice => "."<hr />" ;

            $quantity = $inputFields[$quantityTracker];
            $pName = $inputFields[$pNameTracker];
            $storeProduct = $inputFields[$storeProductTracker];
            $description = $inputFields[$descriptionTracker];

            $productOrder = new PendingRequest();//ProductOrder();
            $productOrder -> productQuantity = $quantity;
            array_push($quantityContainer,$quantity);
            if($storeProduct == "cant"){
                array_push($descriptionQuantity,$description);
                $productOrder -> productDescription = $description;
                $productOrder -> productName = $pName;
            }
            else{
                array_push($descriptionQuantity,$storeProduct);
                $productOrder -> productDescription = $storeProduct;
                $productOrder -> productName = $storeProduct;
                $flag = count(newProduct::where("productName","=",$storeProduct)->get());
                if($flag == 0){
                   $saveProduct =  new newProduct();
                   $saveProduct -> productName = $storeProduct;
                   $saveProduct -> save();
                }

            }
            //$productOrder -> total_price = $totalPrice;
            $productOrder -> hodApproveStatus = 1;
            $productOrder -> hrApprovedStatus = 1;
            $productOrder -> requisitionId = $ro->id;
            $productOrder -> save();  //.......................................``````````````````````````````````````````````````````````````___________________________________________________________________
            $descCount++;
            $quantCount++;
            $unitPCount++;
            $storeProductCount++;
        }
        //
        ////////// END SAVE PRODUCTS FOR REQUEST ORDER ////////////////////////

        //// Send Email

        $emailSalutation = "May I Seek Your Attention Please.";
        $emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from ".Session::get("uName")." in your Department";
        $emailBodyPostfix = "Please find time to review the Application. Thank you";

        $data2 = array('name'=>"Lamin O. Touray","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );

        ///////////////////////////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~
        $name = Session::get("uName");
        $emailSalutation = "May I Seek Your Attention Please.";
        $emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from $name in your Department";
        $emailBodyPostfix = "Please find time to review the Application. Thank you";
        $to_email = $request->hodEmail; //Session::get("hodEmail");//"revolutiongambia@gmail.com";
        $to_name = "Lain";
        $data2 = array('name'=>"$name","msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
         Mail::send("sendMail", $data2, function($message) use ($to_name, $to_email) {

             $message->to($to_email, $to_name)->subject("Qcell PO App");

             $message->from("testmailsend363@gmail.com","Test Mail");
         });
        //////////////////////////////~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

        // Mail::send('sendMail', $data2, function($message) {
        //      $receipientEmail = Session::get("hodEmail");//Session::get("hodEmail");
        //     // $message->to(Session::get("hodEmail"), "QCELL ADMIN")->subject('Application Submission!');

        //     $message->to($receipientEmail, "s")->subject
        //     ('Application Submission!');

        //     $message->from('testmailsend363@gmail.com','QCELL JOB PORTAL');
        // });

        //// End Send Email

            $officerName = $request ->officerName;
            // return $officerName; [{"desc 1":"2"},{"desc 2":"32"},{"desc 3":"34"}]
            $departmentName = Department::find($depId)->department_name;//->department_name;
            $data = array("lpoNo"=> $ro -> lpoNo,"officerName"=>$officerName,"departnemtName"=>$departmentName,"date"=>$date,"purpose"=>$purpose, "quantityContainer"=>$quantityContainer,"descriptionQuantity"=> $descriptionQuantity);
	   // return $ro->lpoNo;
	    return view("unAuthorized",$data);



        return redirect("/requisitionOrder");
        return $totalItem;//explode(",",$inputFields);
        $productList = array(["description"=>"APC Ups Battery","quantity"=>2,"unit_price"=>7400.23,"total_price"=>14800.46],
            ["description"=>"Dell Keyboard","quantity"=>1,"unit_price"=>700.23,"total_price"=>1400.46]);
    }

    public function admin_email($name) {
        $emailSalutation = "May I Seek Your Attention Please.";
        $emailBodyPrefix = "A Purchase order application has been Submitted for A Review and approval from $name in your Department";
        $emailBodyPostfix = "Please find time to review the Application. Thank you";

        $data = array('name'=>$name,"msgHeader"=>"Application Submission Notification","emailSalutation"=>$emailSalutation,"emailBodyPrefix"=>$emailBodyPrefix ,"emailBodyPostfix"=>$emailBodyPostfix );
        Mail::send('Email.mail', $data, function($message) {
            $message->to(Session::get("hodEmail"), "QCELL ADMIN")->subject
            ('Application Submission!');
            $message->from('testmailsend363@gmail.com','QCELL JOB PORTAL');
        });
        // Session::forget("recepientAdd");
        // Session::forget("recepientName");
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
