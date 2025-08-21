@extends('layouts.p-app') 

@section('content')
<main role="main" class="main-content">
  <div class="container-fluid">
    <div class="row justify-content-center">
      <div class="col-12">
        <h2 class="page-title">Form Pengajuan Surat</h2>
        <div class="card shadow mb-4">
          <div class="card-header">
            <strong class="card-title">Pengajuan Surat</strong>
          </div>
          <div class="card-body">
            @if ($errors->any())
              <div class="alert alert-danger">
                  <ul class="mb-0">
                      @foreach ($errors->all() as $error)
                          <li>{{ $error }}</li>
                      @endforeach
                  </ul>
              </div>
            @endif

             @if(session('success'))
              <div class="alert alert-success alert-dismissible fade show" role="alert">
                  {{ session('success') }}
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
            @endif
            
            @if(session('error'))
              <div class="alert alert-danger alert-dismissible fade show" role="alert">
                  {{ session('error') }}
                  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                      <span aria-hidden="true">&times;</span>
                  </button>
              </div>
            @endif

            <form action="{{ route('ajukan-surat.store') }}" method="POST" enctype="multipart/form-data" id="formAjukanSurat">
              @csrf
              <div class="row">
                <div class="col-md-12 mb-4">
                  <div class="form-group mb-3">
                    <label for="jenis_surat_id">Pilih Jenis Surat</label>
                    <select name="jenis_surat_id" id="jenis_surat_id" class="custom-select">
                      <option value="" selected disabled>Pilih jenis surat</option>
                      @foreach ($ajukan as $item)
                        <option value="{{ $item->id }}" {{ old('jenis_surat_id') == $item->id ? 'selected' : '' }}>
                          {{ $item->nama_jenis_surat }}
                        </option>
                      @endforeach
                    </select>
                  </div>

                  <div class="form-group mb-3">
                    <label>Isi Syarat</label>
                    <div id="syarat-container">
                      {{-- Input syarat dinamis dimuat di sini --}}
                    </div>
                  </div>

                  <div class="form-group row mb-0">
                    <div class="col-md-9 left">
                      <button type="submit" class="btn btn-primary">
                        <i class="fas fa-paper-plane"></i> Ajukan Surat
                      </button>
                    </div>
                  </div>
                </div>
              </div>
            </form>

          </div>
        </div>
      </div>
    </div>
  </div>
</main>
@endsection


@push('scripts')
{{-- SCRIPT DINAMIS --}}
<script>
$(document).ready(function() {
  $('#jenis_surat_id').on('change', function() {
    const jenisSuratId = $(this).val();
    const container = $('#syarat-container');
    container.empty();

    if (jenisSuratId) {
      $.get(`/api/jenis-surat/${jenisSuratId}`, function(data) {
        data.syarat.forEach((syarat, index) => {
          const inputLabel = syarat.nama;
          const inputType = syarat.tipe;
          const inputId = `syarat_${index}`;

          // Inject default value dari keterangan_default jika syarat nama == 'keterangan'
          let defaultValue = '';
          if (inputLabel.toLowerCase() === 'keterangan' && inputType === 'text') {
            defaultValue = data.keterangan_default || '';
          }

          let inputHtml = '';

          if (inputType === 'file') {
            inputHtml = `
              <div class="form-group">
                <label for="${inputId}">${inputLabel}</label>
                <input type="file" name="syarat[${index}][value]" class="form-control-file" id="${inputId}">
                <input type="hidden" name="syarat[${index}][nama]" value="${inputLabel}">
                <input type="hidden" name="syarat[${index}][tipe]" value="${inputType}">
              </div>
            `;
          } else {
            inputHtml = `
              <div class="form-group">
                <label for="${inputId}">${inputLabel}</label>
                <input type="text" name="syarat[${index}][value]" class="form-control" id="${inputId}" value="${defaultValue}">
                <input type="hidden" name="syarat[${index}][nama]" value="${inputLabel}">
                <input type="hidden" name="syarat[${index}][tipe]" value="${inputType}">
              </div>
            `;
          }

          container.append(inputHtml);
        });
      });
    }
  });
});
</script>

{{-- VALIDASI JAVASCRIPT --}}
<script>
document.addEventListener('DOMContentLoaded', function () {
  const form = document.getElementById('formAjukanSurat');
  form.addEventListener('submit', function (e) {
    let isValid = true;

    // Reset error
    form.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
    form.querySelectorAll('.invalid-feedback').forEach(el => el.remove());

    const jenisSurat = document.getElementById('jenis_surat_id');
    if (!jenisSurat.value) {
      showError(jenisSurat, 'Jenis surat wajib dipilih.');
      isValid = false;
    }

    const syaratInputs = document.querySelectorAll('#syarat-container input[type="text"], #syarat-container input[type="file"]');
    syaratInputs.forEach(input => {
      if (input.type === 'file' && input.files.length === 0) {
        showError(input, 'File wajib diunggah.');
        isValid = false;
      } else if (input.type === 'text' && (!input.value || input.value.trim() === '')) {
        showError(input, 'Field ini wajib diisi.');
        isValid = false;
      }
    });

    if (!isValid) {
      e.preventDefault();
    }

    function showError(input, msg) {
      input.classList.add('is-invalid');
      const feedback = document.createElement('div');
      feedback.className = 'invalid-feedback';
      feedback.innerText = msg;
      input.parentNode.appendChild(feedback);
    }
  });
});
</script>
@endpush
