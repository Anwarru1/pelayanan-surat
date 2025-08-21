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
        @if (session('modal_id') == 'kelolaModal' . $p->id && session('success_nomor'))
          <div class="alert alert-success">
            {{ session('success_nomor') }}
          </div>
        @endif
        {{-- TABEL INFORMASI --}}
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
              @php
                  $syarat = json_decode($p->data_tambahan, true);
              @endphp

              @if (is_array($syarat))
                <ul>
                @foreach ($syarat as $item)
                  @if (isset($item['tipe']) && $item['tipe'] === 'file' && isset($item['value']))
                    <li>
                      <strong>{{ $item['nama'] }}:</strong>
                      <a href="{{ asset($item['value']) }}" target="_blank">Lihat Berkas</a>
                    </li>
                  @endif
                @endforeach
                  </ul>
              @else
                  <em>Tidak ada syarat yang diajukan</em>
              @endif

            </td>
          </tr>
          <tr>
            <th>Status</th>
            <td>
              @if($p->status == 'menunggu')
                <span class="badge badge-warning">Menunggu</span>
                  @elseif($p->status == 'diproses')
                <span class="badge badge-info">Diproses</span>
                  @elseif($p->status == 'diterima')
                <span class="badge badge-success">Selesai</span>
                  @else
                <span class="badge badge-danger">Ditolak</span>
              @endif
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
                  <label>Nomor Urut Surat</label>
                  <input type="number" name="nomor_urutan" class="form-control" value="{{ $p->nomor_urutan }}" id="nomorUrut{{ $p->id }}">
                  <button type="submit" class="btn btn-sm btn-primary mt-2">Simpan</button>
              </form>
            </td>
          </tr>
        </table>

        {{-- AKSI --}}
        <div class="mt-3">
          @php
              $berkas = \App\Models\BerkasSurat::where('pengajuan_surat_id', $p->id)->first();
              $nomorFilled = !empty($p->nomor_urutan);
          @endphp

          {{-- Disable tombol jika belum ada nomor urut --}}
          <a href="{{ route('pengajuan-surat.preview', $p->id) }}" 
            class="btn btn-secondary {{ !$nomorFilled ? 'disabled' : '' }}" 
            {{ !$nomorFilled ? 'aria-disabled=true' : '' }} 
            id="btnDownload{{ $p->id }}">
            <i class="fe fe-eye"></i> Lihat Surat
          </a>

          
          @if ($p->status === 'menunggu')
            <button class="btn btn-danger" onclick="showForm('tolakForm{{ $p->id }}')">Tolak</button>
            <button class="btn btn-success" onclick="validateTerima('{{ $p->id }}')" id="btnTerimaTrigger{{ $p->id }}">Terima</button>
          @endif
        </div>

        {{-- FORM TOLAK --}}
          <form action="{{ route('pengajuan-surat.tolak', $p->id) }}" method="POST" id="tolakForm{{ $p->id }}" class="mt-3 d-none">
            @csrf
            @method('PUT')
            <div class="form-group">
              <label>Alasan Penolakan</label>
              <textarea name="keterangan" class="form-control" required></textarea>
            </div>
            <button type="submit" class="btn btn-danger">Kirim Penolakan</button>
          </form>

          {{-- FORM TERIMA --}}
          <form action="{{ route('pengajuan-surat.terima', $p->id) }}" method="POST" id="terimaForm{{ $p->id }}" class="mt-3 d-none">
            @csrf
            <input type="hidden" name="status" value="diproses">
            <button type="submit" class="btn btn-success">Konfirmasi & Proses</button>
          </form>
      </div>
    </div>
  </div>
</div>

{{-- Script untuk show/hide form --}}
@push('scripts')
<script>
  function showForm(formId) {
    const form = document.getElementById(formId);
    if (!form) return;

    // Sembunyikan semua form dalam modal ini
    const modal = form.closest('.modal-body');
    modal.querySelectorAll('form').forEach(f => f.classList.add('d-none'));

    // Tampilkan form yang dimaksud
    form.classList.remove('d-none');
  }

  function validateTerima(id) {
    const nomorInput = document.getElementById('nomorUrut' + id);
    if (!nomorInput.value.trim()) {
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
