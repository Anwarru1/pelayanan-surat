<x-layout-login>
    {{-- Notifikasi sukses --}}
    @if (session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    {{-- Notifikasi error umum --}}
    @if (session('error'))
        <div class="alert alert-danger">
            {{ session('error') }}
        </div>
    @endif

    {{-- Validasi error --}}
    @if ($errors->any())
        <div class="alert alert-danger">
            <ul class="mb-0">
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    {{-- Form Reset Password --}}
    <form method="POST" action="{{ route('password.reset.request') }}">
        @csrf

        <h1 class="h6 text-center mb-3">Lupa Password</h1>

        <div class="form-group">
            <label for="nomor_hp">Nama Lengkap</label>
            <input type="text" name="nama" id="nama"
                   class="form-control form-control-lg"
                   oninput="this.value = this.value.toUpperCase();"
                   placeholder="Masukkan Nama Lengkap Anda" required
                   value="{{ old('nama') }}">
        </div>
        <div class="form-group">
            <label for="nomor_hp">NIK</label>
            <input type="text" name="nik" id="nik"
                   class="form-control form-control-lg"
                   placeholder="Masukkan NIK Anda" required
                   value="{{ old('nik') }}">
        </div>
        
        <div class="form-group">
            <label for="no_hp">Nomor HP</label>
            <input type="text" name="no_hp" id="nomor_hp"
                   class="form-control form-control-lg"
                   placeholder="08xxxxxxxxxx" required
                   value="{{ old('nomor_hp') }}">
        </div>
        <div class="form-group">
            <label for="alasan">Kenapa Lupa Password?</label>
            <textarea class="form-control" name="alasan" rows="2" placeholder="Masukkan alasannya" required></textarea>
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block mt-3">Kirim Permintaan</button>
    </form>
</x-layout-login>
