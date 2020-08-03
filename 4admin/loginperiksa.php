<?php
session_start();
include_once "inc.koneksi.php";

$TxtUser = $_REQUEST['TxtUser'];
$TxtPasswd = $_REQUEST['TxtPasswd'];

if (trim($TxtUser)=="") {
	echo "DATA USER BELUM DIISI";
	include "index.php"; exit;
}
elseif (trim($TxtPasswd)=="") {
	echo "DATA PASSWORD BELUM DIISI";
	include "index.php"; exit;
}

// SQL untuk memeriksa data User dan Password
$sql_cek = "SELECT * FROM admin WHERE nmlogin='$TxtUser'
	AND pslogin=md5('$TxtPasswd')";
$qry_cek = mysql_query($sql_cek, $koneksi)
	or die ("Gagal Cek".mysql_error());
$ada_cek = mysql_num_rows($qry_cek);

// Periksa apakah ada data yang sesuai
if ($ada_cek >=1) {
	$SES_USER=$TxtUser;
	$_SESSION[SES_USER]= $SES_USER;
	
	header ("location: admin.php?home=1");
	exit;
}
else {
	$_SESSION['ERR'] = '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" style="font-size: 16px;font-weight: 500;">close</button>Username/password tidak sesuai</div>';
	include "index.php";
	exit;
}

?>