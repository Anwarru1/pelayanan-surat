@extends('layouts.app') 

@section('content')
<main role="main" class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-2">
          <h2 class="page-title mb-0">Pengajuan Surat</h2>
          <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#panduanModal">
            <i class="fe fe-help-circle"></i> Panduan
          </button>
        </div>

        <!-- Modal Panduan -->
        <div class="modal fade" id="panduanModal" tabindex="-1" role="dialog" aria-labelledby="panduanModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="panduanModalLabel">Panduan Pengelolaan Pengajuan Surat</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <div class="modal-body">
              <ol>
                <li>Periksa daftar pengajuan surat yang masuk. Terdapat status pengajuan:
                  <ul>
                    <li><span class="badge badge-info">Menunggu</span>: Surat belum dikonfirmasi admin. Status awal pengajuan.</li> 
                    <li><span class="badge badge-info">Diproses</span>: Surat sudah dikonfirmasi admin.</li>
                    <li><span class="badge badge-success">Selesai</span>: Surat sudah selesai dibuat.</li>
                    <li><span class="badge badge-danger">Ditolak</span>: Surat tidak disetujui atau gagal proses.</li>
                  </ul>
                </li>
                <li>Tekan <strong>Kelola</strong> untuk menampilkan detail pengajuan surat.</li>
                <li>Cek apakah syarat pengajuan surat yang dikirim warga sudah benar.</li>
                <li>Jika syarat valid, <strong>Isi Nomor Urutan</strong> untuk pembuatan Nomor Surat.</li>
                <li>Masukkan nomor urutan surat lalu tekan <strong>Simpan</strong>.</li>
                <li>Tekan <strong>Terima</strong> lalu <strong>Konfirmasi & Proses</strong>. Sistem akan membuat surat otomatis dan mengubah status dari 
                  <span class="badge badge-info">Menunggu</span> menjadi 
                  <span class="badge badge-info">Diproses</span>, yang berarti surat menunggu konfirmasi kepala desa.
                </li>
                <li>Jika syarat tidak valid, tekan <strong>Tolak</strong> dan isikan alasan penolakan, lalu tekan <strong>Kirim Penolakan</strong>. Status pengajuan berubah menjadi <span class="badge badge-danger">Ditolak</span>. </li>                
                <li>Tekan <strong>Lihat Surat</strong> untuk melihat surat yang dibuat. Surat baru bisa dilihat jika status <strong>Diproses</strong> atau <strong>Selesai</strong>.</li>
                <li>Gunakan kolom pencarian untuk memfilter berdasarkan jenis surat, pemohon, atau tanggal.</li>
              </ol>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
            </div>
          </div>
        </div>


        <div class="row my-4">
          <div class="col-md-12">
            <div class="card shadow">
              <div class="card-body">

                @if(session('success'))
                  <div class="alert alert-success alert-dismissible fade show" role="alert">
                      {{ session('success') }}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                  </div>
                @endif
                
                @if(session('error'))
                  <div class="alert alert-danger alert-dismissible fade show" role="alert">
                      {{ session('error') }}
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                  </div>
                @endif

                @if ($errors->any())
                  <div class="alert alert-danger">
                      <ul>
                      @foreach ($errors->all() as $error)
                          <li>{{ $error }}</li>
                      @endforeach
                      </ul>
                  </div>
                @endif

                <!-- Form Hapus Terpilih -->
                <form action="{{ route('pengajuan-surat.bulk-delete') }}" method="POST" id="bulkDeleteForm">
                  @csrf
                  @method('DELETE')
                    <div class="d-flex justify-content-between align-items-center mb-3">
                      <div id="datatable-search"></div>
                      <div>
                        <button type="submit" class="btn btn-danger" onclick="return confirm('Yakin ingin menghapus data terpilih?')">
                           <i class="fe fe-trash-2"></i>
                        </button>
                      </div>
                    </div>

                  <table class="table datatables table-bordered" id="dataTable-1">
                    <thead class="thead-dark">
                      <tr>
                        <th class="text-center">
                          <input type="checkbox" id="selectAll">
                        </th>
                        <th class="text-center">No.</th>
                        <th class="text-center">Jenis Surat</th>
                        <th class="text-center">Pemohon</th>
                        <th class="text-center">Tanggal</th>
                        <th class="text-center">Status</th>
                        <th class="text-center">Aksi</th>
                      </tr>
                    </thead>
                    <tbody>
                      @foreach ($pengajuan as $p)
                      <tr>
                        <td class="text-center">
                          <input type="checkbox" name="ids[]" value="{{ $p->id }}">
                        </td>
                        <td class="text-center">{{ $pengajuan->count() - $loop->index }}</td>
                        <td>{{ $p->jenisSurat->nama_jenis_surat }}</td>
                        <td>{{ $p->pengguna->nama }}</td>
                        <td>{{ \Carbon\Carbon::parse($p->tanggal)->translatedFormat('l, d F Y') }}</td>
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
                          <!-- Tombol buka modal -->
                          <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#kelolaModal{{ $p->id }}">
                            <i class="fe fe-edit"></i> Kelola
                          </button>

                          
                        </td>
                      </tr>
                      @endforeach
                    </tbody>
                  </table>
                </form>
              </div>
            </div>
            @foreach ($pengajuan as $p)
            <x-detail-pengajuan :p="$p" />
            @endforeach
          </div> 
        </div>
      </div>
    </div>
  </div>
</main> 

<script>
  // Select/Deselect all checkbox
  document.getElementById('selectAll').addEventListener('change', function(e) {
    const checkboxes = document.querySelectorAll('input[name="ids[]"]');
    checkboxes.forEach(cb => cb.checked = e.target.checked);
  });
</script>
@endsection
