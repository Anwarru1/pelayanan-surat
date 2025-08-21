<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="{{ asset('assets/images/logo.png') }}">
  <title>Form Pendaftaran Pengguna</title>
  <link rel="stylesheet" href="css/simplebar.css">
  <link href="https://fonts.googleapis.com/css2?family=Overpass:wght@400;600;700&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="css/feather.css">
  <link rel="stylesheet" href="css/daterangepicker.css">
  <link rel="stylesheet" href="css/app-light.css" id="lightTheme">
  <link rel="stylesheet" href="css/app-dark.css" id="darkTheme" disabled>
</head>

<body class="light">
  <div class="wrapper vh-100">
    <div class="row align-items-center h-100">
      <div class="col-lg-8 col-md-10 col-12 mx-auto">
        <div class="card shadow">
          <div class="card-body p-4">
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
            <div class="text-center mb-4">
              <h3>Form Pendaftaran Pengguna</h3>
            </div>
            <form action="{{ route('pengguna.register.store') }}" method="POST" id="formDaftarPengguna">
              @csrf

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Nama</label>
                  <input type="text" name="nama" class="form-control @error('nama') is-invalid @enderror" >
                  @error('nama')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                  @enderror
                </div>
                <div class="form-group col-md-6">
                  <label>NIK</label>
                  <input type="text" name="nik" class="form-control @error('nik') is-invalid @enderror"   >
                  @error('nik')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                  @enderror
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Password</label>
                  <input type="password" name="password" class="form-control @error('password') is-invalid @enderror"   >
                  @error('password')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                  @enderror
                </div>
                <div class="form-group col-md-6">
                  <label>Konfirmasi Password</label>
                  <input type="password" name="password_confirmation" class="form-control @error('password_confirmation') is-invalid @enderror"   >
                  @error('password_confirmation')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                  @enderror
                </div>
              </div>

              <div class="form-group">
                <label>Jenis Kelamin</label><br>
                <div class="form-check form-check-inline">
                  <input class="form-check-input @error('j_kel') is-invalid @enderror" type="radio" name="j_kel" id="laki" value="Laki-laki"   >
                  <label class="form-check-label" for="laki">Laki-laki</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input @error('j_kel') is-invalid @enderror" type="radio" name="j_kel" id="perempuan" value="Perempuan"   >
                  <label class="form-check-label" for="perempuan">Perempuan</label>
                </div>
                @error('j_kel')
                  <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                @enderror
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Status</label>
                  <select name="status" class="custom-select @error('status') is-invalid @enderror"   >
                    <option value="" disabled selected>Pilih Status</option>
                    <option value="Kawin">Kawin</option>
                    <option value="Belum Kawin">Belum Kawin</option>
                    <option value="Cerai Mati">Cerai Mati</option>
                    <option value="Cerai Hidup">Cerai Hidup</option>
                  </select>
                  @error('status')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                  @enderror
                </div>
                <div class="form-group col-md-6">
                  <label>Nomor HP</label>
                  <input type="text" name="nomor_hp" class="form-control @error('nomor_hp') is-invalid @enderror"   >
                </div>
                @error('nomor_hp')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                @enderror
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Tempat Lahir</label>
                  <input type="text" name="tmp_lahir" class="form-control @error('tmp_lahir') is-invalid @enderror"   >
                  @error('tmp_lahir')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
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

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Pekerjaan</label>
                  <input type="text" name="pekerjaan" class="form-control @error('pekerjaan') is-invalid @enderror"   >
                  @error('pekerjaan')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                  @enderror
                </div>
                <div class="form-group col-md-6">
                  <label>Agama</label>
                  <select name="agama" class="custom-select @error('agama') is-invalid @enderror"   >
                    <option value="" disabled selected>Pilih Agama</option>
                    <option value="Islam">Islam</option>
                    <option value="Kristen">Kristen</option>
                    <option value="Katolik">Katolik</option>
                    <option value="Hindu">Hindu</option>
                    <option value="Buddha">Buddha</option>
                    <option value="Konghucu">Konghucu</option>
                  </select>
                  @error('agama')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                  @enderror
                </div>
              </div>

              <div class="form-group">
                <label>Alamat</label>
                <textarea name="alamat" class="form-control @error('alamat') is-invalid @enderror"   ></textarea>
                @error('alamat')
                    <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
                @enderror
              </div>

              <button type="submit" class="btn btn-primary btn-block">Daftar</button>
            </form>
          </div>
        </div>
        <p class="mt-4 mb-3 text-muted text-center">© 2025</p>
      </div>
    </div>
  </div>

  <script src="js/jquery.min.js"></script>
  <script src="js/popper.min.js"></script>
  <script src="js/moment.min.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/simplebar.min.js"></script>
  <script src="js/daterangepicker.js"></script>
  <script src="js/jquery.stickOnScroll.js"></script>
  <script src="js/tinycolor-min.js"></script>
  <script src="js/config.js"></script>
  <script src="js/apps.js"></script>
</body>

<script>
document.addEventListener('DOMContentLoaded', function () {
    const form = document.getElementById('formDaftarPengguna');
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

$(function() {
    $('#tgl_lahir').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        autoUpdateInput: false,   // otomatis update input
        timePicker: false,
        autoApply: true,
        locale: {
        format: 'DD-MM-YYYY', // contoh: 19 Agustus 2025
        daysOfWeek: [
          "Min", "Sen", "Sel", "Rab", "Kam", "Jum", "Sab"
        ],
        monthNames: [
          "Januari", "Februari", "Maret", "April", "Mei", "Juni",
          "Juli", "Agustus", "September", "Oktober", "November", "Desember"
        ],
        firstDay: 1
      }
    });
    
    // placeholder default
    $('#tgl_lahir').attr("placeholder", "dd-mm-yy");

    // Isi input hanya saat pengguna memilih tanggal
    $('#tgl_lahir').on('apply.daterangepicker', function(ev, picker) {
        $(this).val(picker.startDate.format('DD-MM-YYYY'));
    });

    // Bersihkan input jika dibatalkan
    $('#tgl_lahir').on('cancel.daterangepicker', function(ev, picker) {
        $(this).val('');
    });
});
</script>





</html>
