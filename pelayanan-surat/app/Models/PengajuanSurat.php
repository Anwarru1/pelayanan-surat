<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PengajuanSurat extends Model
{
    use HasFactory;

    protected $table = 'pengajuan_surat';

    protected $fillable = [
        'jenis_surat_id', 
        'nama_jenis_surat',
        'pengguna_id',
        'nama',
        'data_tambahan',
        'nomor_urutan',
        'tanggal',
        'status',
        'keterangan',
    ];

    protected $casts = [
        'data_tambahan' => 'array'
    ];

    public function jenisSurat()
    {
        return $this->belongsTo(JenisSurat::class);
    }

    public function pengguna()
    {
        return $this->belongsTo(Pengguna::class);
    }

    public function berkasSurat()
    {
        return $this->hasOne(BerkasSurat::class,  'pengajuan_surat_id');
    }
}
