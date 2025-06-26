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
                                                <button class="btn btn-danger" type="button" title="Hapus terpilih"
                                                    onclick="event.preventDefault(); if(confirm('Yakin hapus data terpilih?')) document.getElementById('bulkDeleteAdminForm').submit();">
                                                    <i class="fe fe-trash-2"></i>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- table -->
                                    <form id="bulkDeleteAdminForm" action="{{ route('data-user.admin.bulk-delete') }}" method="POST">
                                        @csrf
                                        <table class="table datatables" id="adminTable">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th><input type="checkbox" id="checkAllAdmin"></th>
                                                    <th>Id</th>
                                                    <th>Nama</th>
                                                    <th>Password</th>
                                                    <th>Role</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @foreach ($admins as $admin)
                                                    <tr>
                                                        <td>
                                                            <input type="checkbox" name="selected_ids[]" value="{{ $admin->id }}" class="admin-checkbox">
                                                        </td>
                                                        <td>{{ $admin->id }}</td>
                                                        <td>{{ $admin->username }}</td>
                                                        <td>{{ $admin->password }}</td>
                                                        <td>{{ $admin->role }}</td>
                                                        <td> ... </td>
                                                    </tr>
                                                @endforeach
                                            </tbody>
                                        </table>
                                    </form>

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
                                                <button class="btn btn-danger" type="button" title="Hapus terpilih"
                                                    onclick="event.preventDefault(); if(confirm('Yakin hapus data terpilih?')) document.getElementById('bulkDeletePenggunaForm').submit();">
                                                    <i class="fe fe-trash-2"></i>
                                                </button>

                                            </div>
                                        </div>
                                    </div>
                                    <!-- table -->
                                    <form id="bulkDeletePenggunaForm" action="{{ route('data-user.pengguna.bulk-delete') }}" method="POST">
                                        @csrf
                                        <table class="table datatables" id="penggunaTable">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th><input type="checkbox" id="checkAllPengguna"></th>
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
                                                            <input type="checkbox" name="selected_ids[]" value="{{ $pengguna->id }}" class="pengguna-checkbox">
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
                                    </form>
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

        $('#checkAllAdmin').click(function () {
            $('.admin-checkbox').prop('checked', this.checked);
        });
        $('#checkAllPengguna').click(function () {
            $('.pengguna-checkbox').prop('checked', this.checked);
        });

    });
</script>
@endpush
