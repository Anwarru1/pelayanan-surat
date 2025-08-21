<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class JenisSurat extends Model {
    // Nama tabel jika tidak sesuai konvensi

    use HasFactory;
    protected $table = 'jenis_surat';

    protected $fillable = [
        'kode_surat',
        'nama_jenis_surat', 
        'syarat', 
        'template',
        'keterangan_default'
    ];

    protected $casts = [
        'syarat' => 'array',
    ];

    public function pengajuanSurats() {
        return $this->hasMany(PengajuanSurat::class);
    }

}

