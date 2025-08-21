<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Support\Facades\Auth;

class IsAdmin
{
    public function handle($request, Closure $next)
    {
        if (auth('admin')->check() && auth('admin')->user()->role === 'admin') {
            return $next($request);
        }

        abort(403, 'Akses ditolak. Hanya untuk admin.');
    }
}
