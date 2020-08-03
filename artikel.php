<?php include "conf/inc.koneksi.php"; ?>
<div class="panel panel-default">
  <div class="panel-body">
    <form method="post" action="">
<table class="table table-hover">
  <thead>
    <tr>
      <th>No</th>
      
      <th>Penyakit</th>
      
      
      <th>Keterangan</th>
      
    </tr>
  </thead>
  <tbody>
<?php
  $sql = "SELECT * FROM solusi ORDER BY kd_solusi";
  $qry = mysql_query($sql, $koneksi)
    or die ("SQL Error".mysql_error());
  $no=0;
  while ($data=mysql_fetch_array($qry)) {
  $no++;
?>
<tr class="odd gradeX">
  <td class="center"><?php echo $no; ?></td>
  
  <td><?php echo $data['nm_solusi']; ?></td>
  
  <td><?php echo $data['ket']; ?></td>
  
</tr>
  <?php
  }
  ?>
</tbody>
</table>
</form>

  </div>
</div>
