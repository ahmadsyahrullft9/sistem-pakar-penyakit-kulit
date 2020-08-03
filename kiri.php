<!-- Membuat kolom dengan ukuran 3 grid-->
        <div class="col-md-3"> 
          <div class="list-group">
            <a href="#" class="list-group-item active"> Menu Utama </a>
            <a href="?page=welcome" class="list-group-item"><span class="glyphicon glyphicon-home"> Beranda </span></a>
            <a href="?page=profil" class="list-group-item"><span class="glyphicon glyphicon-user"> Profil </span></a>
            <a href="?page=guest" class="list-group-item"><span class="glyphicon glyphicon-credit-card"> Solusi Pengobatan </span></a>
            <a href="4admin" class="list-group-item"><span class="glyphicon glyphicon-phone-alt"> Login </span></a>
          </div>
          
          <div class="list-group">
            <a href="#" class="list-group-item active"> Informasi </a>
            <a href="?page=consultation" class="list-group-item"> Konsultasi Kesehatan </a>
            <a href="?page=article" class="list-group-item"> Penyakit </a>
          </div>

          <div class="panel panel-primary">
            <div class="panel-heading">Statistik Pengunjung</div>
            <div class="panel-body">
            <?php include "statistik_pengunjung.php";?>
            </div>
          </div>

          

        </div>
        <!-- Batas row kolom 3 grid -->