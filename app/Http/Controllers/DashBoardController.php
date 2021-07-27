<?php 
    
namespace App\Http\Controllers;
// use Illuminate\Http\Request;
use App\PO;
use App\Department;
use App\RequisitionOrder;
use App\ProductOrder;
use PDF;
use \Illuminate\Support\Facades\Session;

class DashBoardController extends Controller{

    public function index(){

        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
    $ro = RequisitionOrder::with('departments')->with('officerRequesting')->get();
    
    $ro = ['ro'=> $ro];    
        return view("index")->with($ro);
    }
    public function chartapi($from_month, $to_month){
        
        $myArray = array();    

        $departments = Department::all();
        foreach($departments as $departmentkey => $departmentValue) {
            $adminRO = RequisitionOrder::where('dep_id', $departmentValue['id'])->whereBetween('created_at', [$from_month, $to_month])->with('productOrders')->get('id');
            $genTotal = 0;
            foreach ($adminRO as $rokey => $rovalue) {
                foreach ($rovalue['productorders'] as $rvkey => $rvvalue) {
                    $genTotal = intval($rvvalue['total_price']) + $genTotal;             
                }
            }
            $myArray[$departmentValue['department_name']] = $genTotal;
        }

        if(1==1){
            return response()->json([
                'data' => [
                    'message' => 'success',
                    'department'=>$myArray
                ]
            ], 200);
        } else {
        return response()->json([
                'message' => 'fail'
            ], 404);
        }
    }

    public function reportapi($from_date, $to_date, $department_unit){
        $department_unit = intval($department_unit);
        if($department_unit == 0){
            $ro = RequisitionOrder::with('productOrders')->with('departments')->whereBetween('created_at', [$from_date, $to_date])->get(); 

        } else {

            $ro = RequisitionOrder::with('productOrders')->with('departments')->where('dep_id',$department_unit)->whereBetween('created_at', [$from_date, $to_date])->get(); 
        }
        
        return response()->json($ro,202);
    }
    public function departmentapi(){
        $department = Department::all();
        return response()->json($department,202);
    }

    public function getReport(){
        return view('report');
    }

    public function export_pdf($from_date, $to_date, $department_unit){

        if($department_unit == 0){
            $department_name = "All";
            $ro = RequisitionOrder::with('productOrders')->with('departments')->whereBetween('created_at', [$from_date, $to_date])->get(); 
        } else {
            $department = Department::where('id',$department_unit)->get();
            error_log($department[0]->department_name);
            $department_name = $department[0]->department_name;
            $ro = RequisitionOrder::with('productOrders')->with('departments')->where('dep_id',$department_unit)->whereBetween('created_at', [$from_date, $to_date])->get(); 
        }
        $data = ['ro'=>$ro, 'from_date'=>$from_date, 'to_date'=>$to_date, 'for'=>$department_name];
        $pdf = PDF::loadView('reportPDF',$data);
        return $pdf->stream();
    }
}