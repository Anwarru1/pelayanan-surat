<!DOCTYPE html>
<html lang="id">
<head>
  <meta charset="UTF-8">
  <title>Laporan Pengajuan Surat</title>
  <style>
    table { 
      border-collapse: collapse; 
      width: 100%; 
    }
    table, th, td { 
      border: 1px solid black; 
    }
    th, td { 
      padding: 6px; 
      text-align: left; 
    }
    th { 
      text-align: center; 
    }
    td.no, th.no { 
      text-align: center; 
      width: 50px; 
    }
  </style>
</head>
<body>
  @php
    use Carbon\Carbon;
    Carbon::setLocale('id');
    $bulanTeks = $bulan ? Carbon::create()->month((int)$bulan)->translatedFormat('F') : 'Semua Bulan';
  @endphp

  <p>
    <strong>Bulan:</strong> {{ $bulanTeks }}, 
    <strong>Tahun:</strong> {{ $tahun }}
  </p>

  <h2 style="text-align: center;">Laporan Pengajuan Surat</h2>

  <table>
    <thead>
      <tr>
        <th class="no">No</th>
        <th>Nama Pemohon</th>
        <th>Jenis Surat</th>
        <th>Tanggal Pengajuan</th>
      </tr>
    </thead>
    <tbody>
      @foreach ($data as $i => $d)
      <tr>
        <td class="no">{{ $i + 1 }}</td>
        <td>{{ $d->pengguna->nama }}</td>
        <td>{{ $d->nama_jenis_surat }}</td>
        <td>{{ Carbon::parse($d->tanggal)->translatedFormat('l, d F Y') }}</td>
      </tr>
      @endforeach
    </tbody>
  </table>
</body>
</html>
