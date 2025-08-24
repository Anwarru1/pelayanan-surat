@extends('layouts.d-app') 

@section('content')
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12 col-lg-8">
          <h2 class="page-title mb-3">Profil Warga Domisili</h2>

          {{-- Alert --}}
          @if (session('success'))
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

          {{-- Card 1: Data Diri --}}
          <div class="card shadow mb-4">
            <div class="card-header">
              <h5 class="card-title mb-0">Data Diri</h5>
            </div>
            <div class="card-body">
              <form action="{{ route('profil.updateDataDiri') }}" method="POST">
                @csrf

                <div class="form-group">
                  <label for="nama">Nama Lengkap</label>
                  <input type="text" id="nama" name="nama" class="form-control" oninput="this.value = this.value.toUpperCase();"
                        value="{{ old('nama', Auth::user()->nama) }}" required>
                </div>

                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label for="tmp_lahir">Tempat Lahir</label>
                    <input type="text" id="tmp_lahir" name="tmp_lahir" class="form-control"
                          value="{{ old('tmp_lahir', Auth::user()->tmp_lahir) }}">
                  </div>
                  <div class="form-group col-md-6">
                    <label for="tgl_lahir">Tanggal Lahir</label>
                    <input type="date" id="tgl_lahir" name="tgl_lahir" class="form-control"
                          value="{{ old('tgl_lahir', Auth::user()->tgl_lahir) }}">
                  </div>
                </div>

                <div class="form-group">
                  <label for="alamat">Alamat</label>
                  <textarea id="alamat" name="alamat" rows="3" class="form-control">{{ old('alamat', Auth::user()->alamat) }}</textarea>
                </div>

                <div class="form-row">
                  <div class="form-group col-md-6">
                    <label>Jenis Kelamin</label><br>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="j_kel" id="Laki-laki" value="Laki-laki" {{ old('j_kel', Auth::user()->j_kel) === 'Laki-laki' ? 'checked' : '' }}>
                      <label class="form-check-label" for="Laki-laki">Laki-laki</label>
                    </div>
                    <div class="form-check form-check-inline">
                      <input class="form-check-input" type="radio" name="j_kel" id="Perempuan" value="Perempuan" {{ old('j_kel', Auth::user()->j_kel) === 'Perempuan' ? 'checked' : '' }}>
                      <label class="form-check-label" for="Perempuan">Perempuan</label>
                    </div>
                  </div>
                  <div class="form-group col-md-6">
                    <label for="status">Status Pernikahan</label>
                    <select id="status" name="status" class="custom-select">
                      <option value="" disabled selected>Pilih Status Pernikahan</option>
                      <option value="Kawin" {{ old('status', Auth::user()->status) == 'Kawin' ? 'selected' : '' }}>Kawin</option>
                      <option value="Belum Kawin" {{ old('status', Auth::user()->status) == 'Belum Kawin' ? 'selected' : '' }}>Belum Kawin</option>
                      <option value="Cerai Mati" {{ old('status', Auth::user()->status) == 'Cerai Mati' ? 'selected' : '' }}>Cerai Mati</option>
                      <option value="Cerai Hidup" {{ old('status', Auth::user()->status) == 'Cerai Hidup' ? 'selected' : '' }}>Cerai Hidup</option>
                    </select>
                  </div>
                </div>
              
              <div class="form-row">
                <div class="form-group col-md-6">
                  <label for="pekerjaan">Pekerjaan</label>
                  <select id="pekerjaan" name="pekerjaan" class="custom-select">
                    <option value="" disabled selected>Pilih Pekerjaan</option>
                    <option value="PNS" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'PNS' ? 'selected' : '' }}>PNS</option>
                    <option value="Wiraswasta" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'Wiraswasta' ? 'selected' : '' }}>Wiraswasta</option>
                    <option value="Petani" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'Petani' ? 'selected' : '' }}>Petani</option>
                    <option value="Buruh" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'Buruh' ? 'selected' : '' }}>Buruh</option>
                    <option value="Karyawan" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'Karyawan' ? 'selected' : '' }}>Karyawan</option>
                    <option value="Pensiun" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'Pensiun' ? 'selected' : '' }}>Pensiun</option>
                    <option value="IRT" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'IRT' ? 'selected' : '' }}>IRT (Ibu Rumah Tangga)</option>
                    <option value="Pelajar/Mahasiswa" {{ old('pekerjaan', Auth::user()->pekerjaan) == 'Pelajar/Mahasiswa' ? 'selected' : '' }}>Pelajar/Mahasiswa</option>
                  </select>
                </div>

                <div class="form-group col-md-6">
                  <label>Agama</label>
                  <select id="agama" name="agama" class="custom-select" >
                    <option value="" disabled selected>Pilih Agama</option>
                    <option value="Islam" {{ old('agama', Auth::user()->agama) == 'Islam' ? 'selected' : '' }}>Islam</option>
                    <option value="Kristen" {{ old('agama', Auth::user()->agama) == 'Kristen' ? 'selected' : '' }}>Kristen</option>
                    <option value="Katolik" {{ old('agama', Auth::user()->agama) == 'Katolik' ? 'selected' : '' }}>Katolik</option>
                    <option value="Hindu" {{ old('agama', Auth::user()->agama) == 'Hindu' ? 'selected' : '' }}>Hindu</option>
                    <option value="Buddha" {{ old('agama', Auth::user()->agama) == 'Buddha' ? 'selected' : '' }}>Buddha</option>
                    <option value="Konghucu" {{ old('agama', Auth::user()->agama) == 'Konghucu' ? 'selected' : '' }}>Konghucu</option>
                  </select>
                </div>
              </div>

                <div class="form-group">
                  <label for="nomor_hp">Nomor HP</label>
                  <input type="text" id="nomor_hp" name="nomor_hp" class="form-control"
                        value="{{ old('nomor_hp', Auth::user()->nomor_hp) }}">
                </div>

                <div class="form-group text-right">
                  <button type="submit" class="btn btn-primary">
                    <i class="fe fe-save"></i> Simpan Data
                  </button>
                </div>
              </form>
            </div>
          </div>

          {{-- Card 2: Upload File Data Tambahan --}}
          <div class="card shadow mb-4">
            <div class="card-header">
              <h5 class="card-title mb-0">Upload Data Tambahan</h5>
            </div>
            <div class="card-body">
              <form action="{{ route('profil.updateDataTambahan') }}" method="POST" enctype="multipart/form-data">
                @csrf

                @php
                  $dataTambahan = Auth::user()->data_tambahan ? json_decode(Auth::user()->data_tambahan, true) : [];
                @endphp

                {{-- KTP --}}
                <div class="form-group">
                  <label for="ktp">KTP</label>
                  <input type="file" name="data_tambahan[ktp]" class="form-control">
                  <small class="form-text text-muted">
                    Format: JPEG, JPG, PNG, atau PDF. Maksimal 2MB
                  </small>
                  @if(isset($dataTambahan['ktp']))
                    <p class="mt-2">File saat ini: 
                      <a href="{{ asset($dataTambahan['ktp']) }}" target="_blank">
                        {{ basename($dataTambahan['ktp']) }}
                      </a>
                    </p>
                  @endif
                </div>

                {{-- KK --}}
                <div class="form-group">
                  <label for="kk">Kartu Keluarga</label>
                  <input type="file" name="data_tambahan[kk]" class="form-control">
                  <small class="form-text text-muted">
                    Format: JPEG, JPG, PNG, atau PDF. Maksimal 2MB
                  </small>
                  @if(isset($dataTambahan['kk']))
                    <p class="mt-2">File saat ini: 
                      <a href="{{ asset($dataTambahan['kk']) }}" target="_blank">
                        {{ basename($dataTambahan['kk']) }}
                      </a>
                    </p>
                  @endif
                </div>

                {{-- Surat Pengantar RT/RW --}}
                <div class="form-group">
                  <label for="surat_rt">Surat Pengantar RT/RW</label>
                  <input type="file" name="data_tambahan[surat_rt]" class="form-control">
                  <small class="form-text text-muted">
                    Format: JPEG, JPG, PNG, atau PDF. Maksimal 2MB
                  </small>
                  @if(isset($dataTambahan['surat_rt']))
                    <p class="mt-2">File saat ini: 
                      <a href="{{ asset($dataTambahan['surat_rt']) }}" target="_blank">
                        {{ basename($dataTambahan['surat_rt']) }}
                      </a>
                    </p>
                  @endif
                </div>

                {{-- Surat Pindah --}}
                <div class="form-group">
                  <label for="surat_pindah">Surat Pindah (jika pendatang)</label>
                  <input type="file" name="data_tambahan[surat_pindah]" class="form-control">
                  <small class="form-text text-muted">
                    Format: JPEG, JPG, PNG, atau PDF. Maksimal 2MB
                  </small>
                  @if(isset($dataTambahan['surat_pindah']))
                    <p class="mt-2">File saat ini: 
                      <a href="{{ asset($dataTambahan['surat_pindah']) }}" target="_blank">
                        {{ basename($dataTambahan['surat_pindah']) }}
                      </a>
                    </p>
                  @endif
                </div>

                {{-- Pas Foto --}}
                <div class="form-group">
                  <label for="foto">Pas Foto</label>
                  <input type="file" name="data_tambahan[foto]" class="form-control">
                  <small class="form-text text-muted">
                    Format: JPEG, JPG, atau PNG. Maksimal 2MB
                  </small>
                  @if(isset($dataTambahan['foto']))
                    <p class="mt-2">File saat ini: 
                      <a href="{{ asset($dataTambahan['foto']) }}" target="_blank">
                        {{ basename($dataTambahan['foto']) }}
                      </a>
                    </p>
                  @endif
                </div>

                {{-- Surat Pernyataan Domisili --}}
                <div class="form-group">
                  <label for="pernyataan_domisili">Surat Pernyataan Domisili</label>
                  <input type="file" name="data_tambahan[pernyataan_domisili]" class="form-control">
                  <small class="form-text text-muted">
                    Format: JPEG, JPG, PNG, atau PDF. Maksimal 2MB
                  </small>
                  @if(isset($dataTambahan['pernyataan_domisili']))
                    <p class="mt-2">File saat ini: 
                      <a href="{{ asset($dataTambahan['pernyataan_domisili']) }}" target="_blank">
                        {{ basename($dataTambahan['pernyataan_domisili']) }}
                      </a>
                    </p>
                  @endif
                </div>


                <div class="text-right">
                  <button type="submit" class="btn btn-primary">
                    <i class="fe fe-save"></i> Simpan Data Tambahan
                  </button>
                </div>
              </form>
            </div>
          </div>



        </div>
      </div>
    </div>
  </main>
@endsection
