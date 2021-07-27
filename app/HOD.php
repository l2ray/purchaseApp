<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HOD extends Model
{
    //
    public function department(){
        return $this->belongsTo("App\Department");
    }
    public function requisitionOrder(){
        return $this->hasMany("App\RequisitionOrder");
    }
}
