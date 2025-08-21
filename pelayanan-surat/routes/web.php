<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\{
    AuthController, PengajuanSuratController, JenisSuratController, BerkasSuratController,
    LaporanController, PenggunaController, AdminController, ProfilController,
    DashboardController, HomeController, ResetPasswordController, ProfilDomisiliController
};
use App\Models\JenisSurat;
use Illuminate\Support\Facades\Artisan;




// Auth Routes
Route::controller(AuthController::class)->group(function () {
    Route::get('/login-admin', 'showAdminLogin')->name('login.admin');
    Route::post('/login-admin', 'adminLogin');
    Route::get('/', 'showPenggunaLogin')->name('login.pengguna');
    Route::post('/', 'penggunaLogin');
    
    // Logout Admin
    Route::post('/logout/admin', [AuthController::class, 'logoutAdmin'])->name('logout.admin');
    
    Route::post('logout/kepala-desa', [AuthController::class, 'logoutKepalaDesa'])->name('logout.kepala-desa');
    
    // Logout Pengguna
    Route::post('/logout/pengguna', [AuthController::class, 'logoutPengguna'])->name('logout.pengguna');

});

Route::get('/login', fn() => redirect()->route('login.admin'))->name('login');

// Register & OTP
Route::controller(PenggunaController::class)->group(function () {
    Route::get('/daftar', 'showRegisterForm')->name('pengguna.register');
    Route::post('/daftar', 'register')->name('pengguna.register.store');
});

//Lupa Password
Route::get('/reset-password-request', [ResetPasswordController::class, 'create'])->name('password.reset.form');
Route::post('/reset-password-request', [ResetPasswordController::class, 'store'])->name('password.reset.request');

// Admin Dashboard

Route::middleware('auth:admin')->group(function () {
    Route::get('/dashboard/admin', [DashboardController::class, 'admin'])->name('dashboard.admin'); 
    Route::get('/dashboard/kepala-desa', [DashboardController::class, 'kepalaDesa'])->name('dashboard.kepala-desa');
    // routes admin-only
});


// Pengguna Dashboard
Route::middleware('auth:pengguna')->get('/index', [HomeController::class, 'index'])->name('pengguna.index');


// Routes for Admin & Kepala Desa
Route::middleware('auth:admin')->group(function () {

    // Berkas Surat
    Route::resource('berkas-surat', BerkasSuratController::class)->names('berkas');
    Route::controller(BerkasSuratController::class)->prefix('berkas-surat/{berkas}')->group(function () {
        Route::get('/preview', 'previewDocx')->name('berkas.preview');
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
        Route::resource('pengajuan-surat', PengajuanSuratController::class)->names('pengajuan')->except(['destroy']);
        Route::controller(PengajuanSuratController::class)->prefix('pengajuan-surat/{pengajuanSurat}')->group(function () {
            Route::put('/tolak', 'tolak')->name('pengajuan-surat.tolak');
            Route::post('/nomor-urut', 'isiNomorUrut')->name('pengajuan-surat.nomor-urut');
            Route::post('/terima', 'terima')->name('pengajuan-surat.terima');
        });
        
        Route::delete('/pengajuan-surat/bulk-delete', [PengajuanSuratController::class, 'bulkDelete'])
        ->name('pengajuan-surat.bulk-delete');

        Route::get('/pengajuan-surat/{pengajuan}/preview', [PengajuanSuratController::class, 'previewDocx'])->name('pengajuan-surat.preview');
        Route::get('/pengajuan-surat/{pengajuan}/download', [PengajuanSuratController::class, 'downloadDocx'])->name('pengajuan-surat.download');

        // User Data
        Route::prefix('data-user')->name('data-user.')->group(function () {
            Route::get('/', [AdminController::class, 'index'])->name('index');  
            Route::resource('admin', AdminController::class)->except(['index']);
            Route::resource('pengguna', PenggunaController::class)->except(['index']);
            Route::post('/admin/bulk-delete', [AdminController::class, 'bulkDelete'])->name('admin.bulk-delete');
            Route::post('/pengguna/bulk-delete', [PenggunaController::class, 'bulkDelete'])->name('pengguna.bulk-delete');
        });

        // Jenis Surat
        Route::resource('jenis-surat', JenisSuratController::class)->names('jenis-surat');
        Route::post('/jenis-surat/{jenisSurat}/template', [JenisSuratController::class, 'updateTemplate'])->name('admin.jenis-surat.update-template');

        // Pesan
        Route::controller(DashboardController::class)->group(function () {
            Route::get('/pesan-reset', 'pesanMasuk')->name('admin.pesan');
            Route::post('/pesan-reset/{id}/baca', 'tandaiBaca')->name('admin.pesan.baca');
        });

        //Verifikasi Warga Domisili
        Route::get('admin/warga-domisili',[AdminController::class,'pendingUsers'])->name('admin.warga-domisili');
        Route::get('admin/verify/{id}',[AdminController::class,'verify'])->name('admin.verify');
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
    Route::get('/list-surat/{berkas}/download', [BerkasSuratController::class, 'downloadSurat'])->name('berkas.download');


    // Profil
    Route::prefix('profil')->controller(ProfilController::class)->group(function () {
        Route::get('/', 'index')->name('pengguna.profil');
        Route::put('/', 'update')->name('pengguna.profil.update');
        Route::put('/password', 'updatePassword')->name('pengguna.profil.update-password');
    });

    // Kirim Pesan
    Route::post('/kirim-pesan', [HomeController::class, 'kirimPesan'])->name('pengguna.kirimPesan');
    Route::get('/pesan-saya', [App\Http\Controllers\PenggunaController::class, 'pesanSaya'])->name('pengguna.pesan');
    
    //Reset Password
    Route::get('/password-reset', [ResetPasswordController::class, 'index'])->name('admin.password.reset.index');
    Route::post('/password-reset/{id}/reset', [ResetPasswordController::class, 'reset'])->name('admin.password.reset.manual');

    // API Jenis Surat
    Route::get('/api/jenis-surat/{id}', function ($id) {
        $jenis = JenisSurat::findOrFail($id);
        return response()->json([
            'syarat' => $jenis->syarat,
            'keterangan_default' => $jenis->keterangan_default,
        ]);
    });
    
    Route::post('/kirim-pesan', [PenggunaController::class, 'kirimPesan'])
    ->name('pengguna.kirimPesan');

});


Route::middleware('auth')->group(function(){
    Route::get('profile/index',[ProfilDomisiliController::class,'index'])->name('profil.index');
    Route::post('profile/update',[ProfilDomisiliController::class,'update'])->name('profil.update');
    Route::get('dashboard', function(){ return view('pengguna.index'); })->name('dashboard');
});