<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Pengguna;

class AuthController extends Controller
{
    public function showAdminLogin()
    {
        return view('admin.login');
    }

    public function showPenggunaLogin()
    {
        return view('pengguna.login');
    }

    public function adminLogin(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|string',
        ], [
            'username.required' => 'Username wajib diisi.',
            'password.required' => 'Password wajib diisi.',
        ]);

        $credentials = $request->only('username', 'password');

        if (Auth::guard('admin')->attempt($credentials)) {
            $user = Auth::guard('admin')->user();

            if (in_array($user->role, ['admin', 'kepala desa'])) {
                return redirect('/dashboard');
            }

            return redirect()->route('login.admin')
                ->withErrors(['username' => 'Role tidak dikenali.']);
        }

        return back()->withErrors(['username' => 'Login gagal. Periksa username/password.'])
                     ->withInput($request->only('username'));
    }

    public function penggunaLogin(Request $request)
    {
        $request->validate([
            'nik' => 'required|digits:16',
            'password' => 'required|string|min:6',
        ], [
            'nik.required' => 'NIK wajib diisi.',
            'nik.digits' => 'NIK harus terdiri dari 16 digit.',
            'password.required' => 'Password wajib diisi.',
            'password.min' => 'Password minimal 6 karakter.',
        ]);

        $credentials = $request->only('nik', 'password');

        if (Auth::guard('pengguna')->attempt($credentials)) {
            $request->session()->regenerate();
            return redirect()->route('pengguna.index');
        }

        return back()->withErrors([
            'nik' => 'Login gagal. NIK atau password salah.',
        ])->withInput($request->only('nik'));
    }

    public function logout(Request $request)
    {
        if (Auth::guard('admin')->check()) {
            Auth::guard('admin')->logout();
            return redirect()->route('login.admin');
        }

        if (Auth::guard('pengguna')->check()) {
            Auth::guard('pengguna')->logout();
            return redirect()->route('login.pengguna');
        }

        return redirect('/');
    }
}
