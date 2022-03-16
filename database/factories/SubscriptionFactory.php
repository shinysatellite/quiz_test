<?php

use Faker\Generator as Faker;
use Illuminate\Support\Carbon;
use Laravel\Cashier\Subscription;

/** @var \Illuminate\Database\Eloquent\Factory $factory */
$factory->define(Subscription::class, function (Faker $faker) {
    return [
        'user_id'       => $faker->randomNumber(),
        'name'          => $faker->name,
        'stripe_id'     => $faker->word,
        'stripe_plan'   => $faker->word,
        'quantity'      => $faker->randomNumber(),
        'trial_ends_at' => Carbon::now(),
        'ends_at'       => Carbon::now(),
        'created_at'    => Carbon::now(),
        'updated_at'    => Carbon::now(),
        'status'        => $faker->word,
        'stripe_status' => $faker->word,
    ];
});
