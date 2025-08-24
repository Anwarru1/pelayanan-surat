<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Cek Surat - {{ $berkas->no_surat }}</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">
    <div class="container py-5">
        <div class="card shadow-lg mx-auto" style="max-width: 500px;"> {{-- card diperkecil --}}
            <div class="card-body">

                {{-- Logo Desa --}}
                <div class="text-center mb-3">
                    <img src="{{ asset('assets/images/logo.png') }}" 
                         alt="Logo Desa" 
                         class="img-fluid" 
                         style="width: 70px; height: auto;"> {{-- logo lebih kecil --}}
                </div>

                <h1 class="h5 text-center text-success mb-4 fw-bold">
                    Verifikasi Surat Resmi Desa Wiramastra
                </h1>

                <div class="border rounded p-3 bg-light mb-4">
                    <p class="mb-2"><strong>Nomor Surat:</strong> {{ $berkas->no_surat }}</p>
                    <p class="mb-2"><strong>Nama Pemohon:</strong> {{ $berkas->pengajuanSurat->nama ?? '-' }}</p>
                    <p class="mb-2"><strong>Jenis Surat:</strong> {{ $berkas->pengajuanSurat->nama_jenis_surat ?? '-' }}</p>
                    <p class="mb-2"><strong>Tanggal Pengajuan:</strong> {{ $berkas->created_at->format('l, d F Y H:i') }}</p>
                    <p class="mb-2"><strong>Status:</strong> 
                        @if($berkas->pengajuanSurat->status === 'diterima')
                            <span class="text-success fw-semibold">✅ SAH (Diverifikasi)</span>
                        @else
                            <span class="text-danger fw-semibold">❌ Tidak Sah</span>
                        @endif
                    </p>
                </div>

                <div class="text-center">
                    <a href="{{ asset('storage/' . $berkas->file_surat) }}" 
                       class="btn btn-success">
                        📄 Unduh Surat
                    </a>
                </div>

            </div>
        </div>
    </div>
</body>
</html>
