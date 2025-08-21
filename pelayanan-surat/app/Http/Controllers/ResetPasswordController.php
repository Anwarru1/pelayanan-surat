<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\ResetPassword;
use App\Models\Pengguna;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Http;

class ResetPasswordController extends Controller
{
    
    public function create()
    {
        return view('pengguna.lupa-password');
    }

    protected function normalizePhoneNumber($number)
    {
        $number = preg_replace('/[^0-9]/', '', $number); // hanya angka
        if (strpos($number, '0') === 0) {
            $number = '+62' . substr($number, 1);
        } elseif (strpos($number, '62') === 0) {
            $number = '+' . $number;
        } elseif (strpos($number, '+62') !== 0) {
            $number = '+62' . $number;
        }
        return $number;
    }

    public function store(Request $request)
    {
        $request->validate([
            'nama'   => 'required|string',
            'nik'    => 'required|numeric|digits:16',
            'no_hp'  => 'required|string',
            'alasan' => 'required|string',
        ]);

        ResetPassword::create([
            'nama' => strtoupper($request->nama),
            'nik' => $request->nik,
            'no_hp' => $this->normalizePhoneNumber($request->no_hp),
            'alasan' => $request->alasan,
            'status' => 'menunggu',
        ]);

        return redirect()->route('login.pengguna')->with('success', 'Permintaan reset telah dikirim ke admin.');
    }

    public function reset($id)
    {
        // Ganti $request jadi $resetRequest supaya tidak bentrok
        $resetRequest = ResetPassword::findOrFail($id);
    
        $pengguna = Pengguna::where('nik', $resetRequest->nik)
            ->where('nama', $resetRequest->nama)
            ->first();
    
        if (!$pengguna) {
            return back()->with('error', 'Pengguna tidak ditemukan.');
        }
    
        $pengguna->update([
            'password' => Hash::make('pelayanan-surat'),
        ]);
    
        $resetRequest->update(['status' => 'reset']); // sekarang aman
    
        return back()->with('success', 'Password berhasil direset ke default.');
    }


}
