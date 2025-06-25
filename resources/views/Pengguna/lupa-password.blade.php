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

    {{-- Form OTP --}}
    <form method="POST" action="{{ route('otp.send') }}">
        @csrf

        <div class="form-group">
            <label for="nomor_hp">Masukkan Nomor HP Anda</label>
            <input type="text" name="nomor_hp" id="nomor_hp"
                   class="form-control form-control-lg"
                   placeholder="08xxxxxxxxxx" required
                   value="{{ old('nomor_hp') }}">
        </div>

        <button type="submit" class="btn btn-lg btn-primary btn-block mt-3">Kirim Kode OTP</button>
    </form>
</x-layout-login>
