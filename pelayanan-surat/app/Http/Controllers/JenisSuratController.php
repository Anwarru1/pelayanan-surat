<?php

namespace App\Http\Controllers;

use App\Models\JenisSurat;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class JenisSuratController extends Controller
{
     public function index()
    {
        $jenisSurat = JenisSurat::all();
        return view('admin.jenis-surat', compact('jenisSurat'));
    }

    public function create()
    {
        return view('admin.jenis-surat.create');
    }

    public function store(Request $request)
    {
        $request->validate([
            'kode_surat'         => 'required|string|max:10',
            'nama_jenis_surat'   => 'required|string|max:100',
            'syarat'             => 'required|array|min:1',
            'syarat.*'           => 'required|string|max:255',
            'syarat_tipe'        => 'required|array',
            'syarat_tipe.*'      => 'required|in:text,file',
            'template'           => 'required|file|mimes:docx|max:2048',
            'keterangan_default' => 'nullable|string',
        ], [
            'kode_surat.required'       => 'Kode Surat wajib diisi',
            'nama_jenis_surat.required' => 'Nama Jenis Surat wajib diisi',
            'syarat.required'           => 'Minimal harus ada 1 syarat',
            'syarat.*.required'         => 'Setiap syarat tidak boleh kosong',
            'template.mimes'            => 'Template harus berupa file .docx',
        ]);

        $syarat = [];
        foreach ($request->syarat as $i => $nama) {
            $syarat[] = [
                'nama' => $nama,
                'tipe' => $request->syarat_tipe[$i] ?? 'text',
            ];
        }
        
        $templatePath = $request->file('template')->store('templates', 'public');

        JenisSurat::create([
            'kode_surat'         => $request->kode_surat,
            'nama_jenis_surat'   => $request->nama_jenis_surat,
            'syarat'             => $request->syarat,
            'template'           => $templatePath,
            'keterangan_default' => $request->keterangan_default
        ]);

        return redirect()->route('jenis-surat.index')->with('success', 'Jenis surat berhasil ditambahkan');
    }

    public function edit($id)
    {
        $jenisSurat = JenisSurat::findOrFail($id);
        return view('jenis-surat.edit', compact('jenisSurat'));
    }

    public function update(Request $request, $id)
    {
        $jenisSurat = JenisSurat::findOrFail($id);

        $request->validate([
            'kode_surat'         => 'required|string|max:10,'. $id,
            'nama_jenis_surat'   => 'required|string',
            'syarat'             => 'required|array|min:1',
            'syarat.*.nama'      => 'required|string',
            'syarat.*.tipe'      => 'required|string|in:text,file',
            'template'           => 'nullable|file|mimes:docx',
            'keterangan_default' => 'nullable|string',
        ]);

        $syarat = array_map(function ($item) {
            return [
                'nama' => $item['nama'] ?? '',
                'tipe' => $item['tipe'] ?? 'text',
            ];
        }, $request->syarat);

        $data = [
            'kode_surat'         => $request->kode_surat,
            'nama_jenis_surat'   => $request->nama_jenis_surat,
            'syarat'             => $request->syarat,
            'keterangan_default' => $request->keterangan_default,
        ];

        if ($request->hasFile('template')) {
            Storage::disk('public')->delete($jenisSurat->template);
            $data['template'] = $request->file('template')->store('templates', 'public');
        }

        $jenisSurat->update($data);

        return redirect()->route('jenis-surat.index')->with('success', 'Jenis surat berhasil diperbarui');
    }

    public function destroy($id)
    {
        $jenisSurat = JenisSurat::findOrFail($id);
    
        // Cek apakah masih dipakai di pengajuan surat
        if ($jenisSurat->pengajuanSurats()->exists()) {
            return redirect()->route('jenis-surat.index')
                ->with('error', 'Jenis surat tidak bisa dihapus karena masih dipakai pada pengajuan surat.');
        }
    
        // Hapus file template kalau ada
        if ($jenisSurat->template) {
            Storage::disk('public')->delete($jenisSurat->template);
        }
    
        $jenisSurat->delete();
    
        return redirect()->route('jenis-surat.index')->with('success', 'Jenis surat berhasil dihapus');
    }


    public function updateTemplate(Request $request, JenisSurat $jenisSurat)
    {
        $request->validate([
            'template' => 'required|file|mimes:docx'
        ]);
        
        // Hapus template lama jika ada
        if ($jenisSurat->template) {
            Storage::delete($jenisSurat->template);
        }
        
        // Simpan template baru
        $path = $request->file('template')->store('templates');
        
        $jenisSurat->update([
            'template' => $path
        ]);
        
        return back()->with('success', 'Template berhasil diperbarui');
    }
    
    public function getSyaratWithDefault($id)
    {
        $jenis = JenisSurat::findOrFail($id);
        $syarat = json_decode($jenis->syarat, true) ?? [];

        foreach ($syarat as &$item) {
            if (
                isset($item['tipe'], $item['nama']) &&
                $item['tipe'] === 'text' &&
                strtolower($item['nama']) === 'keterangan'
            ) {
                $item['value'] = $jenis->keterangan_default;
            }
        }

        return response()->json([
            'syarat' => $syarat
        ]);
    }
}
