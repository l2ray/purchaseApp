<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductOrdersTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_orders', function (Blueprint $table) {
            $table->bigIncrements("id");
            $table -> integer("quantity");
            $table ->text("description");
            $table -> decimal("unit_price",7,2);
            $table ->decimal("total_price",7,2);
            $table ->bigInteger("requisitionId")->unsigned()->nullable();
            $table -> foreign("requisitionId")->references("id")->on("requisition_orders")->onDelete("cascade");
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
        Schema::dropIfExists('product_orders');
    }
}
