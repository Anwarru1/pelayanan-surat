<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\PengajuanSurat;
use Illuminate\Support\Facades\Auth;
use App\Models\PesanPengguna;

class HomeController extends Controller
{
    public function index()
    {
        \Carbon\Carbon::setLocale('id');
        
        $user             = Auth::user();

        $totalSurat       = PengajuanSurat::where('pengguna_id', $user->id)->count();
        $suratSelesai     = PengajuanSurat::where('pengguna_id', $user->id)
                            ->where('status', 'diterima')->count();
        $suratDitolak     = PengajuanSurat::where('pengguna_id', $user->id)
                            ->where('status', 'ditolak')->count();
        $suratDiproses    = PengajuanSurat::where('pengguna_id', $user->id)
                            ->whereIn('status', ['menunggu', 'diproses'])->count();
        
        $pengajuanTerbaru = PengajuanSurat::with('jenisSurat')
                            ->where('pengguna_id', $user->id)
                            ->latest()
                            ->take(5)
                            ->get();

        return view('pengguna.index', [
            'totalSurat'       => $totalSurat,
            'suratSelesai'     => $suratSelesai,
            'suratDitolak'     => $suratDitolak,
            'suratDiproses'    => $suratDiproses,
            'pengajuanTerbaru' => $pengajuanTerbaru,
        ]);
    
    }

    public function kirimPesan(Request $request)
    {
        $request->validate([
            'subjek'      => 'required|string|max:255',
            'isi'         => 'required|string',
        ]);

        PesanPengguna::create([
            'pengguna_id' => auth()->user()->id,
            'subjek'      => $request->subjek,
            'isi'         => $request->isi,
        ]);

        return redirect()->back()->with('success', 'Pesan berhasil dikirim.');
    }

    public function pesanSaya()
    {
        $pesanList = PesanPengguna::where('pengguna_id', auth()->user()->id)->latest()->get();
        return view('pengguna.pesan', compact('pesanList'));
    }

}
