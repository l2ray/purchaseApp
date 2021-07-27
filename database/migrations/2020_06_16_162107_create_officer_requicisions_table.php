<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateOfficerRequicisionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('officer_requicisions', function (Blueprint $table) {
            $table->bigIncrements("id");
            $table ->string("name");
            $table -> bigInteger("departmentId")->unsigned()->nullable();
            $table -> foreign("departmentId")->references("id")->on("departments")->onDelete("cascade");
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
        Schema::dropIfExists('officer_requicisions');
    }
}
