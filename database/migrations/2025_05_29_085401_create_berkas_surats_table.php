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
        Schema::create('berkas_surat', function (Blueprint $table) {
            $table->id();
            $table->foreignId('pengajuan_surat_id')->constrained('pengajuan_surat');
            $table->string('no_surat')->unique();
            $table->string('tanda_tangan')->nullable(); // Path to signature image
            $table->string('stempel')->nullable(); // Path to stamp image
            $table->date('tanggal_diajukan');
            $table->string('file_surat'); // Path to generated document
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('berkas_surat');
    }
};
