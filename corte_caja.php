<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";
   //$numhab = $_GET['numhab'];
   //$cod = $_GET['codigo'];
    //print_r($persona);
    $sentencia = $bd->prepare("select * from reservaciones where idReservaciones = ?;");
    //$sentencia->execute([$cod]);
    $reservacion = $sentencia->fetch(PDO::FETCH_OBJ);

    $sentencia = $bd->prepare("select * from pagos where reservacion_id = ?;");
    //$sentencia->execute([$cod]);
    $pagos = $sentencia->fetchAll(PDO::FETCH_OBJ);
    
    $sentencia2 = $bd->query("select sum(monto) as total_efectivo  from pagos inner join reservaciones on reservaciones.idReservaciones = pagos.reservacion_id where tipo_pago = 'Efectivo' and pago_aplicado = 0 ;");
    // $sentencia->execute([$cod]);
     $dinero = $sentencia2->fetchAll(PDO::FETCH_OBJ);

     $sentencia3 = $bd->query("select sum(importe) as total_gastos from gasto where gasto_aplicado = 0");
     $gastos = $sentencia3->fetchAll(PDO::FETCH_OBJ);
     
     $sentencia4 = $bd->query("select folio from cortecaja order by id desc");
     $folio = $sentencia4->fetchAll(PDO::FETCH_OBJ);
     
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
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'registrado'){
            ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
            <strong>Registrado!</strong> Se agregaron los datos.
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
            
<div class="table_title rounded p-2">Corte de Caja</div>

            <div class="card shadow_general">
                <form class="p-4" method="POST" action="registrarcorte.php">
                <button class="btn btn-success float-right" onclick = "location='excelCaja.php'"><i class="bi bi-file-earmark-excel"></i></button>
            
            <div class="col-sm-12 input-group">
                
                        <div class="col-sm-1 float_right "style = "padding-right: 2%;">
                            <label class="form-label" value="" >Folio: </label>
                            <input type="text" class="form-control" name="folio" required  readonly
                        value="<?php echo isset($folio[0]->folio) ?  intval($folio[0]->folio)+1: 1; ?>"> 
                        </div>
                        <!-- <input value="<?php//echo $reservacion->no_folio; ?>" type="number" class="form-control" name="datoFolio" readonly> -->
                    </div>
                
                
                <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                    <div class="col-sm-3">
                        <label class="form-label">Total en Caja: </label>
                        <input type="text" class="form-control" name="total_caja" required  readonly
                        value="<?php echo $dinero[0]->total_efectivo; ?>"> 
                        
                    </div>
                     
                    
                    <div class="col-sm-3">
                        <label class="form-label">Gastos Totales: </label>
                        <input type="text" class="form-control" name="gasto_total" required  readonly
                        value="<?php echo $gastos[0]->total_gastos; ?>">
                    </div>
                    <!-- value="<?php //echo $reservacion->total; ?>" -->

                    <?php 
                    
                    // if(isset($pagos)){
                    //     $restante = $reservacion->total;
                         
                    //     foreach (( array) $pagos as $posicion => $pago ) {
                    //         //var_dump($pago->monto);
                    //        // die();
                    //        $restante -= $pago->monto;
                    //     }
                    ?>
                    <div class="col-sm-3">
                        <label class="form-label">Saldo Restante: </label>
                        <input type="text" class="form-control" name="saldo_restante" required  readonly
                        value="<?php echo  $dinero[0]->total_efectivo - $gastos[0]->total_gastos; ?>">
                    </div>
                    <!-- value="<?php //echo $restante; ?>" -->
                    <?php 
                    //    }
                    //}                    
                    ?>
                    
                    <div class="col-sm-2">
                        <label class="form-label">Saldo Contado: </label>
                        <input type="number" class="form-control" name="saldo_contado" required>
                    </div>
                    <div class="col-sm-3">
                        <input type="hidden" class="form-control" name="datoId" required  readonly
                       >
                    </div>
                    <!-- value="<?php //echo $reservacion->idReservaciones; ?>" -->
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                    </div>
                    <div class="d-grid mt-3">
                    <input type="hidden" name="oculto" value="1">
                    <input type="submit" class="btn btn-primary" value="Realizar Corte">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>


<?php include 'template/footer.php' ?>