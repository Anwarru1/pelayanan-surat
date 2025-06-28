<div>
    {{-- Loading Spinner saat mencari --}}
    <div wire:loading wire:target="search" class="text-muted mb-2">
        <i class="spinner-border spinner-border-sm"></i> Mencari...
    </div>

    {{-- Toolbar --}}
    <div class="toolbar row mb-3 align-items-center">
        <div class="col-md-6 d-flex">
            {{-- Input search --}}
            <input wire:model.defer="search"
                   type="text"
                   class="form-control"
                   placeholder="Cari nama atau NIK..."
                   style="max-width: 250px;">

            {{-- Tombol Cari --}}
            <button wire:click="$refresh"
                    class="btn btn-secondary ml-2"
                    style="height: calc(1.5em + .75rem + 2px);">
                Cari
            </button>
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


    {{-- Highlight Helper --}}
    @php
        function highlight($text, $keyword) {
            if (!$keyword) return e($text);
            return preg_replace('/(' . preg_quote($keyword, '/') . ')/i', '<mark>$1</mark>', e($text));
        }
    @endphp

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
                <th>TTL</th>
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
                    <td>{!! highlight($pengguna->nama, $search) !!}</td>
                    <td>{!! highlight($pengguna->nik, $search) !!}</td>
                    <td>••••••••</td> {{-- Ganti tampilkan password dengan aman --}}
                    <td>{{ $pengguna->j_kel }}</td>
                    <td>{{ Str::limit($pengguna->alamat, 10, '...') }}</td>
                    <td>{{ $pengguna->tmp_lahir }}, {{ \Carbon\Carbon::parse($pengguna->tgl_lahir)->format('d-m-Y') }}</td>
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
        // Atau pakai toast Bootstrap / SweetAlert di sini
    });
</script>
@endpush
