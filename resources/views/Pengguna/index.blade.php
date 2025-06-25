<x-layout>
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

          {{-- Tabel Surat Terbaru --}}
          <div class="card shadow mb-4">
            <div class="card-body">
              <h6 class="mb-3">Daftar Surat Terbaru</h6>
              <div class="table-responsive">
                <table class="table table-bordered table-hover mb-0">
                  <thead class="thead-light">
                    <tr>
                      <th>No</th>
                      <th>Jenis Surat</th>
                      <th>Status</th>
                      <th>Tanggal</th>
                      <th>Aksi</th>
                    </tr>
                  </thead>
                  <tbody>
                    @forelse($pengajuanTerbaru as $pengajuan)
                      <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $pengajuan->jenisSurat->nama_jenis_surat }}</td>
                        <td>
                          @if($pengajuan->status == 'menunggu')
                            <span class="badge badge-warning">Menunggu</span>
                          @elseif($pengajuan->status == 'diproses')
                            <span class="badge badge-info">Diproses</span>
                          @elseif($pengajuan->status == 'diterima')
                            <span class="badge badge-success">Selesai</span>
                          @else
                            <span class="badge badge-danger">Ditolak</span>
                          @endif
                        </td>
                        <td>{{ $pengajuan->created_at->format('d/m/Y') }}</td>
                        <td>
                          <a href="{{ route('list-surat.userList', $pengajuan->id) }}" class="btn btn-sm btn-primary">
                            <i class="fe fe-eye"></i> Detail
                          </a>
                        </td>
                      </tr>
                    @empty
                      <tr>
                        <td colspan="5" class="text-center text-muted">Belum ada pengajuan surat.</td>
                      </tr>
                    @endforelse
                  </tbody>
                </table>
              </div>
            </div>
          </div>

          {{-- Panduan --}}
          <div class="card shadow mb-4">
            <div class="card-body">
              <h6 class="mb-2">Panduan Pengajuan Surat</h6>
              <ol class="mb-0">
                <li>Tekan tombol <strong>Ajukan Surat</strong>.</li>
                <li>Pilih jenis surat yang dibutuhkan.</li>
                <li>Upload berkas persyaratan dan isi keterangan yang diminta.</li>
                <li>Tekan "Kirim" dan tunggu proses verifikasi.</li>
                <li>Anda akan menerima notifikasi ketika status berubah.</li>
              </ol>
            </div>
          </div>

          {{-- Kontak Admin Jika Lupa Password --}}
          <div class="card shadow mb-4">
            <div class="card-body">
              <h5 class="mb-3">Hubungi Admin (Lupa Password / Bantuan)</h5>

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
                <button type="submit" class="btn btn-primary">
                  <i class="fe fe-send"></i> Kirim Pesan
                </button>
              </form>
            </div>
          </div>



        </div>
      </div>
    </div>
  </main>
</x-layout>