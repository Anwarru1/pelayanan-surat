<div>
    {{-- Loading Spinner saat mengetik --}}
    <div wire:loading.delay wire:target="searchAdmin" class="text-muted mb-2">
        <i class="spinner-border spinner-border-sm"></i> Mencari...
    </div>

    {{-- Toolbar --}}
    <div class="toolbar row mb-3 align-items-center">
        <div class="col-md-6 d-flex">
            {{-- Input search realtime --}}
            <input wire:model.live.debounce.500ms="searchAdmin"
                   type="text"
                   class="form-control"
                   placeholder="Cari Username..."
                   style="max-width: 250px;">

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

            <button type="button" class="btn btn-primary ml-2" data-toggle="modal" data-target="#tambahAdmin">
                Tambah +
            </button>
        </div>
        <x-admin />
    </div>


    <table class="table table-bordered table-striped">
        <thead class="thead-dark">
            <tr>
                <th><input type="checkbox" wire:click="$toggle('selectAllCheckbox')" wire:model="selectAllCheckbox"></th>
                <th>ID</th>
                <th>Username</th>
                <th>Password</th>
                <th>Role</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            @forelse ($admins as $admin)
                <tr>
                    <td><input type="checkbox" wire:model="selectedAdmins" value="{{ $admin->id }}"></td>
                    <td>{{ $admin->id }}</td>
                    <td>{{ $admin->username }}</td>
                    <td>••••••••</td>
                    <td>{{ ucfirst($admin->role) }}</td>
                    <td>
                        <button class="btn btn-sm btn-warning" data-toggle="modal" data-target="#adminEdit{{ $admin->id }}">
                            Edit
                        </button>
                        <x-edit-admin :admin="$admin" />

                        <form action="{{ route('data-user.admin.destroy', $admin->id) }}" method="POST" class="d-inline">
                            @csrf @method('DELETE')
                            <button type="submit" class="btn btn-sm btn-danger"
                                    onclick="return confirm('Hapus Admin ini?')">
                                Hapus
                            </button>
                        </form>
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" class="text-center text-muted">Tidak ada data admin.</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    {{-- PAGINATION --}}
    <div class="d-flex justify-content-end mt-3">
        {{ $admins->links() }}
    </div>
</div>

@push('scripts')
<script>
    Livewire.on('show-success', ({ message }) => {
    const alert = document.createElement('div');
    alert.className = 'alert alert-success alert-dismissible fade show mt-3';
    alert.innerHTML = `
        ${message}
        <button type="button" class="close" data-dismiss="alert">&times;</button>
    `;

    const container = document.querySelector('.main-content .container-fluid');
    if (container) container.prepend(alert);

    setTimeout(() => {
        $(alert).alert('close');
    }, 3000);
});


</script>

@endpush
