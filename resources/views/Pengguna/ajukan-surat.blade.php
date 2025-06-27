<x-layout>
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

            @if (session('success'))
              <div class="alert alert-success">
                {{ session('success') }}
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
</x-layout>

{{-- SCRIPT DINAMIS --}}
<script>
$(document).ready(function() {
  $('#jenis_surat_id').on('change', function() {
    const jenisSuratId = $(this).val();
    const container = $('#syarat-container');
    container.empty();

    if (jenisSuratId) {
      $.get(`/api/jenis-surat/${jenisSuratId}`, function(data) {
        data.syarat.forEach((syarat) => {
          const inputName = syarat.replace(/\s+/g, '_');
          const label = `<label for="syarat_${inputName}">${syarat}</label>`;

          if (['bidang_usaha', 'jenis_usaha', 'mulai_usaha', 'keperluan'].includes(syarat.toLowerCase())) {
            container.append(`
              <div class="form-group">
                ${label}
                <input type="text" name="syarat[${syarat}]" class="form-control" id="syarat_${inputName}">
              </div>
            `);
          } else if (syarat.toLowerCase() === 'keterangan') {
            const defaultValue = data.keterangan_default ?? '';
            container.append(`
              <div class="form-group">
                ${label}
                <textarea name="syarat[${syarat}]" class="form-control" id="syarat_${inputName}">${defaultValue}</textarea>
              </div>
            `);
          } else {
            container.append(`
              <div class="form-group">
                ${label}
                <input type="file" name="syarat[${syarat}]" class="form-control-file" id="syarat_${inputName}">
              </div>
            `);
          }
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

    const syaratInputs = document.querySelectorAll('#syarat-container input, #syarat-container textarea');
    syaratInputs.forEach(input => {
      if (!input.value || input.value.trim() === '') {
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
