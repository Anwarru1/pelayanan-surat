<x-layout>
<!--Main Content-->
      <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="mb-2 page-title">Berkas Surat</h2>
              <div class="row my-4">
                <!-- Small table -->
                <div class="col-md-12">
                  <div class="card shadow">
                    <div class="card-body">
                      @if (session('success'))
                        <div class="alert alert-success">
                          {{ session('success') }}
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
                      <!-- table -->
                      <table class="table datatables" id="dataTable-1">
                        <thead class="thead-dark">
                          <tr>
                            <th></th>
                            <th>No. Surat</th>
                            <th>Jenis Surat</th>
                            <th>Nama Pemohon</th>
                            <th>Tanggal Diajukan</th>
                            <th>File Surat</th>
                            <th>Status</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($berkasSurat as $berkas)
                          <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input">
                                <label class="custom-control-label"></label>
                              </div>
                            </td>
                            <td>{{ $berkas->no_surat }}</td>
                            <td>{{ $berkas->pengajuanSurat->nama_jenis_surat }}</td>
                            <td>{{ $berkas->pengajuanSurat->nama }}</td>
                            <td>{{ \Carbon\Carbon::parse($berkas->tanggal_diajukan)->translatedFormat('l, d F Y') }}</td>
                            <td>
                              <a href="{{ route('berkas.preview', $berkas->id) }}" class="btn btn-sm btn-secondary" target="_blank">
                                <i class="fe fe-eye"></i> Lihat
                              </a>
                            </td>
                            <td>
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
</x-layout>

@push('scripts')
<script>
  function showTolakForm(id) {
    const form = document.getElementById('form-tolak-' + id);
    form.classList.toggle('d-none');
  }
</script>
@endpush

