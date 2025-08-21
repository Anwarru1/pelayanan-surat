

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

    <!-- Logout -->
    @if(Auth::guard('daftar')->check())
    <li class="nav-item mx-2 d-flex align-items-center">
      <form action="{{ route('logout.domisili') }}" method="POST" class="mx-2">
        @csrf
        <button type="submit" class="btn btn-sm btn-outline-danger">
            <i class="fe fe-log-out"></i> Logout
        </button>
      </form>
    </li>
    @endif
    
  </ul>
</nav>
