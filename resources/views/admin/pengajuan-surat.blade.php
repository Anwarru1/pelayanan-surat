<x-layout>
<!--Main Content-->
      <main role="main" class="main-content">
        <div class="container-fluid">
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="mb-2 page-title">Pengajuan Surat</h2>
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
                            <th>No.</th>
                            <th>Jenis Surat</th>
                            <th>Pemohon</th>
                            <th>Tanggal</th>
                            <th>Status</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($pengajuan as $p)
                          <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input">
                                <label class="custom-control-label"></label>
                              </div>
                            </td>
                            <td>{{ $loop->iteration }}</td>
                            <td>{{ $p->jenisSurat->nama_jenis_surat }}</td>
                            <td>{{ $p->pengguna->nama }}</td>
                            <td>{{ \Carbon\Carbon::parse($p->tanggal)->translatedFormat('l, d F Y') }}</td>
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
                                <!-- Tombol Kelola Surat -->
                                <button type="button" class="btn btn-primary btn-sm" data-toggle="modal" data-target="#kelolaModal{{ $p->id }}">
                                  <i class="fe fe-edit"></i> Kelola
                                </button>
                                <x-detail-pengajuan :p="$p" />
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
      </main> 
      <!-- main -->
</x-layout>