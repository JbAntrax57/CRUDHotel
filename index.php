<?php 

//$rol=$_GET["rol"];
include 'template/header.php';
//include_once "model/conexion.php"; 



?>

 
<?php 
                if(isset($_SESSION['rol']) and $_SESSION['rol'] == 'usuario'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Rellena todos los campos.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
    <div class="container">
  <img src="img/login.jpg" style="height: 50%; width: 100%!important;" class="img-fluid">
</div>
<?php include 'template/footer.php' ?>