<?php

namespace App\Http\Controllers;

use App\Models\Pengguna;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Carbon\Carbon;

class PenggunaController extends Controller
{

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('pengguna.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //validasi
        $request->validate([
            'nik'       => 'required|string|unique:pengguna',
            'password'  => 'required|string',
            'nama'      => 'required|string',
            'alamat'    => 'required|string',
            'j_kel'     => 'required|in:laki-laki,perempuan',
            'agama'     => 'required|in:Islam,Kristen,Katolik,Hindu,Buddha,Konghucu',
            'status'    => 'required|in:Kawin,Belum Kawin,Cerai Mati,Cerai Hidup',
            'pekerjaan' => 'required|string',
            'nomor_hp'  => 'required|string|unique:pengguna',
            'tmp_lahir' => 'required|string',
            'tgl_lahir' => 'required|date',
        ]);

        //simpan data
        //$tgl_lahir = Carbon::createFromFormat('m/d/Y', $request->tgl_lahir)->format('Y-m-d');
        
        Pengguna::create([
            'nik'       => $request->nik,
            'password'  => Hash::make($request->password),
            'nama'      => $request->nama,
            'j_kel'     => $request->j_kel,
            'alamat'    => $request->alamat,
            'agama'     => $request->agama,
            'pekerjaan' => $request->pekerjaan,
            'nomor_hp'  => $request->nomor_hp,
            'status'    => $request->status,
            'tmp_lahir' => $request->tmp_lahir,
            'tgl_lahir' => Carbon::createFromFormat('m/d/Y', $request->tgl_lahir)->format('Y-m-d'),
        ]);
        return redirect()->route('data-user.index')->with('success', 'Pengguna ditambahkan.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Pengguna $dataUser)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $pengguna = Pengguna::findOrFail($id);
        return view('pengguna.edit', compact('pengguna'));
    }


    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $request->validate([
            'nik'       => 'required|string|unique:pengguna,nik,' . $id,
            'nama'      => 'required|string',
            'alamat'    => 'required|string',
            'j_kel'     => 'required|in:Laki-laki,Perempuan',
            'agama'     => 'required|in:Islam,Kristen,Katolik,Hindu,Buddha,Konghucu',
            'status'    => 'required|in:Kawin,Belum Kawin,Cerai Mati,Cerai Hidup',
            'pekerjaan' => 'required|string',
            'nomor_hp'  => 'required|string',
            'tmp_lahir' => 'required|string',
            'tgl_lahir' => 'required|date',
        ]);
        
        {
        $pengguna = Pengguna::findOrFail($id);
        $pengguna->nik = $request->nik;
        if ($request->password) {
            $pengguna->password = Hash::make($request->password);
        }
        $pengguna->nama = $request->nama;
        $pengguna->alamat = $request->alamat;
        $pengguna->j_kel = $request->j_kel;
        $pengguna->agama = $request->agama;
        $pengguna->status = $request->status;
        $pengguna->pekerjaan = $request->pekerjaan;
        $pengguna->nomor_hp = $request->nomor_hp;
        $pengguna->tmp_lahir = $request->tmp_lahir;
        $pengguna->tgl_lahir = Carbon::createFromFormat('m/d/Y', $request->tgl_lahir)->format('Y-m-d');
        $pengguna->save();
        return redirect()->route('data-user.index')->with('success', 'Pengguna diperbarui.');
    }
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        Pengguna::destroy($id);
        return redirect()->route('data-user.index')->with('success', 'Pengguna dihapus.');
    }

    public function showRegisterForm()
    {
        return view('pengguna.daftar');
    }

    public function register(Request $request)
    {
        $request->validate([
            'nama'      => 'required|string|max:100',
            'nik'       => 'required|string|max:20|unique:pengguna',
            'password'  => 'required|min:6|confirmed',
            'alamat'    => 'required|string|max:255',
            'tgl_lahir' => 'required|date',
            'tmp_lahir' => 'required|string|max:100',
            'agama'     => 'required|in:Islam,Kristen,Katolik,Hindu,Buddha,Konghucu',
            'status'    => 'required|in:Kawin,Belum Kawin,Cerai Mati,Cerai Hidup',
            'nomor_hp'  => 'required|string',
            'j_kel'     => 'required|in:Laki-laki,Perempuan',
            'pekerjaan' => 'required|string|max:100',
        ]);

        Pengguna::create([
            'nama'      => $request->nama,
            'nik'       => $request->nik,
            'password'  => Hash::make($request->password),
            'alamat'    => $request->alamat,
            'tgl_lahir' => $request->tgl_lahir,
            'tmp_lahir' => $request->tmp_lahir,
            'agama'     => $request->agama,
            'status'    => $request->status,
            'nomor_hp'  => $request->nomor_hp,
            'j_kel'     => $request->j_kel,
            'pekerjaan' => $request->pekerjaan,
        ]);

        return redirect()->route('login.pengguna')->with('success', 'Akun berhasil dibuat. Silakan login.');
    }

    public function bulkDelete(Request $request)
    {
        $ids = $request->input('selected_ids');
        
        if (!is_array($ids) || empty($ids)) {
            return back()->withErrors(['Tidak ada data yang dipilih untuk dihapus.']);
        }

        Pengguna::whereIn('id', $ids)->delete();

        return back()->with('success', 'Data admin berhasil dihapus.');
    }


}
