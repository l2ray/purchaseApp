@extends('layout.loginLayout')
{{-- BEGINS PURCHASE FORM --}}
@section('login')
<!---------------------- -->
    <div class="container">
        <div class="row">
            <div class="col-md-8 col-xs-12 col-sm-12 login_form">
                <div class="container">
                    <div class="row container">
                        <form method="post" action="/updatePassword">
                           
                            <input type="hidden" name="_token" value="{{ csrf_token() }}">
                            <div class="row" class="center">
                      
                                <div class="col-lg-12 headingText">
                                 <h4 class="">Please Change Your Default Password.</h4>
                                </div>
                             </div>
                            <div class="row">
                                <div class="col-lg-12">
                                    <input type="password"  name="password" id="username" required class="form__input form-control" placeholder="New Password">
                                </div>
                                <!-- <span class="fa fa-lock"></span> -->
                                <div class="col-lg-12">
                                    <input type="password" name="cPassword" required  id="password" class="form-control form__input" placeholder="Confirm New Password">
                                </div>
                               
                            </div>
                            <div class="row">
                              <div class="col-lg-12"><br />
                                <input type="submit" value="Submit" class="btn btn-success form-control">
                              </div>
                            </div>
                        </form>
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
