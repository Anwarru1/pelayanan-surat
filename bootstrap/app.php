<?php

use App\Http\Middleware\IsAdmin;
use App\Http\Middleware\IsKepalaDesa;
use App\Http\Middleware\IsPengguna;
use Illuminate\Foundation\Application;
use Illuminate\Foundation\Configuration\Exceptions;
use Illuminate\Foundation\Configuration\Middleware;

return Application::configure(basePath: dirname(__DIR__))
    ->withRouting(
        web: __DIR__.'/../routes/web.php',
        commands: __DIR__.'/../routes/console.php',
        health: '/up',
    )
    ->withMiddleware(function (Middleware $middleware) {
        $middleware->alias([
            'admin.only' => IsAdmin::class,
            'kepala.only' => IsKepalaDesa::class,
            'pengguna.only' => IsPengguna::class
        ]);
    })
    ->withExceptions(function (Exceptions $exceptions) {
        //
    })->create();
