<x-layout-login>
    <form method="POST" action="{{ route('login.pengguna') }}">
        @csrf

        <h1 class="h6 text-center mb-3">Login</h1>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">
                    @foreach ($errors->all() as $e)
                        <li>{{ $e }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        <div class="form-group">
            <label for="inputUsername">NIK</label>
            <input type="text" name="nik" id="inputUsername" value="{{ old('nik') }}"
                   class="form-control form-control-lg" placeholder="Masukkan NIK" required autofocus>
        </div>

        <div class="form-group">
            <label for="inputPassword">Password</label>
            <input type="password" name="password" id="inputPassword"
                   class="form-control form-control-lg" placeholder="Masukkan Password" required>
        </div>

        <div class="d-flex justify-content-between mb-3">
            <a href="{{ route('otp.request.form') }}">Lupa Password?</a>
            <a href="{{ route('pengguna.register') }}">Daftar akun</a>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>

        <p class="mt-4 mb-0 text-muted text-center">© 2025</p>
    </form>
</x-layout-login>
