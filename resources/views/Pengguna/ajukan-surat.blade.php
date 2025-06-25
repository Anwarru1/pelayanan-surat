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
                        <ul>
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

                  <form action="{{ route('ajukan-surat.store') }}" method="POST" enctype="multipart/form-data">
                  @csrf
                  <div class="row">
                    
                    <div class="col-md-12 mb-4">
                      <div class="form-group mb-3">
                        <label for="custom-select">Plih Jenis Surat</label>
                        <select name="jenis_surat_id" id="jenis_surat_id" class="custom-select" required>
                          <option value="" selected disabled>Pilih jenis surat</option>
                          @foreach ($ajukan as $ajukan)
                          <option value="{{ $ajukan->id }}">{{ $ajukan->nama_jenis_surat }}</option>
                          @endforeach
                        </select>
                      </div>
                      <div class="form-group mb-3">
                        <label for="example-fileinput">Isi Syarat</label>
                        <div id="syarat-container">
                          {{-- Berkas syarat akan dimuat otomatis setelah jenis surat dipilih --}}
                        </div>
                      </div>
                      <div class="form-group row mb-0">
                        <div class="col-md-9 left">
                            <button type="submit" class="btn btn-primary">
                                <i class="fas fa-paper-plane"></i> Ajukan Surat
                            </button>
                        </div>
                      </div>
                    </div> <!-- /.col -->
                  </div>
                  </form>
                </div>
              </div> <!-- / .card -->
            </div> <!-- .col-12 -->
          </div> <!-- .row -->
        </div> <!-- .container-fluid -->
      </main> <!-- main -->
</x-layout>

<script>
$(document).ready(function() {
    $('#jenis_surat_id').on('change', function() {
        const jenisSuratId = $(this).val();
        const container = $('#syarat-container');
        
        container.empty(); // kosongkan dulu

        if (jenisSuratId) {
            $.get(`/api/jenis-surat/${jenisSuratId}`, function(data) {
              $('#syarat-container').empty();

              data.syarat.forEach((syarat) => {
                  const inputName = syarat.replace(/\s+/g, '_');
                  const label = `<label for="syarat_${inputName}">${syarat}</label>`;

                  if (syarat.toLowerCase() === 'bidang_usaha' || syarat.toLowerCase() === 'jenis_usaha' | syarat.toLowerCase() === 'mulai_usaha' | syarat.toLowerCase() === 'keperluan') {
                      $('#syarat-container').append(`
                        <div class="form-group">
                          ${label}
                          <input type="text" name="syarat[${syarat}]" class="form-control" id="syarat_${inputName}" required>
                        </div>
                      `);
                  } else if (syarat.toLowerCase() === 'keterangan' ) {
                      const defaultValue = data.keterangan_default ?? '';
                      $('#syarat-container').append(`
                        <div class="form-group">
                          ${label}
                          <textarea name="syarat[${syarat}]" class="form-control" id="syarat_${inputName}" required>${defaultValue}</textarea>
                        </div>
                      `);
                  } else {
                      $('#syarat-container').append(`
                        <div class="form-group">
                          ${label}
                          <input type="file" name="syarat[${syarat}]" class="form-control-file" id="syarat_${inputName}" required>
                        </div>
                      `);
                  }
              });
          });

        }
    });
});
</script>