<!-- Modal -->
<div class="modal fade" id="kelolaModal{{ $p->id }}" tabindex="-1" role="dialog" aria-labelledby="kelolaModalLabel{{ $p->id }}" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Kelola Pengajuan Surat</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span>&times;</span>
        </button>
      </div>

      <div class="modal-body">

        {{-- Alert sukses nomor --}}
        @if(session('modal_id') == 'kelolaModal'.$p->id && session('success_nomor'))
          <div class="alert alert-success">{{ session('success_nomor') }}</div>
        @endif

        {{-- Tabel info --}}
        <table class="table table-bordered">
          <tr>
            <th>Nama Pemohon</th>
            <td>{{ $p->pengguna->nama }}</td>
          </tr>
          <tr>
            <th>Jenis Surat</th>
            <td>{{ $p->nama_jenis_surat }}</td>
          </tr>
          <tr>
            <th>Berkas Syarat</th>
            <td>
              @php $syarat = json_decode($p->data_tambahan, true); @endphp
              @if(is_array($syarat))
                <ul>
                  @foreach($syarat as $item)
                    @if(isset($item['tipe'], $item['value']) && $item['tipe'] === 'file')
                      <li><strong>{{ $item['nama'] }}:</strong> <a href="{{ asset($item['value']) }}" target="_blank">Lihat Berkas</a></li>
                    @endif
                  @endforeach
                </ul>
              @else
                <em>Tidak ada syarat</em>
              @endif
            </td>
          </tr>
          <tr>
            <th>Status</th>
            <td>
              @php
                $badge = match($p->status) {
                  'menunggu' => 'warning',
                  'diproses' => 'info',
                  'diterima' => 'success',
                  default => 'danger'
                };
              @endphp
              <span class="badge badge-{{ $badge }}">{{ ucfirst($p->status) }}</span>
            </td>
          </tr>
          <tr>
            <th>Tanggal Pengajuan</th>
            <td>{{ \Carbon\Carbon::parse($p->tanggal)->translatedFormat('l, d F Y') }}</td>
          </tr>
          <tr>
            <th>Nomor Urutan Surat</th>
            <td>
              <form action="{{ route('pengajuan-surat.nomor-urut', $p->id) }}" method="POST">
                @csrf
                <input type="number" name="nomor_urutan" class="form-control" 
                      value="{{ $p->nomor_urutan }}" id="nomorUrut{{ $p->id }}">
                <button type="submit" class="btn btn-sm btn-primary mt-2">Simpan</button>
              </form>
            </td>
          </tr>
        </table>

        {{-- Tombol aksi --}}
        <div class="mt-3">
          {{-- Tombol Lihat Surat --}}
          <a href="{{ route('pengajuan-surat.preview', $p->id) }}" 
            class="btn btn-secondary {{ !in_array($p->status, ['diproses','diterima']) ? 'disabled' : '' }}" 
            {{ !in_array($p->status, ['diproses','diterima']) ? 'aria-disabled=true' : '' }}>
            <i class="fe fe-eye"></i> Lihat Surat
          </a>


          @if ($p->status === 'menunggu')
            <button class="btn btn-danger" onclick="showForm('tolakForm{{ $p->id }}')">Tolak</button>
            <button class="btn btn-success" onclick="validateTerima('{{ $p->id }}')">Terima</button>
          @endif
        </div>

        {{-- FORM TOLAK --}}
        <form action="{{ route('pengajuan-surat.tolak', $p->id) }}" method="POST" 
              id="tolakForm{{ $p->id }}" class="form-aksi mt-3" style="display:none">
          @csrf
          @method('PUT')
          <div class="form-group">
            <label>Alasan Penolakan</label>
            <textarea name="alasan" class="form-control" required></textarea>
          </div>
          <button type="submit" class="btn btn-danger">Kirim Penolakan</button>
        </form>

        {{-- FORM TERIMA --}}
        <form action="{{ route('pengajuan-surat.terima', $p->id) }}" method="POST" 
              id="terimaForm{{ $p->id }}" class="form-aksi mt-3" style="display:none">
          @csrf
          <input type="hidden" name="status" value="diproses">
          <button type="submit" class="btn btn-success">Konfirmasi & Proses</button>
        </form>

      </div>
    </div>
  </div>
</div>

{{-- Script untuk show/hide form dengan animasi --}}
@push('scripts')
<script>
  function showForm(formId) {
    const form = $('#' + formId);

    if (form.is(':visible')) {
      form.slideUp(200);
    } else {
      // hanya sembunyikan form yg punya class "form-aksi"
      form.closest('.modal-body').find('form.form-aksi').not(form).slideUp(200);
      form.slideDown(200);
    }
  }


  function validateTerima(id) {
    const nomorInput = document.getElementById('nomorUrut' + id);
    if (!nomorInput || !nomorInput.value.trim()) {
      alert('Silakan isi nomor urutan surat terlebih dahulu sebelum menerima.');
    } else {
      showForm('terimaForm' + id);
    }
  }

  @if (session('modal_id'))
    $(document).ready(function () {
      $('#{{ session('modal_id') }}').modal('show');
    });
  @endif
</script>
@endpush

