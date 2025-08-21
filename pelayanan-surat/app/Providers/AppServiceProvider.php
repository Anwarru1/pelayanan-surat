<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\Blade;
use Illuminate\Pagination\Paginator;
use Illuminate\Support\Facades\View;
use App\Models\ResetPassword;

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

        Paginator::useBootstrap(); // atau useTailwind()

        // ✅ Bikin data resetBaru tersedia di SEMUA view
        View::composer('*', function ($view) {
            if (auth('admin')->check()) {
                $resetBaru = ResetPassword::where('status', 'menunggu')
                    ->latest()
                    ->get();

                $view->with(compact('resetBaru'));
            }
        });
    }
}
