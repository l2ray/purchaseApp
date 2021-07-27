<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreatePendingRequisitionRequestsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pending_requisition_requests', function (Blueprint $table) {
            $table->id();
            $table -> bigInteger("hod_id")->unsigned()->nullable();
            $table -> bigInteger("dep_id")->unsigned()->nullable();
            $table -> bigInteger("officer_id")->unsigned()->nullable();
            $table -> dateTime("reqDate");
            $table -> text("purpose");
            $table -> integer("hodApproved");
            $table -> integer("hrApproved");
            $table -> integer("delivered");
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
        Schema::dropIfExists('pending_requisition_requests');
    }
}
