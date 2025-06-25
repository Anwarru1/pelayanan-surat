<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PesanPengguna extends Model
{
    use HasFactory;
    protected $table = 'pesan_pengguna';

    protected $fillable = ['pengguna_id', 'subjek', 'isi', 'is_read'];

    public function pengguna()
    {
        return $this->belongsTo(Pengguna::class);
    }
}
