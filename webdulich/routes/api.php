<?php

use Illuminate\Http\Request;
use App\Http\Controllers\RegisterController;
use App\Http\Controllers\loginController;
use App\Http\Controllers\TourController;
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

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

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});

// User
Route::get('/user/get_user', [RegisterController::class, 'get_user']);
Route::post('/user/register', [RegisterController::class, 'create']);
Route::post('/user/login',[LoginController::class,'login']);

// Tour
Route::post('/tour/create',[TourController::class,'create_tour']);
Route::post('/tour/checkuser',[TourController::class,'check_user']);


//test
Route::post('/login', [UserController::class,'login']);
Route::post('/register',[UserController::class,'register']);
Route::group(['middleware' => 'auth:api'], function() {
    Route::get('/get_user', [UserController::class,'get_user']);
});

