<x-layout>
    <main role="main" class="main-content">
        <div class="container-fluid">

            @if(session('success'))
                <div class="alert alert-success">{{ session('success') }}</div>
            @endif
            @if ($errors->any())
                <div class="alert alert-danger">
                    <ul>
                        @foreach ($errors->all() as $error)
                            <li>{{ $error }}</li>
                        @endforeach
                    </ul>
                </div>
            @endif

            <div class="row justify-content-center">
                <div class="col-12">

                    <!-- ====================== ADMIN SECTION via LIVEWIRE ======================= -->
                    <div class="row">
                        <div class="col-md-12 my-4">
                            <h2 class="h4 mb-1">Data Admin</h2>
                            <div class="card shadow">
                                <div class="card-body">
                                    @livewire('admin-search')
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- ====================== PENGGUNA SECTION via LIVEWIRE ======================= -->
                    <div class="row">
                        <div class="col-md-12 my-4">
                            <h2 class="h4 mb-1">Data Pengguna</h2>
                            <div class="card shadow">
                                <div class="card-body">
                                    @livewire('pengguna-search')
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </main>
</x-layout>

