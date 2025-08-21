<x-layout-login>
    <form method="POST" action="{{ route('pengguna.register.store') }}" id="formDaftarPengguna">
        @csrf

        <h1 class="h6 text-center mb-3">Daftar Akun</h1>

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
          <label>NIK</label>
          <input type="text" name="nik" class="form-control @error('nik') is-invalid @enderror"   >
          @error('nik')
            <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
          @enderror
        </div>

        <div class="form-group">
          <label>Password</label>
          <input type="password" name="password" class="form-control @error('password') is-invalid @enderror"   >
          @error('password')
            <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
          @enderror
        </div>

        <div class="form-group">
          <label>Konfirmasi Password</label>
          <input type="password" name="password_confirmation" class="form-control @error('password_confirmation') is-invalid @enderror"   >
          @error('password_confirmation')
            <span class="invalid-feedback"><strong>{{ $message }}</strong></span>
          @enderror
        </div>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Daftar</button>

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
