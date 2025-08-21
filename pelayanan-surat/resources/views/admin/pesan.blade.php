@extends('layouts.app') 

@section('content')
  <main role="main" class="main-content">
    <div class="container-fluid">
      <div class="row justify-content-center">
        <div class="col-12">
          <h2 class="mb-4 page-title">Reset Password</h2>

          @if(session('success'))
            <div class="alert alert-success">{{ session('success') }}</div>
          @endif

          <!-- RESET PASSWORD -->
          <div class="card shadow mb-4">
            <div class="card-body">
              <table class="table table-bordered table-hover">
                <thead class="thead-dark">
                  <tr>
                    <th class="text-center">No</th>
                    <th class="text-center">Nama</th>
                    <th class="text-center">NIK</th>
                    <th class="text-center">No HP</th>
                    <th class="text-center">Waktu</th>
                    <th class="text-center">Alasan</th>
                    <th class="text-center">Aksi</th>
                  </tr>
                </thead>
                <tbody>
                  @foreach($resetList as $reset)
                    <tr>
                      <td class="text-center">{{ $loop->iteration }}</td>
                      <td>{{ $reset->nama }}</td>
                      <td>{{ $reset->nik }}</td>
                      <td>{{ $reset->no_hp }}</td>
                      <td>{{ $reset->created_at->format('d M Y H:i') }}</td>
                        <td>
                          <button class="btn btn-secondary btn-sm" data-toggle="modal" data-target="#modalAlasan{{ $reset->id }}">
                            Lihat
                          </button>
                
                          <!-- Modal Alasan -->
                            <div class="modal fade" id="modalAlasan{{ $reset->id }}" tabindex="-1">
                              <div class="modal-dialog modal-lg">
                                <div class="modal-content">
                                  <div class="modal-header">
                                    <h5 class="modal-title">Alasan Permintaan Reset Password</h5>
                                    <button class="close" data-dismiss="modal">&times;</button>
                                  </div>
                                  <div class="modal-body">
                                    <table class="table table-bordered">
                                      <tr>
                                        <th style="width: 30%">Nama</th>
                                        <td>{{ $reset->nama }}</td>
                                      </tr>
                                      <tr>
                                        <th>Alasan</th>
                                        <td>{{ $reset->alasan }}</td>
                                      </tr>
                                    </table>
                                  </div>
                                </div>
                              </div>
                            </div>

                        </td>
                      <td class="d-flex text-center">
                        @if ($reset->status === 'menunggu')
                          <!-- Reset password -->
                          <form action="{{ route('admin.password.reset.manual', $reset->id) }}" method="POST" class="mr-2">
                            @csrf
                            <button type="submit" class="btn btn-sm btn-danger">Reset Password</button>
                          </form>
                          <a href="https://wa.me/{{ $reset->no_hp }}?text=Halo%20{{ urlencode($reset->nama) }}%2C%20password%20akun%20anda%20telah%20diperbarui%20oleh%20admin.%20Silakan%20coba%20login%20kembali."
                            class="btn btn-sm btn-success"
                            target="_blank">
                            Kirim WA
                          </a>
                        @else
                          <span class="d-flex align-items-center me-2">
                              <i class="fe fe-check-circle text-success mr-2"></i>
                          </span>
                          
                          <a href="https://wa.me/{{ $reset->no_hp }}?text=Halo%20{{ urlencode($reset->nama) }}%2C%20password%20akun%20anda%20telah%20diperbarui%20oleh%20admin.%20Silakan%20coba%20login%20kembali."
                            class="btn btn-sm btn-success"
                            target="_blank">
                            Kirim WA
                          </a>
                        @endif
                        <!-- Kirim WA -->
                        
                      </td>
                    </tr>
                  @endforeach
                </tbody>
              </table>
            </div>
          </div>

        </div>
      </div>
    </div>
  </main>
@endsection
