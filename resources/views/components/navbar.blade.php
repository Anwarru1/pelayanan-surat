@props(['pesanBaru'])

<nav class="topnav navbar navbar-light">
  <button type="button" class="navbar-toggler text-muted mt-2 p-0 mr-3 collapseSidebar">
    <i class="fe fe-menu navbar-toggler-icon"></i>
  </button>

  <form class="form-inline mr-auto searchform text-muted">
    <input class="form-control mr-sm-2 bg-transparent border-0 pl-4 text-muted" 
           type="search" placeholder="Cari sesuatu..." aria-label="Search">
  </form>

  <ul class="nav align-items-center">
    <!-- Mode Switcher -->
    <li class="nav-item">
      <a class="nav-link text-muted" href="#" id="modeSwitcher" data-mode="light">
        <i class="fe fe-sun fe-16"></i>
      </a>
    </li>

    <!-- Dropdown Pesan -->
    @auth('admin')
      @if(Route::has('admin.pesan'))
        <li class="nav-item dropdown d-flex align-items-center mx-2">
          <a class="nav-link dropdown-toggle text-muted pr-0" href="#" role="button" data-toggle="dropdown">
            <i class="fe fe-mail"></i>
            @if($pesanBaru->count() > 0)
              <span class="dot dot-md bg-danger"></span>
            @endif
          </a>

          <div class="dropdown-menu dropdown-menu-right">
            <h6 class="dropdown-header">Pesan Terbaru</h6>
            @forelse($pesanBaru as $pesan)
              <a class="dropdown-item" href="{{ route('admin.pesan') }}">
                <strong>{{ $pesan->pengguna->nama }}</strong>: 
                {{ \Illuminate\Support\Str::limit($pesan->isi, 30) }}
              </a>
            @empty
              <a class="dropdown-item text-muted" href="{{ route('admin.pesan') }}">
                Tidak ada pesan baru
              </a>
            @endforelse
            <div class="dropdown-divider"></div>
            <a class="dropdown-item text-center text-primary" href="{{ route('admin.pesan') }}">
              Lihat Semua Pesan
            </a>
          </div>
        </li>
      @endif
    @endauth


    <!-- Logout -->
    <li class="nav-item mx-2 d-flex align-items-center">
      <form id="logout-form" action="{{ route('logout') }}" method="POST">
        @csrf
        <button type="submit" class="btn btn-sm btn-outline-danger">
          <i class="fe fe-log-out"></i> Logout
        </button>
      </form>
    </li>
  </ul>
</nav>
