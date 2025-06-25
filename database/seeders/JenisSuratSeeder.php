<?php

// database/seeders/JenisSuratSeeder.php

namespace Database\Seeders;

use Illuminate\Database\Seeder;
use App\Models\JenisSurat;
use Illuminate\Support\Facades\DB;

class JenisSuratSeeder extends Seeder {
    public function run(): void {

        DB::table('jenis_surat')->insert([
            'kode_surat' => 'SK-001',
            'nama_jenis_surat' => 'Surat Keterangan Kartu Kuning',
            'syarat' => json_encode([
                'Foto Copy KTP',
                'Keperluan',
                'Keterangan'
            ]),
            'template' => 'templates/PPs5NEUXUNYfnovzyRX1En96EQUpPJRpQxWPTw1q.docx',
            'keterangan_default' => 'Surat ini digunakan sebagai bukti memiliki usaha aktif.',
        ]);

        DB::table('jenis_surat')->insert([
            'kode_surat' => 'SKA-001',
            'nama_jenis_surat' => 'Surat Keterangan Aktif',
            'syarat' => json_encode([
                'Foto Copy KTP',
                'Surat Pengantar RT/RW',
                'Keperluan',
                'Keterangan'
            ]),
            'template' => 'templates/ska.docx',
            'keterangan_default' => 'Surat ini digunakan sebagai bukti memiliki usaha aktif.',
        ]);

        DB::table('jenis_surat')->insert([
            'kode_surat' => 'SKTM-001',
            'nama_jenis_surat' => 'Surat Keterangan Tidak Mampu',
            'syarat' => json_encode([
                'Foto Copy KTP',
                'Foto Copy KK',
                'Surat Pengantar RT/RW',
                'Keperluan',
                'Keterangan'
            ]),
            'template' => 'templates/sktm.docx',
            'keterangan_default' => 'Surat ini digunakan sebagai bukti memiliki usaha aktif.',
        ]);

        DB::table('jenis_surat')->insert([
            'kode_surat' => 'SKD-001',
            'nama_jenis_surat' => 'Surat Keterangan Domisili',
            'syarat' => json_encode([
                'Foto Copy KTP',
                'Foto Copy KK',
                'Surat Pengantar RT/RW',
                'Keperluan',
                'Keterangan'
            ]),
            'template' => 'templates/skd.docx',
            'keterangan_default' => 'Surat ini digunakan sebagai bukti memiliki usaha aktif.',
        ]);
    }
}
