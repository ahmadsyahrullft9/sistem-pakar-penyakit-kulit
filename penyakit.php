<?php include "conf/inc.koneksi.php";
// GET DATA PER ID
if(isset($_GET['idp'])){
	$idp = $_GET['idp'];
}
$q = mysql_query("SELECT * FROM solusi WHERE kd_solusi = '$idp'");
$rl = mysql_fetch_array($q);

?>
<!DOCTYPE html>
	<html>
		<head>
			<title>POP UP</title>
			<style type="text/css">
				#overBox{width:100%;height:100%; top:0;background:rgba(0,0,0,0.5);position: fixed; left: 0;}
			</style>
<div class="wrap" style="width:600px;min-height:300px;"><button style="float:right;background:rgba(100,200,100,0.6);padding:2px;color:green;font:0.7em Tahoma;" onClick="tutup('box');">X</button><div class="head"><h1><?=$rl['nm_solusi'];?></h1></div>
	
	<h1 style="color:black; margin:-160px 0 0 225px;font:1.1em arial;"><strong>Penyebab</strong> :<li> <?=$rl['definisi'];?></li></h1>
	<h1 style="color:black; margin:0px 0 0 225px;font:1.1em tahoma;"><strong>keterangan</strong> : <li><?=$rl['ket'];?></li></h1>
</div>
</head>
		<body>
			<div id="box">mamam</div>
			<a href="#" onClick="popUp();">KLIC SAYA</a>
			
		</body>
	</html>