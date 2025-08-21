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

     public function update(Request $request) {
        $user = Auth::user();
        $user->update($request->all());
        return redirect()->route('pengguna.index')->with('success','Profil diperbarui, tunggu verifikasi admin.');
    }
}
