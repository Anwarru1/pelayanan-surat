<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    public function up(): void {
        Schema::create('jenis_surat', function (Blueprint $table) {
            $table->id();
            $table->string('kode_surat');
            $table->string('nama_jenis_surat');
            $table->json('syarat');
            $table->string('template')->nullable(); // path file
            $table->timestamps();
        });
    }

    public function down(): void {
        Schema::dropIfExists('jenis_surat');
    }
};

