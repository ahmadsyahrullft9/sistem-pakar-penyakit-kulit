<?php
session_start();
if(! ($_SESSION["SES_USER"])) {
	$_SESSION['ERR'] = '<div class="alert alert-danger" role="alert"><button type="button" class="close" data-dismiss="alert" style="font-size: 16px;font-weight: 500;">close</button>Username/password tidak sesuai</div>';
	// echo "<div align=center><b> PERHATIAN! </b><br>";
	// echo "AKSES DITOLAK, PAKAR BELUM LOGIN</div>";
	include "index.php";
	exit;
	// header ("location: admin.php");
}
?>