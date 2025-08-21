<?php

namespace App\Exports;

use App\Models\PengajuanSurat;
use Carbon\Carbon;
use Illuminate\Contracts\View\View;
use Maatwebsite\Excel\Concerns\FromView;
use Maatwebsite\Excel\Concerns\WithTitle;
use Maatwebsite\Excel\Concerns\ShouldAutoSize;
use Maatwebsite\Excel\Concerns\WithStyles;
use PhpOffice\PhpSpreadsheet\Worksheet\Worksheet;
use Maatwebsite\Excel\Events\AfterSheet;

class LaporanExport implements FromView, WithTitle, ShouldAutoSize, WithStyles
{
    protected $request;

    public function __construct($request)
    {
        $this->request = $request;
    }

    public function view(): View
    {
        $bulan = $this->request->bulan;
        $tahun = $this->request->tahun ?? date('Y');

        $query = \App\Models\PengajuanSurat::with(['pengguna', 'jenisSurat'])
                    ->where('status', 'diterima');

        if ($bulan) {
            $query->whereMonth('tanggal', $bulan);
        }

        if ($tahun) {
            $query->whereYear('tanggal', $tahun);
        }

        $data = $query->get();

        return view('admin.excel', [
            'data' => $data,
            'bulan' => $bulan,
            'tahun' => $tahun,
        ]);
    }

    public function title(): string
    {
        return 'Laporan Surat';
    }

    public function styles(Worksheet $sheet)
    {
        // Judul besar di baris 1
        $sheet->mergeCells('A1:E1');
        $sheet->getStyle('A1')->getFont()->setBold(true)->setSize(14);
        $sheet->getStyle('A1')->getAlignment()->setHorizontal('center');

        // Header tabel tebal & tengah
        $sheet->getStyle('A2:E2')->getFont()->setBold(true);
        $sheet->getStyle('A2:E2')->getAlignment()->setHorizontal('center');

        // Border seluruh data (asumsi max 100 baris)
        $sheet->getStyle('A1:E100')->getBorders()->getAllBorders()->setBorderStyle('thin');

        return [];
    }

    public function registerEvents(): array
    {
        return [
            AfterSheet::class => function (AfterSheet $event) {
                // Hitung jumlah baris data
                $dataCount = \App\Models\PengajuanSurat::where('status', 'diterima')
                    ->when($this->request->bulan, fn($q) => $q->whereMonth('tanggal', $this->request->bulan))
                    ->when($this->request->tahun, fn($q) => $q->whereYear('tanggal', $this->request->tahun))
                    ->count();

                // Baris awal judul di baris 1, header di baris 2, data dimulai dari baris 3
                $endRow = 2 + $dataCount;

                // Range kolom (A sampai E, bisa disesuaikan)
                $cellRange = "A2:E$endRow";

                // Atur border untuk seluruh tabel
                $event->sheet->getStyle($cellRange)->applyFromArray([
                    'borders' => [
                        'allBorders' => [
                            'borderStyle' => \PhpOffice\PhpSpreadsheet\Style\Border::BORDER_THIN,
                            'color' => ['argb' => '000000'],
                        ],
                    ],
                ]);
            }
        ];
    }
}
