<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Pengguna;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Yajra\DataTables\Facades\DataTables;
use Illuminate\Support\Facades\Log;
use App\Models\daftar;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request)
    {   

        return view('admin.data-user');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'username' => 'required|string',
            'password' => 'required|min:6',
            'role'     => 'required|in:admin,kepala desa',
        ]);

        Admin::create([
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'role'     => $request->role
        ]);

        return redirect()->route('data-user.index')->with('success', 'Admin Ditambahkan.');
    }

    /**
     * Display the specified resource.
     */
    public function show(Admin $admin)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit($id)
    {
        $admin = Admin::findOrFail($id);
        return view('admin.edit', compact('admin'));
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, $id)
    {
        $admin = Admin::findOrFail($id);
        $admin->username = $request->username;
        if ($request->password) {
            $admin->password = Hash::make($request->password);
        }
        $admin->role = $request->role;
        $admin->save();
        return redirect()->route('data-user.index')->with('success', 'Admin diperbarui.');
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy($id)
    {
        Admin::destroy($id);
        return redirect()->route('data-user.index')->with('success', 'Admin dihapus.');
    }

    public function bulkDelete(Request $request)
    {
        $ids = $request->input('selected_ids');
        
        if (!is_array($ids) || empty($ids)) {
            return back()->withErrors(['Tidak ada data yang dipilih untuk dihapus.']);
        }

        Admin::whereIn('id', $ids)->delete();

        return back()->with('success', 'Data admin berhasil dihapus.');
    }

    public function pendingUsers() {
        $users = daftar::where('is_verified', false)->get();
        return view('admin.domisili', compact('users'));
    }

    public function verify($id) {
        $daftar = daftar::findOrFail($id);

        // Pindahkan ke pengguna
        Pengguna::create([
            'nik' => $daftar->nik,
            'password' => $daftar->password,
            'nama' => $daftar->nama,
            'alamat' => $daftar->alamat,
            'tmp_lahir' => $daftar->tmp_lahir,
            'tgl_lahir' => $daftar->tgl_lahir,
            'j_kel' => $daftar->j_kel,
            'nomor_hp' => $daftar->nomor_hp,
            'pekerjaan' => $daftar->pekerjaan,
            'agama' => $daftar->agama,
            'status' => $daftar->status,
            'role' => 'warga_domisili'
        ]);

        $daftar->delete();

        return back()->with('success','Warga domisili berhasil diverifikasi.');
    }


}
