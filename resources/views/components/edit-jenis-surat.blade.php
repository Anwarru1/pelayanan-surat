@props(['s'])

<div class="modal fade" id="editJenisSurat{{ $s->id }}" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="varyModalLabel">Edit Jenis Surat
                    </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('jenis-surat.update', $s->id)}}" method="POST" enctype="multipart/form-data">
                    @csrf
                    @method('PUT')
                    <div class="form-group">
                        <label for="example-palaceholder">Kode Surat</label>
                        <input type="text" id="kode_surat" class="form-control @error('kode_surat') is-invalid @enderror" name="kode_surat"
                            value="{{ old('kode_surat', $s->kode_surat) }}" required>
                        @error('kode_surat')
                            <span class="invalid-feedback" role="alert">
                                <strong>{{ $message }}</strong>
                            </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label for="example-palaceholder">Nama Jenis Surat</label>
                        <input type="text" id="nama_jenis_surat" class="form-control @error('nama_jenis_surat') is-invalid @enderror" name="nama_jenis_surat"
                            value="{{ old('nama_jenis_surat', $s->nama_jenis_surat) }}" required>
                        @error('nama_jenis_surat')
                        <span class="invalid-feedback" role="alert">
                            <strong>{{ $message }}</strong>
                        </span>
                        @enderror
                    </div>
                    <div class="form-group">
                        <label>Syarat Surat</label>
                        <div class="syarat-container" id="syarat-container-{{ $s->id }}">
                            @foreach(old('syarat', $s->syarat) as $syarat)
                            <div class="input-group mb-2">
                            <input type="text" name="syarat[]" class="form-control" value="{{ $syarat }}" required>
                            <div class="input-group-append">
                                <button type="button" class="btn btn-danger remove-syarat"><i class="fe fe-trash-2"></i></button>
                            </div>
                            </div>
                            @endforeach
                        </div>
                        <button type="button" class="btn btn-sm btn-dark add-syarat" data-target="#syarat-container-{{ $s->id }}">
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
                        <textarea name="keterangan_default" id="keterangan_default" class="form-control" rows="3">{{ old('keterangan_default', $s->keterangan_default ?? '') }}</textarea>
                        <small class="form-text text-muted">Keterangan ini akan otomatis muncul saat pengguna memilih jenis surat.</small>
                    </div>
                    <div class="form-group">
                        <label for="template">Template Surat</label>
                        <div class="custom-file">
                            <input type="file" class="custom-file-input @error('template') is-invalid @enderror" 
                                id="template" name="template">
                            <label class="custom-file-label" for="template">
                                {{ $s->template ? basename($s->template) : 'Pilih file template (.docx)' }}
                            </label>
                            @error('template')
                                <span class="invalid-feedback" role="alert">
                                    <strong>{{ $message }}</strong>
                                </span>
                            @enderror
                        </div>
                        <small class="form-text text-muted">
                            Biarkan kosong jika tidak ingin mengubah template. 
                            @if($s->template)
                                <a href="{{ Storage::url($s->template) }}" target="_blank">Download template saat ini</a>
                            @endif
                        </small>
                    </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn mb-2 btn-danger" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn mb-2 btn-primary">Simpan</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

@push('scripts')
<script>
    $(document).ready(function () {
        // Tambah syarat
        $('.add-syarat').off('click').on('click', function () {
            const targetSelector = $(this).data('target');
            const container = $(targetSelector);

            const html = `
                <div class="input-group mb-2">
                    <input type="text" name="syarat[]" class="form-control" required>
                    <div class="input-group-append">
                        <button type="button" class="btn btn-danger remove-syarat">
                            <i class="fe fe-trash-2"></i>
                        </button>
                    </div>
                </div>
            `;

            container.append(html);
        });

        // Hapus syarat
        $(document).on('click', '.remove-syarat', function () {
        const group = $(this).closest('.input-group');
        
        // Cari container berdasarkan konteks modal aktif
        const container = $(this).closest('.syarat-container, #syarat-container');

        // Hitung hanya input syarat yang masih ada dalam container tersebut
        const totalSyarat = container.find('input[name="syarat[]"]').length;

        if (totalSyarat > 1) {
            group.remove();
        }
        });

        // File input display filename
        $(document).on('change', '.custom-file-input', function () {
            const fileName = $(this).val().split('\\').pop();
            $(this).next('.custom-file-label').addClass("selected").html(fileName);
        });
    });
</script>
@endpush

