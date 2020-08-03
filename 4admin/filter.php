<?php
$aksi = isset($_GET['aksi']) ? $_GET['aksi'] : "";
if($aksi === "diagnosa"){
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
    header ("location: laporan.php?aksi=$aksi&tglmulai=$tglmulai&tglselesai=$tglselesai");
    exit;
}
?>