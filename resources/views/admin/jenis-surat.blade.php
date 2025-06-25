<x-layout>
<!--Main Content-->
      <main role="main" class="main-content">
        <div class="container-fluid">
          @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
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
          <div class="row justify-content-center">
            <div class="col-12">
              <h2 class="mb-2 page-title">Jenis Surat</h2>
              <div class="row my-4">
                <!-- Small table -->
                <div class="col-md-12">
                  <div class="card shadow">
                    <div class="card-body">
                        <div class="toolbar row mb-3">
                        <div class="col ml-auto">
                          <div class="dropdown float-right">
                            <button type="button" class="btn btn-primary ml-3 float-right" data-toggle="modal" data-target="#tambahJenisSurat" data-whatever="@mdo">Tambah +</button>
                            <x-tambah-jenis-surat />
                            <button class="btn btn-dark dropdown-toggle" type="button" id="actionMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> Action </button>
                            <div class="dropdown-menu" aria-labelledby="actionMenuButton">
                              <a class="dropdown-item" href="#">Export</a>
                              <a class="dropdown-item" href="#">Delete</a>
                              <a class="dropdown-item" href="#">Something else here</a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <!-- table -->
                      <table class="table datatables" id="dataTable-1">
                        <thead class="thead-dark">
                          <tr>
                            <th></th>
                            <th>Kode Surat</th>
                            <th>Nama Jenis Surat</th>
                            <th>Syarat</th>
                            <th>Template</th>
                            <th>Action</th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($jenisSurat as $s)
                          <tr>
                            <td>
                              <div class="custom-control custom-checkbox">
                                <input type="checkbox" class="custom-control-input">
                                <label class="custom-control-label"></label>
                              </div>
                            </td>
                            <td>{{ $s->kode_surat }}</td>
                            <td>{{ $s->nama_jenis_surat }}</td>
                            <td>
                              <ul>
                                @foreach($s->syarat as $syarat)
                                <li>{{ $syarat }}</li>
                                @endforeach
                            </ul>
                            </td>
                            <td>
                              @if ($s->template)
                                <a href="{{ asset('storage/' . $s->template) }}" target="_blank">Lihat Template</a>
                              @else
                                -
                              @endif
                            </td>
                            <td>
                              <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#editJenisSurat{{ $s->id }}">Edit</button>
                              <x-edit-jenis-surat :s="$s" />
                              <form action="{{ route('jenis-surat.destroy', $s->id) }}" method="POST" style="display:inline;">
                                @csrf @method('DELETE')
                                <button onclick="return confirm('Hapus Jenis Surat ini?')" class="btn btn-sm btn-danger">Hapus</button>
                              </form>  
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
