<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\AuthController;
use App\Http\Controllers\PengajuanSuratController;
use App\Http\Controllers\JenisSuratController;
use App\Http\Controllers\BerkasSuratController;
use App\Http\Controllers\LaporanController;
use App\Http\Controllers\PenggunaController;
use App\Http\Controllers\AdminController;
use App\Http\Controllers\ProfilController;
use App\Http\Controllers\DashboardController;
use App\Http\Controllers\HomeController;
use App\Http\Controllers\OTPController;
use App\Models\JenisSurat;

//auth
Route::get('/login-admin', [AuthController::class, 'showAdminLogin'])->name('login.admin');
Route::post('/login-admin', [AuthController::class, 'adminLogin']);
Route::get('/', [AuthController::class, 'showPenggunaLogin'])->name('login.pengguna');
Route::post('/', [AuthController::class, 'penggunaLogin']);
Route::post('/logout', [AuthController::class, 'logout'])->name('logout');

//Route::get('/login', fn() => redirect('/login-admin'))->name('login');

Route::middleware('auth:admin')->group(function () {
    Route::get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');
});

Route::middleware(['auth:pengguna'])->group(function() {
    Route::get('/index', [HomeController::class, 'index'])->name('pengguna.index');
});

Route::get('/login', function () {
    return redirect()->route('login.admin');
})->name('login');

Route::get('/daftar', [PenggunaController::class, 'showRegisterForm'])->name('pengguna.register');
Route::post('/daftar', [PenggunaController::class, 'register'])->name('pengguna.register.store');

//Lupa Password
Route::get('lupa-password', [OTPController::class, 'showRequestForm'])->name('otp.request.form');
Route::post('kirim-otp', [OTPController::class, 'send'])->name('otp.send');
Route::get('verifikasi-otp', [OTPController::class, 'showVerifyForm'])->name('otp.verify.form');
Route::post('verifikasi-otp', [OTPController::class, 'verify'])->name('otp.verify');
Route::get('reset-password', [OTPController::class, 'showResetForm'])->name('otp.password.reset.form');
Route::post('reset-password', [OTPController::class, 'updatePassword'])->name('otp.password.update');


// ADMIN & KEPALA DESA
Route::middleware('auth:admin')->group(function () {
    
    Route::resource('berkas-surat', BerkasSuratController::class)->names('berkas');
    Route::get('/berkas-surat/{berkas}/preview', [BerkasSuratController::class, 'preview'])->name('berkas.preview');
    Route::put('/berkas-surat/{berkas}/konfirmasi', [\App\Http\Controllers\BerkasSuratController::class, 'konfirmasi'])->name('berkas-surat.konfirmasi');
    Route::put('/berkas-surat/{berkas}/tolak', [BerkasSuratController::class, 'tolak'])->name('berkas-surat.tolak');

    Route::prefix('laporan')->name('laporan.')->group(function () {
    Route::get('/', [LaporanController::class, 'index'])->name('index');
    Route::get('/cetak', [LaporanController::class, 'print'])->name('print');
    Route::get('/export/excel', [LaporanController::class, 'exportExcel'])->name('export.excel');
    Route::get('/export/pdf', [LaporanController::class, 'exportPDF'])->name('export.pdf');
});

    Route::middleware('admin.only')->group(function () {
        
        Route::resource('pengajuan-surat', PengajuanSuratController::class)->names('pengajuan');
        Route::put('/pengajuan-surat/{pengajuanSurat}/tolak', [PengajuanSuratController::class, 'tolak'])->name('pengajuan-surat.tolak');
        Route::post('/pengajuan-surat/{pengajuanSurat}/nomor-urut', [PengajuanSuratController::class, 'isiNomorUrut'])->name('pengajuan-surat.nomor-urut');
        Route::post('/pengajuan-surat/{pengajuanSurat}/terima', [PengajuanSuratController::class, 'terima'])->name('pengajuan-surat.terima');
        Route::get('/pengajuan-surat/{pengajuan}/preview', [PengajuanSuratController::class, 'previewDocx'])->name('pengajuan-surat.preview');
        Route::prefix('data-user')->name('data-user.')->group(function () {
            Route::get('/', [AdminController::class, 'index'])->name('index');

            Route::resource('admin', AdminController::class)->except(['index']);
            Route::resource('pengguna', PenggunaController::class)->except(['index']);
        });
        // CRUD jenis-surat
        Route::resource('jenis-surat', JenisSuratController::class)->names('jenis-surat');
        Route::post('/jenis-surat/{jenisSurat}/template', [JenisSuratController::class, 'updateTemplate'])        
        ->name('admin.jenis-surat.update-template');

        // Admin - Tampilkan Pesan
        Route::get('/pesan', [DashboardController::class, 'pesanMasuk'])->name('admin.pesan');
        Route::post('/pesan/{id}/baca', [DashboardController::class, 'tandaiBaca'])->name('admin.pesan.baca');
        });
        
});

Route::middleware('auth:pengguna')->group(function () {

    Route::get('/ajukan-surat', [PengajuanSuratController::class, 'create'])->name('ajukan-surat.create');
    Route::post('/ajukan-surat', [PengajuanSuratController::class, 'store'])->name('ajukan-surat.store');
    Route::get('/api/jenis-surat/{id}', function($id) {
    $jenis = JenisSurat::findOrFail($id);
    return response()->json([
        'syarat' => $jenis->syarat, // diasumsikan kolom syarat bertipe JSON
        'keterangan_default' => $jenis->keterangan_default,
    ]);
    });

    Route::get('/list-surat', [PengajuanSuratController::class, 'userList'])->name('list-surat.userList');
    Route::prefix('profil')->group(function() {
        Route::get('/', [ProfilController::class, 'index'])->name('pengguna.profil');
        Route::put('/', [ProfilController::class, 'update'])->name('pengguna.profil.update');
        Route::put('/password', [ProfilController::class, 'updatePassword'])->name('pengguna.profil.update-password');
    });

    // Pengguna - Kirim Pesan
    Route::post('/kirim-pesan', [HomeController::class, 'kirimPesan'])->name('pengguna.kirimPesan');

});

