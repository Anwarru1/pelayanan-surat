<?php

namespace App\Livewire;

use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Pengguna;

class PenggunaSearch extends Component
{
    use WithPagination;

    public $searchTerm = '';
    public $search = '';
    public $selectedPenggunas = [];
    public $selectAllCheckbox = false;

    protected $paginationTheme = 'bootstrap';

    public function cari()
    {
        $this->search = $this->searchTerm;
        $this->resetPage();
    }

    public function updatedSelectAllCheckbox($value)
    {
        if ($value) {
            $this->selectedPenggunas = Pengguna::where(function ($q) {
                $q->where('nama', 'like', '%' . $this->search . '%')
                  ->orWhere('nik', 'like', '%' . $this->search . '%');
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
        $this->dispatch('show-success', message: 'Data pengguna berhasil dihapus.');
    }

    public function render()
    {
        $query = Pengguna::query();

        if (!empty($this->search)) {
            $query->where(function ($q) {
                $q->where('nama', 'like', '%' . $this->search . '%')
                  ->orWhere('nik', 'like', '%' . $this->search . '%');
            });
        }

        $penggunas = $query->orderBy('id', 'desc')->paginate(10);

        return view('livewire.pengguna-search', compact('penggunas'));
    }
}
