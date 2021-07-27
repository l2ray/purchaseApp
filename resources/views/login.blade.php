@extends('layout.loginLayout')

@section('login')
   



    <div class="container-fluid">

        <div class="row main-content bg-success text-center">
            <div class="col-md-4 text-center company__info">
                <img src={{asset('images/qlogo.png')}} />
                <h4 class="company_title">Q PURCHASE ORDER</h4>
            </div>

            <div class="col-md-8 col-xs-12 col-sm-12 login_form ">
                <div class="container-fluid">
                    <div class="row" class="center">
                      
                       <div class="col-lg-12 headingText">
                        <h2 class="">Log In</h2>
                       </div>
                    </div>
                    <div class="row">
                        {{Form::open(["method"=>"post","action"=>"LoginController@store"])}}
                            <div class="row">
                            
                            </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <input type="text"  name="email" id="username" required class="form__input form-control" placeholder="Username">
                                </div>
                                <!-- <span class="fa fa-lock"></span> -->
                                <div class="col-lg-12">
                                    <input type="password" name="password" required  id="password" class="form-control form__input" placeholder="Password">
                                </div>
                            </div>
                            
                            <div class="row">
                              <div class="col-lg-12">
                                <input type="submit" value="Submit" class="btn form-control">
                              </div>
                            </div>
                            {{Form::close()}}
                    </div>
                    <div class="row">
                      <div class="col-lg-12">
                        @if($errors->any())
                        <div class="alert alert-danger alert-dismissible fade show">{{$errors->first()}}  <button type="button" class="close" data-dismiss="alert">&times;</button></div>
                    @endif
                      </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
@endsection
{{-- 

////////////   
            <!--Form-->
       <div class="form-row">
           <div class="form-group col-md-12">
                <input type="email" placeholder="Email@qcell.gm" name="email" class="form-control" />
           </div>
           <div class=" form-group col-lg-12">
               <input type="password" name="password" placeholder="Password" class="form-control" required />
           </div>
           <div class="form-group col-lg-6">
               <input type="submit" value="Login" class="form-control btn btn-primary"/>
           </div>
           <div class="form-grou col-lg-6">
               <a class="btn btn-primary form-control" href="#">Sign Up</a>
           </div>
       </div>

        <div class="col lg-12">

        </div>
    

</div> --}}