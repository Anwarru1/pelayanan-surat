<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class PasswordOtp extends Model
{
    protected $table = 'password_otp';
    protected $fillable = ['nomor_hp', 'otp_code', 'expired_at', 'used'];

    protected $casts = [
        'expired_at' => 'datetime',
        'used' => 'boolean',
    ];

}
