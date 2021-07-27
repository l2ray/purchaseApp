<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PO extends Model
{
    //
    public function suppliers(){
        return $this->belongsTo("App\Supplier");
    }
    public function requitisionOrders(){
        return $this->belongsTo("App\RequisitionOrder");
    }
}
