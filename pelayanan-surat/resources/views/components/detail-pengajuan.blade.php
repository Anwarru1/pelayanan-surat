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
                <input type="number" name="nomor_urutan" class="form-control" value="{{ $p->nomor_urutan }}">
                <button type="submit" class="btn btn-sm btn-primary mt-2">Simpan</button>
              </form>
            </td>
          </tr>
        </table>

        {{-- Tombol aksi --}}
        <div class="mt-3">
          @php $nomorFilled = !empty($p->nomor_urutan); @endphp
          
          <a href="{{ route('pengajuan-surat.preview', $p->id) }}" 
            class="btn btn-secondary {{ !$nomorFilled ? 'disabled' : '' }}" 
            {{ !$nomorFilled ? 'aria-disabled=true' : '' }}>
            <i class="fe fe-eye"></i> Lihat Surat
          </a>

          @if($p->status === 'menunggu')
            {{-- Tombol Terima (trigger) --}}
            <button type="button" class="btn btn-success btn-show-terima" data-id="{{ $p->id }}">
              Terima
            </button>

            {{-- Form Terima (hidden awal) --}}
            <form action="{{ route('pengajuan-surat.terima', $p->id) }}" method="POST" class="d-inline-block mt-2 d-none form-terima-{{ $p->id }}">
              @csrf
              <input type="hidden" name="status" value="diproses">
              <button type="submit" class="btn btn-success">Konfirmasi & Proses</button>
            </form>

            {{-- Tombol Tolak (trigger) --}}
            <button type="button" class="btn btn-danger btn-show-tolak" data-id="{{ $p->id }}">
              Tolak
            </button>

            {{-- Form Tolak (hidden awal) --}}
            <form action="{{ route('pengajuan-surat.tolak', $p->id) }}" method="POST" class="d-inline-block mt-2 d-none form-tolak-{{ $p->id }}">
              @csrf
              @method('PUT')
              <input type="text" name="alasan" class="form-control mb-2" placeholder="Alasan Penolakan" required>
              <button type="submit" class="btn btn-danger">Tolak</button>
            </form>
          @endif
        </div>


      </div>
    </div>
  </div>
</div>

{{-- Script untuk buka modal otomatis jika ada session --}}
@push('scripts')
@if(session('modal_id'))
<script>
  $(document).ready(function () {
      $('#{{ session('modal_id') }}').modal('show');
  });
@endif

  // tombol TERIMA
  $(document).on('click', '.btn-show-terima', function() {
    let id = $(this).data('id');
    $('.form-terima-' + id).toggleClass('d-none');
  });

  // tombol TOLAK
  $(document).on('click', '.btn-show-tolak', function() {
    let id = $(this).data('id');
    $('.form-tolak-' + id).toggleClass('d-none');
  });
</script>
@endpush
