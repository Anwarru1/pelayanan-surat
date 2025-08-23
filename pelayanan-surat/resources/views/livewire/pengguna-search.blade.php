<div>
    {{-- Loading Spinner --}}
    <div wire:loading wire:target="searchPengguna" class="text-muted mb-2">
        <i class="spinner-border spinner-border-sm"></i> Mencari...
    </div>

    {{-- Toolbar --}}
    <div class="toolbar row mb-3 align-items-center">
        <div class="col-md-6 d-flex">
            {{-- Input search realtime --}}
            <input wire:model.live.debounce.500ms="searchPengguna"
                   type="text"
                   class="form-control"
                   placeholder="Cari nama atau NIK..."
                   style="max-width: 250px;">

            {{-- Filter role --}}
            <select wire:model="filterRole" class="form-control ml-2" style="max-width: 180px;">
                <option value="">Semua Role</option>
                <option value="admin">Admin</option>
                <option value="rt">RT</option>
                <option value="warga">Warga</option>
            </select>
        </div>

        {{-- Aksi kanan --}}
        <div class="col-md-6 text-right">
            <form wire:submit.prevent="bulkDelete" class="d-inline">
                <button type="submit" class="btn btn-danger"
                        onclick="return confirm('Yakin hapus data terpilih?')"
                        wire:loading.attr="disabled"
                        wire:target="bulkDelete">
                    <span wire:loading.remove wire:target="bulkDelete">
                        <i class="fe fe-trash-2"></i>
                    </span>
                    <span wire:loading wire:target="bulkDelete">
                        <i class="spinner-border spinner-border-sm"></i>
                    </span>
                </button>
            </form>

            <button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#storePengguna">
                Tambah +
            </button>
        </div>
        <x-pengguna />
    </div>

    {{-- Tabel --}}
    <table class="table table-bordered table-striped" id="penggunaLivewireTable">
        <thead class="thead-dark">
            <tr>
                <th>
                    <input type="checkbox" wire:click="$toggle('selectAllCheckbox')" wire:model="selectAllCheckbox">
                </th>
                <th>ID</th>
                <th>Nama</th>
                <th>NIK</th>
                <th>Password</th>
                <th>Jenis Kelamin</th>
                <th>Alamat</th>
                <th>Role</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody wire:loading.class="opacity-50" wire:loading.remove.class="opacity-100">
            @forelse ($penggunas as $pengguna)
                <tr>
                    <td>
                        <input type="checkbox" wire:model="selectedPenggunas" value="{{ $pengguna->id }}">
                    </td>
                    <td>{{ $pengguna->id }}</td>
                    <td>{{ $pengguna->nama }}</td>
                    <td>{{ $pengguna->nik }}</td>
                    <td>••••••••</td>
                    <td>{{ $pengguna->j_kel }}</td>
                    <td>{{ Str::limit($pengguna->alamat, 10, '...') }}</td>
                    <td>{{ $pengguna->role }}</td>
                    <td>
                        <button type="button" class="btn btn-sm btn-warning" data-toggle="modal" data-target="#editPengguna{{ $pengguna->id }}">
                            Edit
                        </button>
                        <x-edit-pengguna :pengguna="$pengguna" />

                        <form action="{{ route('data-user.pengguna.destroy', $pengguna->id) }}" method="POST" class="d-inline">
                            @csrf @method('DELETE')
                            <button class="btn btn-sm btn-danger" onclick="return confirm('Hapus Pengguna ini?')">Hapus</button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="9" class="text-center text-muted">Tidak ada data ditemukan.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    {{-- Pagination --}}
    <div class="d-flex justify-content-end mt-3">
        {{ $penggunas->links() }}
    </div>
</div>

@push('scripts')
<script>
    window.addEventListener('bulk-delete-success', () => {
        alert('Data berhasil dihapus!');
    });
</script>
@endpush
