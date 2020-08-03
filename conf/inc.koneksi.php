<?php
$my['host']	= "localhost";
$my['user']	= "root";
$my['pass']	= "";
$my['dbs']	= "dbkulit";

$koneksi	= mysql_connect($my['host'], 
							$my['user'], 
							$my['pass']);
if (! $koneksi) {
  echo "Gagal koneksi ..!";
  mysql_error();
}
mysql_select_db($my['dbs'])
	 or die ("Database tidak ditemukan".mysql_error());

?>