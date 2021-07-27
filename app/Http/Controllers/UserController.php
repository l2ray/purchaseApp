<?php

namespace App\Http\Controllers;

use App\OfficerRequicision;
use App\User;
use Illuminate\Http\Request;
use App\Department;
use App\HOD;
use \Illuminate\Support\Facades\Session;

class UserController extends Controller
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
        $userList = User::all(["name","email","department","id"]);
        $departments = Department::all(["id","department_name"]);
        $depList = array();
        foreach($departments as $d){
            $depList[$d->id] = $d -> department_name;
        }
        $data = array("uList"=>$userList,"depList"=>$depList);
        return view("Users.view",$data);

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
        $depList = Department::all(['id',"department_name"]);
        $data = array("dep"=>$depList);
        return view("UserCreateView",$data);

    }


    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $r)
    {
        //
        if(Session::get("appStatus") != 1){
            return redirect("/login");
        }
        $email = $r["email"];
        $name = $r["name"];
        $dep	= $r["dep"];
        $status	= $r["status"];
        $authToAct = $r['authToAct'];
        $password	= $r["password"];
        $conPassword	= $r["conPassword"];
        if($password != $conPassword){
            return redirect()->back()->withErrors(['Sorry Your password character doesn\'t match. Please make sure they are the same.'])->withInput();
            return back()->withInput()
                ->with('error_message','');
        }
       else{
            if($status == 2){
                if(count(HOD::where("departmentId","=",$dep)->get())== 0){
                    $newHod = new HOD();
                    $newHod -> name = $name;
                    $newHod -> departmentId = $dep;
                    $newHod -> save();
                }
                else{
                    return redirect()->back()->withErrors(["Sorry This selected Department already has a HOD"])->withInput();
                }
            }
        //
            $oReq = new OfficerRequicision();
            $oReq -> name = $name;
            $oReq -> departmentId = $dep;
            $oReq -> subDep = $r['subDepartment'];
            $oReq -> save();

            $lastOReqId = OfficerRequicision::all()->last()->id;

            $userCreate = new User();
            $userCreate -> subDep = $r['subDepartment'];
            $userCreate -> name = $name;
            $userCreate -> email = $email;
            $userCreate -> password = $password;
            $userCreate -> uPassword = $password;
            $userCreate -> uId = $lastOReqId;
            $userCreate -> status = $status;
            $userCreate -> authToAct = $authToAct;
            $userCreate -> department = $dep;
	    $userCreate -> hasChangedPassword = 0;
            $userCreate -> save();
            return redirect("/user");
       }

    }

    /**
     * Display the specified resource.
     * return $r;
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
        $depList = Department::all(['id',"department_name"]);
        $userToEdit = User::find($id);
        $data = array("dep"=>$depList,"userToEdit"=>$userToEdit);
        return view("Users.Edit",$data);

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
        // if(Session::get("appStatus") != 1){
        //     return redirect("/login");
        // }
        //"email":"lo2raymoori@gmail.com","name":"Lamin O Touray","dep":"1","status":"1","password":"1","conPassword":"1"
        $email = $request["email"];
        $name = $request["name"];
        $dep	= $request["dep"];
        $status	= $request["status"];

        $password	= $request["password"];
        $conPassword	= $request["conPassword"];

        if($password != $conPassword){

            return redirect()->back()->withErrors(['Sorry Your password character doesn\'t match. Please make sure they are the same.'])->withInput();
            return back()->withInput()
                ->with('error_message','');
        }
       else{
            if($status == 2 && count(HOD::where("departmentId","=",$dep)->get())== 1 ){
                    return redirect()->back()->withErrors(["Sorry This selected Department already has a HOD"])->withInput();

            }
        //

            // $oReq = new OfficerRequicision();
            // $oReq -> name = $name;
            // $oReq -> departmentId = $dep;
            // $oReq -> save();

            // $lastOReqId = OfficerRequicision::all()->last()->id;

            $userCreate = User::find($id);
            $userCreate -> name = $name;
            $userCreate -> email = $email;
            $userCreate -> password = $password;
            $userCreate -> uPassword = $password;
            // $userCreate -> uId = $lastOReqId;
//            $userCreate -> status = $status;
  //          $userCreate -> department = $dep;
            $userCreate -> save();
            return redirect("/user");
        return $request;
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
