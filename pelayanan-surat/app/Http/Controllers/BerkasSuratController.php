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

        $docxPath = storage_path('app/public/' . $berkas->file_surat);
        if (!file_exists($docxPath)) {
            return back()->with('error', 'File surat tidak ditemukan di: ' . $docxPath);
        }

        $template = new TemplateProcessor($docxPath);

        /*
        // ------------------------------
        // Cek & sisipkan TTD
        // ------------------------------
        if (empty($berkas->tanda_tangan)) {
            return back()->with('error', 'Tanda tangan belum diupload.');
        }
        $ttdFullPath = storage_path('app/' . $berkas->tanda_tangan);
        if (!file_exists($ttdFullPath)) {
            return back()->with('error', 'File tanda tangan tidak ditemukan: ' . $ttdFullPath);
        }
        $template->setImageValue('tanda_tangan', [
            'path' => $ttdFullPath,
            'width' => 150,
            'height' => 100,
            'ratio' => false, 
            'marginLeft' => -50,
        ]);


        // ------------------------------
        // Cek & sisipkan Stempel
        // ------------------------------
        if (empty($berkas->stempel)) {
            return back()->with('error', 'Stempel belum diupload.');
        }
        $stempelFullPath = storage_path('app/' . $berkas->stempel);
        if (!file_exists($stempelFullPath)) {
            return back()->with('error', 'File stempel tidak ditemukan: ' . $stempelFullPath);
        }
        $template->setImageValue('stempel', [
            'path' => $stempelFullPath,
            'width' => 100,
            'height' => 100,
            'ratio' => false,
            'marginLeft' => 0,
        ]);

        */
        // ------------------------------
        // Diverifikasi oleh
        // ------------------------------
        $namaKepalaDesa = Auth::user()->username ?? '';
        $template->setValue('diverifikasi', 'Diverifikasi oleh: Kepala Desa Wiramastra ' . $namaKepalaDesa);

        // ------------------------------
        // QR Code
        // ------------------------------
        $qrContent = "Nomor Surat: {$berkas->no_surat}\n";
        $qrContent .= "Nama Pemohon: " . ($berkas->pengajuanSurat->nama ?? '-') . "\n";
        $qrContent .= "Jenis Surat: " . ($berkas->pengajuanSurat->jenis_surat ?? '-') . "\n";
        $qrContent .= "Tanggal: " . now()->format('d-m-Y') . "\n";
        $qrContent .= "Diverifikasi oleh: Kepala Desa " . $namaKepalaDesa;

        $qrPath = storage_path('app/public/qrcode_' . $berkas->id . '.png');
        QrCode::format('png')->size(400)->generate($qrContent, $qrPath);

        if (!file_exists($qrPath)) {
            return back()->with('error', 'Gagal generate QR Code di: ' . $qrPath);
        }

        $template->setImageValue('qrcode', [
            'path' => $qrPath,
            'width' => 200,
            'height' => 200,
            'ratio' => false,
        ]);

        // ------------------------------
        // Simpan DOCX
        // ------------------------------
        $template->saveAs($docxPath);

        $publicFolder = $_SERVER['DOCUMENT_ROOT'] . '/storage/generated/';
        if (!file_exists($publicFolder)) mkdir($publicFolder, 0775, true);

        $publicFilePath = $publicFolder . basename($docxPath);
        copy($docxPath, $publicFilePath);

        // Update path file di database relatif ke folder storage
        $berkas->update(['file_surat' => 'generated/' . basename($docxPath)]);

        // Update status diterima
        $berkas->pengajuanSurat->update(['status' => 'diterima']);

        return redirect()->back()->with('success', 'Surat berhasil dikonfirmasi, TTD, Stempel, & QR Code berhasil disisipkan.');
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
