<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\Pengguna;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class DataUserController extends Controller
{
    // Admin dan Kades
    public function adminIndex()
    {
        $admins = Admin::all();
        return view('admin.data-user.admin', compact('admins'));
    }

    public function adminStore(Request $request)
    {
        $request->validate([
            'username' => 'required|string|unique:admins',
            'password' => 'required|string|min:6',
            'role'     => 'required|in:admin,kades',
        ]);

        Admin::create([
            'username' => $request->username,
            'password' => Hash::make($request->password),
            'role'     => $request->role,
        ]);

        return redirect()->back()->with('success', 'Admin berhasil ditambahkan');
    }

    public function adminUpdate(Request $request, $id)
    {
        $request->validate([
            'username' => 'required|string|unique:admins,username,' . $id,
            'password' => 'nullable|string|min:6',
            'role' => 'required|in:admin,kades',
        ]);

        $admin = Admin::findOrFail($id);
        $data = [
            'username' => $request->username,
            'role' => $request->role,
        ];

        if ($request->password) {
            $data['password'] = Hash::make($request->password);
        }

        $admin->update($data);

        return redirect()->back()->with('success', 'Admin berhasil diperbarui');
    }

    public function adminDestroy($id)
    {
        $admin = Admin::findOrFail($id);
        $admin->delete();

        return redirect()->back()->with('success', 'Admin berhasil dihapus');
    }

    // Pengguna
    public function penggunaIndex()
    {
        $penggunas = Pengguna::all();
        return view('admin.data-user.pengguna', compact('penggunas'));
    }

    public function penggunaStore(Request $request)
    {
        $request->validate([
            'nik' => 'required|string|unique:penggunas',
            'password' => 'required|string|min:6',
            'nama' => 'required|string',
            'alamat' => 'required|string',
            'j_kel' => 'required|in:laki-laki,perempuan',
            'tmp_lahir' => 'required|string',
            'tgl_lahir' => 'required|date',
        ]);

        Pengguna::create([
            'nik' => $request->nik,
            'password' => Hash::make($request->password),
            'nama' => $request->nama,
            'alamat' => $request->alamat,
            'j_kel' => $request->jenis_kelamin,
            'tmp_lahir' => $request->tempat_lahir,
            'tgl_lahir' => $request->tanggal_lahir,
        ]);

        return redirect()->back()->with('success', 'Pengguna berhasil ditambahkan');
    }

    public function penggunaUpdate(Request $request, $id)
    {
        $request->validate([
            'nik' => 'required|string|unique:penggunas,nik,' . $id,
            'password' => 'nullable|string|min:6',
            'nama' => 'required|string',
            'alamat' => 'required|string',
            'j_kel' => 'required|in:laki-laki,perempuan',
            'tmp_lahir' => 'required|string',
            'tanggal_lahir' => 'required|date',
        ]);

        $pengguna = Pengguna::findOrFail($id);
        $data = [
            'nik' => $request->nik,
            'nama' => $request->nama,
            'alamat' => $request->alamat,
            'jenis_kelamin' => $request->jenis_kelamin,
            'tempat_lahir' => $request->tempat_lahir,
            'tanggal_lahir' => $request->tanggal_lahir,
        ];

        if ($request->password) {
            $data['password'] = Hash::make($request->password);
        }

        $pengguna->update($data);

        return redirect()->back()->with('success', 'Pengguna berhasil diperbarui');
    }

    public function penggunaDestroy($id)
    {
        $pengguna = Pengguna::findOrFail($id);
        $pengguna->delete();

        return redirect()->back()->with('success', 'Pengguna berhasil dihapus');
    }
}