<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//import controller
use App\Http\Controllers\Api\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//register new user
Route::post('/signup', [UserController::class, 'register']);
//login user
Route::post('/signin', [UserController::class, 'login']);
// Fetch User
Route::post('/user', [UserController::class, 'current'])->middleware('auth:sanctum');
// Logout User
Route::post('/logout', [UserController::class, 'logout'])->middleware('auth:sanctum');

//using middleware
Route::group(['middleware' => ['auth:sanctum']], function () {
    Route::get('/profile', function (Request $request) {
        return auth()->user();
    });
    // Route::post('/sign-out', [AuthenticationController::class, 'logout']);
});
