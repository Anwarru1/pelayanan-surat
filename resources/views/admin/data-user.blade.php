<x-layout>
    <!--Main Content-->
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
                    <div class="row">
                        <!-- Striped rows -->
                        <div class="col-md-12 my-4">
                            <h2 class="h4 mb-1">Data Admin</h2>
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="toolbar row mb-3">
                                        <div class="col ml-auto">
                                            <div class="dropdown float-right">
                                                <button type="button" class="btn btn-primary ml-3 float-right" data-toggle="modal"
                                                data-target="#tambahAdmin" data-whatever="@mdo">Tambah +</button>
                                                <x-admin></x-admin>
                                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                                    id="actionMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"> Action </button>
                                                <div class="dropdown-menu" aria-labelledby="actionMenuButton">
                                                    <a class="dropdown-item" href="#">Export</a>
                                                    <a class="dropdown-item" href="#">Delete</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- table -->
                                    <table class="table datatables" id="adminTable">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th></th>
                                                <th>Id</th>
                                                <th>Nama</th>
                                                <th>Password</th>
                                                <th>Role</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($admins as $index => $admin)
                                                <tr>
                                                    <td>
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input">
                                                            <label class="custom-control-label"></label>
                                                        </div>
                                                    </td>
                                                    <td>{{ $admin->id }}</td>
                                                    <td>{{ $admin->username }}</td>
                                                    <td>{{ $admin->password }}</td>
                                                    <th>{{ $admin->role }}</th>
                                                    <td>
                                                        <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#adminEdit{{ $admin->id }}">Edit</button>
                                                        <x-edit-admin :admin="$admin" />
                                                        <form action="{{ route('data-user.admin.destroy', $admin->id) }}" method="POST" style="display:inline;">
                                                            @csrf @method('DELETE')
                                                            <button onclick="return confirm('Hapus Admin ini?')" class="btn btn-sm btn-danger">Hapus</button>
                                                        </form>  
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>                                        
                                    </table>

                                </div>
                            </div>
                        </div> <!-- simple table -->
                    </div> <!-- end section -->

                    <div class="row">
                        <!-- Striped rows -->
                        <div class="col-md-12 my-4">
                            <h2 class="h4 mb-1">Data Pengguna</h2>
                            <div class="card shadow">
                                <div class="card-body">
                                    <div class="toolbar row mb-3">
                                        <div class="col ml-auto">
                                            <div class="dropdown float-right">
                                                <button type="button" class="btn btn-primary ml-3 float-right" data-toggle="modal"
                                                data-target="#storePengguna" data-whatever="@mdo">Tambah +</button>
                                                <x-pengguna></x-pengguna>
                                                <button class="btn btn-secondary dropdown-toggle" type="button"
                                                    id="actionMenuButton" data-toggle="dropdown" aria-haspopup="true"
                                                    aria-expanded="false"> Action </button>
                                                <div class="dropdown-menu" aria-labelledby="actionMenuButton">
                                                    <a class="dropdown-item" href="#">Export</a>
                                                    <a class="dropdown-item" href="#">Delete</a>
                                                    <a class="dropdown-item" href="#">Something else here</a>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- table -->
                                    <table class="table datatables" id="penggunaTable">
                                        <thead class="thead-dark">
                                            <tr>
                                                <th></th>
                                                <th>Id</th>
                                                <th>Nama</th>
                                                <th>NIK</th>
                                                <th>Password</th>
                                                <th>Jenis Kelamin</th>
                                                <th>Alamat</th>
                                                <th>TTL</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach ($penggunas as $pengguna)
                                                <tr>
                                                    <td>
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input">
                                                            <label class="custom-control-label"></label>
                                                        </div>
                                                    </td>
                                                    <td>{{ $pengguna->id }}</td>
                                                    <td>{{ $pengguna->nama }}</td>
                                                    <td>{{ $pengguna->nik }}</td>
                                                    <td>{{ Str::limit($pengguna->password, 10, '...') }}</td>
                                                    <td>{{ $pengguna->j_kel }}</td>
                                                    <td>{{ Str::limit($pengguna->alamat, 10, '...') }}</td>
                                                    <td>{{ $pengguna->tmp_lahir }}, 
                                                        {{ \Carbon\Carbon::parse($pengguna->tgl_lahir)->format('d-m-Y') }}
                                                    </td>
                                                    <td>
                                                        <button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#editPengguna{{ $pengguna->id }}">Edit</button>
                                                        <x-edit-pengguna :pengguna="$pengguna" />
                                                        <form action="{{ route('data-user.pengguna.destroy', $pengguna->id) }}" method="POST" style="display:inline;">
                                                            @csrf @method('DELETE')
                                                            <button onclick="return confirm('Hapus Pengguna ini?')" class="btn btn-sm btn-danger">Hapus</button>
                                                        </form>  
                                                        </div>
                                                    </td>
                                                </tr>
                                            @endforeach
                                        </tbody>                                        
                                    </table>
                                </div>
                            </div>
                        </div> <!-- simple table -->
                    </div> <!-- end section -->
                </div> <!-- .col-12 -->
            </div> <!-- .row -->
        </div> <!-- .container-fluid -->
    </main>
    <!-- main -->
</x-layout>

@push('scripts')
<script>
    $(document).ready(function () {
        $('#adminTable').DataTable({
            responsive: true,
            language: {
                searchPlaceholder: "Cari admin...",
                search: ""
            },
            columnDefs: [{
                orderable: false,
                targets: [0, 5] // checkbox dan action
            }]
        });

        $('#penggunaTable').DataTable({
            responsive: true,
            language: {
                searchPlaceholder: "Cari pengguna...",
                search: ""
            },
            columnDefs: [{
                orderable: false,
                targets: [0, 8] // checkbox dan action
            }]
        });
    });
</script>
@endpush
