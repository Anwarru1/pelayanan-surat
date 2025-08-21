<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Pengguna extends Authenticatable
{
    use HasFactory;

    protected $table = 'pengguna';

    protected $fillable = [
        'nik',
        'password',
        'nama',
        'alamat',
        'j_kel',
        'agama',
        'status',
        'nomor_hp',
        'pekerjaan',
        'tmp_lahir',
        'tgl_lahir',
    ];

    protected $hidden = [
        'password',
    ];

    public function pengajuanSurats()
    {
        return $this->hasMany(PengajuanSurat::class);
    }
}