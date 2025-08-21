<?php

namespace App\Http\Controllers;

use App\Models\Laporan;
use Illuminate\Http\Request;
use App\Models\PengajuanSurat;
use Carbon\Carbon;
use Barryvdh\DomPDF\Facade\Pdf;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\LaporanExport;

class LaporanController extends Controller
{
    public function index(Request $request)
    {
        \Carbon\Carbon::setLocale('id');
        $bulan = $request->bulan;
        $tahun = $request->tahun ?? date('Y');

        $query = PengajuanSurat::with(['pengguna', 'jenisSurat', 'berkasSurat'])
            ->where('status', 'diterima');

        if ($bulan) {
            $query->whereMonth('tanggal', $bulan);
        }

        if ($tahun) {
            $query->whereYear('tanggal', $tahun);
        }

        $data = $query->get();

        return view('admin.laporan', compact('data', 'bulan', 'tahun'));
    }

    public function print(Request $request)
    {
        Carbon::setLocale('id');
        $bulan = $request->bulan;
        $tahun = $request->tahun ?? date('Y');
        $data = $this->getFilteredData($request);

        return view('admin.print', compact('data', 'bulan', 'tahun'));
    }

    public function exportPdf(Request $request)
    {
        Carbon::setLocale('id');
        $bulan = $request->bulan;
        $tahun = $request->tahun ?? date('Y');
        $data = $this->getFilteredData($request);

        $pdf = PDF::loadView('admin.pdf', compact('data', 'bulan', 'tahun'))->setPaper('a4', 'landscape');
        return $pdf->download('laporan_surat.pdf');
    }

    private function getFilteredData($request)
    {
        $query = PengajuanSurat::with(['pengguna', 'jenisSurat'])->where('status', 'diterima');

        if ($request->bulan) {
            $query->whereMonth('tanggal', $request->bulan);
        }

        if ($request->tahun) {
            $query->whereYear('tanggal', $request->tahun);
        }

        return $query->get();
    }

    public function exportExcel(Request $request)
    {
        return Excel::download(new LaporanExport($request), 'laporan_surat.xlsx');
    }
}
