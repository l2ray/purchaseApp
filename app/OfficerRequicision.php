<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OfficerRequicision extends Model
{
    //
    public function departments(){
        return $this->belongsTo("App\Department");
    }
}
