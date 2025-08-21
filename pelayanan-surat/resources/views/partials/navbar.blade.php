@props(['resetBaru' => collect(), 'wargaBaru' => collect()])

<nav class="topnav navbar navbar-light">
  <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
    <i class="fe fe-menu navbar-toggler-icon"></i>
  </button>

  <ul class="nav align-items-center">
    <!-- Mode Switcher -->
    <li class="nav-item">
      <a class="nav-link text-muted" href="#" id="modeSwitcher" data-mode="light">
        <i class="fe fe-sun fe-16"></i>
      </a>
    </li>

    @auth('admin')
        @php $admin = Auth::guard('admin')->user(); @endphp

        @if($admin->role === 'admin')
            <!-- 🔔 Notifikasi Gabungan -->
            <li class="nav-item dropdown mx-2">
                <a class="nav-link dropdown-toggle text-muted" href="#" role="button" data-toggle="dropdown">
                    <i class="fe fe-bell"></i>
                    @if($wargaBaru->count() > 0 || $resetBaru->count() > 0)
                      <span class="dot dot-md bg-danger"></span>
                    @endif
                </a>

                <div class="dropdown-menu dropdown-menu-right" style="width: 300px;">
                    
                    <!-- Bagian Warga Baru -->
                    <h6 class="dropdown-header">Warga Baru Mendaftar</h6>
                    @forelse($wargaBaru as $warga)
                        <a class="dropdown-item" href="{{ route('verifikasi.index') }}">
                            <i class="fe fe-user text-primary"></i>
                            <strong>{{ $warga->nama }}</strong> ({{ $warga->nik }})
                        </a>
                    @empty
                        <a class="dropdown-item text-muted" href="{{ route('verifikasi.index') }}">
                            Tidak ada warga baru
                        </a>
                    @endforelse
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-center text-primary" href="{{ route('verifikasi.index') }}">
                        Lihat Semua Permintaan Verifikasi
                    </a>

                    <div class="dropdown-divider"></div>
                    
                    <!-- Bagian Reset Password -->
                    <h6 class="dropdown-header">Permintaan Reset Password</h6>
                    @forelse($resetBaru as $reset)
                        <a class="dropdown-item" href="{{ route('admin.pesan') }}">
                            <i class="fe fe-lock text-warning"></i>
                            <strong>{{ $reset->nama }}</strong> ({{ $reset->nik }})
                        </a>
                    @empty
                        <a class="dropdown-item text-muted" href="{{ route('admin.pesan') }}">
                            Tidak ada permintaan reset
                        </a>
                    @endforelse

                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-center text-primary" href="{{ route('admin.pesan') }}">
                        Lihat Semua Permintaan Reset
                    </a>
                </div>
            </li>
        @endif

        <!-- Logout -->
        <li class="nav-item mx-2 d-flex align-items-center">
            <form id="logout-form" action="{{ route('logout.admin') }}" method="POST">
                @csrf
                <button type="submit" class="btn btn-sm btn-outline-danger">
                    <i class="fe fe-log-out"></i> Logout
                </button>
            </form>
        </li>
    @endauth
  </ul>
</nav>
