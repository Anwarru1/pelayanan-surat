<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
    <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
        <i class="fe fe-x"><span class="sr-only"></span></i>
    </a>
    <nav class="vertnav navbar navbar-light">

        @if(Auth::guard('pengguna')->check())
        <!-- Logo -->
        <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="{{ route('pengguna.index') }}">
                <img src="{{ asset('assets/images/logo.png') }}" alt="Logo" class="navbar-brand-img brand-sm" style="max-height: 50px;">
            </a>
        </div>

        {{-- Jika login sebagai pengguna (sudah diverifikasi) --}}
            <ul class="navbar-nav flex-fill w-100 mb-2">
                <li class="nav-item w-100">
                    <a class="nav-link" href="{{ route('pengguna.index') }}">
                        <i class="fe fe-home fe-16"></i>
                        <span class="ml-3 item-text">Dashboard</span>
                    </a>
                </li>
            </ul>

            <p class="text-muted nav-heading mt-4 mb-1"><span>Menu</span></p>
            <ul class="navbar-nav flex-fill w-100 mb-2">
                <li class="nav-item w-100">
                    <a class="nav-link" href="{{ route('ajukan-surat.create') }}">
                        <i class="fe fe-file-plus fe-16"></i>
                        <span class="ml-3 item-text">Ajukan Surat</span>
                    </a>
                </li>
                <li class="nav-item w-100">
                    <a class="nav-link" href="{{ route('list-surat.userList') }}">
                        <i class="fe fe-layers fe-16"></i>
                        <span class="ml-3 item-text">Daftar Surat Saya</span>
                    </a>
                </li>
            </ul>

            {{-- Profil --}}
            <ul class="navbar-nav flex-fill w-100 mb-2 mt-auto">
                <li class="nav-item w-100">
                    <a class="nav-link" href="{{ route('pengguna.profil') }}">
                        <i class="fe fe-user fe-16"></i>
                        <span class="ml-3 item-text">Profil Saya</span>
                    </a>
                </li>
            </ul>
        @endif

    </nav>
</aside>
