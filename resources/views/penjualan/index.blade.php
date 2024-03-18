@extends('layouts.master')

@section('title')
    Daftar Penjualan
@endsection

@push('css')
<link rel="stylesheet" href="{{ asset('/AdminLTE-2/bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}">
@endpush

@section('breadcrumb')
    @parent
    <li class="active">Daftar Penjualan</li>
@endsection

@section('content')
<div class="row">
    <div class="col-lg-12">
        <div class="box">
            <div class="box-body table-responsive">
                <button class="btn btn-info btn-xs btn-flat" data-toggle="modal" data-target="#modalTanggal"><i class="fa fa-calendar"></i> Pilih Tanggal</button>  
                <br>
                <br>
                <table class="table table-stiped table-bordered table-penjualan">
                    <thead>
                        <th width="5%">No</th>
                        <th>Tanggal</th>
                        <th>Kode Member</th>
                        <th>Total Item</th>
                        <th>Total Harga</th>
                        <th>Diskon</th>
                        <th>Total Bayar</th>
                        <th>Kasir</th>
                        <th width="15%"><i class="fa fa-cog"></i></th>
                    </thead>
                    <tbody>
                    @foreach ($penjualan as $index => $data)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ tanggal_indonesia($data->created_at, false) }}</td>
                            <td>{{ $data->member->kode_member ?? '-' }}</td>
                            <td>{{ format_uang($data->total_item) }}</td>
                            <td>Rp. {{ format_uang($data->total_harga) }}</td>
                            <td>{{ $data->diskon }}%</td>
                            <td>Rp. {{ format_uang($data->bayar) }}</td>
                            <td>{{ $data->user->name ?? '-' }}</td>
                            <td>
                            @if(auth()->user()->level == 2)
                                <div class="btn-group">
                                    <button onclick="showDetail('{{ route('penjualan.show', $data->id_penjualan) }}')" class="btn btn-xs btn-info btn-flat"><i class="fa fa-eye"></i></button>
                                </div>
                            @elseif(auth()->user()->level == 1)
                                <div class="btn-group">
                                    <button onclick="showDetail('{{ route('penjualan.show', $data->id_penjualan) }}')" class="btn btn-xs btn-info btn-flat"><i class="fa fa-eye"></i></button>
                                    <button onclick="deleteData('{{ route('penjualan.destroy', $data->id_penjualan) }}')" class="btn btn-xs btn-danger btn-flat"><i class="fa fa-trash"></i></button>
                                </div>
                            @endif
                            </td>
                        </tr>
                    @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <td colspan="6"><strong>Total:</strong></td>
                            <td>Rp. {{ format_uang($totalPendapatan) }}</td>
                            <td></td>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="modalTanggal" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title">Pilih Rentang Tanggal</h4>
            </div>
            <div class="modal-body">
                <form id="filterForm">
                    <div class="form-group">
                        <label for="tanggal_awal">Tanggal Awal:</label>
                        <input type="date" class="form-control datepicker" id="tanggal_awal" name="tanggal_awal" value="{{ $tanggalAwal }}">
                    </div>
                    <div class="form-group">
                        <label for="tanggal_akhir">Tanggal Akhir:</label>
                        <input type="date" class="form-control datepicker" id="tanggal_akhir" name="tanggal_akhir" value="{{ $tanggalAkhir }}">
                    </div>
                    <button type="submit" class="btn btn-primary">Filter</button>
                </form>
            </div>
        </div>
    </div>
</div>

@includeIf('penjualan.detail')
@endsection

@push('scripts')
<script src="{{ asset('/AdminLTE-2/bower_components/bootstrap-datepicker/dist/js/bootstrap-datepicker.min.js') }}"></script>
<script>
    let table1;

    $(function () {
        table1 = $('.table-detail').DataTable({
            processing: true,
            bSort: false,
            dom: 'Brt',
            columns: [
                {data: 'DT_RowIndex', searchable: false, sortable: false},
                {data: 'kode_produk'},
                {data: 'nama_produk'},
                {data: 'harga_jual'},
                {data: 'jumlah'},
                {data: 'subtotal'},
            ]
        })

        $('#filterForm').submit(function (e) {
            e.preventDefault();
            
            var tanggalAwal = $('#tanggal_awal').val();
            var tanggalAkhir = $('#tanggal_akhir').val();
            
            window.location.href = '{{ route('penjualan.index') }}?tanggal_awal=' + tanggalAwal + '&tanggal_akhir=' + tanggalAkhir;
        });
    });

    function showDetail(url) {
        $('#modal-detail').modal('show');

        table1.ajax.url(url);
        table1.ajax.reload();
    }

    function deleteData(url) {
        if (confirm('Yakin ingin menghapus data terpilih?')) {
            $.post(url, {
                    '_token': $('[name=csrf-token]').attr('content'),
                    '_method': 'delete'
                })
                .done((response) => {
                    window.location.reload();
                })
                .fail((errors) => {
                    alert('Tidak dapat menghapus data');
                    return;
                });
        }
    }
</script>
@endpush
