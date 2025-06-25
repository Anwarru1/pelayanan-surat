<div class="modal fade" id="storePengguna" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="varyModalLabel">Tambah
                    Pengguna</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('data-user.pengguna.store') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="example-palaceholder">NIK</label>
                        <input type="text" class="form-control" id="nik" name="nik"
                            placeholder="Masukkan NIK" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="example-password">Password</label>
                        <input type="password" class="form-control" id="password" name="password"
                            placeholder="Masukkan Password" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="example-password">Nama</label>
                        <input type="text" class="form-control" id="nama" name="nama"
                            placeholder="Masukkan Nama Lengkap" required>
                    </div>
                    <div class="form-group">
                        <label>Jenis Kelamin</label><br>
                        <div class="form-check form-check-inline mb-3">   
                            <input class="form-check-input" type="radio" name="j_kel" id="inlineRadio1"
                                value="Laki-laki">
                            <label class="form-check-label" for="inlineRadio1">Laki-laki</label>
                        </div>
                        <div class="form-check form-check-inline mb-3">
                            <input class="form-check-input" type="radio" name="j_kel" id="inlineRadio2"
                                value="Perempuan">
                            <label class="form-check-label" for="inlineRadio2">Perempuan</label>
                        </div>
                    </div>
                    
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="agama">Agama</label>
                            <select name="agama" id="agama" class="custom-select" required>
                            <option value="" selected disabled>Pilih agama</option>
                            <option value="Islam">Islam</option>
                            <option value="Kristen">Kristen</option>
                            <option value="Katolik">Katolik</option>
                            <option value="Hindu">Hindu</option>
                            <option value="Buddha">Budha</option>
                            <option value="Konghucu">Konghucu</option>
                            </select>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="status">Status</label>
                            <select name="status" id="status" class="custom-select" required>
                            <option value="" selected disabled>Pilih status</option>
                            <option value="Kawin">Kawin</option>
                            <option value="Belum Kawin">Belum Kawin</option>
                            <option value="Cerai Mati">Cerai Mati</option>
                            <option value="Cerai Hidup">Cerai Hidup</option>
                            </select>
                        </div>
                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="inputCity">Tempat Lahir</label>
                            <input type="text" class="form-control" id="inputCity" name="tmp_lahir"
                                placeholder="Masukkan Tempat Lahir" required>
                        </div>
                        <div class="form-group col-md-6">
                            <label for="date-input1">Tanggal
                                Lahir</label>
                            <div class="input-group">
                                <input type="text" class="form-control drgpicker" id="date-input1" name="tgl_lahir"
                                    aria-describedby="button-addon2">
                                <div class="input-group-append">
                                    <div class="input-group-text" id="button-addon-date"><span
                                            class="fe fe-calendar fe-16"></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Pekerjaan</label>
                        <input type="text" class="form-control" id="inputAddress" name="pekerjaan" placeholder="Masukkan pekerjaan">
                    </div>
                    <div class="form-group">
                        <label for="nomor_hp">Nomor HP</label>
                        <input type="text" class="form-control" id="nomor_hp" name="nomor_hp" placeholder="Masukkan nomor HP">
                    </div>
                    <div class="form-group">
                        <label for="inputAddress">Alamat</label>
                        <input type="text" class="form-control" id="inputAddress" name="alamat" placeholder="Masukkan alamat">
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn mb-2 btn-danger" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn mb-2 btn-primary">Tambah</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>