@extends('layouts.d-app') 

@section('content')
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">


          {{-- Selamat Datang + Tombol Ajukan --}}
          <div class="card shadow mb-4">
            <div class="card-body">

              {{-- Info Merah di atas --}}
              <div class="alert alert-danger mb-4">
                <i class="fe fe-info mr-1"></i>
                Segera lengkapi data dan dokumen yang diperlukan agar proses verifikasi tidak tertunda 
                agar kamu bisa mengajukan surat secara online.
              </div>

              {{-- Row Selamat Datang + Tombol --}}
              <div class="d-flex justify-content-between align-items-center">
                <div>
                  <h5 class="mb-1">Selamat datang, Warga Baru {{ Auth::user()->nama }}!</h5>
                  <p class="text-muted mb-0">NIK: {{ Auth::user()->nik }}</p>
                </div>
                <div>
                  <a href="{{ route('profil.index') }}" class="btn btn-primary">
                    <i class="fe fe-plus"></i> Lengkapi Profil Saya
                  </a>
                </div>
              </div>

            </div>
          </div>


          {{-- Alur Verifikasi Domisili --}}
          <div class="card shadow mb-4 border-0">
            <div class="card-body">
              <h5 class="mb-4">Alur Pendaftaran Warga Domisili</h5>

              <div class="row text-center">
                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-primary">
                      <i class="fe fe-edit fe-24"></i>
                    </div>
                    <h6 class="mb-1">1. Lengkapi Profil</h6>
                    <p class="small text-muted mb-0">Klik menu <strong>Profil</strong> pada dashboard.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-info">
                      <i class="fe fe-user fe-24"></i>
                    </div>
                    <h6 class="mb-1">2. Isi Datamu</h6>
                    <p class="small text-muted mb-0">Isi data yang diminta di form tersebut.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-warning">
                      <i class="fe fe-upload fe-24"></i>
                    </div>
                    <h6 class="mb-1">3. Upload</h6>
                    <p class="small text-muted mb-0">Unggah berkas untuk bukti verifikasi.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-secondary">
                      <i class="fe fe-save fe-24"></i>
                    </div>
                    <h6 class="mb-1">4. Simpan</h6>
                    <p class="small text-muted mb-0">Simpan data dan tunggu verifikasi admin.</p>
                  </div>
                </div>

                <div class="col-md-2 col-6 mb-4">
                  <div class="p-3 border rounded shadow-sm">
                    <div class="mb-2 text-success">
                      <i class="fe fe-check-circle fe-24"></i>
                    </div>
                    <h6 class="mb-1">5. Selesai</h6>
                    <p class="small text-muted mb-0">Kamu menjadi warga domisili.</p>
                  </div>
                </div>

              </div>

              <div class="alert alert-info mt-4 mb-0">
                <i class="fe fe-info mr-1"></i>
                Pastikan data dan dokumen yang Anda upload sesuai agar proses verifikasi tidak tertunda.
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



        </div>
      </div>
    </div>
  </main>
@endsection