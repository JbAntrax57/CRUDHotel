<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select *, habitaciones.id as hab_id from habitaciones JOIN preciohabitacion ON habitaciones.id = preciohabitacion.habitacion_id");
    $habitaciones = $sentencia->fetchAll(PDO::FETCH_OBJ);
?>
<head>
<link rel="stylesheet" href="css/styleRooms.css">
</head>
<div class="container" style="margin-top: 5%;">
    <div class="row mt-5">
        <div class="col-lg-12 text-center">
            <div class="row">
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
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_alta) ? 'Temporada Alta: ' . $habitacion->tem_alta : 'Temporada Alta: ' . 0 ?></p>
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_baja) ? 'Temporada Baja: ' . $habitacion->tem_baja : 'Temporada Baja: ' . 0 ?></p>
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
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_alta) ? 'Temporada Alta: ' . $habitacion->tem_alta : 'Temporada Alta: ' . 0 ?></p>
                                    <p class="card-text texto-izq"><?php echo isset($habitacion->tem_baja) ? 'Temporada Baja: ' . $habitacion->tem_baja : 'Temporada Baja: ' . 0 ?></p>
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