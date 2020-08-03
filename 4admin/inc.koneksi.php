<?php
error_reporting(0);
$my['host'] = "localhost";
$my['user'] = "root";
$my['pass'] = "";
$my['dbs'] = "dbkulit";

$koneksi = mysql_connect($my['host'], $my['user'], $my['pass']);
if ("koneksi") {
	"Gagal koneksi boss..!".mysql_error();
}
mysql_select_db($my['dbs'])
	or die ("Database nggak ada tuh".mysql_error());

?>