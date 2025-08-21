<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        // database/migrations/xxxx_create_daftar_pengguna_table.php
        Schema::create('daftar', function (Blueprint $table) {
            $table->id();
            $table->string('nik')->unique();
            $table->string('password');
            $table->string('nama')->nullable();
            $table->string('alamat')->nullable();
            $table->string('tmp_lahir')->nullable();
            $table->date('tgl_lahir')->nullable();
            $table->enum('j_kel', ['Laki-laki','Perempuan'])->nullable();
            $table->string('nomor_hp')->nullable();
            $table->enum('pekerjaan', ['PNS', 'Wiraswasta', 'Petani', 'Buruh', 'Karyawan', 'Pensiun', 'IRT', 'Pelajar/Mahasiswa'])->nullable();
            $table->enum('agama', ['Islam', 'Kristen', 'Katolik', 'Hindu', 'Buddha', 'Konghucu'])->nullable();
            $table->enum('status', ['Kawin', 'Belum Kawin', 'Cerai Mati', 'Cerai Hidup'])->nullable();
            $table->json('data_tambahan')->nullable();
            $table->boolean('is_verified')->default(false);
            $table->timestamps();
        });

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('daftar');
    }
};
