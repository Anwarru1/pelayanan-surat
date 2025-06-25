<!-- Modal -->
<div class="modal fade" id="tambahJenisSurat" tabindex="-1" role="dialog" aria-labelledby="labelTambahJenisSurat" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="labelTambahJenisSurat">Tambah Jenis Surat</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('jenis-surat.store') }}" method="POST" enctype="multipart/form-data">
                    @csrf

                    <!-- Kode Surat -->
                    <div class="form-group">
                        <label for="kode_surat">Kode Surat</label>
                        <input type="text" id="kode_surat" class="form-control @error('kode_surat') is-invalid @enderror"
                            name="kode_surat" placeholder="Kode surat otomatis" value="{{ old('kode_surat') }}" required>
                        @error('kode_surat')
                            <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                        @enderror
                        <small class="form-text text-muted">Contoh: SKTM, SKD, SKP</small>
                    </div>

                    <!-- Nama Jenis Surat -->
                    <div class="form-group">
                        <label for="nama_jenis_surat">Nama Jenis Surat</label>
                        <input type="text" id="nama_jenis_surat" class="form-control @error('nama_jenis_surat') is-invalid @enderror"
                            name="nama_jenis_surat" placeholder="Masukkan nama jenis surat" value="{{ old('nama_jenis_surat') }}" required>
                        @error('nama_jenis_surat')
                            <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                        @enderror
                        <small class="form-text text-muted">Contoh: Surat Keterangan Tidak Mampu</small>
                    </div>

                    <!-- Syarat Surat -->
                    <div class="form-group">
                        <label for="syarat_surat">Syarat Surat</label>
                            <div id="syarat-container" class="syarat-container">
                                <div class="input-group mb-2">
                                    <input type="text" class="form-control" name="syarat[]" required>
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-danger remove-syarat" type="button">
                                            <i class="fe fe-trash-2"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <button type="button" id="add-syarat" class="btn btn-sm btn-dark add-syarat" data-target="#syarat-container">
                                <i class="fe fe-plus"></i> Tambah Syarat
                            </button>
                            @error('syarat')
                                <span class="text-danger" style="font-size: 80%;">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                    </div>
                    <div class="form-group">
                        <label for="keterangan_default">Keterangan Default</label>
                        <textarea name="keterangan_default" id="keterangan_default" class="form-control" rows="3"></textarea>
                        <small class="form-text text-muted">Keterangan ini akan otomatis muncul saat pengguna memilih jenis surat.</small>
                    </div>

                    <!-- Template Surat -->
                    <div class="form-group">
                        <label for="template">Template Surat</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input @error('template') is-invalid @enderror"
                                id="template" name="template" accept=".docx">
                            <label class="custom-file-label" for="template">Pilih file template (DOCX)</label>
                            @error('template')
                                <span class="invalid-feedback" role="alert"><strong>{{ $message }}</strong></span>
                            @enderror
                        </div>
                        <small class="form-text text-muted">Format file .docx (Microsoft Word)</small>
                    </div>

                    <!-- Footer -->
                    <div class="modal-footer">
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn btn-primary">Tambah</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

