<?php 
session_start();
include 'inc.koneksi.php'; 
include 'inc.session.php';
?>
<?php 
$aksi = isset($_GET['aksi']) ? $_GET['aksi'] : "diagnosa"; //default diagnosa 
// echo $aksi;exit;
include('atas.php'); ?>

<?php if($aksi == 'gejala'): ?>

	<center><h3>LAPORAN DATA GEJALA</h3></center>
	<table class="table table-bordered table-hover table-striped">
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
			$qry = mysql_query($sql, $koneksi) or die ("SQL Error".mysql_error());
			$no=0;
			
			while ($data=mysql_fetch_array($qry)):
			$no++; ?>

			<tr class="odd gradeX">
				<td class="center"><?php echo $no; ?></td>
				<td><?php echo $data['kd_gejala']; ?></td>
				<td><?php echo $data['nm_gejala']; ?></td>
			</tr>
			
			<?php endwhile; ?>
		</tbody>
	</table>
	<td></P><a target="_blank " href="lap.php?gejala" class="btn btn-info btn-sm">Print</a></td>

<?php elseif($aksi == 'solusi'):?>

	<center><h3>LAPORAN DATA PENYAKIT DAN SOLUSI</h3></center>
	<table class="table table-bordered table-hover table-striped">
		<thead>
			<tr>
				<th>No</th>
				<th>Kode Penyakit</th>
				<th>Nama PEnyakit</th>
				<th>Solusi</th>
			</tr>
		</thead>
		<tbody>
			<?php
			$sql = "SELECT * FROM solusi ORDER BY kd_solusi";
			$qry = mysql_query($sql, $koneksi) or die ("SQL Error".mysql_error());
			$no=0;
			while ($data=mysql_fetch_array($qry)) :
			$no++; ?>

			<tr class="odd gradeX">
				<td class="center"><?php echo $no; ?></td>
				<td><?php echo $data['kd_solusi']; ?></td>
				<td><?php echo $data['nm_solusi']; ?></td>
				<td><?php echo $data['solusi']; ?></td>
			</tr>
			
			<?php endwhile; ?>
		</tbody>
	</table>
	<td></P><a target="_blank " href="lap.php?solusi" class="btn btn-info btn-sm">Print</a></td>
<?php else: ?>

	<?php 
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
	<center>
		<h3>LAPORAN DATA DIAGNOSA</h3>
	</center>
	<div class="row">
		<div class="col-lg-12">
			<form action="filter.php" method="get">
				<div class="form-group">
					<div class="navbar-form pull-left" style="margin-bottom: 10px;">
						<input type="hidden" name="aksi" value="<?= $aksi; ?>">
						<input type="date" name="tglmulai" id="tglmulai" class="span2" value="<?php echo $tglmulai; ?>">
						<input type="date" name="tglselesai" id="tglselesai" class="span2" value="<?php echo $tglselesai; ?>">
						<button type="submit" class="btn btn-default">Filter</button>
					</div>
					<a target="_blank " href="<?php echo "lap.php?diagnosa=1&tglmulai=$tglmulai&tglselesai=$tglselesai"; ?>" class="btn btn-info btn-sm pull-right" style="margin-left:2px;">Print</a>
					<a target="_blank " href="<?php echo "exp_excel.php?jenis=diagnosa&tglmulai=$tglmulai&tglselesai=$tglselesai"; ?>" class="btn btn-success btn-sm pull-right" style="margin-left:2px;">Export Excel</a>
					<a target="_blank " href="<?php echo "exp_pdf.php?jenis=diagnosa&tglmulai=$tglmulai&tglselesai=$tglselesai"; ?>" class="btn btn-primary btn-sm pull-right" style="margin-left:2px;">Export PDF</a>
				</div>
			</form>
		</div>
		<div class="col-lg-12">
			<div class="table-responsive">
				<table class="table table-bordered table-hover table-striped">
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
							$no = 0;
							while ($data=mysql_fetch_array($qry)):
						?>
						
						<tr class="odd gradeX">
							<td class="center"><?php echo ($no++)+1; ?></td>
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
							<td><?php echo date('d-M-Y H:i:s', strtotime($data['tanggal'])); ?></td>
							<td><?php echo $data['nm_solusi']; ?></td>
						</tr>
						
						<?php 
						endwhile; 
						if($no < 1): ?>
						
						<tr>
							<td colspan="7">Tidak ada data</td>
						</tr>
						
						<?php endif; ?>
					</tbody>
				</table>
			</div>
		</div>
	</div>
<?php endif; ?>

</body>

<?php include('bawah.php'); ?>
