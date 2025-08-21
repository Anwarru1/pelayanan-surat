@extends('layouts.app') 

@section('content')
    <main role="main" class="main-content">
        <div class="container-fluid">

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

            <div class="row justify-content-center">
                <div class="col-12">

                    <!-- ====================== ADMIN SECTION via LIVEWIRE ======================= -->
                    <div class="row">
                        <div class="col-md-12 my-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h2 class="h4 mb-0">Data Admin</h2>
                                <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#panduanAdminModal">
                                    <i class="fe fe-help-circle"></i> Panduan
                                </button>
                            </div>
                            <div class="card shadow">
                                <div class="card-body">
                                    @livewire('admin-search')
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ====================== PENGGUNA SECTION via LIVEWIRE ======================= -->
                    <div class="row">
                        <div class="col-md-12 my-4">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <h2 class="h4 mb-0">Data Pengguna</h2>
                                <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#panduanPenggunaModal">
                                    <i class="fe fe-help-circle"></i> Panduan
                                </button>
                            </div>
                            <div class="card shadow">
                                <div class="card-body">
                                    @livewire('pengguna-search')
                                </div>
                            </div>
                        </div>
                    </div>
                    
                    <!-- ====================== MODALS ======================= -->

                    <!-- Modal Panduan Admin -->
                    <div class="modal fade" id="panduanAdminModal" tabindex="-1" role="dialog" aria-labelledby="panduanAdminLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="panduanAdminLabel">Panduan Pengelolaan Admin</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <ol>
                                        <li>Jika ingin menambah Admin :</li>
                                        <ul>
                                            <li>Klik tombol <strong>Tambah</strong>.</li>
                                            <li>Isi nama, password, dan pilih role </li>
                                            <li>klik <strong>Tambah</strong> untuk menambahkan admin</li>
                                        </ul>
            
                                        <li>Jika ingin mengedit Admin :</li>
                                        <ul>
                                            <li>Klik tombol <strong>Edit</strong>.</li>
                                            <li>Edit nama, password, dan pilih role. Sesuai kebutuhan. </li>
                                            <li>klik <strong>Simpan</strong> untuk menyimpan perubahan admin</li>
                                        </ul>
                                        <li>Klik tombol <strong>Hapus</strong> jika ingin menghapus admin</li>
                                        <li>Pilih data admin yang ingin dihapus dan klik icon <strong><i class="fe fe-trash-2"></i></strong> untuk menghapus data admin yang sudah dipilih</li>
                                    </ol>
                                    
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                </div>
                            </div>
                        </div>
                    </div>
            
                    <!-- Modal Panduan Pengguna -->
                    <div class="modal fade" id="panduanPenggunaModal" tabindex="-1" role="dialog" aria-labelledby="panduanPenggunaLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="panduanPenggunaLabel">Panduan Pengelolaan Pengguna</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <ol>
                                        <li>Jika ingin menambah Pengguna :</li>
                                        <ul>
                                            <li>Klik tombol <strong>Tambah</strong>.</li>
                                            <li>Isi semua form</li>
                                            <li>klik <strong>Tambah</strong> untuk menambahkan pengguna</li>
                                        </ul>
            
                                        <li>Jika ingin mengedit Pengguna :</li>
                                        <ul>
                                            <li>Klik tombol <strong>Edit</strong>.</li>
                                            <li>Edit form sesuai kebutuhan. </li>
                                            <li>klik <strong>Simpan</strong> untuk menyimpan perubahan pengguna</li>
                                        </ul>
                                        <li>Klik tombol <strong>Hapus</strong> jika ingin menghapus pengguna</li>
                                        <li>Pilih data pengguna yang ingin dihapus dan klik icon <strong><i class="fe fe-trash-2"></i></strong> untuk menghapus data pengguna yang sudah dipilih</li>
                                    </ol>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
@endsection

