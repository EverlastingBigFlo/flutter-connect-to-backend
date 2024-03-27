<?php
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\UserController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::prefix('/auth')->group(function(){
    Route::post('register',[AuthController::class,'register']);
    Route::post('checkotp',[AuthController::class,'checkOtp']); 
    Route::post('sendotp',[AuthController::class,'sendOtpNow']); 


});

// proteced routes
Route::middleware('auth:sanctum')->prefix('/account')->group(function(){
    
    Route::post('createtxpin',[UserController::class,'createTxPin']); 
});