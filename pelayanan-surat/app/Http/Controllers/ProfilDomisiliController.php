<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use App\Models\daftar;
use App\Models\Pengguna;

class ProfilDomisiliController extends Controller
{
    public function index()
    {
        $user = Auth::guard('daftar');
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

        $user = Auth::guard('daftar');
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

    public function verifikasiIndex()
    {
        // ambil semua warga domisili yang belum diverifikasi
        $wargaBaru = daftar::where('is_verified', 0)->get();

        return view('admin.verifikasi-domisili', compact('wargaBaru'));
    }

    public function verifikasi($id)
    {
        $domisili = daftar::findOrFail($id);

        // pindahkan data ke tabel pengguna
        $pengguna = Pengguna::create([
            'nik'            => $domisili->nik,
            'password'       => $domisili->password, // sudah di-hash ketika daftar
            'nama'           => $domisili->nama,
            'alamat'         => $domisili->alamat,
            'tmp_lahir'      => $domisili->tmp_lahir,
            'tgl_lahir'      => $domisili->tgl_lahir,
            'j_kel'          => $domisili->j_kel,
            'nomor_hp'       => $domisili->nomor_hp,
            'pekerjaan'      => $domisili->pekerjaan,
            'agama'          => $domisili->agama,
            'status'         => $domisili->status,
            'role'           => 'warga_domisili'
        ]);

        // update daftar_pengguna
        $domisili->update(['is_verified' => 1]);

        return redirect()->back()->with('success', 'Warga domisili berhasil diverifikasi!');
    }

    public function tolak(Request $request, $id)
    {
        $domisili = daftar::findOrFail($id);

        // kalau mau hapus akun
        $domisili->delete();

        return redirect()->back()->with('error', 'Warga domisili ditolak dan datanya dihapus.');
    }

    public function show($id)
    {
        $warga = daftar::findOrFail($id);

        // cek apakah semua field sudah lengkap
        $isLengkap = $warga->nik && $warga->nama && $warga->alamat && 
                    $warga->tmp_lahir && $warga->tgl_lahir && $warga->j_kel && 
                    $warga->nomor_hp && $warga->pekerjaan && 
                    $warga->agama && $warga->status && 
                    $warga->data_tambahan;

        if (!$isLengkap) {
            return redirect()->route('admin.verifikasi.index')
                            ->with('error', 'Data belum lengkap, tidak bisa ditampilkan.');
        }

        // data_tambahan JSON -> decode
        $dataTambahan = json_decode($warga->data_tambahan, true);

        return view('admin.verifikasi-domisili.show', compact('warga', 'dataTambahan'));
    }


}
