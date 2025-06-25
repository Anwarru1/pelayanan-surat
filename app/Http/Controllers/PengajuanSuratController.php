<?php

namespace App\Http\Controllers;

use App\Models\PengajuanSurat;
use App\Models\JenisSurat;
use App\Models\Pengguna;
use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use App\Models\BerkasSurat;
use PhpOffice\PhpWord\TemplateProcessor;
use Illuminate\Support\Facades\Log;

class PengajuanSuratController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index()
    {
        \Carbon\Carbon::setLocale('id');
        $pengajuan = PengajuanSurat::with(['jenisSurat', 'pengguna'])->get();
        return view('admin.pengajuan-surat', compact('pengajuan'));
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create() {
        $ajukan = JenisSurat::all();
        return view('pengguna.ajukan-surat', compact('ajukan'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(Request $request)
    {
        $request->validate([
            'jenis_surat_id' => 'required|exists:jenis_surat,id',
            'syarat' => 'required|array',
        ]);

        $berkasSyarat = [];

        foreach ($request->syarat as $namaSyarat => $value) {
            // Input berupa file
            if ($value instanceof \Illuminate\Http\UploadedFile) {
                $cleanName                 = str_replace([' ', '/', '\\'], '_', $namaSyarat);
                $fileName                  = now()->timestamp . '-' . $cleanName . '.' . $value->getClientOriginalExtension();
                $path                      = $value->storeAs('syarat-pengajuan', $fileName, 'public');
                $berkasSyarat[$namaSyarat] = $path;
            }
            // Input berupa teks
            else {
                $berkasSyarat[$namaSyarat] = $value;
            }
        }

        PengajuanSurat::create([
            'pengguna_id'       => Auth::id(),
            'jenis_surat_id'    => $request->jenis_surat_id,
            'nama_jenis_surat'  => JenisSurat::find($request->jenis_surat_id)->nama_jenis_surat,
            'nama'              => Auth::user()->nama,
            'data_tambahan'     => json_encode($berkasSyarat),
            'tanggal'           => Carbon::now(),
            'status'            => 'menunggu',
        ]);

        return redirect()->route('ajukan-surat.create')
            ->with('success', 'Pengajuan surat berhasil dikirim');
    }

    /**
     * Display the specified resource.
     */
    public function show(PengajuanSurat $pengajuanSurat)
    {
        return view('admin.pengajuan-surat', compact('pengajuanSurat'));
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(PengajuanSurat $pelayananSurat)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(Request $request, PengajuanSurat $pelayananSurat)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     */
    public function destroy(PengajuanSurat $pelayananSurat)
    {
        //
    }

    public function userList()
    {
        $ajukan = PengajuanSurat::with(['jenisSurat', 'pengguna'])->get();
        return view('pengguna.list-surat', compact('ajukan'));
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
        ]);

        $pengajuanSurat->update([
            'status'     => 'ditolak',
            'keterangan' => $request->keterangan
        ]);

        return redirect()->back()->with('success', 'Pengajuan surat ditolak dengan alasan.');
    }

    public function terima(Request $request, PengajuanSurat $pengajuanSurat)
    {
        $request->validate([
        'keterangan'     => 'nullable|string'
    ]);

        $pengajuanSurat->update([
            'status'     => $request->status,
            'keterangan' => $request->keterangan
        ]);

        // Jika status diterima, buat berkas surat
        if ($request->status == 'diproses') {
            
            BerkasSurat::create([
                'pengajuan_surat_id' => $pengajuanSurat->id,
                'no_surat'           => '',
                'tanggal_diajukan'   => $pengajuanSurat->tanggal,
                'file_surat'         => ''
            ]);
            
            // Generate PDF dan simpan ke berkas_surat saat status = diproses 
            app(self::class)->generateAndSaveDocx($pengajuanSurat);
        }

        

    return back()->with('success', 'Status pengajuan berhasil diperbarui');
    }

    public function isiNomorUrut(Request $request, PengajuanSurat $pengajuanSurat)
    {
        $request->validate([
            'nomor_urutan' => 'required|numeric',
        ]);

        $pengajuanSurat->update([
            'nomor_urutan' => $request->nomor_urutan,
        ]);

        return redirect()->back()->with('success_nomor', 'Nomor urut berhasil disimpan.')->with('modal_id', 'kelolaModal' . $pengajuanSurat->id);
    }

    public function previewPdf(PengajuanSurat $pengajuan)
    {
        \Carbon\Carbon::setLocale('id');
        $user        = $pengajuan->pengguna;
        $tambahan    = json_decode($pengajuan->data_tambahan, true);

        //Nomor Surat
        $bulanRomawi = [1=>'I',2=>'II',3=>'III',4=>'IV',5=>'V',6=>'VI',7=>'VII',8=>'VIII',9=>'IX',10=>'X',11=>'XI',12=>'XII'];
        $kodeSurat   = $pengajuan->jenisSurat->kode_surat ?? '000';
        $nomorUrut   = $pengajuan->nomor_urutan ?? 'XXX'; // wajib diisi admin sebelum generate
        $bulan       = $bulanRomawi[Carbon::now()->month];
        $tahun       = Carbon::now()->year;
        $no_surat    = "{$kodeSurat}/{$nomorUrut}/{$bulan}/{$tahun}";


        $data = array_merge(
            $user->only(['nama', 'nik', 'alamat', 'tmp_lahir', 'agama', 'status', 'j_kel', 'pekerjaan']),
            [
                'tgl_lahir' => \Carbon\Carbon::parse($user->tgl_lahir)->format('d-m-Y'),
                'tanggal'   => now()->translatedFormat('d F Y'),
                'no_surat'  => $no_surat
            ],
            $tambahan
        );

        $templatePath = storage_path('app/public/' . $pengajuan->jenisSurat->template);
        if (!file_exists($templatePath)) {
            abort(404, 'Template tidak ditemukan.');
        }

        $folder = storage_path('app/public/generated');
        if (!file_exists($folder)) {
            mkdir($folder, 0775, true);
        }

        $docxPath = "$folder/surat_{$pengajuan->id}.docx";
        $pdfPath  = "$folder/surat_{$pengajuan->id}.pdf";

        // Generate DOCX
        $templateProcessor = new \PhpOffice\PhpWord\TemplateProcessor($templatePath);
        foreach ($data as $key => $val) {
            $templateProcessor->setValue($key, $val);
        }
        $templateProcessor->saveAs($docxPath);

        // Konversi ke PDF via LibreOffice
        $libreOfficePath = '"C:\Program Files\LibreOffice\program\soffice.exe"';
        $command         = "$libreOfficePath --headless --convert-to pdf --outdir \"$folder\" \"$docxPath\"";

        exec($command, $output, $status);

        if (!file_exists($pdfPath)) {
            abort(500, 'Gagal mengonversi file ke PDF.');
        }

        // ✅ Tampilkan langsung di browser
        return response()->file($pdfPath, [
            'Content-Type'        => 'application/pdf',
            'Content-Disposition' => 'inline; filename="' . basename($pdfPath) . '"'
        ]);
    }


    public function generateAndSaveDocx(PengajuanSurat $pengajuan)
    {
        $user        = $pengajuan->pengguna;
        \Carbon\Carbon::setLocale('id');

        $tambahan    = json_decode($pengajuan->data_tambahan, true);

        // Nomor Surat
        $bulanRomawi = [1=>'I',2=>'II',3=>'III',4=>'IV',5=>'V',6=>'VI',7=>'VII',8=>'VIII',9=>'IX',10=>'X',11=>'XI',12=>'XII'];
        $kodeSurat   = $pengajuan->jenisSurat->kode_surat ?? '000';
        $nomorUrut   = $pengajuan->nomor_urutan ?? 'XXX';
        $bulan       = $bulanRomawi[\Carbon\Carbon::now()->month];
        $tahun       = \Carbon\Carbon::now()->year;
        $no_surat    = "{$kodeSurat}/{$nomorUrut}/{$bulan}/{$tahun}";

        $data        = array_merge(
            $user->only(['nama', 'nik', 'alamat', 'tmp_lahir', 'agama', 'status', 'j_kel', 'pekerjaan']),
            [
                'tgl_lahir' => \Carbon\Carbon::parse($user->tgl_lahir)->format('d-m-Y'),
                'tanggal'   => now()->translatedFormat('d F Y'),
                'no_surat'  => $no_surat,
            ],
            $tambahan
        );

        $templatePath = storage_path('app/public/' . $pengajuan->jenisSurat->template);
        if (!file_exists($templatePath)) {
            abort(404, 'Template file tidak ditemukan.');
        }

        $folder     = storage_path('app/public/generated');
        if (!file_exists($folder)) {
            mkdir($folder, 0775, true);
        }

        // DOCX & PDF Path
        $docxPath   = "$folder/surat_{$pengajuan->id}.docx";
        $pdfPath    = "$folder/surat_{$pengajuan->id}.pdf";

        // Generate DOCX
        $templateProcessor = new TemplateProcessor($templatePath);
        foreach ($data as $key => $val) {
            $templateProcessor->setValue($key, $val);
        }
        $templateProcessor->saveAs($docxPath);

        // Convert DOCX to PDF
        $libreOfficePath = '"C:\Program Files\LibreOffice\program\soffice.exe"'; // Sesuaikan jika Linux
        $command = "$libreOfficePath --headless --convert-to pdf --outdir \"$folder\" \"$docxPath\"";
        exec($command, $output, $status);

        if (!file_exists($pdfPath)) {
            abort(500, 'Gagal mengonversi file ke PDF.');
        }

        // Simpan ke berkas_surat
        $berkas = BerkasSurat::where('pengajuan_surat_id', $pengajuan->id)->first();
        if ($berkas) {
            $storageRelativePath = 'generated/surat_' . $pengajuan->id . '.pdf';
            $berkas->update([
                'file_surat' => $storageRelativePath,
                'no_surat'   => $no_surat,
            ]);
        }

        return response()->file($pdfPath, [
            'Content-Type'        => 'application/pdf',
            'Content-Disposition' => 'inline; filename="surat.pdf"'
        ]);
    }





}
