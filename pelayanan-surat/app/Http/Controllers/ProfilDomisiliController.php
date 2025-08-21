<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ProfilDomisiliController extends Controller
{
    public function index()
    {
        $user = Auth::user();
        return view('pengguna.profil-domisili', compact('user'));
    }

    public function update(Request $request)
    {
        $request->validate([
            'nama' => 'required|string|max:100',
            'alamat' => 'required|string',
            'tmp_lahir' => 'nullable|string',
            'tgl_lahir' => 'nullable|date',
            'j_kel' => 'required|in:Laki-laki,Perempuan',
            'agama'     => 'required|in:Islam,Kristen,Katolik,Hindu,Buddha,Konghucu',
            'status'    => 'required|in:Kawin,Belum Kawin,Cerai Mati,Cerai Hidup',
            'pekerjaan' => 'nullable|in:PNS,Wiraswasta,Petani,Buruh,Karyawan,Pensiun,IRT,Pelajar/Mahasiswa',
            'nomor_hp' => 'nullable|numeric',
            'data_tambahan.ktp' => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'data_tambahan.kk'  => 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
            'data_tambahan.akta'=> 'nullable|file|mimes:jpg,jpeg,png,pdf|max:2048',
        ]);

        $user = Auth::user();
        $dataTambahan = $user->data_tambahan ? json_decode($user->data_tambahan, true) : [];

        // upload masing-masing file
        foreach (['ktp','kk','akta'] as $field) {
            if ($request->hasFile("data_tambahan.$field")) {
                $file = $request->file("data_tambahan.$field");
                $filename = time().'_'.$field.'_'.$file->getClientOriginalName();
                $file->move(public_path('uploads/data_tambahan'), $filename);
                $dataTambahan[$field] = $filename;
            }
        }

        $user->nama = $request->nama;
        $user->alamat = $request->alamat;
        $user->pekerjaan = $request->pekerjaan;
        $user->status = $request->status;
        $user->nomor_hp = $request->nomor_hp;
        $user->data_tambahan = json_encode($dataTambahan);

        $user->save();

        return back()->with('success','Profil berhasil disimpan.');
    }

}
