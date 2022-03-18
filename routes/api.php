<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

//import controller
use App\Http\Controllers\Api\UserController;
use App\Http\Controllers\Api\QuizzesController;
use App\Http\Controllers\Api\ResultsController;

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
Route::post('/register', [UserController::class, 'register']);
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

    Route::post('quiz_types', [QuizzesController::class, 'getQuizeType']);
    Route::post('quiz/store', [QuizzesController::class, 'store']);
    Route::post('quiz/lists', [QuizzesController::class, 'getLists']);
    Route::post('quiz/activeQuiz', [QuizzesController::class, 'activeQuiz']);
    Route::post('quiz/active_lists', [QuizzesController::class, 'getActiveLists']);
    Route::post('quiz/save_test', [ResultsController::class, 'saveTest']);
});
