<?php

namespace App\Http\Controllers;

use App\Supplier;
use Illuminate\Http\Request;
use \Illuminate\Support\Facades\Session;

class SupplierController extends Controller
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
        $supplierList = Supplier::all(["id","name","address","contact"]);
        $data = array("supList" => $supplierList);
        return view("Supplier.supplier",$data);
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

        return view("Supplier.supplierCreate");
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
        $supplier = new Supplier();
        $supplier -> name = $request -> supName;
        $supplier -> address = $request -> Address;
	$supplier -> contact = $request -> pno;
        $supplier -> save();
        return redirect("/supplier");
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
	 $getSupplier = Supplier::find($id);
        return view("Supplier.supplierModify",$getSupplier)->with("getSupplier",$getSupplier);
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

        $updateSupplier = Supplier::find($id);
        $updateSupplier -> name = $request -> supName;
        $updateSupplier -> address = $request -> Address;
        $updateSupplier -> contact = $request -> pno;
        $updateSupplier -> save();
        return redirect("/supplier");
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
