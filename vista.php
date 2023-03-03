<?php include 'template/header.php' ?>

<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select * from reservaciones");
    $reservacion = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //print_r($persona);
?>
<head>
    <link rel="stylesheet" href="css/styleGeneral.css">
</head>
<div class="margin_table">
    <div class="row">
        <div class="col-sm-12">
            <!-- inicio alerta -->
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
            <input style="float: right;" type="button" onclick = "location='reservacion.php'" value = "Agregar Reservacion" class = "btn btn_general rounded" ></input>
            <button class="btn btn_general rounded" onclick = "location='excel.php'"><i class="bi bi-file-earmark-excel"></i></button>
<br><br>
            <div class="mt-2">
                <div class="table_title rounded p-2">LISTA DE RESERVACIONES</div>
                <div class="mx-auto">
                    <!-- <table class="table align-middle table-responsive-xl"> -->
                    <table class="table table-striped table-hover table-borderless">
                        <thead class="table_theme">
                            <tr>
                                <th scope="col">Folio</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha DEPS</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Residencia</th>
                                <th scope="col">Llegada</th>
                                <th scope="col">Salida</th>
                                <th scope="col">Habitacion</th>
                                <th scope="col">N° Personas</th>
                                <th scope="col">Deposito</th>
                                <th scope="col">Fecha Reservacion</th>
                                <th scope="col">Tipo Pago</th>
                                <th scope="col">Numero de Noches</th>
                                <th scope="col" colspan="2">Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <?php 
                                foreach($reservacion as $dato){ 
                            ?>

                             <tr>
                                <td scope="row"><?php echo $dato->no_folio; ?></td>
                                <td><?php echo $dato->nombre; ?></td>
                                <td><?php echo $dato->fecha_deps; ?></td>
                                <td><?php echo $dato->num_telefono; ?></td>
                                <td><?php echo $dato->lugar_residencia; ?></td>
                                <td><?php echo $dato->fecha_llegada; ?></td>
                                <td><?php echo $dato->fecha_salida; ?></td>
                                <td><?php echo $dato->habitacion_id; ?></td>
                                <td><?php echo $dato->no_personas; ?></td>
                                <td><?php echo $dato->deposito; ?></td>
                                <td><?php echo $dato->fecha_reservacion; ?></td>
                                <td><?php echo $dato->tipo_pago; ?></td>
                                <td><?php echo $dato->no_noches; ?></td>
                                <td><a class="text-success" href="editar.php?codigo=<?php echo $dato->idReservaciones; ?>"><i class="bi bi-pencil-square"></i></a></td>
                                <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger" href="eliminar.php?codigo=<?php echo $dato->idReservaciones; ?>&habitacion=<?php echo $dato->habitacion_id; ?>"><i class="bi bi-trash"></i></a></td>
                               <!-- <td><a class="text-success" href="vista.php?codigo=<?//php echo $dato->no_folio; ?>"><i class="bi bi-eye-fill"></i></a></td>-->
                                <!-- <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger" href="eliminar.php?codigo=<?php echo $dato->idReservaciones; ?>"><i class="bi bi-trash"></i></a></td> -->
                            </tr>

                            <?php 
                                }
                            ?>

                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>

        <?php include 'template/footer.php' ?>