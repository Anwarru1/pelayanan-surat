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
        Schema::create('password_otp', function (Blueprint $table) {
            $table->id();
            $table->string('nomor_hp');
            $table->string('otp_code');
            $table->timestamp('expired_at');
            $table->boolean('used')->default(false);
            $table->timestamps();
});

    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('password_otps');
    }
};
