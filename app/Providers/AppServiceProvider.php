<?php

namespace App\Providers;
use App\Models\Category;
use App\Models\Post;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        //
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        Paginator::defaultView('vendor.pagination.bootstrap-4');

        view()->composer('layouts.sidebar',function($view) {
            //вывести список статей отсортировав по просмотрам
            $view->with('popular_posts',Post::orderBy('views','desc')->limit(3)->get());
            //вывести список категорий и их количество
            $view->with('cats',Category::withCount('posts')->orderBy('posts_count','desc')->get());
        });



    }
}
