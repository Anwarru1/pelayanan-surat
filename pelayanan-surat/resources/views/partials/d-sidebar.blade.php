<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
    <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
        <i class="fe fe-x"><span class="sr-only"></span></i>
    </a>
    <nav class="vertnav navbar navbar-light">

        {{-- Jika login sebagai daftar_pengguna (belum diverifikasi) --}}
        @if(Auth::guard('daftar')->check())

        <!-- Logo -->
        <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="{{ route('domisili.dashboard') }}">
                <img src="{{ asset('assets/images/logo.png') }}" alt="Logo" class="navbar-brand-img brand-sm" style="max-height: 50px;">
            </a>
        </div>

            <ul class="navbar-nav flex-fill w-100 mb-2">
                <li class="nav-item w-100">
                    <a class="nav-link" href="{{ route('domisili.dashboard') }}">
                        <i class="fe fe-home fe-16"></i>
                        <span class="ml-3 item-text">Dashboard</span>
                    </a>
                </li>
            </ul>

            {{-- Hanya profil --}}
            <ul class="navbar-nav flex-fill w-100 mb-2 mt-auto">
                <li class="nav-item w-100">
                    <a class="nav-link" href="{{ route('profil.index') }}">
                        <i class="fe fe-user fe-16"></i>
                        <span class="ml-3 item-text">Profil Saya</span>
                    </a>
                </li>
            </ul>
        @endif
    </nav>
</aside>
