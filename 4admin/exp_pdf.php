<?php
// Include autoloader 
require_once('dompdf/autoload.inc.php'); 
require_once('dompdf/lib/html5lib/Parser.php');
require_once('dompdf/lib/php-font-lib/src/FontLib/Autoloader.php');
require_once('dompdf/lib/php-svg-lib/src/autoload.php');
require_once('dompdf/src/Autoloader.php');
 
// Reference the Dompdf namespace 
use Dompdf\Dompdf; 
 
$jenis = isset($_GET['jenis']) ? $_GET['jenis'] : "diagnosa"; //default diagnosa 
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
$filename = "lap_".strtolower($jenis)."_".date('d-M-Y', strtotime($tglmulai)).'_'.date('d-M-Y', strtotime($tglselesai));

// Instantiate and use the dompdf class 
$dompdf = new Dompdf();
// Load HTML content 
$protocol = empty($_SERVER['HTTPS']) ? 'http' : 'https';
$domain = $_SERVER['SERVER_NAME'];

switch ($jenis) {
    case 'gejala':
        break;
    default:
        $html = file_get_contents("$protocol://$domain/sistempakar/4admin/pdf/diagnosa.php?jenis=diagnosa&tglmulai=$tglmulai&tgselesai=$tglselesai");
        // echo $html;exit;
        $dompdf->loadHtml($html); 
        break;
}
 
// (Optional) Setup the paper size and orientation 
$dompdf->setPaper('A4', 'landscape'); 
 
// Render the HTML as PDF 
$dompdf->render(); 
 
// Output the generated PDF to Browser 
$dompdf->stream($filename, array("Attachment" => false));