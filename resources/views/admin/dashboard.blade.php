<x-layout :pesanBaru="$pesanBaru">
  <!--Main Content-->
      <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="row">
                <div class="col-md-6 col-xl-3 mb-4">
                  <div class="card shadow bg-primary text-white border-0">
                    <div class="card-body">
                      <div class="row align-items-center">
                        <div class="col-3 text-center">
                          <span class="circle circle-sm bg-primary-light">
                            <i class="fe fe-16 fe-mail text-white mb-0"></i>
                          </span>
                        </div>
                        <div class="col pr-0">
                          <p class="small text-muted mb-0">Pengajuan Surat</p>
                          <span class="h3 mb-0 text-white">{{ $totalPengajuan }}</span>
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
                          <span class="circle circle-sm bg-primary">
                            <i class="fe fe-16 fe-check-circle text-white mb-0"></i>
                          </span>
                        </div>
                        <div class="col pr-0">
                          <p class="small text-muted mb-0">Dikonfirmasi</p>
                          <span class="h3 mb-0">{{ $totalTerkonfirmasi }}</span>
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
                          <span class="circle circle-sm bg-primary">
                            <i class="fe fe-16 fe-x-circle text-white mb-0"></i>
                          </span>
                        </div>
                        <div class="col">
                          <p class="small text-muted mb-0">Belum Dikonfirmasi</p>
                          <div class="row align-items-center no-gutters">
                            <div class="col-auto">
                              <span class="h3 mr-2 mb-0">{{ $totalBelumDikonfirmasi }}</span>
                            </div>
                          </div>
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
                          <span class="circle circle-sm bg-primary">
                            <i class="fe fe-16 fe-users text-white mb-0"></i>
                          </span>
                        </div>
                        <div class="col">
                          <p class="small text-muted mb-0">Total Pengguna</p>
                          <span class="h3 mb-0">{{ $totalPengguna }}</span>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div> <!-- end section -->

              <div class="row my-4">

                <div class="col-md-3 d-flex flex-column gap-3">

                  <!-- Card: Role Saat Ini -->
                  <div class="card shadow-sm p-3 mb-3">
                    <h6 class="mb-2 fw-bold">Role Saat Ini</h6>
                    @php
                      $role = Auth::user()->role ?? 'Tidak diketahui';
                    @endphp
                    <span class="badge bg-primary text-white px-3 py-2">{{ $role }}</span>
                  </div>

                  <!-- Card: Aksi Cepat -->
                  <div class="card shadow-sm p-3 h-100">
                    <h6 class="mb-3 fw-bold">Aksi Cepat</h6>
                    @php
                        $admin = Auth::guard('admin')->user();
                    @endphp
                    <div class="d-flex flex-column gap-2">
                      @if($admin->role === 'admin')
                      <a href="{{ route('pengajuan.index') }}" class="btn btn-outline-primary btn-sm w-100 mb-2">
                        <i class="fe fe-plus mr-1"></i> Pengajuan Surat
                      </a>
                      <a href="{{ route('jenis-surat.index') }}" class="btn btn-outline-success btn-sm w-100 mb-2">
                        <i class="fe fe-folder mr-1"></i> Kelola Jenis Surat
                      </a>
                      <a href="{{ route('data-user.index') }}" class="btn btn-outline-warning btn-sm text-dark w-100">
                        <i class="fe fe-users mr-1"></i> Data User
                      </a>
                      @endif
                      @if($admin->role === 'kepala desa')
                      <a href="{{ route('berkas.index') }}" class="btn btn-outline-success btn-sm w-100 mb-2">
                        <i class="fe fe-folder mr-1"></i> Konfirmasi Surat
                      </a>
                      <a href="{{ route('laporan.index') }}" class="btn btn-outline-warning btn-sm text-dark w-100">
                        <i class="fe fe-users mr-1"></i> Buat Laporan
                      </a>
                      @endif
                    </div>
                  </div>

                </div>

                <!-- Kolom 2: Grafik Pengajuan -->
                <div class="col-md-9">
                  <div class="card shadow-sm p-3 h-100">
                    <h6 class="mb-3 text-center">Grafik Pengajuan per Bulan</h6>
                    <canvas id="pengajuanChart" height="200"></canvas>
                  </div>
                </div>

              </div>


              <div class="row my-2">
                <div class="col d-flex justify-content-start align-items-center">
                  @php
                    $tanggal = \Carbon\Carbon::now()->translatedFormat('l, d F Y');
                  @endphp

                  <p class="mb-0 text-muted">
                    <i class="fe fe-calendar mr-1"></i> {{ $tanggal }}
                  </p>
                </div>
              </div>

              <div class="row">
                <!-- Recent orders -->
                <div class="col-md-12">
                  <div class="card shadow">
                    <div class="card-body">
                    <h6 class="mb-3">Pengajuan Surat Terbaru</h6>
                    <table class="table dashboard">
                      <thead class="thead-dark">
                        <tr>
                          <th>No.</th>
                          <th>Name</th>
                          <th>Jenis Surat</th>
                          <th>Tanggal Pengajuan</th>
                          <th>Status</th>
                          <th>Detail</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach ($pengajuanList as $p)
                        <tr>
                          <td>{{ $loop->iteration }}</td>
                          <td>{{ $p->pengguna->nama }}</td>
                          <td>{{ $p->jenisSurat->nama_jenis_surat }}</td>
                          <td>{{ $p->tanggal }}</td>
                          <td>
                            @if($p->status == 'menunggu')
                                  <span class="badge badge-warning">Menunggu</span>
                                @elseif($p->status == 'diproses')
                                    <span class="badge badge-info">Diproses</span>
                                @elseif($p->status == 'diterima')
                                    <span class="badge badge-success">Selesai</span>
                                @else
                                    <span class="badge badge-danger">Ditolak</span>
                                @endif
                          </td>
                          <td>
                            <a href="{{ route('pengajuan.index') }}" class="btn btn-sm btn-primary">
                              <i class="fe fe-eye"></i> Lihat Detail
                            </a>
                          </td>
                        </tr>
                        @endforeach
                      </tbody>
                    </table>
                    </div>
                  </div>
                </div> <!-- / .col-md-3 -->
              </div> <!-- end section -->
            </div>
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
      </main> <!-- main -->
</x-layout>

<!-- Chart.js CDN -->
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

<script>
  const ctx = document.getElementById('pengajuanChart').getContext('2d');
  const pengajuanChart = new Chart(ctx, {
    type: 'bar',
    data: {
      labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'],
      datasets: [{
        label: 'Pengajuan',
        data: @json($dataChart),
        backgroundColor: '#4e73df'
      }]
    },
    options: {
      plugins: {
        legend: {
          display: false
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          ticks: {
            stepSize: 2
          }
        }
      }
    }
  });
</script>


    