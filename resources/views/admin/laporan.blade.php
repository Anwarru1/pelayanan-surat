<x-layout>
<main class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <h2 class="mb-2 page-title">Laporan</h2>

        <div class="card shadow-sm mb-4">
          <div class="card-body">
            <form method="GET" action="{{ route('laporan.index') }}" class="mb-4">
              <div class="row">
                <div class="col-md-3">
                  <select name="bulan" class="form-control">
                    <option value="">Pilih Bulan</option>
                    @foreach(range(1,12) as $b)
                      <option value="{{ $b }}" {{ request('bulan') == $b ? 'selected' : '' }}>
                        {{ \Carbon\Carbon::create()->month($b)->translatedFormat('F') }}
                      </option>
                    @endforeach
                  </select>
                </div>
                <div class="col-md-3">
                  <select name="tahun" class="form-control">
                    <option value="">Pilih Tahun</option>
                    @foreach(range(now()->year, 2020) as $t)
                      <option value="{{ $t }}" {{ request('tahun') == $t ? 'selected' : '' }}>{{ $t }}</option>
                    @endforeach
                  </select>
                </div>
                <div class="col-md-2">
                  <button type="submit" class="btn btn-primary">Filter</button>
                </div>
              </div>
            </form>

            <div class="mb-3">
              <a href="{{ route('laporan.print', request()->all()) }}" class="btn btn-secondary" target="_blank">
                <i class="fe fe-printer mr-1"></i> Print
              </a>
              <a href="{{ route('laporan.export.excel', request()->all()) }}" class="btn btn-success">
                <i class="fe fe-file-text mr-1"></i> Excel
              </a>
              <a href="{{ route('laporan.export.pdf', request()->all()) }}" class="btn btn-warning">
                <i class="fe fe-file mr-1"></i> PDF
              </a>
            </div>

            <div class="table-responsive">
              <table class="table datatable" id="laporanTable">
                <thead class="thead-dark text-center">
                  <tr>
                    <th>No</th>
                    <th>Nama Pemohon</th>
                    <th>Jenis Surat</th>
                    <th>Tanggal Pengajuan</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  @forelse ($data as $key => $row)
                    <tr>
                      <td>{{ $key + 1 }}</td>
                      <td>{{ $row->pengguna->nama }}</td>
                      <td>{{ $row->nama_jenis_surat }}</td>
                      <td>{{ \Carbon\Carbon::parse($row->tanggal)->translatedFormat('l, d F Y') }}</td>
                      <td>
                        @if($row->status == 'menunggu')
                          <span class="badge badge-warning">Menunggu</span>
                        @elseif($row->status == 'diproses')
                          <span class="badge badge-info">Diproses</span>
                        @elseif($row->status == 'diterima')
                          <span class="badge badge-success">Selesai</span>
                        @else
                          <span class="badge badge-danger">Ditolak</span>
                        @endif
                      </td>
                    </tr>
                  @empty
                    <tr><td colspan="5" class="text-center">Tidak ada data</td></tr>
                  @endforelse
                </tbody>
              </table>
            </div>
          </div>
        </div>

      </div> <!-- .col-12 -->
    </div> <!-- .row -->
  </div> <!-- .container-fluid -->
</main>
</x-layout>
