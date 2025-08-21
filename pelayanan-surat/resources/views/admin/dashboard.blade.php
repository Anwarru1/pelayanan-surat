@extends('layouts.app') 

@section('content')
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

              <div class="row my-4 align-items-stretch">
                <!-- Kolom 1: Aksi Cepat + Role -->
                <div class="col-md-3 d-flex flex-column h-100">
                    <div class="d-flex flex-column gap-3 flex-grow-1">
                
                      <!-- Card: Role Saat Ini -->
                      <div class="card shadow-sm p-3 mb-3">
                        <h6 class="mb-2 fw-bold">Role Saat Ini</h6>
                        @php
                          $role = Auth::user()->role ?? 'Tidak diketahui';
                        @endphp
                        <span class="badge bg-primary text-white px-3 py-2">{{ $role }}</span>
                      </div>
                
                      <!-- Card: Aksi Cepat -->
                      <div class="card shadow-sm p-3">
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
                        </div>
                      </div>
                
                    </div>
                </div>
                
                <!-- Kolom 2: Grafik Pengajuan -->
                <div class="col-md-9 d-flex flex-column h-100">
                    <div class="card shadow-sm p-3" style="height: auto; min-height: 200px;">
                      <h6 class="mb-3 text-center">Grafik Pengajuan per Bulan</h6>
                      <canvas id="pengajuanChart" class="w-100" style="min-height: 200px; height: 100%;"></canvas>
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
                    <table class="table dashboard table-bordered">
                      <thead class="thead-dark">
                        <tr>
                          <th class="text-center">No.</th>
                          <th class="text-center">Name</th>
                          <th class="text-center">Jenis Surat</th>
                          <th class="text-center">Tanggal Pengajuan</th>
                          <th class="text-center">Status</th>
                          <th class="text-center">Detail</th>
                        </tr>
                      </thead>
                      <tbody>
                        @foreach ($pengajuanList as $p)
                        <tr>
                          <td class="text-center">{{ $loop->iteration }}</td>
                          <td>{{ $p->pengguna->nama }}</td>
                          <td>{{ $p->jenisSurat->nama_jenis_surat }}</td>
                          <td>{{ \Carbon\Carbon::parse($p->tanggal)->translatedFormat('l, d F Y')}}</td>
                          <td class="text-center">
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
@endsection

@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function () {
  const ctx = document.getElementById('pengajuanChart');
  if (ctx) {
    const pengajuanChart = new Chart(ctx, {
      type: 'bar',
      data: {
        labels: ['Jan', 'Feb', 'Mar', 'Apr', 'Mei', 'Jun', 'Jul', 'Agu', 'Sep', 'Okt', 'Nov', 'Des'],
        datasets: [{
          label: 'Pengajuan',
          data: @json($dataChart ?? []),
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
  } else {
    console.warn("Canvas #pengajuanChart tidak ditemukan");
  }
});
</script>
@endpush



    