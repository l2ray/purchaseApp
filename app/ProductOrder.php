<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ProductOrder extends Model
{
    //
    public function requisitionOrder(){
        return $this->belongsTo("App\RequisitionOrder","requisitionId");
    }
}
