<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('category_id');
            $table->string('title')->unique();
            $table->string('product_code')->unique()->comment('unique SKU/code');
            $table->text('detail');
            $table->text('return_policy')->nullable();
            $table->float('price', 8, 2);
            $table->integer('quantity')->default(0);
            $table->string('base_unit')->comment('kg, liter, etc.');
            $table->string('thumbnail_url');
            $table->boolean('is_active')->default(true);
            $table->unsignedBigInteger('created_by');
            $table->timestamps();

            $table->foreign('category_id')->references('id')->on('categories')->onDelete('cascade');
            $table->foreign('created_by')->references('id')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        // First drop unique and foreign key contraints
        Schema::table('products', function (Blueprint $table) {
            $table->dropUnique('products_title_unique');
            $table->dropUnique('products_product_code_unique');
            $table->dropForeign('products_category_id_foreign');
            $table->dropForeign('products_created_by_foreign');
        });

        Schema::dropIfExists('products');
    }
}
