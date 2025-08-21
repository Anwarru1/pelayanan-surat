<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Pengguna;

class PenggunaSearch extends Component
{
    use WithPagination;

    public $searchPengguna = '';  // ✅ pakai nama unik
    public $selectedPenggunas = [];
    public $selectAllCheckbox = false;

    protected $paginationTheme = 'bootstrap';

    // reset halaman setiap kali search berubah
    public function updatingSearchPengguna()
    {
        $this->resetPage();
    }

    public function updatedSelectAllCheckbox($value)
    {
        if ($value) {
            $this->selectedPenggunas = Pengguna::where(function ($q) {
                $q->where('nama', 'like', '%' . $this->searchPengguna . '%')
                  ->orWhere('nik', 'like', '%' . $this->searchPengguna . '%');
            })->pluck('id')->toArray();
        } else {
            $this->selectedPenggunas = [];
        }
    }

    public function bulkDelete()
    {
        Pengguna::whereIn('id', $this->selectedPenggunas)->delete();
        $this->selectedPenggunas = [];
        $this->selectAllCheckbox = false;
        $this->dispatch('bulk-delete-success');
    }

    public function render()
    {
        $query = Pengguna::query();

        if (!empty($this->searchPengguna)) {
            $query->where(function ($q) {
                $q->where('nama', 'like', '%' . $this->searchPengguna . '%')
                  ->orWhere('nik', 'like', '%' . $this->searchPengguna . '%');
            });
        }

        $penggunas = $query->orderBy('id', 'desc')->paginate(10);

        return view('livewire.pengguna-search', compact('penggunas'));
    }
}
