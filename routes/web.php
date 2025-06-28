<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    AuthController, PengajuanSuratController, JenisSuratController, BerkasSuratController,
    LaporanController, PenggunaController, AdminController, ProfilController,
    DashboardController, HomeController, OTPController
};
use App\Models\JenisSurat;

// Auth Routes
Route::controller(AuthController::class)->group(function () {
    Route::get('/login-admin', 'showAdminLogin')->name('login.admin');
    Route::post('/login-admin', 'adminLogin');
    Route::get('/', 'showPenggunaLogin')->name('login.pengguna');
    Route::post('/', 'penggunaLogin');
    Route::post('/logout', 'logout')->name('logout');
});

Route::get('/login', fn() => redirect()->route('login.admin'))->name('login');

// Register & OTP
Route::controller(PenggunaController::class)->group(function () {
    Route::get('/daftar', 'showRegisterForm')->name('pengguna.register');
    Route::post('/daftar', 'register')->name('pengguna.register.store');
});

//Lupa Password
Route::controller(OTPController::class)->group(function () {
    Route::get('lupa-password', 'showRequestForm')->name('otp.request.form');
    Route::post('kirim-otp', 'send')->name('otp.send');
    Route::get('verifikasi-otp', 'showVerifyForm')->name('otp.verify.form');
    Route::post('verifikasi-otp', 'verify')->name('otp.verify');
    Route::get('reset-password', 'showResetForm')->name('otp.password.reset.form');
    Route::post('reset-password', 'updatePassword')->name('otp.password.update');
});

// Admin Dashboard
Route::middleware('auth:admin')->get('/dashboard', [DashboardController::class, 'index'])->name('dashboard.index');

// Pengguna Dashboard
Route::middleware('auth:pengguna')->get('/index', [HomeController::class, 'index'])->name('pengguna.index');

// Routes for Admin & Kepala Desa
Route::middleware('auth:admin')->group(function () {

    // Berkas Surat
    Route::resource('berkas-surat', BerkasSuratController::class)->names('berkas');
    Route::controller(BerkasSuratController::class)->prefix('berkas-surat/{berkas}')->group(function () {
        Route::get('/preview', 'preview')->name('berkas.preview');
        Route::put('/konfirmasi', 'konfirmasi')->name('berkas-surat.konfirmasi');
        Route::put('/tolak', 'tolak')->name('berkas-surat.tolak');
    });

    // Laporan
    Route::prefix('laporan')->name('laporan.')->controller(LaporanController::class)->group(function () {
        Route::get('/', 'index')->name('index');
        Route::get('/cetak', 'print')->name('print');
        Route::get('/export/excel', 'exportExcel')->name('export.excel');
        Route::get('/export/pdf', 'exportPDF')->name('export.pdf');
    });

    // Admin only routes
    Route::middleware('admin.only')->group(function () {

        // Pengajuan Surat
        Route::resource('pengajuan-surat', PengajuanSuratController::class)->names('pengajuan');
        Route::controller(PengajuanSuratController::class)->prefix('pengajuan-surat/{pengajuanSurat}')->group(function () {
            Route::put('/tolak', 'tolak')->name('pengajuan-surat.tolak');
            Route::post('/nomor-urut', 'isiNomorUrut')->name('pengajuan-surat.nomor-urut');
            Route::post('/terima', 'terima')->name('pengajuan-surat.terima');
        });
        Route::get('/pengajuan-surat/{pengajuan}/preview', [PengajuanSuratController::class, 'previewPdf'])->name('pengajuan-surat.preview');

        // User Data
        Route::prefix('data-user')->name('data-user.')->group(function () {
            Route::get('/', [AdminController::class, 'index'])->name('index');  
            Route::resource('admin', AdminController::class)->except(['index']);
            Route::resource('pengguna', PenggunaController::class)->except(['index']);
            Route::post('/admin/bulk-delete', [AdminController::class, 'bulkDelete'])->name('admin.bulk-delete');
            Route::post('/pengguna/bulk-delete', [PenggunaController::class, 'bulkDelete'])->name('pengguna.bulk-delete');
            Route::get('/pengguna/ajax', [PenggunaController::class, 'penggunaAjax'])->name('pengguna.ajax');
            
        });

        // Jenis Surat
        Route::resource('jenis-surat', JenisSuratController::class)->names('jenis-surat');
        Route::post('/jenis-surat/{jenisSurat}/template', [JenisSuratController::class, 'updateTemplate'])->name('admin.jenis-surat.update-template');

        // Pesan
        Route::controller(DashboardController::class)->group(function () {
            Route::get('/pesan', 'pesanMasuk')->name('admin.pesan');
            Route::post('/pesan/{id}/baca', 'tandaiBaca')->name('admin.pesan.baca');
        });
    });
});

// Routes for Pengguna
Route::middleware('auth:pengguna')->group(function () {

    // Ajukan Surat
    Route::controller(PengajuanSuratController::class)->group(function () {
        Route::get('/ajukan-surat', 'create')->name('ajukan-surat.create');
        Route::post('/ajukan-surat', 'store')->name('ajukan-surat.store');
        Route::get('/list-surat', 'userList')->name('list-surat.userList');
    });

    // Profil
    Route::prefix('profil')->controller(ProfilController::class)->group(function () {
        Route::get('/', 'index')->name('pengguna.profil');
        Route::put('/', 'update')->name('pengguna.profil.update');
        Route::put('/password', 'updatePassword')->name('pengguna.profil.update-password');
    });

    // Kirim Pesan
    Route::post('/kirim-pesan', [HomeController::class, 'kirimPesan'])->name('pengguna.kirimPesan');

    // API Jenis Surat
    Route::get('/api/jenis-surat/{id}', function ($id) {
        $jenis = JenisSurat::findOrFail($id);
        return response()->json([
            'syarat' => $jenis->syarat,
            'keterangan_default' => $jenis->keterangan_default,
        ]);
    });
});
