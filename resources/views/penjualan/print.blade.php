<h1>Laporan Penjualan</h1>

<table>
    <thead>
        <tr>
            <th>No</th>
            <th>Tanggal</th>
            <th>Nama</th>
            <th>Usia</th>
            <th>Metode Pembayaran</th>
            <th>Kode Member</th>
            <th>Total Item</th>
            <th>Total Harga</th>
            <th>Diskon</th>
            <th>Total Bayar</th>
            <th>Kasir</th>
        </tr>
    </thead>
    <tbody>
        @foreach($penjualan as $index => $data)
        <tr>
            <td>{{ $index + 1 }}</td>
            <td>{{ $data->created_at }}</td>
            <td>{{ ucfirst($data->nama) }}</td>
            <td>{{ $data->usia }}</td>
            <td>{{ ucfirst($data->payment_method) }}</td>
            <td>{{ $data->member->kode_member ?? '-' }}</td>
            <td>{{ $data->total_item }}</td>
            <td>{{ $data->total_harga }}</td>
            <td>{{ $data->diskon }}%</td>
            <td>{{ $data->bayar }}</td>
            <td>{{ $data->user->name ?? '-' }}</td>
        </tr>
        @endforeach
    </tbody>
</table>
