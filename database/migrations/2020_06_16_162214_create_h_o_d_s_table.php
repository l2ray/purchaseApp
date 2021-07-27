<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateHODSTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('h_o_d_s', function (Blueprint $table) {
            $table->bigIncrements("id");
            $table->string("name");
            $table->bigInteger("departmentId")->unsigned()->nullable();
            $table ->foreign( "departmentId")->references("id")->on("departments");//->onDelete("cascade");
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('h_o_d_s');
    }
}
