@extends('layouts.app')

@section('content')
<main role="main" class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <h2 class="page-title mb-3">Verifikasi Warga Baru</h2>

        @if(session('success'))
          <div class="alert alert-success">{{ session('success') }}</div>
        @endif
        @if(session('error'))
          <div class="alert alert-danger">{{ session('error') }}</div>
        @endif

        <div class="card shadow">
          <div class="card-body">
            <table class="table table-bordered table-striped">
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

                  <!-- Modal Kelola -->
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
                          <table class="table table-bordered">
                            <tr><th>NIK</th><td>{{ $warga->nik }}</td></tr>
                            <tr><th>Nama</th><td>{{ $warga->nama }}</td></tr>
                            <tr><th>Alamat</th><td>{{ $warga->alamat }}</td></tr>
                            <tr>
                              <th>TTL</th>
                              <td>{{ $warga->tmp_lahir }}, {{ \Carbon\Carbon::parse($warga->tgl_lahir)->format('d-m-Y') }}</td>
                            </tr>
                            <tr><th>Jenis Kelamin</th><td>{{ $warga->j_kel }}</td></tr>
                            <tr><th>No. HP</th><td>{{ $warga->nomor_hp }}</td></tr>
                            <tr><th>Pekerjaan</th><td>{{ $warga->pekerjaan }}</td></tr>
                            <tr><th>Agama</th><td>{{ $warga->agama }}</td></tr>
                            <tr><th>Status Pernikahan</th><td>{{ $warga->status }}</td></tr>
                          </table>

                          <h6>Data Tambahan</h6>
                          @php
                            use Illuminate\Support\Str;
                            $dataTambahan = json_decode($warga->data_tambahan, true);
                          @endphp

                          @if($dataTambahan)
                            <ul class="list-group">
                              @foreach($dataTambahan as $key => $value)
                                <li class="list-group-item">
                                  <strong>{{ ucfirst($key) }}:</strong>
                                  @if(Str::endsWith($value, ['.jpg','.jpeg','.png','.pdf','.doc','.docx']))
                                    <a href="{{ asset('uploads/data_tambahan/'.$value) }}" target="_blank">Lihat File</a>
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

                        <div class="modal-footer d-flex justify-content-between">
                          <!-- Form Tolak -->
                          <form action="{{ route('verifikasi.tolak', $warga->id) }}" method="POST" class="d-inline w-50">
                            @csrf
                            @method('DELETE')
                            <div class="input-group">
                              <input type="text" name="alasan" class="form-control" placeholder="Alasan penolakan..." required>
                              <div class="input-group-append">
                                <button type="submit" class="btn btn-danger">Tolak</button>
                              </div>
                            </div>
                          </form>

                          <!-- Form Verifikasi -->
                          <form action="{{ route('verifikasi.verifikasi', $warga->id) }}" method="POST" class="d-inline">
                            @csrf
                            @method('PUT')
                            <button type="submit" class="btn btn-success">
                              <i class="fe fe-check"></i> Verifikasi
                            </button>
                          </form>

                          <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- End Modal -->
                @empty
                  <tr><td colspan="5" class="text-center">Tidak ada warga baru yang menunggu verifikasi.</td></tr>
                @endforelse
              </tbody>
            </table>
          </div>
        </div>

      </div>
    </div>
  </div>
</main>
@endsection
