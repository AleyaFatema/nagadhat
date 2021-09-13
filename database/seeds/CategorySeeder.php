<?php

use Illuminate\Database\Seeder;
use Faker\Factory as Faker;
use \Carbon\Carbon;

class CategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('App\Category');
        for ($i = 0; $i < 5; $i++) {
            DB::table('categories')->insert([
                'name' => $faker->word,
                'is_active' => $faker->boolean(),
                'created_by' => App\User::all()->random()->id,
                'created_at' => Carbon::now(),
                'updated_at' => Carbon::now(),
            ]);
        }
    }
}
