<!-- Modal Tambah Jenis Surat -->
<div class="modal fade" id="tambahJenisSurat" tabindex="-1" role="dialog" aria-labelledby="labelTambahJenisSurat" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="labelTambahJenisSurat">Tambah Jenis Surat</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span>&times;</span></button>
            </div>
            <div class="modal-body">
                <form action="{{ route('jenis-surat.store') }}" method="POST" enctype="multipart/form-data" id="formJenisSurat">
                    @csrf

                    <!-- Kode Surat -->
                    <div class="form-group">
                        <label for="kode_surat">Kode Surat</label>
                        <input type="text" id="kode_surat" name="kode_surat"
                            class="form-control @error('kode_surat') is-invalid @enderror"
                            placeholder="Masukkan kode surat"
                            value="{{ old('kode_surat') }}" required>
                        @error('kode_surat')
                            <span class="invalid-feedback">{{ $message }}</span>
                        @enderror
                        <small class="form-text text-muted">Contoh: 470, 350, 600</small>
                    </div>

                    <!-- Nama Jenis Surat -->
                    <div class="form-group">
                        <label for="nama_jenis_surat">Nama Jenis Surat</label>
                        <input type="text" id="nama_jenis_surat" name="nama_jenis_surat"
                            class="form-control @error('nama_jenis_surat') is-invalid @enderror"
                            placeholder="Masukkan nama jenis surat"
                            value="{{ old('nama_jenis_surat') }}" required>
                        @error('nama_jenis_surat')
                            <span class="invalid-feedback">{{ $message }}</span>
                        @enderror
                        <small class="form-text text-muted">Contoh: Surat Pengantar E-KTP</small>
                    </div>

                    <!-- Syarat Surat -->
                    <div class="form-group">
                        <label>Syarat Surat</label>
                        <small class="form-text text-muted">Minimal 1 syarat.</small>
                        <div class="syarat-container" id="syarat-container">
                            <div class="form-row mb-2 syarat-item">
                                <div class="col">
                                    <input type="text" name="syarat[0][nama]" class="form-control" placeholder="Nama syarat" required>
                                </div>
                                <div class="col">
                                    <select name="syarat[0][tipe]" class="form-control" required>
                                        <option value="text">Isi Text</option>
                                        <option value="file">Upload File</option>
                                    </select>
                                </div>
                                <div class="col-auto">
                                    <button type="button" class="btn btn-danger remove-syarat"><i class="fe fe-trash-2"></i></button>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-sm btn-dark add-syarat" data-target="#syarat-container">
                            <i class="fe fe-plus"></i> Tambah Syarat
                        </button>
                        @error('syarat')
                            <div class="text-danger" style="font-size: 80%"><strong>{{ $message }}</strong></div>
                        @enderror
                    </div>

                    <!-- Keterangan Default -->
                    <div class="form-group">
                        <label for="keterangan_default">Keterangan Default</label>
                        <textarea name="keterangan_default" id="keterangan_default" class="form-control" rows="3">{{ old('keterangan_default') }}</textarea>
                        <small class="form-text text-muted">Keterangan ini akan otomatis muncul saat pengguna memilih jenis surat.</small>
                    </div>

                    <!-- Template Surat -->
                    <div class="form-group">
                        <label for="template">Template Surat</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input @error('template') is-invalid @enderror" id="template" name="template" accept=".docx">
                            <label class="custom-file-label" for="template">Pilih file template (DOCX)</label>
                        </div>
                        @error('template')
                            <span class="invalid-feedback d-block">{{ $message }}</span>
                        @enderror
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
