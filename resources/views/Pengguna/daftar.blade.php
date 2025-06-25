<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">
  <link rel="icon" href="favicon.ico">
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
            <form action="{{ route('pengguna.register.store') }}" method="POST">
              @csrf

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Nama</label>
                  <input type="text" name="nama" class="form-control" required>
                </div>
                <div class="form-group col-md-6">
                  <label>NIK</label>
                  <input type="text" name="nik" class="form-control" required>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Password</label>
                  <input type="password" name="password" class="form-control" required>
                </div>
                <div class="form-group col-md-6">
                  <label>Konfirmasi Password</label>
                  <input type="password" name="password_confirmation" class="form-control" required>
                </div>
              </div>

              <div class="form-group">
                <label>Jenis Kelamin</label><br>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="j_kel" id="laki" value="Laki-laki" required>
                  <label class="form-check-label" for="laki">Laki-laki</label>
                </div>
                <div class="form-check form-check-inline">
                  <input class="form-check-input" type="radio" name="j_kel" id="perempuan" value="Perempuan" required>
                  <label class="form-check-label" for="perempuan">Perempuan</label>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Status</label>
                  <select name="status" class="custom-select" required>
                    <option value="" disabled selected>Pilih Status</option>
                    <option value="Kawin">Kawin</option>
                    <option value="Belum Kawin">Belum Kawin</option>
                    <option value="Cerai Mati">Cerai Mati</option>
                    <option value="Cerai Hidup">Cerai Hidup</option>
                  </select>
                </div>
                <div class="form-group col-md-6">
                  <label>Nomor HP</label>
                  <input type="text" name="nomor_hp" class="form-control" required>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Tempat Lahir</label>
                  <input type="text" name="tmp_lahir" class="form-control" required>
                </div>
                <div class="form-group col-md-6">
                  <label>Tanggal Lahir</label>
                  <input type="date" name="tgl_lahir" class="form-control" required>
                </div>
              </div>

              <div class="form-row">
                <div class="form-group col-md-6">
                  <label>Pekerjaan</label>
                  <input type="text" name="pekerjaan" class="form-control" required>
                </div>
                <div class="form-group col-md-6">
                  <label>Agama</label>
                  <select name="agama" class="custom-select" required>
                    <option value="" disabled selected>Pilih Agama</option>
                    <option value="Islam">Islam</option>
                    <option value="Kristen">Kristen</option>
                    <option value="Katolik">Katolik</option>
                    <option value="Hindu">Hindu</option>
                    <option value="Buddha">Buddha</option>
                    <option value="Konghucu">Konghucu</option>
                  </select>
                </div>
              </div>

              <div class="form-group">
                <label>Alamat</label>
                <textarea name="alamat" class="form-control" required></textarea>
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

</html>
