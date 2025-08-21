<x-layout-login>
    <form method="POST" action="{{ route('login.pengguna') }}" id="formLoginPengguna">
        @csrf

        <h1 class="h6 text-center mb-3">Login</h1>

        @if (session('success'))
            <div class="alert alert-success">
                {{ session('success') }}
            </div>
        @endif
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
                class="form-control form-control-lg @error('nik') is-invalid @enderror" placeholder="Masukkan NIK">
        </div>

        <div class="form-group">
            <label for="inputPassword">Password</label>
            <input type="password" name="password" id="inputPassword"
                class="form-control form-control-lg @error('password') is-invalid @enderror" placeholder="Masukkan Password">
        </div>


        <div class="d-flex justify-content-between mb-3">
            <a href="{{ route('password.reset.form') }}">Lupa Password?</a>
            <a href="{{ route('pengguna.register') }}">Daftar akun</a>
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>

        <p class="mt-4 mb-0 text-muted text-center">© 2025</p>
    </form>
</x-layout-login>


@push('scripts')
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const form = document.getElementById('formLoginPengguna');
        if (!form) return;

        const fields = {
            nik: 'NIK',
            password: 'Password'
        };

        form.addEventListener('submit', function (e) {
            let isValid = true;

            // Bersihkan error sebelumnya
            form.querySelectorAll('.is-invalid').forEach(el => el.classList.remove('is-invalid'));
            form.querySelectorAll('.invalid-feedback.client-side').forEach(el => el.remove());

            Object.keys(fields).forEach(field => {
                const input = form.querySelector(`[name="${field}"]`);
                if (!input) return;

                if (!input.value.trim()) {
                    isValid = false;
                    input.classList.add('is-invalid');

                    const error = document.createElement('div');
                    error.className = 'invalid-feedback client-side';
                    error.textContent = fields[field] + ' wajib diisi';
                    input.parentNode.appendChild(error);
                }
            });

            if (!isValid) {
                e.preventDefault(); // Hentikan submit jika ada error
            }
        });
    });
</script>
@endpush
