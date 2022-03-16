<?php

use App\Models\Trademark;
use Faker\Generator as Faker;
use Illuminate\Support\Carbon;

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(Trademark::class, function (Faker $faker) {
    return [
        'phrase'     => $faker->word,
        'used'       => $faker->boolean,
        'created_at' => Carbon::now(),
        'updated_at' => Carbon::now(),
        'user_id' => 1,
    ];
});
