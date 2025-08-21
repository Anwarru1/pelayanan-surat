<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Log;

class ProfilController extends Controller
{
    public function index()
    {
        return view('pengguna.profil');
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

    public function update(Request $request)
    {
        $user = Auth::user();

        $request->validate([
            'nama'      => 'required|string|max:100',
            'alamat'    => 'required|string|max:255',
            'status'    => 'required|in:Kawin,Belum Kawin',
            'pekerjaan' => 'required|string|max:100',
            'nomor_hp'  => 'required|numeric',
        ]);

        $user->update([
            'nama'      => $request->nama,
            'alamat'    => $request->alamat,
            'status'    => $request->status,
            'pekerjaan' => $request->pekerjaan,
            'nomor_hp'  => $this->normalizePhoneNumber($request->nomor_hp),
        ]);

        return back()->with('success', 'Profil berhasil diperbarui');
    }

    public function updatePassword(Request $request)
    {
        $request->validate([
            'current_password' => ['required', 'current_password'],
            'new_password'     => [
                'required',
                'confirmed',
                Password::min(6)
            ],
        ], [
            'current_password.required' => 'Password lama wajib diisi',
            'new_password.required' => 'Password baru wajib diisi'
        ]);

        $user = Auth::user();
        $user->update([
            'password' => Hash::make($request->new_password)
        ]);

        return back()->with('success', 'Password berhasil diubah');
    }

    public function kontakAdmin(Request $request)
    {
        $request->validate([
            'nama'  => 'required|string|max:100',
            'nik'   => 'required|string|max:20',
            'pesan' => 'required|string|max:500',
        ]);

        // Kirim ke email admin, simpan ke DB, atau kirim notifikasi
        // Contoh sederhana: log pesan atau kirim email
        Log::info('Pesan ke admin:', $request->only('nama', 'nik', 'pesan'));

        return back()->with('success', 'Pesan Anda telah dikirim ke admin.');
    }

}
