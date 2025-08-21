<?php

namespace App\Livewire;

use Livewire\Component;
use App\Models\Admin;
use Livewire\WithPagination;

class AdminSearch extends Component
{
    use WithPagination;

    public $searchAdmin = '';
    public $selectedAdmins = [];
    public $selectAllCheckbox = false;

    protected $paginationTheme = 'bootstrap';

    public function updatedSearchTerm()
    {
        $this->resetPage();
    }

    public function updatedSelectAllCheckbox($value)
    {
        if ($value) {
            $this->selectedAdmins = Admin::where(function ($q) {
                $q->where('username', 'like', '%' . $this->searchAdmin . '%')
                  ->orWhere('role', 'like', '%' . $this->searchAdmin . '%');
            })->pluck('id')->toArray();
        } else {
            $this->selectedAdmins = [];
        }
    }

    public function bulkDelete()
    {
        if (count($this->selectedAdmins) > 0) {
            Admin::whereIn('id', $this->selectedAdmins)->delete();

            $this->selectedAdmins = [];
            $this->selectAllCheckbox = false;

            // ✅ Perbaikan dispatchBrowserEvent
            $this->dispatch('show-success', message: 'Data admin yang dipilih berhasil dihapus.');

        }
    }

    public function render()
    {
        $query = Admin::query();

        if (!empty($this->searchAdmin)) {
            $query->where(function ($q) {
                $q->where('username', 'like', '%' . $this->searchAdmin . '%')
                  ->orWhere('role', 'like', '%' . $this->searchAdmin . '%');
            });
        }

        $admins = $query->orderBy('id', 'desc')->paginate(10);

        return view('livewire.admin-search', compact('admins'));
    }
}
