@extends('layouts.app') 

@section('content')
<main class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-2">
            <h2 class="page-title mb-3">Laporan</h2>
            <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#panduanLaporanModal">
              <i class="fe fe-help-circle"></i> Panduan
            </button>
        </div>

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
              <table class="table datatable table-bordered" id="laporanTable">
                <thead class="thead-dark text-center">
                  <tr>
                    <th>No</th>
                    <th>Nomor Surat</th>
                    <th>Nama Pemohon</th>
                    <th>Jenis Surat</th>
                    <th>Tanggal Pengajuan</th>
                  </tr>
                </thead>
                <tbody>
                  @forelse ($data as $key => $row)
                    <tr>
                      <td>{{ $key + 1 }}</td>
                      <td>{{ $row->berkasSurat->no_surat }}</td>
                      <td>{{ $row->pengguna->nama }}</td>
                      <td>{{ $row->nama_jenis_surat }}</td>
                      <td>{{ \Carbon\Carbon::parse($row->tanggal)->translatedFormat('l, d F Y') }}</td>
                    </tr>
                  @empty
                    <tr><td colspan="5" class="text-center">Tidak ada data</td></tr>
                  @endforelse
                </tbody>
              </table>
            </div>
          </div>
        </div>
        
        <!-- Modal Panduan Laporan -->
        <div class="modal fade" id="panduanLaporanModal" tabindex="-1" role="dialog" aria-labelledby="panduanLaporanLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title">Panduan Penggunaan Laporan</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
              <div class="modal-body">
                <ol>
                  <li>Pilih <strong>Bulan</strong> dan <strong>Tahun</strong> pada bagian filter untuk menampilkan data sesuai periode tertentu.</li>
                  <li>Klik tombol <strong>Filter</strong> untuk memproses pencarian data laporan.</li>
                  <li>Tombol-tombol di bawah form filter:
                    <ul>
                      <li><strong>Print</strong>: untuk mencetak laporan langsung dari browser.</li>
                      <li><strong>Excel</strong>: mengunduh laporan dalam format Microsoft Excel (.xlsx).</li>
                      <li><strong>PDF</strong>: mengunduh laporan dalam format file PDF.</li>
                    </ul>
                  </li>
                  <li>Laporan hanya menampilkan data jika status pengajuan <span class="badge badge-success">Selesai</span></li>
                  <li>Jika tidak ada data sesuai filter, tabel akan menampilkan pesan <em>"Tidak ada data"</em>.</li>
                </ol>
              </div>
              <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
              </div>
            </div>
          </div>
        </div>


      </div> <!-- .col-12 -->
    </div> <!-- .row -->
  </div> <!-- .container-fluid -->
</main>
@endsection
