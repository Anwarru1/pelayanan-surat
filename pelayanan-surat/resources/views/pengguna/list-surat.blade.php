@extends('layouts.p-app') 

@section('content')
<!-- Main Content -->
<main role="main" class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        
        <!-- Title -->
        <h2 class="mb-2 page-title">List Surat</h2>

        <!-- Card Section -->
        <div class="row my-4">
          <div class="col-md-12">
            <div class="card shadow">
              <div class="card-body">

                <!-- Toolbar: Search (kiri) + Tambah (kanan) -->
                <div class="d-flex justify-content-between align-items-center mb-3">
                  <div id="datatable-search"></div>
                  <a href="{{ route('ajukan-surat.create') }}" class="btn btn-primary">
                    <i class="fas fa-plus"></i> Ajukan Surat Baru
                  </a>
                </div>

                <!-- Table -->
                <table class="table datatables table-bordered" id="listSuratTable">
                  <thead class="thead-dark">
                    <tr>
                      <th class="text-center">No.</th>
                      <th class="text-center">Jenis Surat</th>
                      <th class="text-center">Tanggal Pengajuan</th>
                      <th class="text-center">Status</th>
                      <th class="text-center">Keterangan</th>
                      <th class="text-center">Download Surat</th>
                    </tr>
                  </thead>
                  <tbody>
                    @forelse ($ajukan as $pengajuan)
                      <tr>
                        <td class="text-center">{{ $loop->iteration }}</td>
                        <td>{{ $pengajuan->jenisSurat->nama_jenis_surat }}</td>
                        <td>{{ \Carbon\Carbon::parse($pengajuan->tanggal)->translatedFormat('l, d F Y') }}</td>
                        <td class="text-center">
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
                        <td>{{ $pengajuan->keterangan }}</td>
                        <td>
                          @if($pengajuan->status === 'diterima')
                            @php
                              $berkas = \App\Models\BerkasSurat::where('pengajuan_surat_id', $pengajuan->id)->first();
                            @endphp
                            @if ($berkas && $berkas->file_surat)
                              <a href="{{ route('berkas.download', $berkas->id) }}" class="btn btn-sm btn-success">
                                <i class="fe fe-download"></i> Download
                              </a>
                            @endif
                          @else
                            <i class="fe fe-loader"></i>
                          @endif
                        </td>
                      </tr>
                    @empty
                      <tr>
                        <td colspan="7" class="text-center">Belum ada pengajuan surat</td>
                      </tr>
                    @endforelse
                  </tbody>
                </table>
                <!-- End Table -->

              </div> <!-- .card-body -->
            </div> <!-- .card -->
          </div> <!-- .col -->
        </div> <!-- .row section -->

      </div> <!-- .col-12 -->
    </div> <!-- .row -->
  </div> <!-- .container-fluid -->
</main>
@endsection