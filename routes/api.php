<?php

use Illuminate\Http\Client\ResponseSequence;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('charts/{from_month}/{to_month}','DashBoardController@chartapi');
Route::get('report/{from_date}/{to_date}/{department_unit}','DashBoardController@reportapi');
Route::get("hrDisApproveRequest/{id}","miscellaneousController@hrDisApprove");
Route::get("hrApproveRequest/{id}","miscellaneousController@hrApprove");
Route::get("/fetchId/{id}/{name}","testController@xyz");
Route::get("/getcachedata","miscellaneousController@cachedData");
Route::get("/fetchHod/{departmentId}","miscellaneousController@fetchHod");

Route::get('fetch_department','DashBoardController@departmentapi');
Route::get('export_pdf/{from_date}/{to_date}/{department_unit}','DashBoardController@export_pdf_api');
Route::get("fetchSubDep/{id}","miscellaneousController@fetchSubDep");
Route::get("fetchOfficers/{subDep}","miscellaneousController@fetchStaff");
Route::get("hodpproverequest2/{hodId}/{pendingrequisitionid}","miscellaneousController@hodRequest2");
Route::get("/reversepo/{id}","miscellaneousController@reversePO");