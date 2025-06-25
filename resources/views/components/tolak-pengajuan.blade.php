@props(['p'])

<!-- Tombol Tolak (hanya jika status menunggu atau diproses) -->
@if (in_array($p->status, ['menunggu', 'diproses']))
    <button class="btn btn-sm btn-danger" data-toggle="modal" data-target="#tolakModal{{ $p->id }}">
        Tolak
    </button>
@endif
<!-- Modal Tolak -->
<div class="modal fade" id="tolakModal{{ $p->id }}" tabindex="-1" role="dialog" aria-labelledby="tolakModalLabel{{ $p->id }}" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <form action="{{ route('pengajuan-surat.tolak', $p->id) }}" method="POST">
      @csrf
      @method('PUT')
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title">Tolak Pengajuan</h5>
          <button type="button" class="close" data-dismiss="modal">
            <span>&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label>Alasan Penolakan</label>
            <textarea name="keterangan" class="form-control" rows="3" required></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button type="submit" class="btn btn-danger">Tolak Pengajuan</button>
        </div>
      </div>
    </form>
  </div>
</div>
