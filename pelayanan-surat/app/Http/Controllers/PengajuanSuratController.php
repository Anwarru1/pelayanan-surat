<?php

namespace App\Http\Controllers;

use App\Models\PengajuanSurat;
use App\Models\JenisSurat;
use App\Models\Pengguna;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\BerkasSurat;
use PhpOffice\PhpWord\TemplateProcessor;
use Illuminate\Support\Str;
use Illuminate\Support\Facades\File;


class PengajuanSuratController extends Controller
{
    public function index()
    {
        \Carbon\Carbon::setLocale('id');
        $pengajuan = PengajuanSurat::with(['jenisSurat', 'pengguna'])->latest()->get();
        return view('admin.pengajuan-surat', compact('pengajuan'));
    }

    public function create()
    {
        $ajukan = JenisSurat::all();
        return view('pengguna.ajukan-surat', compact('ajukan'));
    }

    public function store(Request $request)
    {
        $request->validate([
            'jenis_surat_id' => 'required|exists:jenis_surat,id',
            'syarat'          => 'required|array',
        ]);

        $berkasSyarat = [];

        foreach ($request->syarat as $item) {
            $nama = $item['nama'] ?? null;
            $tipe = $item['tipe'] ?? 'text';
            $value = $item['value'] ?? null;

            if ($tipe === 'file' && $value instanceof \Illuminate\Http\UploadedFile) {
                $cleanName = str_replace([' ', '/', '\\'], '_', $nama);
                $fileName = now()->timestamp . '-' . $cleanName . '.' . $value->getClientOriginalExtension();
                $destinationPath = base_path('../storage/syarat-pengajuan');
                if (!file_exists($destinationPath)) {
                    mkdir($destinationPath, 0755, true);
                }
                $value->move($destinationPath, $fileName);
                $path = 'storage/syarat-pengajuan/' . $fileName;


                $berkasSyarat[] = [
                    'nama'  => $nama,
                    'tipe'  => 'file',
                    'value' => $path
                ];
            } else {
                $berkasSyarat[] = [
                    'nama'  => $nama,
                    'tipe'  => 'text',
                    'value' => $value
                ];
            }
        }

        $jenis = JenisSurat::findOrFail($request->jenis_surat_id);

        PengajuanSurat::create([
            'pengguna_id'       => Auth::id(),
            'jenis_surat_id'    => $jenis->id,
            'nama_jenis_surat'  => $jenis->nama_jenis_surat,
            'nama'              => Auth::user()->nama,
            'data_tambahan'     => json_encode($berkasSyarat),
            'tanggal'           => Carbon::now(),
            'status'            => 'menunggu',
        ]);

        return redirect()->route('ajukan-surat.create')->with('success', 'Pengajuan surat berhasil dikirim');
    }

    public function updateStatus(Request $request, PengajuanSurat $pengajuanSurat)
    {
        $request->validate([
            'status'     => 'required|in:menunggu,diproses,selesai,ditolak',
            'keterangan' => 'nullable|string'
        ]);

        $pengajuanSurat->update([
            'status'     => $request->status,
            'keterangan' => $request->keterangan
        ]);

        return back()->with('success', 'Status pengajuan berhasil diperbarui');
    }

    public function tolak(Request $request, PengajuanSurat $pengajuanSurat)
    {
        $request->validate([
            'keterangan' => 'required|string|max:255'
        ], [
            'keterangan.required' => 'Alasan Penolakan wajib diisi'
        ]);

        $pengajuanSurat->update([
            'status'     => 'ditolak',
            'keterangan' => $request->keterangan
        ]);

        return redirect()->back()->with('success', 'Pengajuan surat ditolak.');
    }

    public function terima(Request $request, PengajuanSurat $pengajuanSurat)
    {
        $request->validate([
            'keterangan' => 'nullable|string'
        ]);

        $pengajuanSurat->update([
            'status'     => $request->status,
            'keterangan' => $request->keterangan
        ]);

        if ($request->status === 'diproses') {
            BerkasSurat::create([
                'pengajuan_surat_id' => $pengajuanSurat->id,
                'no_surat'           => '',
                'tanggal_diajukan'   => $pengajuanSurat->tanggal,
                'file_surat'         => ''
            ]);

            $this->generateAndSaveDocx($pengajuanSurat);
        }

        return back()->with('success', 'Status pengajuan berhasil diperbarui');
    }


    public function generateAndSaveDocx(PengajuanSurat $pengajuan)
    {
        $user        = $pengajuan->pengguna;
        $rawTambahan = json_decode($pengajuan->data_tambahan, true);
        $tambahan    = [];
    
        foreach ($rawTambahan as $item) {
            if (isset($item['nama'], $item['value'])) {
                $tambahan[$item['nama']] = is_scalar($item['value']) ? $item['value'] : '';
            }
        }
    
        \Carbon\Carbon::setLocale('id');
    
        // Nomor surat
        $bulanRomawi = [1=>'I',2=>'II',3=>'III',4=>'IV',5=>'V',6=>'VI',7=>'VII',8=>'VIII',9=>'IX',10=>'X',11=>'XI',12=>'XII'];
        $kodeSurat   = $pengajuan->jenisSurat->kode_surat ?? '000';
        $nomorUrut   = $pengajuan->nomor_urutan ?? 'XXX';
        $bulan       = $bulanRomawi[Carbon::now()->month];
        $tahun       = Carbon::now()->year;
        $no_surat    = "{$kodeSurat}/{$nomorUrut}/{$bulan}/{$tahun}";
    
        // Gabungkan data pengguna + tambahan
        $data = array_merge(
            $user->only(['nama', 'nik', 'alamat', 'tmp_lahir', 'agama', 'status', 'j_kel', 'pekerjaan']),
            [
                'tgl_lahir' => \Carbon\Carbon::parse($user->tgl_lahir)->format('d-m-Y'),
                'tanggal'   => now()->translatedFormat('d F Y'),
                'no_surat'  => $no_surat
            ],
            $tambahan
        );
    
        // Template DOCX
        $templatePath = storage_path('app/public/' . $pengajuan->jenisSurat->template);
        if (!file_exists($templatePath)) {
            abort(404, 'Template surat tidak ditemukan.');
        }
    
        // Folder storage sementara
        $folderStorage = storage_path('app/public/generated/');
        if (!file_exists($folderStorage)) mkdir($folderStorage, 0775, true);
    
        $docxFileName = "surat_{$pengajuan->id}_" . Str::uuid() . ".docx";
        $docxPathStorage = $folderStorage . $docxFileName;
    
        // Generate DOCX ke storage
        $templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templatePath);
        foreach ($data as $key => $value) {
            $templateProcessor->setValue($key, $value);
        }
        $templateProcessor->saveAs($docxPathStorage);
    
        // Folder publik (public_html/storage/generated)
        $folderPublic = $_SERVER['DOCUMENT_ROOT'] . '/storage/generated/';
        if (!file_exists($folderPublic)) mkdir($folderPublic, 0775, true);
    
        $docxPathPublic = $folderPublic . $docxFileName;
    
        // Copy ke public
        if (!copy($docxPathStorage, $docxPathPublic)) {
            Log::error("Gagal menyalin file ke public: {$docxPathPublic}");
        }
    
        // Simpan path relatif di DB
        $berkas = \App\Models\BerkasSurat::where('pengajuan_surat_id', $pengajuan->id)->first();
        if ($berkas) {
            $berkas->update([
                'file_surat' => "generated/{$docxFileName}", // path relatif untuk asset()
                'no_surat'   => $no_surat,
            ]);
        }
    }


    




    public function downloadDocx(PengajuanSurat $pengajuan)
    {
        $berkas = $pengajuan->berkasSurat;
        if (!$berkas || !$berkas->file_surat) {
            return back()->with('error', 'File surat belum tersedia.');
        }
    
        $path = storage_path("app/public/{$berkas->file_surat}");
    
        if (!file_exists($path)) {
            return back()->with('error', 'File surat tidak ditemukan.');
        }
    
        return response()->download($path, 'Surat_' . $pengajuan->id . '.docx');
    }


    public function previewDocx(PengajuanSurat $pengajuan)
    {
        $berkas = $pengajuan->berkasSurat;
        if (!$berkas || !$berkas->file_surat) {
            return back()->with('error', 'File surat belum tersedia.');
        }
    
        $fileUrl = asset('storage/' .$berkas->file_surat); // sudah benar
    
         // cek apakah URL dapat diakses (optional)
        if (!file_exists(storage_path('app/public/' . $berkas->file_surat))) {
            return back()->with('error', 'File tidak ditemukan.');
        }
    
        // Google Docs Viewer
        $googleViewer = "https://docs.google.com/viewer?url={$fileUrl}&embedded=true";
    
        return redirect()->away($googleViewer);
    }



    public function isiNomorUrut(Request $request, PengajuanSurat $pengajuanSurat)
    {
        $request->validate([
            'nomor_urutan' => 'required|numeric',
        ]);

        $pengajuanSurat->update([
            'nomor_urutan' => $request->nomor_urutan,
        ]);

        return redirect()->back()
            ->with('success_nomor', 'Nomor urut berhasil disimpan.')
            ->with('modal_id', 'kelolaModal' . $pengajuanSurat->id);
    }

    public function userList()
    {
        \Carbon\Carbon::setLocale('id');
        $userId = Auth::id();
        $ajukan = PengajuanSurat::where('pengguna_id', $userId)->with(['jenisSurat', 'pengguna'])->get();
        return view('pengguna.list-surat', compact('ajukan'));
    }
    
    public function bulkDelete(Request $request)
    {
        $request->validate([
            'ids' => 'required|array',
            'ids.*' => 'exists:pengajuan_surat,id',
        ]);
    
        try {
            // Ambil semua pengajuan yang dipilih
            $pengajuans = PengajuanSurat::whereIn('id', $request->ids)->get();
    
            foreach ($pengajuans as $pengajuan) {
                // Kalau ada relasi berkasSurat, hapus juga file-nya
                if ($pengajuan->berkasSurat) {
                    $path = storage_path("app/public/" . $pengajuan->berkasSurat->file_surat);
                    if (file_exists($path)) {
                        unlink($path);
                    }
                    $pengajuan->berkasSurat()->delete();
                }
    
                // Hapus pengajuan
                $pengajuan->delete();
            }
    
            return back()->with('success', 'Pengajuan surat terpilih berhasil dihapus.');
        } catch (\Exception $e) {
            Log::error('Bulk delete error: ' . $e->getMessage());
            return back()->with('error', 'Terjadi kesalahan saat menghapus data.');
        }
    }

}
