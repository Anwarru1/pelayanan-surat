@extends('layouts.app') 

@section('content')
<!--Main Content-->
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
              <div class="d-flex justify-content-between align-items-center mb-3">
                <h2 class="mb-2 page-title">Jenis Surat</h2>
                <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#panduanJenisSuratModal">
                  <i class="fe fe-help-circle"></i> Panduan
                </button>
              </div>
              
              <!-- Modal Panduan Jenis Surat -->
              <div class="modal fade" id="panduanJenisSuratModal" tabindex="-1" role="dialog" aria-labelledby="panduanJenisSuratLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                  <div class="modal-content">
                    <div class="modal-header">
                      <h5 class="modal-title">Panduan Pengelolaan Jenis Surat</h5>
                      <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                        <span aria-hidden="true">&times;</span>
                      </button>
                    </div>
                    <div class="modal-body">
                      <!-- Tabs -->
                      <ul class="nav nav-tabs" id="tabPanduanJenisSurat" role="tablist">
                        <li class="nav-item">
                          <a class="nav-link active" id="tabTambahJenisSurat" data-toggle="tab" href="#panduanTambahJenisSurat" role="tab">Kelola Data</a>
                        </li>
                        <li class="nav-item">
                          <a class="nav-link" id="tabEditJenisSurat" data-toggle="tab" href="#panduanEditJenisSurat" role="tab">Membuat Template</a>
                        </li>
                      </ul>
                      <div class="tab-content mt-3">
                        <!-- Tab Tambah -->
                        <div class="tab-pane fade show active" id="panduanTambahJenisSurat" role="tabpanel">
                          <ol>
                            <li>Jika ingin menambah Jenis Surat :</li>
                            <ul>
                                <li>Klik tombol <strong>Tambah +</strong>.</li>
                                <li>Isi semua form.</li>
                                <li><strong>Syarat</strong> terdapat 2 tipe : teks/file.</li>
                                <ul>
                                  <li><strong>Teks</strong> jika ingin pengguna manambah data tambahan yang dibutuhkan pada template surat. Nama teks sesuai dengan data tambahan pada template surat.</li>
                                  <li><strong>File</strong> jika ingin pengguna mengupload file persyaratan yang dibutuhkan. misal : Fotocopy KTP.</li>
                                </ul> 
                                <li>klik <strong>Tambah syarat</strong> jika ingin menambah syarat surat.</li>
                                <li>klik icon <strong><i class="fe fe-trash-2"></i></strong> jika ingin menghapus syarat surat. Minimal terdapat 1 syarat.</li>
                                <li><strong>Keterangan Default</strong> agar saat pengguna pengajukan surat. keterangan terdapat nilai default.</li>
                                <li><strong>Template Surat</strong> upload template surat sesuai persyaratan.</li>
                                <li>klik <strong>Tambah</strong> untuk menambahkan Jenis Surat.</li>
                            </ul>

                            <li>Jika ingin mengedit Jenis Surat :</li>
                            <ul>
                                <li>Klik tombol <strong>Edit</strong>.</li>
                                <li>Edit form sesuai kebutuhan. </li>
                                <li>klik <strong>Simpan</strong> untuk menyimpan perubahan Jenis Surat</li>
                            </ul>
                            <li>Klik tombol <strong>Hapus</strong> jika ingin menghapus Jenis Surat</li>
                        </ol>
                        </div>

                        <!-- Tab Membuat Template -->
                        <div class="tab-pane fade" id="panduanEditJenisSurat" role="tabpanel">
                          <p>Berikut panduan membuat <strong>template surat</strong> (.docx):</p>

                          <div class="text-center">
                            <img src="{{ asset('storage/panduan/panduan-template-surat.png') }}" class="img-fluid rounded shadow-sm my-3" alt="Panduan Template Surat">
                          </div>

                          <ol>
                            <li><strong>Format file:</strong> Template harus berformat <code>.docx</code>.</li>
                            
                            <li><strong>Struktur template:</strong></li>
                            <ul>
                              <li><code>${no_surat}</code>, digunakan untuk menampilkan <u>Nomor Surat</u>.</li>
                              <li>Untuk data dari database pengguna, tersedia:
                                <ul>
                                  <li><code>${nama}</code> (nama)</li>
                                  <li><code>${nik}</code> (NIK)</li>
                                  <li><code>${j_kel}</code> (Jenis Kelamin)</li>
                                  <li><code>${agama}</code> (Agama)</li>
                                  <li><code>${tmp_lahir}, {tgl_lahir}</code> (Tempat, Tanggal Lahir)</li>
                                  <li><code>${pekerjaan}</code> (Pekerjaan)</li>
                                  <li><code>${alamat}</code> (Alamat)</li>
                                  <li><code>${no_hp}</code> (nomor Hp)</li>
                                </ul>
                              </li>
                              <li>Untuk data tambahan (yang diinput pengguna), gunakan format: <code>${keperluan}</code>, <code>${keterangan}</code>, dsb.</li>
                              <li><code>${tanggal}</code>, tanggal akan otomatis mengambil dari tanggal pengajuan.</li>
                            </ul>

                            <li><strong>Keperluan tetap vs dinamis:</strong></li>
                            <ul>
                              <li>Jika isi keperluan <strong>selalu sama</strong>, tulis langsung di dokumen .docx.</li>
                              <li>Jika <strong>berubah-ubah</strong> tiap pengajuan, gunakan <code>${keperluan}</code> agar dapat diisi pengguna saat pengajuan.</li>
                            </ul>

                            <li><strong>Keterangan</strong> dapat diset saat tambah/edit jenis surat, akan muncul otomatis saat pengajuan.</li>

                            <li>Jika ingin mengubah <strong>Tanda tangan</strong>, lakukan langsung di file template .docx.</li>
                          </ol>
                        </div>

                      </div>
                    </div>
                    <div class="modal-footer">
                      <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="row my-4">
                <!-- Small table -->
                <div class="col-md-12">
                  <div class="card shadow">
                    <div class="card-body">
                      <!-- Toolbar: Tambah + Cari -->
                      <div class="d-flex justify-content-between align-items-center mb-3">
                        <div>
                          <div id="datatable-search"></div>
                        </div>
                          <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#tambahJenisSurat" data-whatever="@mdo">
                            Tambah +
                          </button>
                          <x-tambah-jenis-surat />
                      </div>
                      <!-- table -->
                      <table class="table datatables table-bordered" id="dataTable-1">
                        <thead class="thead-dark">
                          <tr>
                            <th class="text-center">Kode Surat</th>
                            <th class="text-center">Nama Jenis Surat</th>
                            <th class="text-center">Syarat</th>
                            <th class="text-center">Template</th>
                            <th class="text-center">Aksi</th>
                          </tr>
                        </thead>
                        <tbody>
                          @foreach ($jenisSurat as $s)
                          <tr>
                            <td class="text-center">{{ $s->kode_surat }}</td>
                            <td>{{ $s->nama_jenis_surat }}</td>
                            <td>
                              @if (is_array($s->syarat))
                                <ul>
                                  @foreach ($s->syarat as $syarat)
                                    @php
                                      $nama = is_array($syarat) && isset($syarat['nama']) ? $syarat['nama'] : (is_string($syarat) ? $syarat : '-');
                                      $tipe = is_array($syarat) && isset($syarat['tipe']) ? $syarat['tipe'] : '';
                                    @endphp
                                    <li>{{ $nama }}{{ $tipe ? ' (' . $tipe . ')' : '' }}</li>
                                  @endforeach
                                </ul>
                              @else
                                <em>- Tidak ada syarat -</em>
                              @endif
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
@endsection
