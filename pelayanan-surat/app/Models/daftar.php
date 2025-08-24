<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;

class Daftar extends Authenticatable
{
    protected $table = 'daftar';
    protected $fillable = [
        'nik','password','nama','alamat','tmp_lahir','tgl_lahir','j_kel',
        'nomor_hp','pekerjaan','agama','status','data_tambahan','is_verified'
    ];

    protected $hidden = ['password'];
}