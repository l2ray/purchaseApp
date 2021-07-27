<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Supplier extends Model
{
    //
    public function POs(){
        return $this->hasMany("App\PO");
    }
}
