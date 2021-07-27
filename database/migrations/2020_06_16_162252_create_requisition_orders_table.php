<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateRequisitionOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('requisition_orders', function (Blueprint $table) {
            $table->bigIncrements("id");
            $table -> integer("reqNo");
            $table -> bigInteger("hod_id")->unsigned()->nullable();
            $table -> bigInteger("dep_id")->unsigned()->nullable();
            $table -> bigInteger("officer_id")->unsigned()->nullable();
            $table -> dateTime("reqDate");
            $table -> text("purpose");
            $table -> text("requisitionNote");
            $table -> integer("hodApproved");
            $table -> integer("hrApproved");
            $table -> integer("delivered");


            $table -> foreign("hod_id")->references("id")->on("h_o_d_s")->onDelete("cascade");
            $table -> foreign("dep_id")->references("id")->on("departments")->onDelete("cascade");
            $table -> foreign("officer_id")->references("id")->on("officer_requicisions")->onDelete("cascade");
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
        Schema::dropIfExists('requisition_orders');
    }
}
