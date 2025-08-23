@extends('layouts.app')

@section('content')
<!--Main Content-->
      <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <div class="d-flex justify-content-between align-items-center mb-2">
                <h2 class="page-title mb-0">Berkas Surat</h2>
                <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#panduanModal">
                  <i class="fe fe-help-circle"></i> Panduan
                </button>
              </div>
              <div class="row my-4">
                <!-- Small table -->
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
                      
                      <!-- Modal Panduan -->
                      <div class="modal fade" id="panduanModal" tabindex="-1" role="dialog" aria-labelledby="panduanModalLabel" aria-hidden="true">
                        <div class="modal-dialog modal-lg" role="document">
                          <div class="modal-content">
                            <div class="modal-header">
                              <h5 class="modal-title" id="panduanModalLabel">Panduan Pengelolaan Berkas Surat</h5>
                              <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                                <span aria-hidden="true">&times;</span>
                              </button>
                            </div>
                            <div class="modal-body">
                              <ol>
                                <li>Periksa daftar berkas surat yang masuk. Terdapat status pengajuan:
                                    <ul>
                                      <li><span class="badge badge-info">Diproses</span>: Surat sedang diproses admin.</li>
                                      <li><span class="badge badge-success">Selesai</span>: Surat sudah selesai dibuat.</li>
                                      <li><span class="badge badge-danger">Ditolak</span>: Surat tidak disetujui atau gagal proses.</li>
                                    </ul>
                                </li>
                                <li>Cek apakah Nomor Surat sudah benar.</li>
                                <li>Klik <strong>Lihat</strong> untuk melihat dan mendownload surat yang dibuat</li>
                                <li>Jika surat valid, klik <strong>Konfirmasi</strong> untuk mengkonfirmasi apakah surat sudah benar dan mengirim file surat tersebuat ke pengguna. Status pengajuan berubah menjadi <span class="badge badge-success">Selesai</span></li>
                                <li>Jika surat tidak valid, klik tolak dan isikan alasan penolakan, lalu klik <strong>Kirim Penolakan</strong>. Status pengajuan berubah menjadi <span class="badge badge-danger">Ditolak</span> dan data akan dihapus</li>
                                <li>Gunakan kolom pencarian untuk memfilter berdasarkan jenis surat, pemohon, atau tanggal.</li>
                              </ol>
                            </div>
                            <div class="modal-footer">
                              <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                            </div>
                          </div>
                        </div>
                      </div>
 
                      
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div id="datatable-search"></div>
                        <div>
                        </div>
                      </div>

                      
                      <!-- table -->
                      <table class="table datatables table-bordered" id="dataTable-1">
                        <thead class="thead-dark">
                          <tr>
                            <th class="text-center">No. Surat</th>
                            <th class="text-center">Jenis Surat</th>
                            <th class="text-center">Nama Pemohon</th>
                            <th class="text-center">Tanggal Diajukan</th>
                            <th class="text-center">File Surat</th>
                            <th class="text-center">Status</th>
                            <th class="text-center">Aksi</th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($berkasSurat as $berkas)
                          <tr>
                            <td>{{ $berkas->no_surat }}</td>
                            <td>{{ $berkas->pengajuanSurat->nama_jenis_surat }}</td>
                            <td>{{ $berkas->pengajuanSurat->nama }}</td>
                            <td>{{ \Carbon\Carbon::parse($berkas->tanggal_diajukan)->translatedFormat('l, d F Y') }}</td>
                            <td>
                              <a href="{{ route('berkas.preview', $berkas->id) }}" class="btn btn-sm btn-secondary" target="_blank">
                                <i class="fe fe-eye"></i> Lihat
                              </a>
                            </td>
                            <td class="text-center">
                              @if($berkas->pengajuanSurat && $berkas->pengajuanSurat->status == 'diterima')
                                <span class="badge badge-success">Selesai</span>
                              @elseif($berkas->pengajuanSurat && $berkas->pengajuanSurat->status == 'ditolak')
                                <span class="badge badge-danger">Ditolak</span>
                              @else
                                <span class="badge badge-info">Diproses</span>
                              @endif

                            </td>
                            <td>
                              @if ($berkas->pengajuanSurat->status === 'diproses')
                              <!-- Tombol untuk membuka modal -->
                              <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalTolak-{{ $berkas->id }}">
                                <i class="fe fe-x-circle"></i> Tolak
                              </button>
                              @endif

                              <!-- Modal Tolak -->
                              <div class="modal fade" id="modalTolak-{{ $berkas->id }}" tabindex="-1" role="dialog" aria-labelledby="modalTolakLabel-{{ $berkas->id }}" aria-hidden="true">
                                <div class="modal-dialog" role="document">
                                  <form action="{{ route('berkas-surat.tolak', $berkas->id) }}" method="POST">
                                    @csrf
                                    @method('PUT')
                                    <div class="modal-content">
                                      <div class="modal-header">
                                        <h5 class="modal-title" id="modalTolakLabel-{{ $berkas->id }}">Tolak Berkas Surat</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                                          <span aria-hidden="true">&times;</span>
                                        </button>
                                      </div>
                                      <div class="modal-body">
                                        <div class="form-group">
                                          <label for="keterangan">Alasan Penolakan</label>
                                          <textarea name="keterangan" class="form-control" required placeholder="Tuliskan alasan penolakan..."></textarea>
                                        </div>
                                      </div>
                                      <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
                                        <button type="submit" class="btn btn-danger">Kirim Penolakan</button>
                                      </div>
                                    </div>
                                  </form>
                                </div>
                              </div>


                              @if($berkas->pengajuanSurat && $berkas->pengajuanSurat->status === 'diproses')
                                <form action="{{ route('berkas-surat.konfirmasi', $berkas->id) }}" method="POST" class="d-inline">
                                  @csrf
                                  @method('PUT')
                                  <button type="submit" class="btn btn-success btn-sm">
                                    <i class="fe fe-check"></i> Konfirmasi
                                  </button>
                                </form>
                              @else
                                <i class="fe fe-check-circle text-success"></i>
                              @endif
                            </td>
                          </tr>
                          @endforeach
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
@endsection

@push('scripts')
<script>
  function showTolakForm(id) {
    const form = document.getElementById('form-tolak-' + id);
    form.classList.toggle('d-none');
  }

  $(document).ready(function () {
    $('#dataTable-1').DataTable({
      "order": [[3, "desc"]] // Kolom ke-4 (Tanggal Diajukan) urut DESC
    });
  });
</script>
@endpush


