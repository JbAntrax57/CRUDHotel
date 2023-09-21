<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";
    $codigo=$_GET['codigo'];   
    $sentencia = $bd->prepare("select ph.*, th.tipo_habitacion, h.nom_habitacion
    from preciohabitacion as ph
      join tipohabitaciones as th on th.id = ph.tipo_id 
      join habitaciones as h on h.id = ph.habitacion_id where ph.id = ?;");
    $sentencia->execute([$codigo]);
    $precios = $sentencia->fetch(PDO::FETCH_OBJ);
    
   
?>
<head>
    <link rel="stylesheet" href="css/styleGeneral.css">
</head>
<div class="container mt-5">
<div class="margin_formulario">
    <div class="row">
        <div class="col-sm-12">
<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'error'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Fallo Operacion.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>


            
            <div class="table_title rounded p-2">EDITAR PRECIO</div>
            <div class="card shadow_general">
                <!--<div class="card-header">
                    Ingresar Reservacion:
                </div>-->
                <form class="p-4" method="POST" action="editarprecios.php">
                   
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                        <div class="col-sm-3">
                            <label class="form-label">Tipo Habitacion: </label>
                            <input type="text" class="form-control" name="tipohabitacion" readonly value = "<?php echo $precios->tipo_habitacion ?>">
                        </div>
                        
                        <div class="col-sm-3">
                            <label class="form-label">Habitacion: </label>
                            <input type="text" class="form-control" name="habitacion" readonly value = "<?php echo $precios->nom_habitacion ?>">
                        </div>
                        <div class="col-sm-3">
                            <label class="form-label">Temporada Alta: </label>
                            <input type="text" class="form-control" name="tem_alta"  value = "<?php echo $precios->tem_alta ?>">
                        </div>
                        
                        <div class="col-sm-3">
                            <label class="form-label">Temporada Baja: </label>
                            <input type="text" class="form-control" name="tem_baja"  value = "<?php echo $precios->tem_baja ?>">
                        </div>
                        
                    </div>
                    <div class="d-grid mt-3 ">
                        <input type="hidden" name="codigo" value = "<?php echo $precios->id ?>">
                        <input type="submit" class="btn btn-primary" value="Confirmar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include 'template/footer.php' ?>