<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BerkasSurat extends Model
{
    use HasFactory;

    protected $table = 'berkas_surat';

    protected $fillable = [
        'pengajuan_surat_id',
        'no_surat',
        'tanda_tangan',
        'stempel',
        'tanggal_diajukan',
        'file_surat',
    ];

    public function pengajuanSurat()
    {
        return $this->belongsTo(PengajuanSurat::class, 'pengajuan_surat_id');
    }

    public function laporans()
    {
        return $this->hasMany(Laporan::class);
    }
}
