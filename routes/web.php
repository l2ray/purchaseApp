<?php

use \Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------

| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!

*/


//Route::get('/', function () {
//    return view('welcome');
//});

//////////// REPORTING ROUTES
    Route::post('expperdep', 'miscellaneousController@expPerDep');
    Route::get("/route/expperdep",'miscellaneousController@expPerDepView');
/////////// END REPORTING ROUTES
Route::get("/login","LoginController@index");
Route::get("hrDashboard","DashBoardController@index");
Route::get("/report","DashBoardController@getReport");
Route::get("/",function(){
    if(Session::get("status") != 3){
        return redirect("/requisitionOrder");
    }
    else{
        return redirect("/hrDashboard");
    }
});

Route::get('test', function () {
    // return view("materialize");
    return view("pdfview");
});
Route::resource("department","DepartmentController");
Route::resource("orequicision","OfficerRequicisionController");
Route::resource('hod',"HODController");
Route::resource("requisitionOrder","RequisitionOrderController");
Route::resource("productOrder","ProductOrderController");
Route::resource("supplier","SupplierController");
Route::get('poLst', "testCTRL@index");
Route::resource("po","POController");
Route::resource("grn","GRNController");
Route::resource("user","UserController");
Route::resource("login","LoginController");
Route::resource("hrPO","hrProductOrderController");
Route::resource("subDep","SubDepartmentController");
Route::resource("currencylist","CurrencyTypeController");
Route::get("pendingRequest","miscellaneousController@pendingRequest");
Route::get("hrPOPendingList","miscellaneousController@hrPendingList");
Route::get("awaitingList","miscellaneousController@hodListToApprove");
Route::get("approveRejectProduct/{id}/{status}/{reason}/{flag}","miscellaneousController@hodRejectItem");
Route::get("approveRejectProductHR/{id}/{status}/{reason}/{flag}","miscellaneousController@hrRejectItem");
Route::get("hodApproveRequest/{id}","miscellaneousController@hodApprove");
Route::get("hodDisApproveRequest/{id}/{reason}/{flag}/{status}","miscellaneousController@hodDisApprove");
Route::get("hodListToRecycle","miscellaneousController@hodListToRecycle");
Route::get("hodRecycleData/{id}","miscellaneousController@hodRecycleData");
Route::get("hrAwaitingList","RequisitionOrderController@hrPendingList");
Route::get("generateLPO","miscellaneousController@generateLPO");
Route::get("viewLPO/{id}","miscellaneousController@viewLPO");
Route::get("/viewSpecific/{id}/{itemList}/{supId}","miscellaneousController@generateSubItem");
Route::get("/grn","miscellaneousController@grnList");
Route::get('/purchase',function(){
    return view('purchaseform');
});
Route::post("updatePassword","miscellaneousController@updatePassword");
Route::get("resetPassword","miscellaneousController@passwordReset");
Route::post("hrStore","hrProductOrderController@hrPurchaseStore");
Route::post('/storeCustomPoItems','miscellaneousController@storeCustom');
Route::get('export_pdf/{from_date}/{to_date}/{department_unit}','DashBoardController@export_pdf');
Route::get('hodlisttoApproveothers','miscellaneousController@hodListToApproveOthers');
