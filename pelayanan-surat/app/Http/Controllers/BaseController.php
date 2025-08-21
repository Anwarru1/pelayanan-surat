<?php

namespace App\Providers;

use Illuminate\Support\ServiceProvider;
use Illuminate\Support\Facades\View;
use App\Models\ResetPassword;

class RouteServiceProvider extends ServiceProvider
{
    public function boot(): void
    {
        // Bagikan $resetBaru ke semua view
        View::composer('*', function ($view) {
            $view->with('resetBaru', ResetPassword::latest()->take(5)->get());
        });
    }
}
