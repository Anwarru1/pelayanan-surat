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
            <!-- Notifikasi Reset Password -->
            <li class="nav-item dropdown mx-2">
                <a class="nav-link dropdown-toggle text-muted" href="#" role="button" data-toggle="dropdown">
                    <i class="fe fe-bell"></i>
                    @if($resetBaru->count() > 0)
                      <span class="dot dot-md bg-danger"></span>
                    @endif
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <h6 class="dropdown-header">Permintaan Reset Password</h6>
                    @forelse($resetBaru as $reset)
                        <a class="dropdown-item" href="{{ route('admin.password.reset.index') }}">
                            <strong>{{ $reset->nama }}</strong> ({{ $reset->nik }})
                        </a>
                    @empty
                        <a class="dropdown-item text-muted" href="{{ route('admin.password.reset.index') }}">
                            Tidak ada permintaan reset
                        </a>
                    @endforelse
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-center text-primary" href="{{ route('admin.password.reset.index') }}">
                        Lihat Semua Reset
                    </a>
                </div>
            </li>

            <!-- Notifikasi Warga Baru -->
            <li class="nav-item dropdown mx-2">
                <a class="nav-link dropdown-toggle text-muted" href="#" role="button" data-toggle="dropdown">
                    <i class="fe fe-users"></i>
                    @if($wargaBaru->count() > 0)
                      <span class="dot dot-md bg-warning"></span>
                    @endif
                </a>
                <div class="dropdown-menu dropdown-menu-right">
                    <h6 class="dropdown-header">Warga Baru Mendaftar</h6>
                    @forelse($wargaBaru as $warga)
                        <a class="dropdown-item" href="{{ route('verifikasi.index') }}">
                            <strong>{{ $warga->nama }}</strong> ({{ $warga->nik }})
                        </a>
                    @empty
                        <a class="dropdown-item text-muted" href="{{ route('verifikasi.index') }}">
                            Tidak ada warga baru
                        </a>
                    @endforelse
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item text-center text-primary" href="{{ route('verifikasi.index') }}">
                        Lihat Semua Pendaftar
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
