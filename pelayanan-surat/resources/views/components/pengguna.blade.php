<!-- Modal Tambah Pengguna -->
<div class="modal fade" id="storePengguna" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Tambah Pengguna</h5>
                <button type="button" class="close" data-dismiss="modal"><span>&times;</span></button>
            </div>
            <div class="modal-body">
                <form id="formTambahPengguna" action="{{ route('data-user.pengguna.store') }}" method="POST">
                    
                    @csrf
                    <div class="form-group">
                        <label for="nik">NIK</label>
                        <input type="text" class="form-control @error('nik') is-invalid @enderror" id="nik" name="nik" placeholder="Masukkan NIK"  >
                        @error('nik')
                            <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                        @enderror
                    </div>

                    <div class="form-group mb-3">
                        <label for="password">Password</label>
                        <input type="password" class="form-control @error('password') is-invalid @enderror" id="password" name="password" placeholder="Masukkan Password"  >
                        @error('password')
                            <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                        @enderror
                    </div>

                    <div class="form-group mb-3">
                        <label for="nama">Nama</label>
                        <input type="text" class="form-control @error('nama') is-invalid @enderror" oninput="this.value = this.value.toUpperCase();" id="nama" name="nama" placeholder="Masukkan Nama Lengkap"  >
                        @error('nama')
                            <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label>Jenis Kelamin</label><br>
                        <div class="form-check form-check-inline mb-3">
                            <input class="form-check-input @error('j_kel') is-invalid @enderror" type="radio" name="j_kel" id="Laki-laki" value="Laki-laki"  >
                            <label class="form-check-label" for="Laki-laki">Laki-laki</label>
                        </div>
                        <div class="form-check form-check-inline mb-3">
                            <input class="form-check-input @error('j_kel') is-invalid @enderror" type="radio" name="j_kel" id="Perempuan" value="Perempuan"  >
                            <label class="form-check-label" for="Perempuan">Perempuan</label>
                        </div>
                        @error('j_kel')
                            <div class="invalid-feedback d-block"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="agama">Agama</label>
                            <select name="agama" id="agama" class="custom-select @error('agama') is-invalid @enderror"  >
                                <option value="" selected disabled>Pilih agama</option>
                                <option value="Islam">Islam</option>
                                <option value="Kristen">Kristen</option>
                                <option value="Katolik">Katolik</option>
                                <option value="Hindu">Hindu</option>
                                <option value="Buddha">Budha</option>
                                <option value="Konghucu">Konghucu</option>
                            </select>
                            @error('agama')
                                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="status">Status</label>
                            <select name="status" id="status" class="custom-select @error('status') is-invalid @enderror"  >
                                <option value="" selected disabled>Pilih status</option>
                                <option value="Kawin">Kawin</option>
                                <option value="Belum Kawin">Belum Kawin</option>
                                <option value="Cerai Mati">Cerai Mati</option>
                                <option value="Cerai Hidup">Cerai Hidup</option>
                            </select>
                            @error('status')
                                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                            @enderror
                        </div>
                    </div>

                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <label for="tmp_lahir">Tempat Lahir</label>
                            <input type="text" class="form-control @error('tmp_lahir') is-invalid @enderror" id="tmp_lahir" name="tmp_lahir" placeholder="Masukkan Tempat Lahir"  >
                            @error('tmp_lahir')
                                <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                            @enderror
                        </div>
                        <div class="form-group col-md-6">
                            <label for="tgl_lahir">Tanggal Lahir</label>
                            <div class="input-group">
                                <input type="text" class="form-control drgpicker @error('tgl_lahir') is-invalid @enderror" id="tgl_lahir" name="tgl_lahir" autocomplete="off" >
                                <div class="input-group-append">
                                    <div class="input-group-text"><span class="fe fe-calendar fe-16"></span></div>
                                </div>
                                @error('tgl_lahir')
                                    <div class="invalid-feedback d-block"><strong>{{ $message }}</strong></div>
                                @enderror
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="pekerjaan">Pekerjaan</label>
                        <input type="text" class="form-control @error('pekerjaan') is-invalid @enderror" id="pekerjaan" name="pekerjaan" placeholder="Masukkan pekerjaan"  >
                        @error('pekerjaan')
                            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="nomor_hp">Nomor HP</label>
                        <input type="text" class="form-control @error('nomor_hp') is-invalid @enderror" id="nomor_hp" name="nomor_hp" placeholder="Masukkan nomor HP"  >
                        @error('nomor_hp')
                            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>

                    <div class="form-group">
                        <label for="alamat">Alamat</label>
                        <input type="text" class="form-control @error('alamat') is-invalid @enderror" id="alamat" name="alamat" placeholder="Masukkan alamat"  >
                        @error('alamat')
                            <div class="invalid-feedback"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary">Tambah</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


@push('scripts')
<script>
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('formTambahPengguna');
    if (!form) return;

    const fieldLabels = {
        nik: 'NIK',
        password: 'Password',
        nama: 'Nama',
        alamat: 'Alamat',
        j_kel: 'Jenis Kelamin',
        agama: 'Agama',
        status: 'Status',
        pekerjaan: 'Pekerjaan',
        nomor_hp: 'Nomor HP',
        tmp_lahir: 'Tempat Lahir',
        tgl_lahir: 'Tanggal Lahir'
    };

    form.addEventListener('submit', function (e) {
        let valid = true;

        // Bersihkan error lama
        form.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
        form.querySelectorAll('.invalid-feedback').forEach(el => el.remove());

        Object.keys(fieldLabels).forEach(field => {
            const el = form.querySelector(`[name="${field}"]`);
            let isInvalid = false;

            if (!el) return;

            if (el.type === 'radio') {
                const checked = form.querySelector(`[name="${field}"]:checked`);
                if (!checked) isInvalid = true;
            } else if (!el.value.trim()) {
                isInvalid = true;
            }

            if (isInvalid) {
                valid = false;

                const label = fieldLabels[field];
                const errorText = `${label} wajib diisi`;

                if (el.type === 'radio') {
                    const radios = form.querySelectorAll(`[name="${field}"]`);
                    radios.forEach(radio => radio.classList.add('is-invalid'));

                    const group = el.closest('.form-group');
                    if (group && !group.querySelector('.invalid-feedback')) {
                        const feedback = document.createElement('div');
                        feedback.className = 'invalid-feedback d-block';
                        feedback.innerText = errorText;
                        group.appendChild(feedback);
                    }
                } else {
                    el.classList.add('is-invalid');
                    const feedback = document.createElement('div');
                    feedback.className = 'invalid-feedback';
                    feedback.innerText = errorText;
                    el.parentNode.appendChild(feedback);
                }
            }
        });

        if (!valid) {
            e.preventDefault(); // Hentikan submit jika tidak valid
        }
    });
});
</script>
@endpush



