<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Laporan extends Model
{
    use HasFactory;

    protected $table = 'laporan';

    protected $fillable = [
        'nama_laporan',
        'berkas_surat_id',
        'periode_awal',
        'periode_akhir',
        'file_laporan',
    ];

    public function berkasSurat()
    {
        return $this->belongsTo(BerkasSurat::class);
    }
}
