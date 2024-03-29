<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";

    $sql = $bd -> query("select * from reservaciones order by idReservaciones desc");
    $reservacion = $sql->fetchAll(PDO::FETCH_OBJ);
    
    foreach ($reservacion as $r) {
        if ($r->fecha_llegada <= date("Y-m-d") && $r->fecha_salida >= date("Y-m-d")){
            $disponible = 0;
            // var_dump($r->habitacion_id. ' '. $disponible );
            // var_dump($r->fecha_llegada. ' '. $r->fecha_salida );
            // var_dump(date("Y-m-d"));
        }else{
            $disponible = 1;
            //var_dump($r->habitacion_id. ' '. $disponible);   
        }
    $sentencia = $bd -> query("select * from habitaciones where id = $r->habitacion_id");
    $rom = $sentencia->fetchAll(PDO::FETCH_OBJ);

    $query = $bd->prepare("UPDATE habitaciones SET tipo_id = ?, nom_habitacion = ?, planta = ?, disponible = ? where id = ?;");
    $response = $query->execute([$rom[0]->tipo_id, $rom[0]->nom_habitacion, $rom[0]->planta, $disponible, $r->habitacion_id]);

    }

    $sentencia = $bd -> query("select * from habitaciones");
    $habitaciones = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //print_r($persona);
?>
<head>
    <link rel="stylesheet" href="css/styleGeneral.css">
</head>
<div class="container mt-5">
<div class="margin_formulario">
    <div class="row">
        <div class="col-sm-12">
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
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'fechaigual'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Estas fechas ya no estan disponibles!
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

<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'maxtp'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Eliminado!</strong> Las personas execen el total.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?> 



<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'fecha'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> La fecha de llegada no puede ser mayor a la de salida.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>

<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'fdeps'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> La fecha DEPS tiene que estar entre las fechas de la reservacion.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'fdia'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Debe reserservarse por al menos 24 Horas.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'npersonas'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Este numero de personas no esta permitido.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>

            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'fmenor'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong>Error!</strong> La fecha de entrada no puede ser menor a la fecha actual.
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
            
            <div class="table_title rounded p-2">FORMULARIO RESERVACIÓN</div>
            <div class="card shadow_general">
                <!--<div class="card-header">
                    Ingresar Reservacion:
                </div>-->
                <form class="p-4" method="POST" action="registrar.php">
                    <div class="col-sm-12 input-group">
                        <div class="col-sm-1 float_right">
                            <label class="form-label">Folio: </label>
                            <input value="<?php echo isset($reservacion[0]->no_folio) ? $reservacion[0]->no_folio+1 : 1; ?>" type="number" class="form-control" name="datoFolio" autofocus required readonly>
                        </div>
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                        <div class="col-sm-3">
                            <label class="form-label">Nombre: </label>
                            <input type="text" class="form-control" name="datoNombre" autofocus required>
                        </div>
                        
                        <div class="col-sm-2">
                            <label class="form-label">Fecha DEPS: </label>
                            <input type="date" class="form-control" name="datoDEPS" autofocus required>
                        </div>
                        <div class="col-sm-2">
                            <label class="form-label">Telefono: </label>
                            <input type="text" class="form-control" name="datoTelefono" autofocus required>
                        </div>
                        <!--&nbsp;&nbsp;&nbsp;-->
                        <div class="col-sm-4">
                            <label class="form-label">Correo Electronico: </label>
                            <input type="email" class="form-control" name="datoEmail" autofocus required>
                        </div>
                        <!--&nbsp;&nbsp;&nbsp;-->
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                        <div class="col-sm-2">
                            <label class="form-label">Lugar Residencia: </label>
                            <input type="text" class="form-control" name="datoResidencia" autofocus required>
                        </div>
                        <div class="col-sm-2">
                            <label class="form-label">Fecha Llegada: </label>
                            <input type="date" class="form-control" name="datoFechaLlegada" autofocus required>
                        </div>
                        <div class="col-sm-2">
                            <label class="form-label">Fecha Salida: </label>
                            <input type="date" class="form-control" name="datoFechaSalida" autofocus required>
                        </div>
                        <div class="col-sm-2">
                            <label class="form-label">Habitacion: </label>
                            <select id="inputState" class="form-control" name="datoHabitacion">
                                <?php 
                                    foreach ($habitaciones as $habitacion) {
                                ?> 
                                    <option value="<?php echo $habitacion->id; ?>" <?php echo (isset($valorSeleccionado) && $valorSeleccionado == $habitacion->id) || (isset($_GET['codigo']) && $_GET['codigo'] == $habitacion->id) ? "selected" : "" ?>><?php  echo ($habitacion->tipo_id === 1) ? ($habitacion->nom_habitacion . ' mp#6') :
             (($habitacion->tipo_id === 2) ? ($habitacion->nom_habitacion . ' mp#7') :
             (($habitacion->tipo_id === 3) ? ($habitacion->nom_habitacion . ' mp#4') :
                                              ($habitacion->nom_habitacion . ' mp#8'))) ; ?></option>
                                <?php 
                                    }
                                ?> 
                            </select>
                        </div>
                        <div class="col-sm-2">
                            <label class="form-label">N° Personas:</label>
                            <input type="number" class="form-control" name="datoNoPersonas" autofocus required>
                        </div>
                        <!-- <div class="col-sm-1">
                            <label class="form-label">Deposito: </label>
                            <input type="number" class="form-control" name="datoDeposito" autofocus required>
                        </div> -->
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex">
                        <div class="col-sm-2">
                            <label for="form-label">Tipo Pago: </label>
                            <select id="inputState" class="form-control" name="datoTipoPago" autofocus required>
                                <option value="" selected disabled="true">Seleccionar...</option>
                                <option value = "Efectivo">Efectivo</option>
                                <option value = "Tarjeta">Tarjeta</option>
                                <option value = "Transferencia">Transferencia</option>
                                <option value = "Credito">Credito</option>
                                <option value = "Cortesia">Cortesia</option>
                            </select>
                        </div>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <div class="col-sm-2">
                            <label for="form-label">Temporada: </label>
                            <select id="inputState" class="form-control" name="datoTemporada" autofocus required>
                                <option value=""  selected disabled="true">Seleccionar...</option>
                                <option value = "alta">Alta</option>
                                <option value = "baja">Baja</option>
                            </select>
                        </div>
                    </div>
                    <div class="d-grid mt-3 ">
                        <input type="hidden" name="oculto" value="1">
                        <input type="submit" class="btn btn-primary" value="Registrar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include 'template/footer.php' ?>