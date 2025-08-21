@props(['pengguna'])

<div class="modal fade" id="editPengguna{{ $pengguna->id }}" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="varyModalLabel">
                    Edit Pengguna</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('data-user.pengguna.update', $pengguna->id) }}" method="POST">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="example-palaceholder">NIK</label>
                        <input type="text" class="form-control" id="nik" name="nik"
                            value="{{ old('nik', $pengguna->nik ?? '') }}" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="example-password">Password {{ isset($pengguna) ? '(kosongkan jika tidak diubah)' : '' }}</label>
                        <input type="password" class="form-control" id="password" name="password">
                    </div>
                    <div class="form-group mb-3">
                        <label for="example-password">Nama</label>
                        <input type="text" class="form-control" id="nama" name="nama" oninput="this.value = this.value.toUpperCase();"
                            value="{{ old('nama', $pengguna->nama ?? '') }}" required>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label>Jenis Kelamin</label><br>
                            <div class="form-check form-check-inline mb-3">   
                                <input class="form-check-input" type="radio" name="j_kel" id="laki-laki{{ $pengguna->id }}"
                                    value="Laki-laki" {{ $pengguna->j_kel === 'Laki-laki' ? 'checked' : '' }}>
                                <label class="form-check-label" for="laki-laki{{ $pengguna->id }}">Laki-laki</label>
                            </div>
                            <div class="form-check form-check-inline mb-3">
                                <input class="form-check-input" type="radio" name="j_kel" id="perempuan{{ $pengguna->id }}"
                                    value="Perempuan" {{ $pengguna->j_kel === 'Perempuan' ? 'checked' : '' }}>
                                <label class="form-check-label" for="perempuan{{ $pengguna->id }}">Perempuan</label>
                            </div>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="role">Role</label>
                            <select name="role" id="role" class="custom-select" required>
                                <option value="" disabled {{ $pengguna->role ? '' : 'selected' }}>Pilih role</option>
                                <option value="warga_tetap" {{ $pengguna->role == 'warga_tetap' ? 'selected' : '' }}>Warga Tetap</option>
                                <option value="warga_domisili" {{ $pengguna->role == 'warga_domilisi' ? 'selected' : '' }}>Warga Domisili</option>
                            </select>
                        </div>
                    </div>
                    
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="agama">Agama</label>
                            <select name="agama" id="agama" class="custom-select" required>
                                <option value="" disabled {{ $pengguna->agama ? '' : 'selected' }}>Pilih agama</option>
                                <option value="Islam" {{ $pengguna->agama == 'Islam' ? 'selected' : '' }}>Islam</option>
                                <option value="Kristen" {{ $pengguna->agama == 'Kristen' ? 'selected' : '' }}>Kristen</option>
                                <option value="Katolik" {{ $pengguna->agama == 'Katolik' ? 'selected' : '' }}>Katolik</option>
                                <option value="Hindu" {{ $pengguna->agama == 'Hindu' ? 'selected' : '' }}>Hindu</option>
                                <option value="Buddha" {{ $pengguna->agama == 'Buddha' ? 'selected' : '' }}>Buddha</option>
                                <option value="Konghucu" {{ $pengguna->agama == 'Konghucu' ? 'selected' : '' }}>Konghucu</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="status">Status</label>
                            <select name="status" id="status" class="custom-select" required>
                                <option value="" disabled {{ $pengguna->status ? '' : 'selected' }}>Pilih status</option>
                                <option value="Kawin" {{ $pengguna->status == 'Kawin' ? 'selected' : '' }}>Kawin</option>
                                <option value="Belum Kawin" {{ $pengguna->status == 'Belum Kawin' ? 'selected' : '' }}>Belum Kawin</option>
                                <option value="Cerai Mati" {{ $pengguna->status == 'Cerai Mati' ? 'selected' : '' }}>Cerai Mati</option>
                                <option value="Cerai Hidup" {{ $pengguna->status == 'Cerai Hidup' ? 'selected' : '' }}>Cerai Hidup</option>
                            </select>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">Tempat Lahir</label>
                            <input type="text" class="form-control" id="inputCity" name="tmp_lahir"
                                value="{{ old('tmp_lahir', $pengguna->tmp_lahir ?? '') }}" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="date-input{{ $pengguna->id }}">Tanggal
                                Lahir</label>
                            <div class="input-group">
                                <input type="text" class="form-control drgpicker" id="date-input{{ $pengguna->id }}" name="tgl_lahir"
                                    aria-describedby="button-addon-date{{ $pengguna->id }}" value="{{ old('tgl_lahir', \Carbon\Carbon::parse($pengguna->tgl_lahir)->format('m/d/Y')) }}" required>
                                <div class="input-group-append">
                                    <div class="input-group-text" id="button-addon-date{{ $pengguna->id }}"><span
                                            class="fe fe-calendar fe-16"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                        <label for="pekerjaan">Pekerjaan</label>
                        <input type="text" class="form-control" id="pekerjaan" name="pekerjaan" placeholder="Masukkan pekerjaan"
                            value="{{ old('pekerjaan', $pengguna->pekerjaan) }}">
                        </div>

                        <div class="form-group">
                        <label for="nomor_hp">Nomor HP</label>
                        <input type="text" class="form-control" id="nomor_hp" name="nomor_hp" placeholder="Masukkan nomor HP"
                            value="{{ old('nomor_hp', $pengguna->nomor_hp) }}">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputAddress">Alamat</label>
                        <input type="text" class="form-control" id="inputAddress" name="alamat" value="{{ old('alamat', $pengguna->alamat ?? '') }}" required>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn mb-2 btn-danger" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn mb-2 btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>