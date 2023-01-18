<?php include 'template/header.php' ?>

<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select * from reservaciones");
    $reservacion = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //print_r($persona);
?>
  <style>
    .bg-red{
  height:50px!important;
  background-color: #000;
  color: #fff;
}


</style>
<nav class="navbar navbar-dark bg-primary">
  <!-- Navbar content -->
</nav>
<div class="row">
      <div class="col bg-red">
        <img src="img/login.jpg" class="img-fluid" alt="Responsive image">
      </div>
    </div>
</div>

        

<?php include 'template/footer.php' ?>