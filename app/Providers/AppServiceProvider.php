<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Blade;

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
        Blade::component('components.layout', 'layout');
        Blade::component('components.navbar', 'navbar');
        Blade::component('components.sidebar', 'sidebar');
        Blade::component('components.admin', 'admin');
        Blade::component('components.pengguna', 'pengguna');
        Blade::component('components.edit-admin', 'editAdmin');
        Blade::component('components.edit-pengguna', 'editPengguna');
    }
}
