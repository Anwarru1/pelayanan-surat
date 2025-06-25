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

    {{-- Form Verifikasi OTP --}}
    <form method="POST" action="{{ route('otp.verify') }}">
        @csrf

        <input type="hidden" name="nomor_hp" value="{{ session('nomor_hp') }}">

        <div class="form-group">
            <label for="otp_code">Masukkan Kode OTP</label>
            <input type="text" name="otp_code" id="otp_code"
                   class="form-control form-control-lg"
                   placeholder="Kode OTP" required>
        </div>

        <button type="submit" class="btn btn-lg btn-success btn-block mt-3">Verifikasi</button>
    </form>
</x-layout-login>
