@php
    use Carbon\Carbon;
    Carbon::setLocale('id');
    $bulanTeks = $bulan ? Carbon::create()->month((int)$bulan)->translatedFormat('F') : 'Semua Bulan';
@endphp

<table>
    <tr>
        <td colspan="5"><strong>Laporan Pengajuan Surat</strong></td>
    </tr>
    <tr>
        <td colspan="5">Bulan: {{ $bulanTeks }} | Tahun: {{ $tahun }}</td>
    </tr>
</table>

<br>

<table border="1">
    <thead>
        <tr>
            <th>No</th>
            <th>Nama Pemohon</th>
            <th>Jenis Surat</th>
            <th>Tanggal Pengajuan</th>
        </tr>
    </thead>
    <tbody>
        @foreach ($data as $i => $d)
        <tr>
            <td>{{ $i + 1 }}</td>
            <td>{{ $d->pengguna->nama }}</td>
            <td>{{ $d->jenisSurat->nama_jenis_surat }}</td>
            <td>{{ \Carbon\Carbon::parse($d->tanggal)->translatedFormat('l, d F Y') }}</td>
        </tr>
        @endforeach
    </tbody>
</table>
