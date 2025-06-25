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
    <form method="POST" action="{{ route('otp.password.update') }}">
        @csrf

        <div class="form-group">
            <label for="password">Password Baru</label>
            <input type="password" name="password" id="password"
                   class="form-control form-control-lg"
                   placeholder="Masukkan Password Baru" required>
        </div>

        <div class="form-group">
            <label for="password_confirmation">Konfirmasi Password</label>
            <input type="password" name="password_confirmation" id="password_confirmation"
                   class="form-control form-control-lg"
                   placeholder="Ulangi Password" required>
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block mt-3">Reset Password</button>
    </form>
</x-layout-login>
