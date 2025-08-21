@extends('layouts.p-app') 

@section('content')
  <main class="main-content">
    <div class="container mt-4">
      <h2>Pesan Saya</h2>
      <table class="table table-bordered">
        <thead>
          <tr>
            <th>Subjek</th>
            <th>Isi</th>
            <th>Tanggal</th>
            <th>Balasan Admin</th>
          </tr>
        </thead>
        <tbody>
          @foreach($pesanList as $pesan)
          <tr>
            <td>{{ $pesan->subjek }}</td>
            <td>{{ $pesan->isi }}</td>
            <td>{{ $pesan->created_at->format('d M Y H:i') }}</td>
            <td>
              @if($pesan->balasan)
                <div class="alert alert-success">{{ $pesan->balasan }}</div>
              @else
                <span class="text-muted">Belum dibalas</span>
              @endif
            </td>
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </main>
@endsection
