<?php

namespace App\Http\Controllers;

use App\Models\Admin;
use App\Models\Pengguna;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class AdminController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {   
        $admins = Admin::all();
        $penggunas = Pengguna::all();

        return view('admin.data-user', compact('admins', 'penggunas'));
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
            'username' => 'required',
            'password' => 'required',
            'role'     => 'required',
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


}
