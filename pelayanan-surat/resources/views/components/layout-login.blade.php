<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Pelayanan Surat</title>
    <link rel="icon" href="{{ asset('assets/images/logo.png') }}?v=1" type="image/png">
    <link rel="stylesheet" href="{{ asset('css/simplebar.css') }}">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Overpass&display=swap">
    <link rel="stylesheet" href="{{ asset('css/feather.css') }}">
    <link rel="stylesheet" href="{{ asset('css/daterangepicker.css') }}">
    <link rel="stylesheet" href="{{ asset('css/app-light.css') }}" id="lightTheme">
    <link rel="stylesheet" href="{{ asset('css/app-dark.css') }}" id="darkTheme" disabled>
  </head>
  <body class="light">
    <div class="wrapper vh-100 d-flex flex-column justify-content-center align-items-center">
      <div class="text-center mb-3">
        <img src="{{ asset('assets/images/logo.jpeg') }}" alt="Logo" width="80" class="mb-2">
        <h5 class="mt-2 mb-0">PELAYANAN SURAT</h5>
      </div>

      <div class="card shadow p-4" style="max-width: 400px; width: 100%;">
        {{ $slot }}
      </div>
    </div>
  </body>
</html>
