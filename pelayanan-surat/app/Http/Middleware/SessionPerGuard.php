<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Session;

class SessionPerGuard
{
    public function handle(Request $request, Closure $next, $guard)
    {
        $cookieName = 'laravel_session_' . $guard;

        if ($request->hasCookie($cookieName)) {
            Session::setId($request->cookie($cookieName));
            Session::start();
        }

        $response = $next($request);

        $response->withCookie(cookie($cookieName, Session::getId(), 120));

        return $response;
    }
}
