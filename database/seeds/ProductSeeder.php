<?php

use Illuminate\Database\Seeder;
use \App\Product;
use Carbon\Carbon;

class ProductSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        Product::truncate();
        $faker = \Faker\Factory::create();
        for($i=0; $i<15; $i++){
            Product::create([
                'category_id' => \App\Category::all()->random()->id,
                'title' => $faker->sentence,
                'product_code' => $faker->realTextBetween('4','10'),
                'detail' => $faker->paragraph,
                'return_policy' => $faker->paragraph,
                'price' => $faker->numberBetween(400, 10000),
                'quantity' => $faker->numberBetween(0, 50),
                'base_unit' =>$faker->randomElement(['kg' ,'liter', 'mg', 'ml','piece']),
                'is_active' => $faker->boolean(),
                'thumbnail_url'=> $faker->imageUrl,
                'created_by' => App\User::all()->random()->id,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}
