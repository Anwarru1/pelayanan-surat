<aside class="sidebar-left border-right bg-white shadow" id="leftSidebar" data-simplebar>
    <a href="#" class="btn collapseSidebar toggle-btn d-lg-none text-muted ml-2 mt-3" data-toggle="toggle">
        <i class="fe fe-x"><span class="sr-only"></span></i>
    </a>
    <nav class="vertnav navbar navbar-light">
        <!-- nav bar -->
        <div class="w-100 mb-4 d-flex">
            <a class="navbar-brand mx-auto mt-2 flex-fill text-center" href="{{ route('dashboard.kepala-desa') }}">
                <img src="{{ asset('assets/images/logo.png') }}" alt="Logo" class="navbar-brand-img brand-sm" style="max-height: 50px;">
            </a>
        </div>

        
        @if(Auth::guard('admin')->check())
          @php
              $admin = Auth::guard('admin')->user();
          @endphp
            <ul class="navbar-nav flex-fill w-100 mb-2">
                <li class="nav-item w-100">
                    <a class="nav-link" href="{{ route('dashboard.kepala-desa') }}">
                        <i class="fe fe-home fe-16"></i>
                        <span class="ml-3 item-text">Dashboard</span>
                    </a>
                </li>
            </ul>
            <p class="text-muted nav-heading mt-4 mb-1">
                <span>Menu</span>
            </p>
            
            {{-- Untuk Admin --}}
            @if($admin->role === 'admin')
                <ul class="navbar-nav flex-fill w-100 mb-2">
                    <li class="nav-item w-100">
                        <a class="nav-link" href="{{ route('pengajuan.index') }}">
                            <i class="fe fe-mail fe-16"></i>
                            <span class="ml-3 item-text">Pengajuan Surat</span>
                        </a>
                    </li>
                    <li class="nav-item w-100">
                        <a class="nav-link" href="{{ route('jenis-surat.index') }}">
                            <i class="fe fe-list fe-16"></i>
                            <span class="ml-3 item-text">Jenis Surat</span>
                        </a>
                    </li>
                    <li class="nav-item w-100">
                        <a class="nav-link" href="{{ route('data-user.index') }}">
                            <i class="fe fe-users fe-16"></i>
                            <span class="ml-3 item-text">Data User</span>
                        </a>
                    </li>
                    <li class="nav-item w-100">
                        <a class="nav-link" href="{{ route('laporan.index') }}">
                            <i class="fe fe-archive fe-16"></i>
                            <span class="ml-3 item-text">Laporan</span>
                        </a>
                    </li>
                </ul>
                
                {{-- Untuk Kepala Desa --}}
            @elseif($admin->role === 'kepala desa')
                <ul class="navbar-nav flex-fill w-100 mb-2">
                    <li class="nav-item w-100">
                        <a class="nav-link" href="{{ route('berkas.index') }}">
                            <i class="fe fe-check-square fe-16"></i>
                            <span class="ml-3 item-text">Berkas Surat</span>
                        </a>
                    </li>
                    <li class="nav-item w-100">
                        <a class="nav-link" href="{{ route('laporan.index') }}">
                            <i class="fe fe-archive fe-16"></i>
                            <span class="ml-3 item-text">Laporan</span>
                        </a>
                    </li>
                </ul>

            @endif
        @endif
    </nav>
</aside>
