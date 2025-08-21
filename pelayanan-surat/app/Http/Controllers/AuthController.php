<?php

namespace App\Http\Controllers;

use App\Models\daftar;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\Pengguna;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    // --- Login Views ---
    public function showAdminLogin()
    {
        return view('admin.login');
    }

    public function showPenggunaLogin()
    {
        return view('pengguna.login');
    }

    // --- Admin + Kepala Desa Login ---
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
    
            // Simpan role di session
            session(['role' => $user->role]);

            // Redirect ke **satu dashboard** terlepas dari role
            return redirect()->route('dashboard.admin');
        }
    
        return back()->withErrors([
            'username' => 'Login gagal. Periksa username/password.'
        ])->withInput($request->only('username'));
    }

    // --- Pengguna Login ---
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
            return redirect()->route('pengguna.index');
        }elseif(Auth::guard('daftar')->attempt($credentials)) {
            return redirect()->route('profil.index')->with('info','Lengkapi profil Anda, menunggu verifikasi admin.');
        }

        return back()->withErrors([
            'nik' => 'Login gagal. NIK atau password salah.',
        ])->withInput($request->only('nik'));
    }

    // --- Logout ---
    public function logoutAdmin(Request $request)
    {
        Auth::guard('admin')->logout();
        session()->forget('role'); // hapus session role
        return redirect()->route('login.admin');
    }

    public function logoutPengguna(Request $request)
    {
        Auth::guard('pengguna')->logout();
        return redirect()->route('login.pengguna');
    }

    public function register(Request $request) {
        $request->validate([
            'nik' => 'required|unique:daftar,nik',
            'password' => 'required|min:8|confirmed',
        ]);

        daftar::create([
            'nik' => $request->nik,
            'password' => Hash::make($request->password)
        ]);

        return redirect()->route('login')->with('success','Akun berhasil dibuat, lengkapi profil setelah login.');
    }
}
