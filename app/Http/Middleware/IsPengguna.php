<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsPengguna
{
    public function handle($request, Closure $next)
    {
        if (Auth::guard('pengguna')->check()) {
            return $next($request);
        }

        return redirect('/login-pengguna');
    }
}
