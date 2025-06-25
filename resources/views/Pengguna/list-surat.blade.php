<x-layout>
<!--Main Content-->
<main role="main" class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <h2 class="mb-2 page-title">List Surat</h2>
        <div class="row my-4">
          <!-- Small table -->
          <div class="col-md-12">
            <div class="card shadow">
              <div class="card-body">
                <div class="toolbar row mb-3">
                  <div class="col ml-auto">
                    <div class="dropdown float-left">
                      <a href="{{ route('ajukan-surat.create') }}" class="btn btn-primary">
                        <i class="fas fa-plus"></i> Ajukan Surat Baru
                      </a>
                    </div>
                  </div>
                </div>
                <!-- table -->
                <table class="table datatables" id="listSuratTable">
                  <thead class="thead-dark">
                    <tr>
                      <th></th>
                      <th>Id</th>
                      <th>Jenis Surat</th>
                      <th>Tanggal Pengajuan</th>
                      <th>Status</th>
                      <th>Keterangan</th>
                      <th>Lihat Surat</th>
                      <th>Download Surat</th>
                    </tr>
                  </thead>
                  <tbody>
                    @forelse ($ajukan as $pengajuan)
                    <tr>
                      <td>
                        <div class="custom-control custom-checkbox">
                          <input type="checkbox" class="custom-control-input">
                          <label class="custom-control-label"></label>
                        </div>
                      </td>
                      <td>{{ $loop->iteration }}</td>
                      <td>{{ $pengajuan->jenisSurat->nama_jenis_surat }}</td>
                      <td>{{ \Carbon\Carbon::parse($pengajuan->tanggal)->translatedFormat('l, d F Y') }}</td>
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
                      <td>{{ $pengajuan->keterangan }}</td>

                      @if($pengajuan->status === 'diterima')
                        @php
                          $berkas = \App\Models\BerkasSurat::where('pengajuan_surat_id', $pengajuan->id)->first();
                        @endphp
                        @if ($berkas && $berkas->file_surat)
                          <td>
                            <a href="{{ asset('storage/' . $berkas->file_surat) }}" target="_blank" class="btn btn-sm btn-primary">
                              <i class="fe fe-eye"></i> Lihat
                            </a>
                          </td>
                          <td>
                            <a href="{{ asset('storage/' . $berkas->file_surat) }}" download class="btn btn-sm btn-success">
                              <i class="fe fe-download"></i> Download
                            </a>
                          </td>
                        @else
                          <td></td>
                          <td></td>
                        @endif
                      @else
                        <td></td>
                        <td></td>
                      @endif
                    </tr>
                    @empty
                    <tr>
                      <td colspan="8" class="text-center">Belum ada pengajuan surat</td>
                    </tr>
                    @endforelse
                  </tbody>
                </table>
              </div>
            </div>
          </div> <!-- simple table -->
        </div> <!-- end section -->
      </div> <!-- .col-12 -->
    </div> <!-- .row -->
  </div> <!-- .container-fluid -->
</main> <!-- main -->
</x-layout>

@push('scripts')
<!-- Tambahkan style opsional untuk geser search ke kiri -->
<style>
  #listSuratTable_filter {
    float: left !important;
    text-align: left;
  }
</style>

<script>
$(document).ready(function () {
    var table = $('#listSuratTable').DataTable({
        responsive: true,
        paging: false,        // Nonaktifkan pagination
        info: false,          // Nonaktifkan info entries
        lengthChange: false,  // Nonaktifkan dropdown jumlah entries
        language: {
            searchPlaceholder: "Cari...",
            search: ""
        },
        columnDefs: [{
            orderable: false,
            targets: [0, 5] // Kolom yang tidak bisa di-sort
        }],
        dom: '<"top"f>rt' // Hanya search (filter) di bagian atas
    });

    // Pastikan filter berada di kiri
    $('#listSuratTable_filter').addClass('float-left');
});
</script>
@endpush
