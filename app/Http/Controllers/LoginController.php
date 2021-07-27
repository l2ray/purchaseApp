<?php

namespace App\Http\Controllers;

use App\CurrencyType;
use App\User;
use App\newProduct;

use \Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;
class LoginController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        Session::put("appStatus",0);
        $countCurrency = count(CurrencyType::all());
        if($countCurrency == 0){
            $currencyList = array(
                "Gambian Dalasi"=>"GMD:D",
                "United Kingdom Pound Sterling" =>"GBP:£",
                "United States Dollar"=>"USD:$",
                "European Euro"=>"EUR:€",
                "Canadian Dollar"=>"CAD:$",
                "Chinese Yuan Renminbi" => "CNY:¥",
                "West African CFA" => "XOF:CFA",
                "Nigerian Naira"=>"NGN:₦"
            );
            foreach($currencyList as $key=>$val){
                $newCurrency = new CurrencyType();
                $newCurrency -> currencyName = $key;
                $newCurrency -> status = 0;
                $newCurrency -> currency = explode(":",$val)[1];
                $newCurrency -> currencyAbbreviation = explode(":",$val)[0];
                $newCurrency -> save();
            }

            $response = Http::get('https://stores.qcell.gm/api/items?all');
            $storeContent = $response['data'];
            for($count = 0; $count <count($storeContent); $count++){
                 $curProd = $storeContent[$count]['item_description'];
                 $newProduct = new newProduct();
                 $newProduct -> productName = $curProd;
                 $newProduct -> save();
            }
        }

        return view("login");
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
        return view("login");

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

        $email = $request -> email;
        $password = $request -> password;
        $currentUser = User::where("uPassword","=",$password)->where("email","=",$email)->get(["email", "name","uId","status","department","hasChangedPassword","authToAct"]);
       if(count($currentUser) == 1){
//           Session::put('userId', $currentUser["uId"]);
        $hodEmail = User::where("department","=",$currentUser[0]->department)->where("status","=",2)->get(['email']);
           Session::put("userId",$currentUser[0]->uId);
           Session::put("depId",$currentUser[0]->department);
           Session::put("status",$currentUser[0]->status);
           Session::put("userEmail",$currentUser[0]->email);
           Session::put("hodEmail",$hodEmail);
           Session::put("uName",$currentUser[0]->name);
           Session::put("appStatus",1);
           Session::put("authToAct",$currentUser[0]->authToAct);
            if($currentUser[0]->hasChangedPassword == 0){
                return redirect("/resetPassword");
            }

           else if($currentUser[0]->status == 3){
            return redirect("/hrDashboard");//view("landing");
           }
           return redirect("/requisitionOrder");//view("landing");
       }
       else{

           return redirect()->back()->withErrors(["Sorry Please check your credentials. Either your password or email or both are incorrect. "])->withInput();
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
