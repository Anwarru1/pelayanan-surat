@extends('layouts.app')

@section('content')
<main role="main" class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <div class="d-flex justify-content-between align-items-center mb-2">
          <h2 class="page-title mb-0">Verifikasi Warga Domisili</h2>
          <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#panduanModal">
            <i class="fe fe-help-circle"></i> Panduan
          </button>
        </div>

        <!-- Modal Panduan -->
        <div class="modal fade" id="panduanModal" tabindex="-1" role="dialog" aria-labelledby="panduanModalLabel" aria-hidden="true">
          <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
              <div class="modal-header">
                <h5 class="modal-title" id="panduanModalLabel">Panduan Verifikasi Warga Domisili</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                  <span aria-hidden="true">&times;</span>
                </button>
              </div>
            <div class="modal-body">
              <ol>
                <li>Periksa daftar warga domisili yang mendaftar akun.</li>
                <li>Tekan <strong>Kelola</strong> untuk menampilkan detail warga domisili yang mendaftar akun.</li>
                <li>Cek apakah semua data yang dikirim warga sudah benar.</li>
                <li>Jika syarat valid, Tekan <strong>Verifikasi</strong> agar data warga yang mendeftar disimpan ke database dan warga bisa mengajukan surat</li>
                <li>Tombol <strong>Verifikasi</strong> hanya aktif jika warga domisili sudah melengkapi semua yang dibutuhkan di Profil</li>
                <li>Jika syarat tidak valid, tekan <strong>Tolak</strong> untuk menghapus akun warga yang mendaftar.</li>                
                <li>Gunakan kolom pencarian untuk memcari data yang diinginkan.</li>
              </ol>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
            </div>
          </div>
        </div>
        </div>

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

        <div class="card shadow">
          <div class="card-body">

            <div class="d-flex justify-content-between align-items-center mb-3">
                <div id="datatable-search"></div>
                <div>
                </div>
            </div>

            <table class="table datatables table-bordered" id="dataTable-1">
                <thead class="thead-dark">
                    <tr>
                    <th>NIK</th>
                    <th>Nama</th>
                    <th>Alamat</th>
                    <th>No HP</th>
                    <th>Aksi</th>
                    </tr>
                </thead>
                <tbody>
                    @forelse($wargaBaru as $warga)
                    <tr>
                        <td>{{ $warga->nik }}</td>
                        <td>{{ $warga->nama }}</td>
                        <td>{{ $warga->alamat }}</td>
                        <td>{{ $warga->nomor_hp }}</td>
                        <td class="text-center">
                        <button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#modalKelola-{{ $warga->id }}">
                            <i class="fe fe-eye"></i> Kelola
                        </button>
                        </td>
                    </tr>
                    @empty
                    <tr><td colspan="5" class="text-center">Tidak ada warga baru yang menunggu verifikasi.</td></tr>
                    @endforelse
                </tbody>
                </table>

                {{-- ========== Semua Modal ditaruh di luar tabel ========== --}}
                @foreach($wargaBaru as $warga)
                <div class="modal fade" id="modalKelola-{{ $warga->id }}" tabindex="-1" role="dialog" aria-labelledby="modalKelolaLabel-{{ $warga->id }}" aria-hidden="true">
                    <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                        <h5 class="modal-title">Detail Warga Domisili</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        </div>

                        <div class="modal-body">
                        <table class="table table-bordered" id="dataTable-1">
                            <tr><th>NIK</th><td>{{ $warga->nik }}</td></tr>
                            <tr><th>Nama</th><td>{{ $warga->nama }}</td></tr>
                            <tr><th>Alamat</th><td>{{ $warga->alamat }}</td></tr>
                            <tr><th>TTL</th><td>{{ $warga->tmp_lahir }} , {{ $warga->tgl_lahir }}</td></tr>
                            <tr><th>Jenis Kelamin</th><td>{{ $warga->j_kel }}</td></tr>
                            <tr><th>No. HP</th><td>{{ $warga->nomor_hp }}</td></tr>
                            <tr><th>Pekerjaan</th><td>{{ $warga->pekerjaan }}</td></tr>
                            <tr><th>Agama</th><td>{{ $warga->agama }}</td></tr>
                            <tr><th>Status Pernikahan</th><td>{{ $warga->status }}</td></tr>
                        </table>

                        <h6>Data Tambahan</h6>
                          @php
                              $dataTambahan = json_decode($warga->data_tambahan, true);
                              $labels = [
                                  'ktp' => 'KTP',
                                  'kk' => 'Kartu Keluarga',
                                  'surat_rt' => 'Surat Pengantar RT/RW',
                                  'surat_pindah' => 'Surat Pindah (jika ada)',
                                  'foto' => 'Pas Foto',
                                  'surat_pernyataan' => 'Surat Pernyataan Domisili',
                              ];
                          @endphp

                          @if($dataTambahan)
                              <ul class="list-group">
                                  @foreach($dataTambahan as $key => $value)
                                      <li class="list-group-item">
                                          <strong>{{ $labels[$key] ?? ucfirst($key) }}:</strong>
                                          @if(\Illuminate\Support\Str::endsWith($value, ['.jpg','.jpeg','.png']))
                                              <div class="mt-2">
                                                  <img src="{{ asset($value) }}" alt="{{ $key }}" 
                                                      class="img-thumbnail" style="max-height:150px">
                                              </div>
                                              <a href="{{ asset($value) }}" target="_blank" class="btn btn-sm btn-outline-primary mt-2">
                                                  Lihat File
                                              </a>
                                          @elseif(\Illuminate\Support\Str::endsWith($value, ['.pdf','.doc','.docx']))
                                              <a href="{{ asset($value) }}" target="_blank" class="btn btn-sm btn-outline-primary">
                                                  Lihat File
                                              </a>
                                          @else
                                              {{ $value }}
                                          @endif
                                      </li>
                                  @endforeach
                              </ul>
                          @else
                              <p class="text-muted">Tidak ada data tambahan.</p>
                          @endif


                        </div>

                        <div class="modal-footer d-flex justify-content-start">
                        {{-- Tombol Tolak --}}
                        <form action="{{ route('verifikasi.tolak', $warga->id) }}" method="POST" class="d-inline mr-2">
                            @csrf
                            @method('DELETE')
                            <button type="submit" class="btn btn-danger">
                            <i class="fe fe-x"></i> Tolak
                            </button>
                        </form>

                        {{-- Tombol Verifikasi --}}
                        @php
                            $isComplete = $warga->nik 
                                && $warga->nama 
                                && $warga->alamat 
                                && $warga->nomor_hp 
                                && $warga->tmp_lahir 
                                && $warga->tgl_lahir 
                                && $warga->j_kel 
                                && $warga->pekerjaan 
                                && $warga->agama 
                                && $warga->status 
                                && !empty($warga->data_tambahan); // pastikan ada data tambahan juga
                        @endphp

                        <form action="{{ route('verifikasi.verifikasi', $warga->id) }}" method="POST" class="d-inline">
                            @csrf
                            @method('PUT')
                            <button type="submit" 
                                    class="btn btn-success {{ !$isComplete ? 'disabled' : '' }}" 
                                    {{ !$isComplete ? 'disabled' : '' }}>
                                <i class="fe fe-check"></i> Verifikasi
                            </button>
                        </form>


                        {{-- Tombol Tutup tetap di kanan --}}
                        <button type="button" class="btn btn-secondary ml-auto" data-dismiss="modal">Tutup</button>
                        </div>

                    </div>
                    </div>
                </div>
                @endforeach

          </div>
        </div>

      </div>
    </div>
  </div>
</main>
@endsection
