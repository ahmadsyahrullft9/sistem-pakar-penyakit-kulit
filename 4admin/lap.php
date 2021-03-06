<?php 
session_start();
include 'inc.koneksi.php'; 
include 'inc.session.php';
?>
<?php if(isset($_GET['gejala'])){ ?>
<body onload="window.print();" Layout="Portrait">
<center><h3>LAPORAN DATA GEJALA</h3></center>
<table border=1 width=600>
<thead>
		<tr>
			<th>No</th>
			<th>Kode Gejala</th>
			<th>Nama Gejala</th>
		</tr>
	</thead>
<tbody>
<?php
	$sql = "SELECT * FROM gejala ORDER BY kd_gejala";
	$qry = mysql_query($sql, $koneksi)
		or die ("SQL Error".mysql_error());
	$no=0;
	while ($data=mysql_fetch_array($qry)) {
	$no++;
?>
<tr class="odd gradeX">
	<td class="center"><?php echo $no; ?></td>
	<td><?php echo $data['kd_gejala']; ?></td>
	<td><?php echo $data['nm_gejala']; ?></td>
</tr>
	<?php
	}
	?>
</tbody>
</table>
</body>
<?php } ?>

<?php if(isset($_GET['solusi'])){ ?>
<body onload="window.print();" Layout="Portrait">
<center><h3>LAPORAN DATA PENYAKIT DAN SOLUSI</h3></center>
<table border=1 width=700>
<thead>
		<tr>
			<th>No</th>
			<th>Kode Penyakit</th>
			<th>Nama Penyakit</th>
			<th>Solusi</th>
		</tr>
	</thead>
<tbody>
<?php
	$sql = "SELECT * FROM solusi ORDER BY kd_solusi";
	$qry = mysql_query($sql, $koneksi)
		or die ("SQL Error".mysql_error());
	$no=0;
	while ($data=mysql_fetch_array($qry)) {
	$no++;
?>
<tr class="odd gradeX">
	<td class="center"><?php echo $no; ?></td>
	<td><?php echo $data['kd_solusi']; ?></td>
	<td><?php echo $data['nm_solusi']; ?></td>
	<td><?php echo $data['solusi']; ?></td>
</tr>
	<?php
	}
	?>
</tbody>
</table>
</body>
<?php } ?>


<?php if(isset($_GET['diagnosa'])){ 
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
?>
<body onload="window.print();" Layout="Landscape">
<center>
	<h3>LAPORAN DATA DIAGNOSA</h3>
	<h5><strong>Per Tanggal <strong><?= date('d-M-Y', strtotime($tglmulai)).' s/d '.date('d-M-Y', strtotime($tglselesai)); ?></strong></h5>
<table border=1 width=1000>
<thead>
		<tr>
			<th>No</th>
			<th>Nama</th>
			<th>Jenis Kelamin</th>
			<th>Alamat</th>
			<th>Pekerjaan</th>
			<th>Tanggal Diagnosa</th>
			<th>Penyakit</th>
		</tr>
	</thead>
<tbody>
<?php

	$sql = "SELECT analisa_hasil.nama, analisa_hasil.kelamin, analisa_hasil.alamat, analisa_hasil.pekerjaan, analisa_hasil.tanggal, solusi.nm_solusi
		FROM analisa_hasil,solusi
		WHERE analisa_hasil.kd_solusi = solusi.kd_solusi AND (
		(DATE(analisa_hasil.tanggal) BETWEEN DATE('$tglmulai') AND DATE('$tglselesai')) OR (DATE(analisa_hasil.tanggal) BETWEEN DATE('$tglselesai') AND DATE('$tglmulai'))
		)
		ORDER BY analisa_hasil.id DESC";
	$qry = mysql_query($sql, $koneksi) or die ("SQL Error".mysql_error());
	$no=0;
	while ($data=mysql_fetch_array($qry)) {
	$no++;
?>
<tr class="odd gradeX">
	<td class="center"><?php echo $no; ?></td>
	<td><?php echo $data['nama']; ?></td>
	<td><?php 
		if ($data['kelamin']=="P") {
			echo "Laki-laki";
		}
		else {
			echo "Perempuan";
		}
	?></td>
	<td><?php echo $data['alamat']; ?></td>
	<td><?php echo $data['pekerjaan']; ?></td>
	<td><?php echo $data['tanggal']; ?></td>
	<td><?php echo $data['nm_solusi']; ?></td>
</tr>
	<?php
	}
	?>
</tbody>
</table>
</center>
</body>
<?php } ?>
