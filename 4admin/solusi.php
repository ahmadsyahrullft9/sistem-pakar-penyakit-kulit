<?php include('atas.php'); ?>
<?php if(isset($_GET['data'])){ ?>
<table cellpadding="0" cellspacing="0" border="0" class="table table-striped table-bordered table-hover" id="example">
<thead>
		<tr>
			<th>No</th>
			<th>Kode Solusi</th>
			<th>Penyakit</th>
			<th>Penyebab</th>
			<th>Keterangan</th>
			<th>Solusi Dan Pengobatan</th>
			<th>Opsi</th>
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
	<td><?php echo $data['definisi']; ?></td>
	<td><?php echo $data['ket']; ?></td>
	<td><?php echo $data['solusi']; ?></td>
	<td align="center">
	<a title="edit" href="?edit&id=<?php echo $data['kd_solusi']; ?>" class="btn btn-success"><i class="icon-edit icon-white"></i></a>
	<a title="delete" href="?hapus&id=<?php echo $data['kd_solusi']; ?>" class="btn btn-danger" onclick="return confirm('Yakin Mau Hapus..?');" ><i class="icon-trash icon-white"></i></a>
	</td>
</tr>
	<?php
	}
	?>
</tbody>
</table>
<?php } ?>

<?php if(isset($_GET['entri'])){  ?>
<form method="post" action="">
<font face="arial" color="#8f5a1c">
  <table class="table" width="450" border="0" cellpadding="2" cellspacing="1" align="center">
  <tr class="success text-center">
        <td colspan="2" >INPUT DATA PENYAKIT DAN SOLUSI</td>
      </tr>
  <tr>
    <td>Kode</td>
    <td><input class="form-control" name="kode" type="text" maxlength="4" size="6" value="<?php echo kdauto("solusi","P"); ?>" disabled="disabled">
    <input class="form-control" name="kode" type="hidden" value="<?php echo kdauto("solusi","P"); ?>"></td>
  </tr>
  <tr>
    <td width="90">Penyakit</td>
    <td width="361">
    <input class="form-control" name="nmsolusi" type="text" value="" size="45" maxlength="100">
    </td>
  </tr>
  <tr>
    <td>Penyebab </td>
    <td><textarea name="definisi" cols="40" rows="4"></textarea></td>
  </tr>
  <tr>
    <td>Keterangan </td>
    <td><textarea name="ket" cols="40" rows="4"></textarea></td>
  </tr>
  <tr>
    <td>Solusi Dan Pengobatan</td>
    <td><textarea name="solusi" cols="40" rows="4"></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="simpan" value="Simpan" class="btn btn-info"></td>
  </tr>

  </table></font>
</form>
<?php }		
		if(isset($_POST['simpan'])){

		$kode=$_POST['kode'];
		$nmsolusi=$_POST['nmsolusi'];
		$ket=$_POST['ket'];
		$solusi=$_POST['solusi'];
		$definisi=$_POST['definisi'];
		
		$sql="insert into solusi (kd_solusi,nm_solusi,ket,solusi,definisi) values ('$kode','$nmsolusi','$ket','$solusi','$definisi')";
		mysql_query($sql);

		echo'<script type="text/javascript">
			alert("Data Solusi Baru Disimpan");
			window.location="?data"
		</script>';
		
		}
?>


<?php
	if(isset($_GET['hapus'])){
		$id=$_GET['id'];
		unlink("../news/$nm");
		$sql="delete from solusi where kd_solusi='$id'";
		mysql_query($sql);
		echo '<script type="text/javascript">
			//<![CDATA[
			window.location="?data"
			//]]>
		</script>';
	}
?>


<?php if(isset($_GET['edit'])){ 
$sql="select * from solusi where kd_solusi='$_GET[id]'";
$rs=mysql_query($sql);
$row=mysql_fetch_array($rs);
 { ?>
<form method="POST" action="">
<font face="arial" color="#8f5a1c">
  <table class="table" width="450" border="0" cellpadding="2" cellspacing="1" align="center">
  <tr class="success">
        <td colspan="2" class="center" >EDIT DATA PENYAKIT DAN SOLUSI</td>
      </tr>
  <tr>
    <td>Kode</td>
    <td><input class="form-control" name="kd" type="text" maxlength="4" size="6" value="<?php echo $row['kd_solusi']; ?>" disabled="disabled">
    	<input name="id" type="hidden" value="<?php echo $row['kd_solusi']; ?>" >
    </td>
  </tr>
  <tr>
    <td width="90">Penyakit</td>
    <td width="361">
    <input class="form-control" name="a" type="text" value="<?php echo $row['nm_solusi']; ?>" size="45" maxlength="100">
    </td>
  </tr>
  <tr>
    <td>Penyebab </td>
    <td><textarea name="c" cols="40" rows="4"><?php echo $row['definisi']; ?></textarea></td>
  </tr>
  <tr>
    <td>Keterangan </td>
    <td><textarea name="k" cols="40" rows="4"><?php echo $row['ket']; ?></textarea></td>
  </tr>
  <tr>
  <tr>
    <td>Solusi Dan Pengobatan</td>
    <td><textarea name="b" cols="40" rows="4"><?php echo $row['solusi']; ?></textarea></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td><input type="submit" name="edit" value="Simpan" class="btn btn-info"></td>
  </tr>
  </table></font>
</form>

<?php	} 
		
		if(isset($_POST['edit'])){

		$a=$_POST['a'];
		$k=$_POST['k'];
		$b=$_POST['b'];
		$c=$_POST['c'];
		$id=$_POST[id];
		
		$sql="update solusi set nm_solusi='$a', ket='$k', solusi='$b', definisi='$c' where kd_solusi='$id'";
		mysql_query($sql);

		echo'<script type="text/javascript">
			alert("Data Solusi Berhasil Edit");
			window.location="?data"
		</script>';
		
		}
?>

<?php } ?>
<?php include('bawah.php'); ?>
