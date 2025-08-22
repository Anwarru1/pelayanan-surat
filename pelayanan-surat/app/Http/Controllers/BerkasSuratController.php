<?php

namespace App\Http\Controllers;

use App\Models\BerkasSurat;
use Illuminate\Http\Request;
use PhpOffice\PhpWord\TemplateProcessor;
use SimpleSoftwareIO\QrCode\Facades\QrCode;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

class BerkasSuratController extends Controller
{
    public function index()
    {
        \Carbon\Carbon::setLocale('id');
        $berkasSurat = BerkasSurat::with('pengajuanSurat')->latest()->get();
        return view('admin.berkas-surat', compact('berkasSurat'));
    }

    public function show($id)
    {
        $berkas = BerkasSurat::findOrFail($id);
        return view('admin.detail-berkas', compact('berkas'));
    }

    // Upload TTD & Stempel
    public function uploadTtdStempel(Request $request)
    {
        $request->validate([
            'tanda_tangan' => 'required|image|mimes:png,jpg,jpeg|max:2048',
            'stempel' => 'required|image|mimes:png,jpg,jpeg|max:2048',
        ]);

        $ttdPath = $request->file('tanda_tangan')->store('public/tanda_tangan');
        $stempelPath = $request->file('stempel')->store('public/stempel');

        // Update semua berkas di tabel
        BerkasSurat::query()->update([
            'tanda_tangan' => $ttdPath,
            'stempel' => $stempelPath,
        ]);

        return redirect()->back()->with('success', 'TTD & Stempel berhasil diupload untuk semua berkas.');
}


    public function konfirmasi($id)
    {
        $berkas = BerkasSurat::with('pengajuanSurat')->findOrFail($id);

        if (!$berkas->no_surat) {
            return back()->with('error', 'Nomor surat belum tersedia.');
        }


        // Update status diterima
        $berkas->pengajuanSurat->update(['status' => 'diterima']);

        $docxPath = storage_path('app/public/' . $berkas->file_surat);
        if (!file_exists($docxPath)) {
            return back()->with('error', 'File surat tidak ditemukan.');
        }

        $template = new TemplateProcessor($docxPath);

        // Sisipkan TTD
        if ($berkas->tanda_tangan && file_exists(storage_path('app/public/' . $berkas->tanda_tangan))) {
            $template->setImageValue('tanda_tangan', [
                'path' => storage_path('app/public/' . $berkas->tanda_tangan),
                'width' => 120,
                'height' => 80,
                'ratio' => false,
            ]);
        }

        // Sisipkan Stempel
        if ($berkas->stempel && file_exists(storage_path('app/public/' . $berkas->stempel))) {
            $template->setImageValue('stempel', [
                'path' => storage_path('app/public/' . $berkas->stempel),
                'width' => 100,
                'height' => 100,
                'ratio' => false,
            ]);
        }

        // Diverifikasi oleh
        $namaKepalaDesa = Auth::user()->username ?? '';
        $template->setValue('diverifikasi', 'Diverifikasi oleh: Kepala Desa Wiramastra' . $namaKepalaDesa);

        // Generate QR Code dari detail + unique ID

        $qrContent = "Nomor Surat: {$berkas->no_surat}\n";
        $qrContent .= "Nama Pemohon: " . ($berkas->pengajuanSurat->nama ?? '-') . "\n";
        $qrContent .= "Jenis Surat: " . ($berkas->pengajuanSurat->jenis_surat ?? '-') . "\n";
        $qrContent .= "Tanggal: " . now()->format('d-m-Y') . "\n";
        $qrContent .= "Diverifikasi oleh: Kepala Desa " . $namaKepalaDesa;

        $qrPath = storage_path('app/public/qrcode_' . $berkas->id . '.png');
        QrCode::format('png')->size(200)->generate($qrContent, $qrPath);

        if (file_exists($qrPath)) {
            $template->setImageValue('qrcode', [
                'path' => $qrPath,
                'width' => 120,
                'height' => 120,
                'ratio' => false,
            ]);
        }

        // Simpan ulang DOCX
        $template->saveAs($docxPath);

        // Salin ke folder public untuk download
        $folderPublic = $_SERVER['DOCUMENT_ROOT'] . '/storage/generated/';
        if (!file_exists($folderPublic)) mkdir($folderPublic, 0775, true);
        copy($docxPath, $folderPublic . basename($docxPath));

        $berkas->update(['file_surat' => 'generated/' . basename($docxPath)]);

        return redirect()->back()->with('success', 'Surat berhasil dikonfirmasi, QR Code & TTD/Stempel disisipkan.');
    }

    public function downloadSurat(BerkasSurat $berkas)
    {
        $path = storage_path('app/public/' . $berkas->file_surat);
        if (!file_exists($path)) abort(404, 'File surat tidak ditemukan.');
        return response()->download($path, 'Surat_' . $berkas->pengajuan_surat_id . '.docx');
    }

    public function previewDocx(BerkasSurat $berkas)
    {
        $fileUrl = asset('storage/' . $berkas->file_surat);
        if (!file_exists(storage_path('app/public/' . $berkas->file_surat))) {
            return back()->with('error', 'File tidak ditemukan.');
        }
        $googleViewer = "https://docs.google.com/viewer?url={$fileUrl}&embedded=true";
        return redirect()->away($googleViewer);
    }

    public function tolak(Request $request, BerkasSurat $berkas)
    {
        $request->validate(['keterangan' => 'required|string|max:255'], [
            'keterangan.required' => 'Alasan Penolakan wajib diisi'
        ]);

        $berkas->pengajuanSurat->update([
            'status' => 'ditolak',
            'keterangan' => $request->keterangan,
        ]);

        $berkas->delete();

        return back()->with('success', 'Pengajuan surat berhasil ditolak');
    }
}
