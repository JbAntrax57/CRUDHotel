<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";
    date_default_timezone_set('America/Mexico_City');
    $sql = $bd -> query("SELECT * FROM reservaciones WHERE CURDATE() BETWEEN fecha_llegada AND fecha_salida");
    $reservacion = $sql->fetchAll(PDO::FETCH_OBJ);
    
    foreach ($reservacion as $r) {
      $disponible = 0;  
       /* if ($r->fecha_llegada <= date("Y-m-d") && $r->fecha_salida >= date("Y-m-d")){
            $disponible = 0;
            //var_dump($r->habitacion_id);
           // die();
            // var_dump($r->habitacion_id. ' '. $disponible );
            // var_dump($r->fecha_llegada. ' '. $r->fecha_salida );
            // var_dump(date("Y-m-d"));
        }else{
            $disponible = 1;
            //var_dump($r->habitacion_id. ' '. $disponible);   
            //var_dump($r->fecha_llegada. ' '. $r->fecha_salida);
            //var_dump(date("Y-m-d"));
        }*/
    $sentencia = $bd -> query("select * from habitaciones where id = $r->habitacion_id");
    $rom = $sentencia->fetchAll(PDO::FETCH_OBJ);



    $query = $bd->prepare("UPDATE habitaciones SET tipo_id = ?, nom_habitacion = ?, planta = ?, disponible = ? where id = ?;");
    $response = $query->execute([$rom[0]->tipo_id, $rom[0]->nom_habitacion, $rom[0]->planta, $disponible, $r->habitacion_id]);

    }
    //die();

    $sentencia = $bd -> query("select *, habitaciones.id as hab_id from habitaciones JOIN preciohabitacion ON habitaciones.id = preciohabitacion.habitacion_id");
    $habitaciones = $sentencia->fetchAll(PDO::FETCH_OBJ);



?>
<head>
<link rel="stylesheet" href="css/styleRooms.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
</head>
<div class="container" style="margin-top: 5%;">
    <div class="row mt-5">
        <div class="col-lg-12 text-center">
            <div class="row">








<!-- El modal -->
<div class="modal" id="miModal">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
        
            <!-- Encabezado del modal -->
            <div class="modal-header">
                <h4 class="modal-title">Toallas Extras</h4>
                <button type="button" class="close" data-dismiss="modal">&times;</button>
            </div>
            
            <!-- Contenido del modal -->
            <div class="modal-body">
                <p>Seleccione la cantidad:</p>
                <select class="form-select"  name="registros" id="">
      <option value="" selected disabled ="true" >Cantidad de Toallas</option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>



      </select>
            </div>
            
            <!-- Pie del modal -->
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
            </div>
            
        </div>
    </div>
</div>

<!-- Agregar el enlace al JS de Bootstrap y jQuery (necesario para el funcionamiento de Bootstrap) -->
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.10.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>





            

            
                <!-- CÓDIGO DE LOS CARDS PARA LAS HABITACIONES -->
                <!-- CARD PARA LA HABITACIÓN NO DISPOBIBLE -->
                <?php foreach ($habitaciones as $habitacion) { ?>
                    <?php if ($habitacion->disponible === 0) { ?>
                        <div class="col-lg-4 col-md-12 mb-4 mt-5">
                            <div class="card-section border rounded p-3">
                                <div class="card-header-first rounded pb-5">
                                    <h2 class="card-header-title text-white pt-3"><?php echo $habitacion->nom_habitacion ?></h2>
                                </div>
                                <div class="card-body">
                                    <p class="card-text texto-izq"><?php echo ($habitacion->tipo_id === 1) ? 'Tipo Habitación: 2 Matrimoniales' : ''?></p>
                                    <p class="card-text texto-izq"><?php echo ($habitacion->disponible === 0) ? 'No disponible' : 'Disponible'?></p>
                                    <p class="card-text texto-izq"><?php echo ($habitacion->planta === 0) ? 'Planta baja' : 'Planta alta'?></p>
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_alta) ? 'Temporada Alta: $' . $habitacion->tem_alta : 'Temporada Alta: $' . 0 ?></p>
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_baja) ? 'Temporada Baja: $' . $habitacion->tem_baja : 'Temporada Baja: $' . 0 ?></p>
                                    <div class="row">
                                        <div class="col-lg-12 text-right">
                                            <!-- <a href="#" title="check"><i class="bi bi-bag-check-fill"></i></a> -->
                                            <a href="reservacion.php?codigo=<?php echo $habitacion->hab_id; ?>" title="Reservar"><i class="bi bi-bag-check-fill"></i></a>
                                            
                                            <button type="button" class="btn btn-light" data-toggle="modal" data-target="#miModal"><span class="material-symbols-outlined">dry_cleaning</span></button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } else { ?>

                        <!-- CARD PARA LA HABITACIÓN DISPOBIBLE -->
                        <div class="col-lg-4 col-md-12 mb-4 mt-5">
                            <div class="card-section border rounded p-3">
                                <div class="card-header-third rounded pb-5">
                                    <h2 class="card-header-title text-white pt-3"><?php echo $habitacion->nom_habitacion ?></h2>
                                </div>
                                <div class="card-body">
                                <p class="card-text texto-izq"><?php echo ($habitacion->tipo_id === 1) ? 'Tipo Habitación: 2 Matrimoniales' : ''?></p>
                                    <p class="card-text texto-izq"><?php echo ($habitacion->disponible === 1) ? 'Disponible' : 'No disponible'?></p>
                                    <p class="card-text texto-izq"><?php echo ($habitacion->planta === 0) ? 'Planta baja' : 'Planta alta'?></p>
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_alta) ? 'Temporada Alta: $' . $habitacion->tem_alta : 'Temporada Alta: $' . 0 ?></p>
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_baja) ? 'Temporada Baja: $' . $habitacion->tem_baja : 'Temporada Baja: $' . 0 ?></p>
                                    <div class="row">
                                        <div class="col-lg-12 text-right">
                                            <!-- <a href="#" title="check"><i class="bi bi-bag-check-fill"></i></a> -->
                                            <a href="reservacion.php?codigo=<?php echo $habitacion->hab_id; ?>" title="Reservar"><i class="bi bi-bag-check-fill"></i></a>
                                            </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php } ?>
                <?php } ?>
            </div>
        </div>
    </div>
</div>

<?php include 'template/footer.php' ?>