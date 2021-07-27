<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateGRNSTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('g_r_n_s', function (Blueprint $table) {
            $table->bigIncrements("id");
            $table->string("grnNo");
            $table -> bigInteger("poId")->unsigned()->nullable();
            $table -> bigInteger("supplierId")->unsigned()->nullable();
            $table -> bigInteger("reqId")->unsigned()->nullable();

            $table->foreign("poId")->references("id")->on("p_o_s")->onDelete("cascade");
            $table -> foreign("supplierId")->references("id")->on("suppliers")->onDelete("cascade");
            $table -> foreign("reqId")->references("id")->on("requisition_orders")->onDelete("cascade");
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
        Schema::dropIfExists('g_r_n_s');
    }
}
