<?php

use App\Http\Controllers\AuthController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\CodeController;
use App\Http\Controllers\FeatureController;
use App\Http\Controllers\PageController;
use App\Http\Controllers\ProjectController;
use Illuminate\Support\Facades\Route;

Route::group(['prefix' => 'auth'], function () {
    Route::post('login', [AuthController::class, 'login']);
    Route::post('register', [AuthController::class, 'register']);
    Route::post('logout', [AuthController::class, 'logout'])
        ->middleware('auth:api');
    Route::post('refresh', [AuthController::class, 'refresh'])
        ->middleware('auth:api');
});
Route::group(['prefix' => 'project'], function () {
    Route::get('index', [ProjectController::class, 'index'])
        ->middleware('auth:api');
    Route::get('show/{project}', [ProjectController::class, 'show'])
        ->middleware('auth:api');
    Route::post('create', [ProjectController::class, 'store'])
        ->middleware('auth:api');
    Route::post('update/{project}', [ProjectController::class, 'update'])
        ->middleware('auth:api');
    Route::get('features/{id}', [FeatureController::class, 'index'])
        ->middleware('auth:api');
    Route::delete('destroy/{project}', [ProjectController::class, 'destroy'])
        ->middleware('auth:api');
});
Route::group(['prefix' => 'feature'], function () {
    Route::get('pages/{id}', [PageController::class, 'index'])
        ->middleware('auth:api');
    Route::get('show/{feature}', [FeatureController::class, 'show'])
        ->middleware('auth:api');
    Route::post('update/{feature}', [FeatureController::class, 'update'])
        ->middleware('auth:api');
    Route::post('create', [FeatureController::class, 'store'])
        ->middleware('auth:api');
    Route::delete('destroy/{feature}', [FeatureController::class, 'destroy'])
        ->middleware('auth:api');
});
Route::group(['prefix' => 'page'], function () {
    Route::get('codes/{id}', [CodeController::class, 'index'])
        ->middleware('auth:api');
    Route::get('show/{page}', [PageController::class, 'show'])
        ->middleware('auth:api');
    Route::post('update/{page}', [PageController::class, 'update'])
        ->middleware('auth:api');
    Route::post('create', [PageController::class, 'store'])
        ->middleware('auth:api');
    Route::delete('destroy/{page}', [PageController::class, 'destroy'])
        ->middleware('auth:api');
});
Route::group(['prefix' => 'code'], function () {
    Route::post('create', [CodeController::class, 'store'])
        ->middleware('auth:api');
    Route::post('update/{code}', [CodeController::class, 'update'])
        ->middleware('auth:api');
    Route::get('show/{code}', [CodeController::class, 'show'])
        ->middleware('auth:api');
    Route::delete('destroy/{code}', [CodeController::class, 'destroy'])
        ->middleware('auth:api');
});
Route::group(['prefix' => 'chat'], function () {
    Route::get('index', [ChatController::class, 'index'])
        ->middleware('auth:api');
});
