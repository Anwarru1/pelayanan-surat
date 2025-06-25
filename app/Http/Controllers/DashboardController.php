<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use App\Models\Admin;
use App\Models\PengajuanSurat;
use App\Models\Pengguna;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Models\PesanPengguna;

class DashboardController extends Controller
{
    public function index()
    {
        \Carbon\Carbon::setLocale('id');

        $pengajuanPerBulan = DB::table('pengajuan_surat')
        ->select(DB::raw('MONTH(tanggal) as bulan'), DB::raw('COUNT(*) as total'))
        ->whereYear('tanggal', Carbon::now()->year)
        ->groupBy(DB::raw('MONTH(tanggal)'))
        ->pluck('total', 'bulan')
        ->toArray();

        $dataChart = [];
        for ($i = 1; $i <= 12; $i++) {
            $dataChart[] = $pengajuanPerBulan[$i] ?? 0;
        }

        $pesanBaru              = PesanPengguna::latest()->take(5)->get();
        $pengajuanList          = PengajuanSurat::with('pengguna', 'jenisSurat')->latest()->take(10)->get();
        $totalPengajuan         = PengajuanSurat::count();
        $totalTerkonfirmasi     = PengajuanSurat::where('status', 'diterima')->count();
        $totalBelumDikonfirmasi = PengajuanSurat::whereIn('status', ['menunggu', 'diproses'])->count();
        $totalPengguna          = Pengguna::count();

        return view('admin.dashboard', compact(
            'dataChart',
            'totalPengajuan',
            'totalTerkonfirmasi',
            'totalBelumDikonfirmasi',
            'totalPengguna',
            'pengajuanList',
            'pesanBaru',
        ));
    }

    public function pesanMasuk()
    {
        $pesanList = PesanPengguna::with('pengguna')->latest()->get();
        return view('admin.pesan', compact('pesanList'));
        
    }

    public function tandaiBaca($id)
    {
        $pesan = PesanPengguna::findOrFail($id);
        $pesan->update(['is_read' => true]);

        return redirect()->back()->with('success', 'Pesan ditandai sebagai dibaca.');
    }
}