<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use App\Models\Pengguna;
use Illuminate\Support\Facades\Hash;

class HashPlaintextPasswords extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'pengguna:hash-passwords';
    protected $description = 'Mengubah semua password plaintext di tabel pengguna menjadi bcrypt';

    /**
     * Execute the console command.
     */
    public function handle()
    {
        $users = Pengguna::all();

        foreach ($users as $user) {
            if (!str_starts_with($user->password, '$2y$')) {
                $user->password = Hash::make($user->password);
                $user->save();

                $this->info("Password untuk pengguna ID {$user->id} berhasil di-hash.");
            }
        }

        $this->info('Semua password berhasil diperiksa dan dienkripsi jika perlu.');
        return Command::SUCCESS;
    }
}
