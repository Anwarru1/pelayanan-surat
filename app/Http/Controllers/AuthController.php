<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use App\Models\Pengguna;

class AuthController extends Controller
{
    public function showAdminLogin() {
        return view('admin.login');
    }
    public function showPenggunaLogin() {
        return view('pengguna.login');
    }
    public function adminLogin(Request $request) {
        $request->validate([
        'username' => 'required',
        'password' => 'required',
        ]);

        $credentials = $request->only('username', 'password');
        if (Auth::guard('admin')->attempt($credentials)) {
        $user = Auth::guard('admin')->user();

        if ($user->role === 'admin') {
            return redirect('/dashboard');
        } elseif ($user->role === 'kepala desa') {
            return redirect('/dashboard');
        } else {
            return redirect('/login-admin')->withErrors(['username' => 'Role tidak dikenali']);
        }
    }

    return back()->withErrors(['username' => 'Login gagal. Periksa username/password']);

    }

    public function penggunaLogin(Request $request)
{
    $request->validate([
        'nik' => 'required',
        'password' => 'required',
    ]);

    if (Auth::guard('pengguna')->attempt($request->only('nik', 'password'))) {
        $request->session()->regenerate();
        return redirect()->route('pengguna.index');
    }

    return back()->withErrors([
        'nik' => 'Login gagal. NIK atau password salah',
    ])->withInput($request->only('nik'));
}

    public function logout(Request $request) {
       if (Auth::guard('admin')->check()) {
        Auth::guard('admin')->logout();
        return redirect()->route('login.admin'); // arahkan ke form login admin
    }

    if (Auth::guard('pengguna')->check()) {
        Auth::guard('pengguna')->logout();
        return redirect()->route('login.pengguna'); // arahkan ke form login pengguna
    }

    return redirect('/'); //
    }
}

