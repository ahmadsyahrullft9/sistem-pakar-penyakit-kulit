<?php
include "conf/inc.koneksi.php";
?>
<div class="panel panel-default">
  <div class="panel-body">
    <form method="post" action="?page=processreg" >
		<table class="table">
			<tr class="success">
				<td colspan="2" >Daftar untuk diagnosa</td>
			</tr>
			<tr>
				<td >Nama</td>
				<td><input class="form-control"  type="text" name="nama" value="" placeholder="Isi Nama Lengkap" autocomplete="off"/></td>
			</tr>
			<tr>
				<td >Jenis Kelamin</td>
				<td><input  type="radio" name="jk" value="P"  /> Laki-laki 
					<input  type="radio" name="jk" value="W"  /> Wanita 
				</td>
			</tr>
			<tr>
				<td >Alamat</td>
				<td><input class="form-control"  type="text" name="alamat" value=""  placeholder="Isi Alamat Lengkap" autocomplete="off"/></td>
			</tr>
			<tr>
				<td >Pekerjaan</td>
				<td><input class="form-control"  type="text" name="pekerjaan" value="" placeholder="Isi Pekerjaan Anda" autocomplete="Off" /></td>
			</tr>
			<tr>
				<td>&nbsp;</td><td>	<input type="submit" class="btn btn-success" name="daftar" value="DAFTAR" />
									<input type="reset" class="btn btn-danger" name="reset" value="BATAL" />
				</td>
			</tr>
		</table>
	</form>

  </div>
</div>
