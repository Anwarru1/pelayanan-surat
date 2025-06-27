<x-layout>
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="mb-2 page-title">Pesan Saya</h2>

          <div class="row my-4">
            <div class="col-md-12">
              <div class="card shadow">
                <div class="card-body">

                  @if(session('success'))
                    <div class="alert alert-success">{{ session('success') }}</div>
                  @endif

                  <table class="table table-bordered table-hover">
                    <thead class="thead-dark">
                      <tr>
                        <th>No</th>
                        <th>Subjek</th>
                        <th>Isi Pesan</th>
                        <th>Balasan Admin</th>
                        <th>Status</th>
                        <th>Waktu</th>
                      </tr>
                    </thead>
                    <tbody>
                      @forelse($pesanPengguna as $pesan)
                        <tr>
                          <td>{{ $loop->iteration }}</td>
                          <td>{{ $pesan->subjek ?? '-' }}</td>
                          <td>
                            <button type="button" class="btn btn-sm btn-info" data-toggle="modal" data-target="#modalIsi{{ $pesan->id }}">
                              Lihat Isi
                            </button>

                            <!-- Modal -->
                            <div class="modal fade" id="modalIsi{{ $pesan->id }}" tabindex="-1" role="dialog" aria-labelledby="modalLabel{{ $pesan->id }}" aria-hidden="true">
                              <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title" id="modalLabel{{ $pesan->id }}">Detail Pesan</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                      <span aria-hidden="true">&times;</span>
                                    </button>
                                  </div>
                                  <div class="modal-body">
                                    <p><strong>Subjek:</strong> {{ $pesan->subjek ?? '-' }}</p>
                                    <p>{{ $pesan->isi }}</p>
                                  </div>
                                  <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Tutup</button>
                                  </div>
                                </div>
                              </div>
                            </div>
                          </td>
                          <td>
                            @if($pesan->balasan)
                              <span class="text-success">{{ $pesan->balasan }}</span>
                            @else
                              <span class="text-muted">Belum dibalas</span>
                            @endif
                          </td>
                          <td>
                            @if($pesan->is_read)
                              <span class="badge badge-success">Dibaca Admin</span>
                            @else
                              <span class="badge badge-secondary">Belum Dibaca</span>
                            @endif
                          </td>
                          <td>{{ $pesan->created_at->format('d M Y H:i') }}</td>
                        </tr>
                      @empty
                        <tr>
                          <td colspan="6" class="text-center text-muted">Belum ada pesan dikirim.</td>
                        </tr>
                      @endforelse
                    </tbody>
                  </table>

                </div>
              </div>
            </div> <!-- .col-md-12 -->
          </div> <!-- .row -->
        </div> <!-- .col-12 -->
      </div> <!-- .row justify-content-center -->
    </div> <!-- .container-fluid -->
  </main>
</x-layout>
