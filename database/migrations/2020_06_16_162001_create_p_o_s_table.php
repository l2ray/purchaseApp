<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePOSTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        //
        Schema::create('p_o_s', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('poNumber');
            $table -> dateTime("poDate");
            $table -> bigInteger("supplierId")->unsigned()->nullable();
            $table -> bigInteger('reqOrderId')->unsigned()->nullable();
            $table ->foreign("supplierId")->references("id")->on("suppliers")->onDelete('cascade');
            $table -> foreign("reqOrderId")->references("id")->on("requisition_orders")->onDelete('cascade');
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
        Schema::dropIfExists('p_o_s');
    }
}
