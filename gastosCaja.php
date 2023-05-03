<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";
   $numhab = $_GET['numhab'];
   //$cod = $_GET['codigo'];
    //print_r($persona);
    $sentencia = $bd->prepare("select * from reservaciones where idReservaciones = ?;");
    //$sentencia->execute([$cod]);
    $reservacion = $sentencia->fetch(PDO::FETCH_OBJ);

    $sentencia = $bd->prepare("select * from pagos where reservacion_id = ?;");
    //$sentencia->execute([$cod]);
    $pagos = $sentencia->fetchAll(PDO::FETCH_OBJ);
    
    
 
?>
<head>
    <link rel="stylesheet" href="css/styleGeneral.css">
</head>
<div class="container mt-5">
    <div class="row justify-content-center">
<div class="col-md-12">
<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'falta'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Rellena todos los campos.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>

<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'creado'){
            ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Registrado!</strong> Se agrego el gasto correctame.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>   

<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'error'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Vuelve a intentar.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>   


<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'editado'){
            ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Cambiado!</strong> Los datos fueron actualizados.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?> 


<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'eliminado'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Eliminado!</strong> Los datos fueron borrados.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?> 



            <br><br> 
<div class="table_title rounded p-2">Agregar Gastos</div>
            <div class="card shadow_general">
            
                        
                        
                <form class="p-4" method="POST" action="agregarGastos.php">
                <div class="row" >

                
                
                    <div class="col-8">
                        <label class="form-label">Descripcion del Gasto: </label>
                        <input type="text" class="form-control" name="concepto" required>
                    </div>
                    <div class="col-4">
                        <label class="form-label">Monto: </label>
                        <input type="number" class="form-control" name="importe" required>
                    </div> 
                    </div>
                    <div class="d-grid mt-3">
                    <input type="hidden" name="oculto" value="1">
                    <input type="submit" class="btn btn-primary" value="Registrar">
                    
                    </div>
                </form>
            
        </div>
    </div>
</div>
<?php include 'template/footer.php' ?>