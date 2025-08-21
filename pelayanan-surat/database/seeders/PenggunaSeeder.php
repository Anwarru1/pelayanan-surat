<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use PhpParser\Node\NullableType;

class PenggunaSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         DB::table('pengguna')->insert([
        'nik' => '1234567890123456',
        'password' => Hash::make('123'),
        'nama' => 'Budi Santoso',
        'alamat' => 'Jl. Contoh No.1',
        'j_kel' => 'Laki-laki',
        'agama' => 'islam',
        'pekerjaan' => 'Nganggur',
        'status' => 'Kawin',
        'tmp_lahir' => 'Jakarta',
        'tgl_lahir' => '1990-01-01',
        'created_at' => now(),
        'updated_at' => now(),
    ]);
    }
}
