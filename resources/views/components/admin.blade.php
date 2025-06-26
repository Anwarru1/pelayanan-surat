<div class="modal fade" id="tambahAdmin" tabindex="-1" role="dialog" aria-labelledby="varyModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="varyModalLabel">Tambah
                    Admin</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="{{ route('data-user.admin.store') }}" method="POST">
                    @csrf
                    <div class="form-group">
                        <label for="example-palaceholder">Username</label>
                        <input type="text" class="form-control" id="username" name="username"
                            placeholder="Masukkan Username" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="example-password">Password</label>
                        <input type="password" class="form-control" id="password" name="password"
                            placeholder="Masukkan Password" required>
                    </div>
                    <div class="form-group mb-3">
                        <label>Role</label>
                        <select name="role" class="form-control">
                        <option value="admin">Admin</option>
                        <option value="kepala desa">Kepala Desa</option>
                        </select>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn mb-2 btn-danger" data-dismiss="modal">Batal</button>
                        <button type="submit" class="btn mb-2 btn-primary">Tambah</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>