<?php 
session_start();
include 'inc.koneksi.php'; 
include 'inc.session.php';

$jenis = isset($_GET['jenis']) ? $_GET['jenis'] : "diagnosa"; //default diagnosa 
$date = new DateTime();
$tglmulai = $date->format('Y-m-d');
date_add($date, date_interval_create_from_date_string("30 days"));
$tglselesai = $date->format('Y-m-d');

if(isset($_GET['tglmulai'])){
    $tglmulai = strtotime($_GET['tglmulai']);
    $tglmulai = date('Y-m-d',$tglmulai);
}
if(isset($_GET['tglselesai'])){
    $tglselesai = strtotime($_GET['tglselesai']);
    $tglselesai = date('Y-m-d',$tglselesai);
}

header("Content-type: application/vnd-ms-excel");
header("Content-Disposition: attachment; filename=lap_".strtolower($jenis)."_".date('d-M-Y', strtotime($tglmulai)).'_'.date('d-M-Y', strtotime($tglselesai)).".xls");
?>
<style>
	h2 {
		color: black;
		font-family: times;
		font-size: 16pt;
	}
	h4 {
		color: black;
		font-family: times;
		font-size: 14pt;
	}

	.border-isi {
		border-top: 0;
		border-bottom: 0;
		border-left: 1px solid #000;
		border-right: 1px solid #000;
		vertical-align: middle;
		padding: 4px;
	}

	.border {
		border: 1px solid #000;
		vertical-align: middle;
		text-align: center;
		padding: 4px;
	}

	.border-left {
		border: 1px solid #000;
		text-align: left;
		padding: 4px;
	}

	.border-right {
		border: 1px solid #000;
		text-align: right;
		padding: 4px;
	}
    .strong{
		color: black;
		font-family: times;
    }
    td{
        text-align:left !important;
    }
    th{
        text-align:left !important;
    }
	table{
		font-family: times;
		font-size: 12pt;
	}
</style>
<html xmlns:x="urn:schemas-microsoft-com:office:excel">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <!--[if gte mso 9]>
    <xml>
    <x:ExcelWorkbook>
    <x:ExcelWorksheets>
    <x:ExcelWorksheet>
    Name of the sheet
    <x:WorksheetOptions>
    <x:Panes>
    </x:Panes>
    </x:WorksheetOptions>
    </x:ExcelWorksheet>
    </x:ExcelWorksheets>
    </x:ExcelWorkbook>
    </xml>
<![endif]-->
</head>
<body>
    <table>
    
    <?php if($jenis === "diagnosa"):?>

        <tr>
            <td colspan="7" align="center">
                <h2><?php echo 'Laporan '.ucwords(strtolower($jenis)); ?>
                    <br>
                    <small style="font-size:12pt;">Per Tanggal <strong><?= date('d-M-Y', strtotime($tglmulai)).' s/d '.date('d-M-Y', strtotime($tglselesai)); ?></strong></small>
                </h2>
            </td>
        </tr>
        <tr>
            <td colspan="7" align="center"><h6></h6></td>
        </tr>
        <tr></tr>
        <tr>
            <th class="border strong" style="text-align:left !important;">No</th>
            <th class="border strong" style="text-align:left !important;">Nama</th>
            <th class="border strong" style="text-align:left !important;">Jenis Kelamin</th>
            <th class="border strong" style="text-align:left !important;">Alamat</th>
            <th class="border strong" style="text-align:left !important;">Pekerjaan</th>
            <th class="border strong" style="text-align:left !important;">Tanggal Diagnosa</th>
            <th class="border strong" style="text-align:left !important;">Penyakit</th>
        </tr>
        <?php
            $sql = "SELECT analisa_hasil.nama, analisa_hasil.kelamin, analisa_hasil.alamat, analisa_hasil.pekerjaan, analisa_hasil.tanggal, solusi.nm_solusi
            FROM analisa_hasil,solusi
            WHERE analisa_hasil.kd_solusi = solusi.kd_solusi AND (
            (DATE(analisa_hasil.tanggal) BETWEEN DATE('$tglmulai') AND DATE('$tglselesai')) OR (DATE(analisa_hasil.tanggal) BETWEEN DATE('$tglselesai') AND DATE('$tglmulai'))
            )
            ORDER BY analisa_hasil.id DESC";
            $qry = mysql_query($sql, $koneksi) or die ("SQL Error".mysql_error());
            $no = 0;
            while ($data = mysql_fetch_array($qry)):
        ?>        
        <tr>
            <td class="border" style="width:40px;"><?php echo ($no++)+1; ?></td>
            <td class="border" style="width:160px;"><?php echo $data['nama']; ?></td>
            <td class="border" style="width:80px;"><?php 
                if ($data['kelamin']=="P") {
                    echo "Laki-laki";
                }
                else {
                    echo "Perempuan";
                }
            ?></td>
            <td class="border" style="width:140px;"><?php echo $data['alamat']; ?></td>
            <td class="border" style="width:140px;"><?php echo $data['pekerjaan']; ?></td>
            <td class="border" style="width:140px;"><?php echo date('d-M-Y H:i:s', strtotime($data['tanggal'])); ?></td>
            <td class="border" style="width:270px;"><?php echo $data['nm_solusi']; ?></td>
        </tr>
    <?php endwhile;
    
    endif; ?>

    </table>
</body>