<?php

namespace App\Http\Controllers;

use App\Models\BerkasSurat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;
use App\Models\PengajuanSurat;
use PhpOffice\PhpWord\TemplateProcessor;

class BerkasSuratController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        \Carbon\Carbon::setLocale('id');
        $berkasSurat = BerkasSurat::with('pengajuanSurat')->get();
        return view('admin.berkas-surat', compact('berkasSurat'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     */
    public function show($id)
    {
    $berkas = BerkasSurat::findOrFail($id);
    return view('admin.detail-berkas', compact('berkas'));
    }


    /**
     * Show the form for editing the specified resource.
     */
    public function edit(BerkasSurat $berkasSurat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, BerkasSurat $berkasSurat)
    {
        $request->validate([
            'tanda_tangan' => 'nullable|image|mimes:png|max:2048',
            'stempel' => 'nullable|image|mimes:png|max:2048'
        ]);

        if ($request->hasFile('tanda_tangan')) {
            // Hapus yang lama
            if ($berkasSurat->tanda_tangan) {
                Storage::delete('public/' . $berkasSurat->tanda_tangan);
            }
            
            // Simpan yang baru
            $path = $request->file('tanda_tangan')
                    ->store('tanda-tangan', 'public');
            $berkasSurat->tanda_tangan = $path;
        }

        if ($request->hasFile('stempel')) {
            if ($berkasSurat->stempel) {
                Storage::delete('public/' . $berkasSurat->stempel);
            }
            
            $path = $request->file('stempel')
                    ->store('stempel', 'public');
            $berkasSurat->stempel = $path;
        }

        $berkasSurat->save();

        return back()->with('success', 'Berkas surat berhasil diperbarui');
    }


    /**
     * Remove the specified resource from storage.
     */
    public function destroy(BerkasSurat $berkasSurat)
    {
        //
    }

    public function preview(BerkasSurat $berkas)
    {
        $pdfPath = storage_path('app/public/' . $berkas->file_surat);

        if (!file_exists($pdfPath)) {
            abort(404, 'File surat tidak ditemukan.');
        }

        return response()->file($pdfPath, [
            'Content-Type' => 'application/pdf',
            'Content-Disposition' => 'inline; filename="' . basename($pdfPath) . '"'
        ]);
    }

    public function konfirmasi($id)
    {
        $berkas = BerkasSurat::with('pengajuanSurat')->findOrFail($id);

        // Update status pengajuan menjadi selesai
        $berkas->pengajuanSurat->update([
            'status' => 'diterima',
        ]);

        return redirect()->back()->with('success', 'Surat berhasil dikonfirmasi.');
    }

    public function tolak(Request $request, BerkasSurat $berkas)
    {
        $request->validate([
            'keterangan' => 'required|string|max:255'
        ], [
            'keterangan.required' => 'Alasan Penolakan wajib diisi'
        ]);

        // Update status pengajuan menjadi ditolak dan simpan alasan
        $pengajuan = $berkas->pengajuanSurat;
        $pengajuan->update([
            'status' => 'ditolak',
            'keterangan' => $request->keterangan,
        ]);

        // Hapus berkas jika diperlukan (opsional)
        // Storage::delete('public/' . $berkas->file_surat);
        //$berkas->delete(); // Hapus berkas surat dari tabel

        return back()->with('success', 'Pengajuan surat berhasil ditolak');
    }


}
