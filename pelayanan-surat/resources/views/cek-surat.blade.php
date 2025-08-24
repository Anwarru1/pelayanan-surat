<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Cek Surat - {{ $berkas->no_surat }}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="card shadow-lg">
            <div class="card-body">


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
                    <a href="{{ asset('storage/' . $berkas->file_surat) }}" 
                    class="px-4 py-2 bg-green-600 text-white rounded-lg shadow hover:bg-green-700 transition">
                        📄 Unduh Surat
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
