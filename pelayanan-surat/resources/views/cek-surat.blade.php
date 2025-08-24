@extends('layouts.app') {{-- atau layouts.public, sesuaikan dengan punyamu --}}

@section('content')
<div class="container mx-auto px-4 py-6">
    <div class="bg-white shadow-lg rounded-2xl p-6">

        {{-- Logo Desa --}}
        <div class="flex justify-center mb-4">
            <img src="{{ asset('assets/images/logo.png') }}" alt="Logo Desa" style="width: 80px; height: auto;">
        </div>

        <h1 class="text-2xl font-bold mb-4 text-center text-green-700">
            Verifikasi Surat Resmi Desa Wiramastra
        </h1>

        <div class="border rounded-xl p-4 bg-gray-50 mb-6">
            <p class="mb-2"><strong>Nomor Surat:</strong> {{ $berkas->no_surat }}</p>
            <p class="mb-2"><strong>Nama Pemohon:</strong> {{ $berkas->pengajuanSurat->nama ?? '-' }}</p>
            <p class="mb-2"><strong>Jenis Surat:</strong> {{ $berkas->pengajuanSurat->nama_jenis_surat ?? '-' }}</p>
            <p class="mb-2"><strong>Tanggal Pengajuan:</strong> {{ $berkas->created_at->format('l, d F Y H:i') }}</p>
            <p class="mb-2"><strong>Status:</strong> 
                @if($berkas->pengajuanSurat->status === 'diterima')
                    <span class="text-green-600 font-semibold">SAH (Diverifikasi)</span>
                @else
                    <span class="text-red-600 font-semibold">Tidak Sah</span>
                @endif
            </p>
        </div>

        <div class="flex flex-col items-center">
            <p class="text-gray-600 mb-2">Scan QR Code berikut untuk memverifikasi:</p>
            <img src="{{ asset('storage/qrcode_' . $berkas->id . '.png') }}" 
                 alt="QR Code Surat" class="w-40 h-40 mb-4">

            <a href="{{ asset('storage/' . $berkas->file_surat) }}" 
               class="px-4 py-2 bg-green-600 text-white rounded-lg shadow hover:bg-green-700 transition">
                📄 Unduh Surat
            </a>
        </div>
    </div>
</div>
@endsection
