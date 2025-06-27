<x-layout-login>
    <form method="POST" action="{{ route('login.admin') }}">
        <h1 class="h6 text-center mb-3">Login Admin</h1>

        @if ($errors->any())
            <div class="alert alert-danger">
                <ul class="mb-0">
                    @foreach ($errors->all() as $e)
                        <li>{{ $e }}</li>
                    @endforeach
                </ul>
            </div>
        @endif

        @csrf
        <div class="form-group">
            <label for="inputUsername">Username</label>
            <input type="text" name="username" value="{{ old('username') }}" class="form-control form-control-lg"
                placeholder="Masukkan Username" >
        </div>
        <div class="form-group">
            <label for="inputPassword">Password</label>
            <input type="password" name="password" class="form-control form-control-lg" placeholder="Masukkan Password">
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Login</button>
        <p class="mt-4 mb-0 text-muted text-center">© 2025</p>
    </form>
</x-layout-login>
