<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PasswordOtp;
use App\Models\Pengguna;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use Illuminate\Support\Facades\Log;

class OTPController extends Controller
{
    // Tampilkan form permintaan OTP
    public function showRequestForm()
    {
        return view('pengguna.lupa-password');
    }

    public function send(Request $request)
    {
        $request->validate(['nomor_hp' => 'required']);

        $inputHp = trim($request->nomor_hp);

        // Cocokkan langsung sesuai yang tersimpan di database
        $user = Pengguna::whereRaw("REPLACE(nomor_hp, ' ', '') = ?", [$inputHp])->first();

        if (!$user) {
            return back()->withErrors(['nomor_hp' => 'Nomor tidak ditemukan.']);
        }

        // Buat OTP baru
        $otp = rand(100000, 999999);

        // Simpan ke tabel password_otps
        PasswordOtp::create([
            'nomor_hp'   => $user->nomor_hp,
            'otp_code'   => $otp,
            'expired_at' => now()->addMinutes(10),
            'used'       => false,
        ]);

        // Simulasi kirim (WhatsApp/SMS)
        session(['reset_hp' => $inputHp]);

        return redirect()->route('otp.verify.form')->with('success', 'Kode OTP telah dikirim. (Tes OTP: ' . $otp . ')');

    }

    public function showVerifyForm()
    {
        return view('pengguna.verifikasi-otp');
    }

    public function verify(Request $request)
    {
        $request->validate(['otp_code' => 'required|digits:6']);

        $nomorHp = Session::get('reset_hp');

        $otp = PasswordOtp::where('nomor_hp', $nomorHp)
            ->where('otp_code', $request->otp_code)
            ->where('expired_at', '>=', now())
            ->where('used', false)
            ->latest()
            ->first();

        if (!$otp) {
            $debug = PasswordOtp::where('nomor_hp', $nomorHp)->orderByDesc('id')->take(5)->get();
            dd([
                'otp_input' => $request->otp_code,
                'nomor_session' => $nomorHp,
                'otp_match' => $debug
            ]);
        }

        if (!$otp) {
            return back()->withErrors(['otp_code' => 'Kode OTP salah atau sudah kedaluwarsa.']);
        }
        

        $otp->update(['used' => true]);

        Session::put('reset_verified', true);

        return redirect()->route('otp.password.reset.form');
    }

    public function showResetForm()
    {
        if (!Session::get('reset_verified')) {
            return redirect()->route('otp.request.form');
        }

        return view('pengguna.ganti-password');
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'password' => 'required|min:6|confirmed',
        ]);

        $nomorHp = Session::get('reset_hp');

        $user = Pengguna::where('nomor_hp', $nomorHp)->first();

        if (!$user) {
            return redirect()->route('otp.request.form')->withErrors(['nomor_hp' => 'Pengguna tidak ditemukan.']);
        }

        $user->update([
            'password' => Hash::make($request->password),
        ]);

        Session::forget(['reset_hp', 'reset_verified']);

        return redirect()->route('login.pengguna')->with('success', 'Password berhasil diubah.');
    }
}
