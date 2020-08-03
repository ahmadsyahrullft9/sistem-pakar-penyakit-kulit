<?php include"atas.php"; ?>

<div class="container">
      <!-- Membuat row untuk dibagikan menjadi kolom -->
      <div class="row">
        <?php include"kiri.php"; ?>

        <!-- Membuat kolom dengan ukuran 9 grid -->
        <div class="col-md-9">
          <?php 
          include "conf/inc.program.php";
           ?>
        </div>

        
        <div id="box"></div>
</div>
<hr>
<div id="footer">
      <div class="container">
        <p class="text-center"></p>
      </div>
</div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.min.js"></script>
          <script type="text/javascript">
        function popUp () {
          var dawal = "<div id='overBox'>";
          var dakhir = "</div>";
          var saya = "<h1 style='color:white;margin:100px auto;width100px;'>Saya Muncul Disisni</h1>";
          var box = document.getElementById("box").innerHTML = dawal+saya+dakhir;
        }
      </script>
</body>
</html>