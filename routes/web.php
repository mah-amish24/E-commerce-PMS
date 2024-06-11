<?php

use App\Http\Controllers\PostController;
use App\Http\Controllers\ProductController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    // return view('auth.login');
    return view('auth.register');
});

Route::middleware(['auth'])->group(function () {
    // Route::resource('posts',PostController::class);
    Route::resource('products',ProductController::class);
    // Route::get('/products', [ProductController::class, 'index'])->name('products.index');
    // Route::post('/products', [ProductController::class, 'store'])->name('products.store');


});




require __DIR__.'/auth.php';
