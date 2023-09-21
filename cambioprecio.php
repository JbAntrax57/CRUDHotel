<?php include 'template/header.php' ?>

<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select ph.*, th.tipo_habitacion, h.nom_habitacion from preciohabitacion ph inner join tipohabitaciones th on th.id = ph.tipo_id inner join habitaciones h on h.id = ph.habitacion_id ");
    $precios = $sentencia->fetchAll(PDO::FETCH_OBJ);
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
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'editado'){
            ?>
            <div class="alert alert-succes alert-dismissible fade show" role="alert">
                <strong>Editado!</strong> Los datos fueron actualizados
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>

            <br><br>
            <div class="mt-2">
                <div class="table_title rounded p-2">PRECIOS HABITACIONES</div>
                <div class="mx-auto">
                    <!-- <table class="table align-middle table-responsive-xl"> -->
                    <div class="table-responsive">
                        <table class="table table-striped  table-hover table-borderless">
                            <thead class="table_theme">

                                <tr>
                                    <th scope="col">Tipo Habitacion</th>
                                    <th scope="col">Habitacion</th>
                                    <th scope="col">Precio Temporada Alta</th>
                                    <th scope="col">Precio Temporada Baja</th>
                                    <th scope="col" colspan="3">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>

                                <?php 
                                foreach($precios as $dato){ 
                            ?>

                                <tr>
                                    <td scope="row"><?php echo $dato->tipo_habitacion; ?></td>
                                    <td><?php echo $dato->nom_habitacion; ?></td>
                                    <td><?php echo $dato->tem_alta; ?></td>
                                    <td><?php echo $dato->tem_baja; ?></td>

                                   

                                    <td>
                                    
                                    <?php
                                      if($_SESSION['rol']!='usuario'){
                                    ?>
                                    
                                    <a class="text-success"
                                            href="formularioprecio.php?codigo=<?php echo $dato->id; ?>&hab_id=<?php echo $dato->habitacion_id; ?>&tipo_id=<?php echo $dato->tipo_id; ?>"><i
                                                class="bi bi-pencil-square"></i></a>
                                    <?php 
                                      }
                                    ?>
                                    </td>
                                    
                                </tr>

                                <?php 
                                }
                            ?>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <?php include 'template/footer.php' ?>