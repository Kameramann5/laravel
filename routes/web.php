<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/
//старая функция
//Route::get('/', function () { return view('welcome'); })->name('home');
//новая функция
Route::get('/', 'PostController@index')->name('home');

//для поста польз. части
Route::get('/article', 'PostController@show')->name('posts.single');







//middleware 'это закрыть от входа страницы если не админ
//для админа, не работает! Route::group(['prefix' => 'admin', 'namespace' => 'Admin','middleware'=> 'admin'], function () {
Route::group(['prefix' => 'admin', 'namespace' => 'Admin'], function () {



   Route::get('/','MainController@index')->name('admin.index');
Route::resource ('/categories','CategoryController');
    Route::resource ('/tags','TagController');
    Route::resource ('/posts','PostController');




});

Route::group(['middleware' => 'guest'], function  () {
    Route::get('/register','UserController@create')->name('register.create');
    Route::post('/register','UserController@store')->name('register.store');

    Route::get('/login','UserController@loginForm')->name('login.create');
    Route::post('/login','UserController@login')->name('login');
});



Route::get('/logout','UserController@logout')->name('logout')->middleware ('auth');
