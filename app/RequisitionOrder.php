<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class RequisitionOrder extends Model
{
    //
    public function POs(){
        return $this->hasMany("App\PO");
    }
    public function departments(){
        return $this->belongsTo("App\Department","dep_id");
    }
    public function hods(){
        return $this->belongsTo("App\HOD");
    }
    public function officerRequesting(){
        return $this->belongsTo("App\OfficerRequicision","officer_id");
    }
    public function productOrders(){
        return $this->hasMany("App\ProductOrder",'requisitionId');
    }
}
