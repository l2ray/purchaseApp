<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    //
    public function officers(){
        return $this->hasMany("App\OfficerRequicision");
    }
    public function hods(){
        return $this->hasMany("App\HOD");
    }
    public function requisitionOrders(){
        return $this->hasMany("App\RequisitionOrder");
    }
}
