@extends('layouts.d-app') 

@section('content')
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">

          {{-- Statistik Surat --}}
          <div class="row">
            <div class="col-md-6 col-xl-3 mb-4">
              <div class="card shadow bg-primary text-white border-0">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-3 text-center">
                      <i class="fe fe-mail fe-24 text-white"></i>
                    </div>
                    <div class="col">
                      <p class="small text-light mb-0">Total Surat</p>
                      <span class="h4 mb-0 text-white">{{ $totalSurat }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-xl-3 mb-4">
              <div class="card shadow border-0">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-3 text-center">
                      <i class="fe fe-check-circle fe-24 text-success"></i>
                    </div>
                    <div class="col">
                      <p class="small text-muted mb-0">Disetujui</p>
                      <span class="h4 mb-0">{{ $suratSelesai }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-xl-3 mb-4">
              <div class="card shadow border-0">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-3 text-center">
                      <i class="fe fe-x-circle fe-24 text-danger"></i>
                    </div>
                    <div class="col">
                      <p class="small text-muted mb-0">Ditolak</p>
                      <span class="h4 mb-0">{{ $suratDitolak }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-md-6 col-xl-3 mb-4">
              <div class="card shadow border-0">
                <div class="card-body">
                  <div class="row align-items-center">
                    <div class="col-3 text-center">
                      <i class="fe fe-loader fe-24 text-warning"></i>
                    </div>
                    <div class="col">
                      <p class="small text-muted mb-0">Diproses</p>
                      <span class="h4 mb-0">{{ $suratDiproses }}</span>
                    </div>
                  </div>
                </div>
              </div>
            </div>
          </div>

          {{-- Selamat Datang + Tombol Ajukan --}}
          <div class="card shadow mb-4">
            <div class="card-body d-flex flex-column flex-md-row justify-content-between align-items-md-center">
              <div>
                <h5 class="mb-0">Selamat datang, {{ Auth::user()->nama }}!</h5>
                <p class="text-muted mb-0">NIK: {{ Auth::user()->nik }}</p>
              </div>
              <div class="mt-3 mt-md-0">
                <a href="{{ route('ajukan-surat.create') }}" class="btn btn-primary">
                  <i class="fe fe-plus"></i> Ajukan Surat
                </a>
              </div>
            </div>
          </div>

          {{-- Alur Ajukan Surat --}}
          <div class="card shadow mb-4 border-0">
            <div class="card-body">
              <h5 class="mb-4">Alur Pengajuan Surat</h5>

              <div class="row text-center">
                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-primary">
                      <i class="fe fe-edit fe-24"></i>
                    </div>
                    <h6 class="mb-1">1. Ajukan</h6>
                    <p class="small text-muted mb-0">Klik <strong>Ajukan Surat</strong> pada dashboard.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-info">
                      <i class="fe fe-layers fe-24"></i>
                    </div>
                    <h6 class="mb-1">2. Pilih Surat</h6>
                    <p class="small text-muted mb-0">Pilih jenis surat yang diperlukan.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-warning">
                      <i class="fe fe-upload fe-24"></i>
                    </div>
                    <h6 class="mb-1">3. Upload</h6>
                    <p class="small text-muted mb-0">Unggah berkas dan isi form keterangan.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-success">
                      <i class="fe fe-send fe-24"></i>
                    </div>
                    <h6 class="mb-1">4. Kirim</h6>
                    <p class="small text-muted mb-0">Kirim data dan tunggu verifikasi.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-secondary">
                      <i class="fe fe-refresh-cw fe-24"></i>
                    </div>
                    <h6 class="mb-1">5. Diproses</h6>
                    <p class="small text-muted mb-0">Permohonan diproses oleh admin desa.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-success">
                      <i class="fe fe-check-circle fe-24"></i>
                    </div>
                    <h6 class="mb-1">6. Selesai</h6>
                    <p class="small text-muted mb-0">Surat siap diambil atau diunduh.</p>
                  </div>
                </div>
              </div>

              <div class="alert alert-info mt-4 mb-0">
                <i class="fe fe-info mr-1"></i>
                Pastikan data dan dokumen yang Anda upload sesuai agar proses pengajuan tidak tertunda.
              </div>
            </div>
          </div>



          {{-- Profil Desa untuk Pelayanan Surat Online --}}
          <div class="card shadow mb-4 border-0">
            <div class="card-body">
              <div class="d-flex align-items-center mb-4">
                <h5 class="mb-0">Profil Desa Wiramastra</h5>
              </div>

              <div class="row">
                <div class="col-md-6 mb-3">
                  <ul class="list-unstyled mb-0">
                    <li class="mb-2">
                      <i class="fe fe-map fe-16 text-muted mr-2"></i>
                      <strong>Nama Desa:</strong> Wiramastra
                    </li>
                    <li class="mb-2">
                      <i class="fe fe-globe fe-16 text-muted mr-2"></i>
                      <strong>Kecamatan:</strong> Bawang, Kabupaten Banjarnegara
                    </li>
                    <li class="mb-2">
                      <i class="fe fe-home fe-16 text-muted mr-2"></i>
                      <strong>Provinsi:</strong> Jawa Tengah
                    </li>
                   
                    <li class="mb-2">
                      <i class="fe fe-user fe-16 text-muted mr-2"></i>
                      <strong>Kepala Desa:</strong> Bpk. Muthowim
                    </li>
                  </ul>
                </div>

                <div class="col-md-6 mb-3">
                  <ul class="list-unstyled mb-0">
                    <li class="mb-2">
                      <i class="fe fe-map-pin fe-16 text-muted mr-2"></i>
                      <strong>Alamat Kantor:</strong> Jl. Raya Pucang-kebondalem Km.08
                    </li>
                    <li class="mb-2">
                      <i class="fe fe-clock fe-16 text-muted mr-2"></i>
                      <strong>Jam Pelayanan:</strong> Senin–Jumat, 08.00–15.00 WIB
                    </li>
                    <li class="mb-2">
                      <i class="fe fe-cpu fe-16 text-muted mr-2"></i>
                      <strong>Jenis Layanan:</strong> Pembuatan Surat Keterangan, Pengantar, dan lainnya
                    </li>
                     <li class="mb-2">
                      <i class="fe fe-users fe-16 text-muted mr-2"></i>
                      <strong>Jumlah Penduduk:</strong> ± 3.100 jiwa
                    </li>
                    
                  </ul>
                </div>
              </div>

              <div class="alert alert-info mt-4 mb-0">
                <i class="fe fe-info mr-2"></i>
                <strong>Pelayanan surat desa kini lebih mudah!</strong> Warga dapat mengajukan surat secara online tanpa harus datang langsung ke kantor desa.
              </div>
            </div>
          </div>


          {{-- Kontak Admin Jika Lupa Password --}}
          <div class="card shadow mb-4">
            <div class="card-body">
              <h5 class="mb-3">Hubungi Admin (Bantuan)</h5>

              @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
              @endif

              <form action="{{ route('pengguna.kirimPesan') }}" method="POST">
                @csrf
                <div class="form-group">
                  <label for="subjek">Subjek</label>
                  <input type="text" class="form-control" name="subjek" required>
                </div>
                <div class="form-group">
                  <label for="isi">Pesan</label>
                  <textarea class="form-control" name="isi" rows="4" required></textarea>
                </div>
                <button type="submit" class="btn btn-success text-white">
                  <i class="fe fe-message-circle"></i> Kirim via WhatsApp
                </button>
              </form>
            </div>
          </div>



        </div>
      </div>
    </div>
  </main>
@endsection