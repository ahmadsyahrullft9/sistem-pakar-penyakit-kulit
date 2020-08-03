-- phpMyAdmin SQL Dump
-- version 2.11.9.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Aug 02, 2020 at 01:27 PM
-- Server version: 5.0.67
-- PHP Version: 5.2.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `dbkulit`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE IF NOT EXISTS `admin` (
  `id` int(15) NOT NULL auto_increment,
  `nmuser` varchar(25) default NULL,
  `nmlogin` varbinary(25) default NULL,
  `pslogin` varchar(55) default NULL,
  `level` int(1) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `nmuser`, `nmlogin`, `pslogin`, `level`) VALUES
(3, 'Fery Purnama', 'user', 'ee11cbb19052e40b07aac0ca060c23ee', NULL),
(2, 'Administrator', 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(5, 'umam', 'umam', '343ef316652197d14cdccc98c7a44cb1', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `analisa_hasil`
--

CREATE TABLE IF NOT EXISTS `analisa_hasil` (
  `id` int(4) unsigned zerofill NOT NULL auto_increment,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `kd_solusi` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=211 ;

--
-- Dumping data for table `analisa_hasil`
--

INSERT INTO `analisa_hasil` (`id`, `nama`, `kelamin`, `alamat`, `pekerjaan`, `kd_solusi`, `noip`, `tanggal`) VALUES
(0197, 'jono', 'P', 'jombang', 'swasta', 'P011', '127.0.0.1', '2020-06-30 14:38:00'),
(0198, 'umam', 'P', 'jombang', 'swasta', 'P003', '127.0.0.1', '2020-06-30 15:12:43'),
(0204, 'paijo', 'P', 'sumobito', 'kuli bangunan', 'P001', '127.0.0.1', '2020-07-23 01:20:34'),
(0203, 'aditya', 'P', 'jombang', 'swasta', 'P012', '127.0.0.1', '2020-07-15 19:29:56'),
(0202, 'aditya', 'P', 'jombang', 'swasta', 'P005', '127.0.0.1', '2020-07-13 20:22:13'),
(0201, 'ahmadu', 'P', 'jombang', 'swasta', 'P004', '127.0.0.1', '2020-07-12 18:38:10'),
(0200, 'susanti', 'W', 'jombang', 'swasta', 'P005', '127.0.0.1', '2020-07-05 17:06:45'),
(0199, 'santi', 'W', 'Peterongan', 'swasta', 'P011', '127.0.0.1', '2020-07-05 16:06:06'),
(0205, 'sumi', 'W', 'jombang', 'buruh tani', 'P001', '127.0.0.1', '2020-07-23 01:23:27'),
(0206, 'SANTI', 'W', 'peterongan', 'guru', 'P013', '127.0.0.1', '2020-07-23 01:25:12'),
(0207, 'hanif', 'P', 'jombang', 'guru', 'P001', '127.0.0.1', '2020-07-23 11:01:43'),
(0208, 'irsad', 'P', 'jombang', 'guru', 'P001', '127.0.0.1', '2020-07-23 12:19:41'),
(0209, 'irasd', 'P', 'jombang', 'guru', 'P013', '127.0.0.1', '2020-07-23 12:20:29'),
(0210, 'hanii', 'W', 'jombang', 'swasta', 'P005', '127.0.0.1', '2020-07-23 12:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE IF NOT EXISTS `artikel` (
  `id` int(15) NOT NULL auto_increment,
  `idadmin` varchar(55) default NULL,
  `tgl` varchar(55) default NULL,
  `judul` varchar(100) default NULL,
  `isi` text,
  `foto` varchar(100) default NULL,
  `ket` enum('Y','T') default NULL,
  `keyword` varchar(100) default NULL,
  `deskripsi` text,
  PRIMARY KEY  (`id`),
  KEY `FK_news` (`idadmin`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 CHECKSUM=1 DELAY_KEY_WRITE=1 ROW_FORMAT=DYNAMIC AUTO_INCREMENT=8 ;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id`, `idadmin`, `tgl`, `judul`, `isi`, `foto`, `ket`, `keyword`, `deskripsi`) VALUES
(7, '', '2014-05-15', '12 Cara Menjaga Kesehatan Gigi dan Mulut Secara Alami', '<p style="text-align: justify;">Inilah tips&nbsp;<strong>12 cara menjaga kesehatan gigi dan mulut secara alami</strong>. Sakit gigi terjadi karena kurang memperhatikan kesehatan gigi dan mulut, sehingga bisa menimbulakan gigi berlubang, gusi berbengkak dan berdarah serta bau mulut. Apa lagi terkena yang namanya sakit gigi sungguh merasa menggangu dan tidak menyenangkan bahkan kesenanganpun terasa hilang.&nbsp;Nah ada baiknya Anda baca artikel dibawah ini cara menjaga kesehatan gigi dan mulut agar tidak terjadi hal-hal yang tidak menyenangkan. Berikut adalah 12 cara menjaga kesehatan gigi dan mulut, yuk simak:<br /><br /><strong>1. Makanan Sehat</strong><br /><br />Makan makanan yang sehat dan seimbang. Selain karbohidrat Anda juga memerlukan tambahan nutrisi seperti vitamin dan mineral agar gigi dan gusi tetap sehat. Terutama vitamin A, vitamin C dan vitamin D<br /><br /><strong>2. Air Putih</strong><br /><br />Air putih adalah komponen utama dari air liur yang berfungsi untuk menyimpan mineral-mineral yang diperlukan gigi, sekaligus membersihkan partikel makanan yang menempel di sela-sela gigi. Air juga mengandung fluoride yang dapat membuat gusi anda tetap lembab dan memperkuat enamel gigi.<br /><strong><br />3. Waktu Makan</strong><br /><br />Berikan jeda waktu antara makan dan ngemil. Ini membantu gigi agar tidak selalu terkena asam. Karena setelah makan, asam akan terbentuk antara 20 &ndash; 40 menit.<br /><br /><strong>4. Keju dan Susu</strong><br /><strong><br /></strong><br />Dua bahan makanan ini mengandung kalsium yang kaya dan baik bagi kesehatan gigi. Kandungan vitamin D dan fosfat juga akan memperkuat gigi agar tak gampang keropos dan dapat memperbaiki komponen gigi yang rusak dengan efektif.<br /><br /><strong>5. Hindari Gula</strong><br /><br />Minuman dengan gula tambahan seperti jus, teh dan kopi akan membentuk asam pada gigi. Batasi minum minuman dengan gula tambahan. Termasuk juga memakan permen lollipop.<br /><br /><strong>6. Kesehatan Gigi Anak</strong><br /><br />Jangan membiarkan bayi terlalu lama menggunakan botol susu. Kebiasaan ngedot ini akan membuat gigi terlalu lama terkena karbohidrat sehingga merusak gigi si kecil. Gantilah isi botol susunya dengan air putih, dan biasakan ia minum susu dari gelas.<br /><br /><strong>7. Sikat Gigi</strong><br /><br />Sikatlah gigi minimal dua kali sehari. Namun, bila memungkinkan sikat gigi setelah makan akan membantu menghilangkan plak yang dapat menciptakan asam.<br /><br /><strong>8. Konsumsi Teh</strong><br /><br />Teh mengandung polifenol yang dapat menekan pertumbuhan bakteri yang menyebabkan plak pada gigi. Selain itu, teh juga dapat mencegah gigi berlubang. Untuk hasil yang lebih baik, gunakan madu sebagai pengganti gula biasa. Namun jangan berlebihan karena teh juga bisa membuat gigi menjadi kuning.<br /><br /><strong>9. Benang Gigi</strong><br /><br />Untuk permukaan gigi yang lebih sehat, Anda bisa menggunakan benang gigi setiap sekali atau dua kali sehari.<br /><br /><strong>10. Berhentilah merokok</strong><br /><br />Tembakau akan meningkatkan resiko kerusakan gigi dan bahkan gangguan mulut lainnya.<br /><br /><strong>11. Kacang-kacangan</strong><br /><br />Kacang-kacangan terbukti mengandung kalsium dan vitamin D serta mineral yang tinggi. Ketiga komponen ini amat baik bagi gigi. Namun mengunyah kacang terlalu sering, apalagi kacang-kacangan yang keras, dapat merusak enamel gigi. Jadi tetaplah berhati-hati saat mengunyah kacang.<br /><br /><strong>12. Lakukan Pemeriksaan</strong><br /><br />Setiap 6 bulan sekali datanglah ke dokter gigi untuk pemeriksaan dan perawatan gigi Anda.<br /><br />Nah itulah sahabat sehat&nbsp;<span style="text-decoration: underline;">12 cara menjaga kesehatan gigi dan mulut secara alami</span>. Artikel diatas yang mungkin dapat membantu anda untuk menjaga kesehatan gigi dan mulut. Semoga cara diatas bisa membantu dan bermanfaat untuk Anda.</p>', 'gigi sehat.jpg', 'Y', 'kesehatan, gigi', 'menjaga kesehatan gigi dan mulut');

-- --------------------------------------------------------

--
-- Table structure for table `buku_tamu`
--

CREATE TABLE IF NOT EXISTS `buku_tamu` (
  `id` int(15) NOT NULL auto_increment,
  `nama` varchar(40) default NULL,
  `email` varchar(55) default NULL,
  `isi` text,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `buku_tamu`
--


-- --------------------------------------------------------

--
-- Table structure for table `gejala`
--

CREATE TABLE IF NOT EXISTS `gejala` (
  `kd_gejala` char(4) NOT NULL default '',
  `nm_gejala` varchar(100) default NULL,
  `nilai` double NOT NULL,
  `foto` varchar(200) NOT NULL,
  PRIMARY KEY  (`kd_gejala`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `gejala`
--

INSERT INTO `gejala` (`kd_gejala`, `nm_gejala`, `nilai`, `foto`) VALUES
('G036', 'mengalami perubahan kuku berwarna coklat tak bercahaya', 0, ''),
('G035', 'mengalami adanya bisul-bisul kecil pada kulit kepala', 0, ''),
('G034', 'mencium adanya bau busuk', 0, ''),
('G033', 'mengalami warna rambut kusam', 0, ''),
('G032', 'mengalami rambut mudah putus', 0, ''),
('G030', 'merasakan adanya jembatan-jembatan kutil', 0, ''),
('G029', 'merasakan adanya pembengkakan pembuluh limfe', 0, ''),
('G028', 'melihat adanya kelainan bentuk pada kaki', 0, ''),
('G027', 'melihat adanya tumor/kutil', 0, ''),
('G026', 'mengalami vesikula miliar dan dalam', 0, ''),
('G025', 'megalamii vesikel', 0, ''),
('G024', 'mengalami vesikopustula miliar', 0, ''),
('G023', 'mengalami Postula (jerawat)', 0, ''),
('G022', 'mengalami edema (bengkak)', 0, ''),
('G021', 'meihat adanya nanah', 0, ''),
('G020', 'merasakan adanya pembengkakan kulit', 0, ''),
('G019', 'merasakan adanya pembengkakkan lesi', 0, ''),
('G018', 'melihat timbulnya Lesi menyerupai kembang kol', 0, ''),
('G017', 'merasakan timbulnya lesi', 0, ''),
('G016', 'merasakan skuama lebih tebal dan berlapis lapis', 0, ''),
('G031', 'mengalami fisura pada jari', 0, ''),
('G015', 'melihat adanya skuama', 0, ''),
('G014', 'merasakan nyeri otot', 0, ''),
('G013', 'merasakan kulit panas seperti terbakar', 0, ''),
('G012', 'merasakan pedih pada kulit', 0, ''),
('G011', 'melihat munculnya butiran-butiran kuning kehijauan', 0, ''),
('G010', 'melihat munculnya bintik hitam kecoklatan', 0, ''),
('G009', 'melihat munculnya bintik-bintik berwarna merah kuning', 0, ''),
('G008', 'melihat munculnya bintik-bintik kemerahan', 0, ''),
('G007', 'melihat perubahan kulit berwarna merah kehitaman', 0, ''),
('G006', 'melihat perubahan pada warna kulit', 0, ''),
('G005', 'melihat adanya sisik menyerupai lingkaran bermata 1', 0, ''),
('G004', 'merasakan adanya sisik kasar', 0, ''),
('G003', 'merasakan adanya sisik halus', 0, ''),
('G002', 'melihat adanya elemen jamur', 0, ''),
('G001', 'merasakan gatal', 0, ''),
('G037', 'mengalami fistel mengeluarkan eksudat keputi-putihan', 0, ''),
('G038', 'merasakan reaksi radang pada folikel', 0, ''),
('G039', 'melihat timbulnya hiperkeratotik/hiperkeratosis', 0, ''),
('G040', 'melihat timbul fistel-fistel', 0, ''),
('G041', 'melihat timbulnya papula/Nodula', 0, ''),
('G042', 'mengalami eritema', 0, ''),
('G043', 'melihat adanya ulkus (borok)', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `rule`
--

CREATE TABLE IF NOT EXISTS `rule` (
  `kd_solusi` char(4) NOT NULL,
  `kd_gejala` char(4) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rule`
--

INSERT INTO `rule` (`kd_solusi`, `kd_gejala`) VALUES
('P013', 'G041'),
('P013', 'G040'),
('P013', 'G037'),
('P013', 'G020'),
('P013', 'G007'),
('P012', 'G039'),
('P012', 'G034'),
('P012', 'G031'),
('P012', 'G026'),
('P012', 'G024'),
('P012', 'G003'),
('P011', 'G043'),
('P011', 'G041'),
('P011', 'G019'),
('P011', 'G017'),
('P011', 'G002'),
('P010', 'G041'),
('P010', 'G019'),
('P010', 'G018'),
('P010', 'G017'),
('P010', 'G002'),
('P009', 'G043'),
('P009', 'G030'),
('P009', 'G029'),
('P009', 'G028'),
('P009', 'G027'),
('P009', 'G023'),
('P009', 'G014'),
('P009', 'G011'),
('P009', 'G002'),
('P008', 'G043'),
('P008', 'G036'),
('P008', 'G025'),
('P008', 'G015'),
('P008', 'G014'),
('P008', 'G013'),
('P008', 'G001'),
('P007', 'G014'),
('P007', 'G010'),
('P007', 'G001'),
('P006', 'G038'),
('P006', 'G032'),
('P006', 'G024'),
('P006', 'G022'),
('P006', 'G021'),
('P006', 'G012'),
('P006', 'G008'),
('P006', 'G001'),
('P005', 'G005'),
('P005', 'G004'),
('P005', 'G001'),
('P004', 'G006'),
('P004', 'G003'),
('P004', 'G001'),
('P003', 'G025'),
('P003', 'G002'),
('P003', 'G001'),
('P002', 'G035'),
('P002', 'G034'),
('P002', 'G032'),
('P002', 'G015'),
('P002', 'G014'),
('P002', 'G009'),
('P002', 'G002'),
('P002', 'G001'),
('P001', 'G042'),
('P001', 'G016'),
('P001', 'G015'),
('P001', 'G003'),
('P001', 'G002'),
('P001', 'G001');

-- --------------------------------------------------------

--
-- Table structure for table `solusi`
--

CREATE TABLE IF NOT EXISTS `solusi` (
  `kd_solusi` char(4) NOT NULL,
  `nm_solusi` varchar(300) NOT NULL,
  `ket` text NOT NULL,
  `solusi` text NOT NULL,
  `definisi` text NOT NULL,
  PRIMARY KEY  (`kd_solusi`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `solusi`
--

INSERT INTO `solusi` (`kd_solusi`, `nm_solusi`, `ket`, `solusi`, `definisi`) VALUES
('P006', 'Tinea Barbae & Sikosis Barbae (jamur di dagu dan rambut)', '<p>Adalah bentuk infeksi jamur dermatofita pada dacrah dagu, jenggot, yang menyerang kulit dan folikel rambut.<br />Yang terkene jamur ini akan mudah patah, kusam. Sedangkan kulit bagian leher yang terkene virus ini akan terdapat bintik-bintik putih.<br />Di sebabkan oleh Jamur Trichophyton mentagrophytes, Trichophyton violaceum, Microsporum cranis. Dapat tertular apabila bersentuhan atau melalui alat pemotong jenggot yang telah terinfeksi</p>', '<p>Toksilat, haloprogin, tolnaftate, dan derival imidasol seperti mikonasol, ekonasol,bifanasol, kotrimasol dalam bentuk larutan atau krem dengan konsentrasi 1-2% dioleskan 2x sehari dalam waktu 1-3 minggu</p>', '<p>Disebabkan Oleh Jamur Golongan Trichopyton dan Microsporum</p>'),
('P005', 'Tinea Imbrikata (kurap bersisik)', '<p>Infeksi jamur superfisial yang menyerang kulit dengan gambaran khas berupa skuama kasar yang tersusun konsentris sehingga tanpak seperti atap genteng.</p>', '<p>Sistemik Griseofulvin 0,5 g selama l-2bulan.<br />Topikal Keratolitik kuat yang bersifat fungisid antara lain:<br />krisarobin 5%, sulfur 5% atau asam salisilat 5%. G Castellani, spaint G Salep Whitfield 2 kali sehari G Antimikotik golongan imidazol mempunyai khasiat baik.</p>', '<p>Disebabkan oleh Jamur Tichophyton Concentricum</p>'),
('P004', 'Tinea Versikolor (Panu)', '<p>Tinea Vesikolor adalah suatu penyakit jamur kulit yang kronik dan asimtomatik serta ditandai dengan bercak putih sampai coklat yang bersisik. Kelainan ini umumnya menyerang badan dan kadang-kadang terlihat di ketiak, sela paha, tungkai atas, leher, muka, dan kulit kepala.</p>', '<p>salaep whitfield,salep salsil sulfur, larutan salisil spritus, larutan tiosulfat natrikus dan latio kumerfeldi.</p>', '<p>Disebabkan Oleh Malassezia Furfur</p>'),
('P003', 'Tinea Manus (Kudis di tangan)', '<p>Tinea manus: Ringworm melibatkan tangan-tangan, terutama telapak tangan dan ruang-ruang antara jari-jari tangan. Ia secara khas menyebabkan penebalan (hyperkeratosis) dari area-area ini, seringkali pada hanya satu tangan. Tinea manus adalah suatu teman yang umum dari tinea pedis (ringworm dari kaki-kaki). Ia juga disebut tinea manuum.</p>', '<p>Pemilihan terapi topikal atau sistemik antara lain bergantung pada luas lesi dan ada/tidaknya kontraindikasi. <br />Preparat topical yang dapat digunakan antara lain golongan imidazol atau alilamin.<br />Obat topikal digunakan hingga 1 minggu setelah lesi sembuh.</p>', '<p>Disebabkan Oleh Jamur T.mentagropytes dan T.rubrum</p>'),
('P002', 'Tinea Kapitis (kurap kulit kepala)', '<p style="text-align: justify;">Tinea kapitis (tinea capitis) adalah infeksi jamur pada folikel rambut kulit kepala yang ditandai oleh pembentukan kerak kecil di dasar folikel. Kondisi ini juga disebut kurap kulit kepala. Penyakit ini sering terjadi pada anak-anak yang dapat ditularkan dari binatang peliharaan misalnya kucing dan anjing. Selain itu lingkungan kotor dan panas serta udara yang lembap ikut berperan dalam penularan penyakit ini.</p>', '<p>pada anak biasanya diberikan per oral dengan <strong>griseofulvin</strong> 10-25 mg/kg berat badan per hari selama 6 minggu. Dosis pada orang dewasa sebesar 500 mg perhari selama 6 minggu. Selain itu pengobatan dapat dilakukan dengan mencuci kepala dan rambut dengan shampo desinfektan antimikotik seperti larutan asam.&nbsp;</p>', '<p>Disebabkan Oleh Jamur Golongan Dermatofita, terutama T.rubrum, T.Mentagropytes dan M.gypseum</p>'),
('P001', 'Tinea Cruris (Jamur Kaki)', '<p>Tinea dari selangkangan ("gatal joki") cenderung mempunyai suatu warna coklat kemerahan dan meluas dari lipatan-lipatan selangkangan turun ke satu atau kedua paha. Kondisi-kondisi lain yang dapat meniru tinea cruris termasuk infeksi-infeksi ragi, psoriasis, dan intertrigo, suatu ruam gossokan (chafing rash) yang berakibat dari gosokkan kulit terhadap kulit.</p>', '<p style="text-align: justify;">Menghilangkan faktor predisposisi, menganjurkan pasien mengusahakan<br />daerah lesi selalu kering dan memakai pakaian yang menyerap keringat.<br />Bila menggunakan terapi topikal, pengobatan dilanjutkan hingga 1 minggu<br />setelah lesi sembuh.<br />Jika lesi luas atau gagal dengan terapi topikal, dapat digunakan obat oral<br />seperti griseofulvin 500-1000 mg/hari (dewasa) atau 10-20 mg/kgBB/hari<br />(anak-anak) dosis tunggal selama 2-6 minggu atau terbinafin 250 mg/hari<br />(dewasa) selama 1- 2 minggu atau itrakonazol 2x100 mg/hr selama 2 minggu<br />atau ketokonazol 200 mg/hr selama 10-14 hari. <strong>Obat Topikal: Ecoza dan Oxistat, Obat Oral: Sporanox dan Diflucan</strong></p>', '<p>Disebabkan Oleh Jamur Efloccosum, T.rubrum dan T.mentagrophytes</p>'),
('P007', 'Tinea Nigra Palmaris (jamur di telapak kaki dan tangan)', '<p>Tinea nigra palmaris adalah penyakit infeksi jamur superfisial yang menyerang telapak kaki dan tangan, menimbulkan gambaran khas berupa warna coklat-kehitamanpada kulit.</p>', '<p>salep anti jamur seperti Salep whitfield 1 dan 2 atau salep sulfur salisil<br />Obat anti jamuur dan preparat-preparat imidazol, seperti isokotonasol, bifonasol, klotrimasol dalam bentuk salep atau krim</p>', '<p>Disebabkan Oleh Jamur Cladosporium Werneckii</p>'),
('P008', 'Kandidiasis (peradangan)', '<p>Adalah penyakit infeksi yang disebabkan oleh jamur kandida /candida albicans. merupakan jamur mirip ragi dan selalu ada dalam tubuh kita, dalam jumlah sedikit. Dalam keadaan normal jamur ini hidup di rongga mulut, vagina dan usus. Tanpa menimbulkan gangguan atau penyakit.<br />Perubahan kondisi tubuh kadang bisa mengakibatkan kandida tumbuh dan berkembang biak secara berlebihan sehingga menimbulkan infeksi yang di sebut Kandidiasis jadi.. &ldquo;dia&rdquo; termasuk penyakit yang bersifat oportunistik dalam keadaan normal jamur ini tidak menyebabkan ganguan. Na..muunn..bila kulit lembab, hangat, terluka, akan memicu Kandida semakin memeperbanyak diri dan akhirnya membuat infeksi.<br />Infeksi kandida menyerang kulit dan selaput mukosa; yaitu jaringan yang melapisi permukaan bagian tubuh kita misalnya vagina, (vagina condidiasis) yang sering kita kenal keputihan dan rongga mulut, (oral condidiasis) Kandida juga merupakan penyebab tersering dari paronokia yaitu infeksi kulit di sekitar kuku dan onikomikosis panyakit jamur kuku.</p>', '<p>larutan gentian violet 1-2% dioleskan 1-2 kali sehari sampai dengan 5-7 hari, biasanya dipakai untuk kandidasis kuitis dan mukokutan<br />Nistatin<br />- Bentuk krim atau salep dipakai untuk mengobati kandidiasis kuitis<br />- Bentuk larutan dipakai untuk kuku dan mult<br />-bentuk tablet untuk mengatasi kandidasis disaluran cerna<br />- bentuk tablet vaginal untuk mengatasi kandidiasis vaginitis<br />Amfoterisin B<br />- bentuk salep atau krim untuk mengobati kandidiasis kulit<br />- Bentuk tablet untuk mengatasi atau memberantas sumber infeksi di dalam usus<br />- Bentuk tablet Vaginal untuk mengatasi vaginitis<br />-Bentuk suntikan untuk mengobati kandidiasis sistemik<br />Natasin<br />- Bentuk salep atau krim untuk mengobati kandidiasis kulit<br />- Bentuk tablet vagina mengobati vulvovaginitis<br />Trikomisin, bentuk salep atau krim untuk mengobati kandidiasis kutis dan selaput lendir<br />5 Fluorositosin (5F.C), bentuk tablet untuk mengobati kandidiasis alat cerna dan kandidiasis sitemik<br />Asam undesilinat, dalam bentuk salep 5%, krim 5%, dan tingtura 5% serta dalam bentuk larutan 15% dapat mengobati kandidiasis kuitis dan selaput lendir.</p>', '<p>Disebabkan Oleh Jamur Candida albicans</p>'),
('P009', 'Misetoma (Jamur Kronik dibawah kulit)', '<p>Merupakan infeksi kronik pada jaringan dibawah kulit, yang dapat melua sampai ke fasia dan tulang-tulang dengan menimbulkan kelainan-kelainan berupa pembengkakan kruris deforminitas dari alat-alat yang diserang<br />Daerah yang diserang adalah telapak kaki, tangan, pergelangan kaki, tangan, dan lutut</p>', '<p>Untuk jenis misetoma aktinomikotik dapat diobati dengan penisilin prokain dosis tinggi 2.4 juta unit sampai 2 mega unit. Etiologinya genus nokardia yang diobati dengan preparat sulfur, seperti sulfadiasin 3-8 gram perhari diberikan sampai 2-4 minggu<br />Pengobatan misetoma eumikotik sangat susah susah dan dapat dicoba dengan amfoterisin B intravena. Pengobatan dengan turunan Asol, seperti itrakonasol 400 mg/hari dan flutosin 2gr/hari selama 1-2 bulan.</p>', '<p>Disebabkan Oleh Jamur Actinomycetes termasuk genus Nocardia dan Streptomycesa</p>'),
('P010', 'Kromomikosis (Jamur kronik berpigmen)', '<p>Merupakan penyakit jamur yang biasanya mengenai kaki, tangan, dan bokong. Penyebab kromomikosis masuk kedalam tubuh melalui luka- dikulit, secara kontak langsung.<br />Penyakit ini banyak menyerang pria, terutama petani dan buruh peternakan. Biasanya dimulai dengan pembengkakkan berupa pembentukan nodul-nodul pada tempat luka atau aberasi kulit</p>', '<p>Amfoterisin B dosisi tinggi dapat diberikan suntikan didalam lesi<br />larutan kalium iodida<br />Derifatasol, itrakonasol dengan dosis 2x100 mg/hari selama 5 bulan.</p>', '<p>Disebabkan Oleh Jamur Phialophora pedrosoi, P.verrucosa, P.compacta dan Cladosporium carioni</p>'),
('P011', 'Sporotrikosis', '<p>Merupakan penyakit jamur kronik yang disebabkan oleh sporothrix schenchii, yaitu suatu jamur yang bersifat dirmorfik. jamur dapat masuk ke dalam tubuh memaluli luka-luka akibat kecelakaan atau luka dikulit akibat garukan. Manusia dapat ditulari dari binatang, seperti kuda, kucing, anjing, atau tikus.</p>', '<p>Larutan kalium iodida jenuh dapat memberikan hasil yang memuaskan. dengan dosis 30-50 tetes 3 kali sehari selama 1-2 bulan memberi hasil yang memuaskan. pemberian dimulai dengan 5 tetes 3 kali sehari dan dosis tiap minggu dinaikan sampai mencapai 30-50 tetes 3 kali sehari.<br />Dengan adanya obat antimikosis yang baru seperti ketokonasol dengan dosis 2x100 mg/hari selama 2-4 minggu atau itrakonasol 2x100mg/hari selama 1-2 bulan memberikan hasil yang memuaskan<br />Pengobatan lokal dapat dikompres dengan larutan lugol sampai lesi-lesi menutup<br />Obat anti biotik lain, seperti amfoterisin B diberikan dengan intravena dengan dosis 0.25 mg/kg berat badan dapat memberikan hasil yang baik. dosis maksimum adalah 1 mg/kg berat badan</p>', '<p>Disebabkan Oleh Jamur Sporotrichum schenkii</p>'),
('P012', 'Tinea Pedis (Kutu air)', '<p>Tinea pedis merupakan infeksi dermatofita pada kaki terutama mengenai sela jari dan telapak kaki sedangkan yang terdapat pada bagian dorsal pedis dianggap sebagai tinea korporis. Keadaan lembab dan hangat pada sela jari kaki karena bersepatu dan berkaos kaki disertai daerah tropis yang lembab mengakibatkan pertumbuhan jamur makin subur. Efek ini lebih nyata pada sela jari kaki keempat dan kelima, dan lokasi ini paling sering terkena. Kenyataaannya, tinea pedis jarang ditemukan pada populasi yang tidak menggunakan sepatu. Sinonim dari tinea pedis adalah foot ringworm, athlete foot, foot mycosis.</p>', '<p>Pemilihan terapi topikal atau sistemik antara lain bergantung pada luas lesi dan ada/tidaknya kontraindikasi.<br /> Preparat topical yang dapat digunakan antara lain golongan imidazol atau alilamin.<br />Obat topikal digunakan hingga 1 minggu setelah lesi sembuh.</p>', '<p>Disebabkan Oleh Jamur Epidermopyton, Trichopyton, Microsporum dan C.albicans</p>'),
('P013', 'Aktinomikosis', '<p>Adalah penyakit jamur kronis berupa lesi supuratif granulomatosa superfisial atau viseral yang timbulnya dari pemecahan abses-abses sehingga menimbulkan fistel-fistel yang multipel<br />Penyakit ini tersebar diseluruh dunia dan lebih sering ditemukan pada pria dewasa muda.Penyebab penyakit ini adalah actinomyces israelii atau actinomyces bovis yang bersifat anaerob, hidup komensal di dalam rongga mulut atau mukosa faring dan laring. jamur ini berkembang subur pada orang dengan higiene buruk<br />Dari rongga mulut penyakit ini dapat berkembang kearah rahang, kesaluran cerna, paru, dan akhirnya kekulit.</p>', '<p>larutan kalium iodida jenuh dengan dosis 3x50 tetes per hari<br />Itrakonasol dengan dosis 2x100 mg/hari diberikan dengan teratur selama 2-3 bulan.</p>', '<p>Disebabkan Oleh Jamur Actinomyces israelii</p>');

-- --------------------------------------------------------

--
-- Table structure for table `statistik`
--

CREATE TABLE IF NOT EXISTS `statistik` (
  `ip` varchar(20) NOT NULL default '',
  `tanggal` date NOT NULL,
  `hits` int(10) NOT NULL default '1',
  `online` varchar(255) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `statistik`
--

INSERT INTO `statistik` (`ip`, `tanggal`, `hits`, `online`) VALUES
('127.0.0.2', '2009-09-11', 1, '1252681630'),
('::1', '2014-12-09', 10, '1418156879'),
('::1', '2014-07-08', 1, '1404811988'),
('::1', '2014-07-04', 2, '1404441411'),
('::1', '2014-06-17', 4, '1402973989'),
('::1', '2014-06-13', 7, '1402651504'),
('127.0.0.1', '2010-04-16', 11, '1271389426'),
('::1', '2014-06-10', 90, '1402399216'),
('::1', '2019-09-18', 49, '1568834529'),
('::1', '2019-09-19', 14, '1568876709'),
('::1', '2019-09-19', 14, '1568876709'),
('::1', '2019-09-20', 35, '1569014524'),
('::1', '2019-09-21', 1, '1569040644'),
('::1', '2019-09-26', 13, '1569474873'),
('::1', '2019-10-10', 25, '1570687291'),
('::1', '2019-10-14', 23, '1571076645'),
('::1', '2019-10-16', 19, '1571248834'),
('::1', '2019-10-18', 1, '1571432545'),
('::1', '2019-10-21', 46, '1571685747'),
('::1', '2019-10-23', 1, '1571857879'),
('::1', '2019-10-28', 45, '1572291690'),
('::1', '2019-11-08', 3, '1573236376'),
('::1', '2019-11-09', 13, '1573334777'),
('::1', '2019-11-10', 6, '1573416554'),
('::1', '2019-11-11', 1, '1573449673'),
('::1', '2019-11-15', 48, '1573844453'),
('::1', '2019-11-27', 41, '1574891397'),
('::1', '2019-11-28', 412, '1574974777'),
('::1', '2019-11-29', 332, '1575064726'),
('::1', '2019-12-02', 98, '1575323250'),
('::1', '2019-12-04', 10, '1575462908'),
('::1', '2019-12-05', 93, '1575546027'),
('::1', '2019-12-08', 3, '1575778943'),
('::1', '2019-12-09', 3, '1575851893'),
('::1', '2019-12-16', 1, '1576469531'),
('::1', '2019-12-23', 9, '1577071415'),
('::1', '2020-01-13', 8, '1578880038'),
('::1', '2020-01-14', 116, '1578973167'),
('::1', '2020-01-15', 26, '1579063849'),
('::1', '2020-01-16', 264, '1579176337'),
('::1', '2020-01-17', 196, '1579268314'),
('::1', '2020-01-18', 186, '1579333830'),
('::1', '2020-01-19', 34, '1579409370'),
('::1', '2020-01-20', 19, '1579516260'),
('::1', '2020-01-22', 136, '1579667939'),
('::1', '2020-01-25', 212, '1579953007'),
('::1', '2020-01-27', 3, '1580105665'),
('::1', '2020-02-04', 16, '1580787272'),
('::1', '2020-02-04', 16, '1580787272'),
('::1', '2020-04-26', 356, '1587910585'),
('::1', '2020-04-27', 33, '1587955013'),
('127.0.0.1', '2020-06-24', 21, '1592958491'),
('127.0.0.1', '2020-06-25', 4, '1593026965'),
('127.0.0.1', '2020-06-28', 189, '1593353700'),
('127.0.0.1', '2020-06-30', 63, '1593504828'),
('127.0.0.1', '2020-07-05', 59, '1593944042'),
('127.0.0.1', '2020-07-07', 2, '1594089268'),
('127.0.0.1', '2020-07-11', 2, '1594471970'),
('127.0.0.1', '2020-07-12', 27, '1594562260'),
('127.0.0.1', '2020-07-13', 24, '1594647157'),
('127.0.0.1', '2020-07-15', 18, '1594816487'),
('127.0.0.1', '2020-07-18', 6, '1595047535'),
('127.0.0.1', '2020-07-23', 91, '1595482886'),
('127.0.0.1', '2020-08-02', 24, '1596345686');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_analisa`
--

CREATE TABLE IF NOT EXISTS `tmp_analisa` (
  `noip` varchar(60) NOT NULL default '',
  `kd_solusi` char(4) NOT NULL default '',
  `kd_gejala` char(4) NOT NULL default '',
  `status` enum('Y','N') NOT NULL default 'N'
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_analisa`
--

INSERT INTO `tmp_analisa` (`noip`, `kd_solusi`, `kd_gejala`, `status`) VALUES
('::1', 'P013', 'G037', 'N'),
('::1', 'P013', 'G020', 'N'),
('::1', 'P013', 'G007', 'N'),
('::1', 'P013', 'G040', 'N'),
('::1', 'P013', 'G041', 'N'),
('127.0.0.1', 'P005', 'G001', 'N'),
('127.0.0.1', 'P005', 'G004', 'N'),
('127.0.0.1', 'P005', 'G005', 'N');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_gejala`
--

CREATE TABLE IF NOT EXISTS `tmp_gejala` (
  `kd_gejala` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_gejala`
--

INSERT INTO `tmp_gejala` (`kd_gejala`, `noip`) VALUES
('G004', '127.0.0.1'),
('G001', '127.0.0.1');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_pasien`
--

CREATE TABLE IF NOT EXISTS `tmp_pasien` (
  `id` int(4) unsigned zerofill NOT NULL auto_increment,
  `nama` varchar(60) NOT NULL,
  `kelamin` enum('P','W') NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `pekerjaan` varchar(60) NOT NULL,
  `noip` varchar(60) NOT NULL,
  `tanggal` datetime NOT NULL,
  PRIMARY KEY  (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=290 ;

--
-- Dumping data for table `tmp_pasien`
--

INSERT INTO `tmp_pasien` (`id`, `nama`, `kelamin`, `alamat`, `pekerjaan`, `noip`, `tanggal`) VALUES
(0258, 'darmaji', 'P', 'jombang', 'mahasiswa', '::1', '2020-04-27 09:05:11'),
(0289, 'hanii', 'W', 'jombang', 'swasta', '127.0.0.1', '2020-07-23 12:40:57');

-- --------------------------------------------------------

--
-- Table structure for table `tmp_solusi`
--

CREATE TABLE IF NOT EXISTS `tmp_solusi` (
  `kd_solusi` char(4) NOT NULL,
  `noip` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tmp_solusi`
--

INSERT INTO `tmp_solusi` (`kd_solusi`, `noip`) VALUES
('P013', '::1'),
('P013', '::1'),
('P013', '::1'),
('P013', '::1'),
('P013', '::1'),
('P005', '127.0.0.1');
