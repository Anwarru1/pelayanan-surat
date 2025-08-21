@extends('layouts.p-app') 

@section('content')
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12 col-lg-8">

          {{-- Profil Saya --}}
          <div class="card shadow mb-4">
            <div class="card-header">
                <h5 class="card-title mb-0">Informasi Profil</h5>
            </div>
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
                <div class="table-responsive">
                <table class="table table-bordered">
                    <tbody>
                    <tr>
                        <td>Nama Lengkap</td>
                        <td>{{ Auth::user()->nama }}</td>
                    </tr>
                    <tr>
                        <td>NIK</td>
                        <td>{{ Auth::user()->nik }}</td>
                    </tr>
                    <tr>
                        <td>Jenis Kelamin</td>
                        <td>{{ Auth::user()->j_kel == 'Laki-laki' ? 'Laki-laki' : 'Perempuan' }}</td>
                    </tr>
                    <tr>
                        <td>Tempat, Tanggal Lahir</td>
                        <td>{{ Auth::user()->tmp_lahir }}, {{ \Carbon\Carbon::parse(Auth::user()->tgl_lahir)->format('d/m/Y') }}</td>
                    </tr>
                    <tr>
                        <td>Agama</td>
                        <td>{{ Auth::user()->agama }}</td>
                    </tr>
                    <tr>
                        <td>Status</td>
                        <td>{{ Auth::user()->status }}</td>
                    </tr>
                    <tr>
                        <td>Pekerjaan</td>
                        <td>{{ Auth::user()->pekerjaan }}</td>
                    </tr>
                    <tr>
                        <td>Nomor HP</td>
                        <td>{{ Auth::user()->nomor_hp }}</td>
                    </tr>
                    <tr>
                        <td>Alamat</td>
                        <td>{{ Auth::user()->alamat }}</td>
                    </tr>
                    </tbody>
                </table>
                </div>

                <div class="text-right mt-3">
                <button class="btn btn-outline-secondary btn-sm" data-toggle="modal" data-target="#editProfilModal">
                    <i class="fe fe-edit"></i> Edit Profil
                </button>
                </div>
            </div>
            </div>


          {{-- Form Ganti Password --}}
          <div class="card shadow">
            <div class="card-header">
              <h5 class="card-title mb-0">Ganti Password</h5>
            </div>
            <div class="card-body">
              <form action="{{ route('pengguna.profil.update-password') }}" method="POST">
                @csrf
                @method('PUT')

                <div class="form-group">
                  <label for="current_password">Password Saat Ini</label>
                  <input type="password" name="current_password" id="current_password"
                         class="form-control @error('current_password') is-invalid @enderror" required>
                  @error('current_password')
                    <div class="invalid-feedback">{{ $message }}</div>
                  @enderror
                </div>

                <div class="form-group">
                  <label for="new_password">Password Baru</label>
                  <input type="password" name="new_password" id="new_password"
                         class="form-control @error('new_password') is-invalid @enderror" required>
                  @error('new_password')
                    <div class="invalid-feedback">{{ $message }}</div>
                  @enderror
                  <small class="form-text text-muted">Minimal 8 karakter.</small>
                </div>

                <div class="form-group">
                  <label for="new_password_confirmation">Konfirmasi Password Baru</label>
                  <input type="password" name="new_password_confirmation" id="new_password_confirmation"
                         class="form-control" required>
                </div>

                <div class="text-right">
                  <button type="submit" class="btn btn-primary">
                    <i class="fe fe-save"></i> Simpan Password
                  </button>
                </div>
              </form>
            </div>
          </div>

        </div>
      </div>
    </div>
  </main>

  {{-- Modal Edit Profil --}}
  <div class="modal fade" id="editProfilModal" tabindex="-1" role="dialog" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Edit Profil</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Tutup">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>

        <form action="{{ route('pengguna.profil.update') }}" method="POST">
          @csrf
          @method('PUT')

          <div class="modal-body">
            <div class="form-group">
              <label for="nama">Nama Lengkap</label>
              <input type="text" id="nama" name="nama" class="form-control" value="{{ Auth::user()->nama }}" required>
            </div>

            <div class="form-group">
              <label for="alamat">Alamat</label>
              <textarea id="alamat" name="alamat" class="form-control" rows="3" required>{{ Auth::user()->alamat }}</textarea>
            </div>

            <div class="form-row">
              <div class="form-group col-md-6">
                <label for="pekerjaan">Pekerjaan</label>
                <input type="text" id="pekerjaan" name="pekerjaan" class="form-control" value="{{ Auth::user()->pekerjaan }}">
              </div>
              <div class="form-group col-md-6">
                <label for="status">Status</label>
                <select name="status" id="status" class="custom-select" required>
                  <option value="" disabled {{ Auth::user()->status == null ? 'selected' : '' }}>Pilih status</option>
                  <option value="Kawin" {{ Auth::user()->status == 'Kawin' ? 'selected' : '' }}>Kawin</option>
                  <option value="Belum Kawin" {{ Auth::user()->status == 'Belum Kawin' ? 'selected' : '' }}>Belum Kawin</option>
                </select>
              </div>
            </div>
            <div class="form-group">
              <label for="nama">Nomor HP</label>
              <input type="text" id="nomor_hp" name="nomor_hp" class="form-control" value="{{ Auth::user()->nomor_hp }}">
            </div>
          </div>

          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
            <button type="submit" class="btn btn-primary">Simpan Perubahan</button>
          </div>
        </form>
      </div>
    </div>
  </div>
@endsection
