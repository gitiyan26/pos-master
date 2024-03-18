<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Penjualan;

class BulananController extends Controller
{
    public function index (Request $request){
        $tanggalAwal = date('Y-m-d', mktime(0, 0, 0, date('m'), 1, date('Y')));
        $tanggalAkhir = date('Y-m-d');

        if ($request->has('tanggal_awal') && $request->tanggal_awal != "" && $request->has('tanggal_akhir') && $request->tanggal_akhir) {
            $tanggalAwal = $request->tanggal_awal;
            $tanggalAkhir = $request->tanggal_akhir;
        }

        return view('bulanan.index', compact('tanggalAwal', 'tanggalAkhir'));
    }

    public function getData($awal, $akhir)
    {

        $data = [];

    while (strtotime($awal) <= strtotime($akhir)) {
        $tanggal = $awal;
        $awal = date('Y-m-d', strtotime("+1 day", strtotime($awal)));

        // Ambil data penjualan berdasarkan tanggal
        $penjualan = Penjualan::whereDate('tanggal', $tanggal)->get();

        $total_item = $penjualan->sum('total_item');
        $total_harga = $penjualan->sum('total_harga');
        $total_diskon = $penjualan->sum('diskon');
        $total_bayar = $penjualan->sum('bayar');

        // Tambahkan data ke dalam array
        $data[] = [
            'DT_RowIndex' => count($data) + 1,
            'tanggal' => tanggal_indonesia($tanggal, false),
            'kode_member' => '', // Sesuaikan dengan data yang sesuai dengan penjualan
            'total_item' => $total_item,
            'total_harga' => format_uang($total_harga),
            'diskon' => format_uang($total_diskon),
            'bayar' => format_uang($total_bayar),
            'kasir' => '', // Sesuaikan dengan data yang sesuai dengan penjualan
            'aksi' => '', // Sesuaikan dengan data yang sesuai dengan penjualan
        ];
    }

    $data[] = [
        'DT_RowIndex' => '',
        'tanggal' => '',
        'kode_member' => '',
        'total_item' => '',
        'total_harga' => '',
        'diskon' => '',
        'bayar' => 'Total Pendapatan',
        'kasir' => '',
        'aksi' => '',
    ];

    return $data;
    }

    public function data($awal, $akhir)
    {
        $data = $this->getData($awal, $akhir);

        return datatables()
            ->of($data)
            ->make(true);
            
    }
}
