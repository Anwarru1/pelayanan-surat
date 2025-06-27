<!-- Modal -->
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
                            placeholder="Massukkan kode surat "
                            value="{{ old('kode_surat') }}">
                        @error('kode_surat')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <small class="form-text text-muted">Contoh: 470, 350, 600</small>
                    </div>

                    <!-- Nama Jenis Surat -->
                    <div class="form-group">
                        <label for="nama_jenis_surat">Nama Jenis Surat</label>
                        <input type="text" id="nama_jenis_surat" name="nama_jenis_surat"
                            class="form-control @error('nama_jenis_surat') is-invalid @enderror"
                            placeholder="Masukkan nama jenis surat"
                            value="{{ old('nama_jenis_surat') }}">
                        @error('nama_jenis_surat')
                            <div class="invalid-feedback">{{ $message }}</div>
                        @enderror
                        <small class="form-text text-muted">Contoh: Surat Pengantar E-KTP</small>
                    </div>

                    <!-- Syarat Surat -->
                    <div class="form-group">
                        <label for="syarat_surat">Syarat Surat</label>
                        <div id="syarat-container">
                            <div class="input-group mb-2">
                                <input type="text" class="form-control" name="syarat[]" placeholder="Masukkan syarat">
                                <div class="input-group-append">
                                    <button class="btn btn-outline-danger remove-syarat" type="button"><i class="fe fe-trash-2"></i></button>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-sm btn-dark" id="add-syarat">
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
                            <div class="invalid-feedback d-block">{{ $message }}</div>
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

@push('scripts')
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        const container = document.getElementById('syarat-container');
        const addBtn = document.getElementById('add-syarat');
        const form = document.getElementById('formJenisSurat');

        addBtn.addEventListener('click', function () {
            const inputGroup = document.createElement('div');
            inputGroup.className = 'input-group mb-2';
            inputGroup.innerHTML = `
                <input type="text" class="form-control" name="syarat[]" placeholder="Masukkan syarat">
                <div class="input-group-append">
                    <button class="btn btn-outline-danger remove-syarat" type="button"><i class="fe fe-trash-2"></i></button>
                </div>
            `;
            container.appendChild(inputGroup);
        });

        container.addEventListener('click', function (e) {
            if (e.target.closest('.remove-syarat')) {
                const group = e.target.closest('.input-group');
                if (container.children.length > 1) group.remove();
            }
        });

        form.addEventListener('submit', function (e) {
            form.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));

            let valid = true;
            ['kode_surat', 'nama_jenis_surat'].forEach(id => {
                const el = document.getElementById(id);
                if (!el.value.trim()) {
                    el.classList.add('is-invalid');
                    valid = false;
                }
            });

            container.querySelectorAll('input[name="syarat[]"]').forEach(input => {
                if (!input.value.trim()) {
                    input.classList.add('is-invalid');
                    valid = false;
                }
            });

            if (!valid) {
                e.preventDefault();
            }
        });
    });
    </script>

    
@endpush
