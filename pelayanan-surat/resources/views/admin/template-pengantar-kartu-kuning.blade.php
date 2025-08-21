<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>
        @page {
            size: 21.5cm 33cm;
            margin: 2.54cm 2cm 2.54cm 2.5cm;
        }
        body {
            font-family: "Times New Roman", Times, serif;
            font-size: 12pt;
            line-height: 1.15;
        }
        .kop {
            text-align: center;
            margin-bottom: 5px;
        }
        .kop .header {
            font-weight: bold;
            font-size: 14pt;
            line-height: 1.3;
        }
        .kop .alamat {
            font-size: 11pt;
        }
        .logo {
            float: left;
            width: 80px;
            height: 80px;
            margin-right: 10px;
        }
        .garis {
            border-top: 3px solid black;
            margin-top: 5px;
            margin-bottom: 20px;
        }
        .judul {
            text-align: center;
            font-weight: bold;
            text-decoration: underline;
        }
        .nomor {
            text-align: center;
            margin-bottom: 15px;
        }
        .isi {
            text-align: justify;
        }
        .ttd {
            width: 100%;
            margin-top: 50px;
        }
        .kanan {
            float: right;
            text-align: center;
        }
        .clear {
            clear: both;
        }
    </style>
</head>
<body>

    <div class="kop">
        <img src="{{ public_path('storage/logo.png') }}" class="logo">
        <div class="header">
            PEMERINTAH KABUPATEN BANJARNEGARA<br>
            KECAMATAN BAWANG<br>
            DESA WIRAMASTRA
        </div>
        <div class="alamat">
            Alamat : Jl Raya Pucang-Kebondalem Km 08, Kode Pos 53471
        </div>
    </div>

    <div class="garis"></div>

    <div class="judul">NO KODE DESA</div>
    <div class="nomor">33.04.05.2004</div>

    <div class="judul">SURAT PENGANTAR/KETERANGAN</div>
    <div class="nomor">No: {{ no_surat }}</div>

    <div class="isi">
        <p>
            Kami yang bertanda tangan dibawah ini, Kepala Desa Wiramastra Kecamatan Bawang Kabupaten Banjarnegara menyatakan bahwa:
        </p>
        <ol style="margin-left: 20px;">
            <li>Nama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: {{ nama }}</li>
            <li>Tempat / Tgl Lahir&nbsp;&nbsp;&nbsp;&nbsp;: {{ tmp_lahir }}, {{ tgl_lahir }}</li>
            <li>NIK&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: {{ nik }}</li>
            <li>Agama&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: {{ agama }}</li>
            <li>Jenis Kelamin&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: {{ j_kel }}</li>
            <li>Status Perkawinan&nbsp;&nbsp;&nbsp;: {{ status }}</li>
            <li>Pekerjaan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: {{ pekerjaan }}</li>
            <li>Alamat&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: {{ alamat }}</li>
            <li>Keperluan&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Pembuatan Kartu Kuning</li>
            <li>Keterangan Lain&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: Yang bersangkutan benar-benar sedang berdomisili di Desa Wiramastra Kecamatan Bawang Kabupaten Banjarnegara</li>
        </ol>

        <p>
            Demikian Surat Keterangan/Pengantar ini kami buat dengan sebenarnya untuk dapat dipergunakan sebagaimana mestinya.
        </p>
    </div>

    <div class="ttd">
        <div class="kanan">
            Wiramastra, {{ tanggal }}<br>
            Kepala Desa Wiramastra<br><br><br><br><br>
            <strong><u>(MUTHOWIM)</u></strong>
        </div>
        <div class="clear"></div>
    </div>

</body>
</html>
