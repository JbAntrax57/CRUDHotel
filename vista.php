<?php include 'template/header.php' ?>

<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select * from reservaciones");
    $reservacion = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //print_r($persona);
?>
<nav class="navbar navbar-dark bg-primary">
</nav>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
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

            <!-- fin alerta -->
            <input style="margin-left:73%; border-radius:0%" type="button" onclick = "location='reservacion.php'" value = "Agregar Reservacion" class = "btn btn-primary" ></input>
     
            <div class="card">
                
                <div class="card-header">
                    Lista de Reservaciones
                </div>
                
                <div class="p-10">
                    <table class="table align-middle">
                        <thead>
                            <tr>
                                <th scope="col">N° Folio</th>
                                <th scope="col">Informacion</th>
                                <th scope="col">Detalles</th>
                                <th scope="col" colspan="2">Opciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <?php 
                                foreach($reservacion as $dato){ 
                            ?>

<tr>
                                <td scope="row"><?php echo $dato->idReservaciones; ?></td>
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
                                <td><a class="text-success" href="editar.php?codigo=<?php echo $dato->no_folio; ?>"><i class="bi bi-pencil-square"></i></a></td>
                                <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger" href="eliminar.php?codigo=<?php echo $dato->codigo; ?>"><i class="bi bi-trash"></i></a></td>
                               <!-- <td><a class="text-success" href="vista.php?codigo=<?//php echo $dato->no_folio; ?>"><i class="bi bi-eye-fill"></i></a></td>-->
                                <!-- <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger" href="eliminar.php?codigo=<?php echo $dato->codigo; ?>"><i class="bi bi-trash"></i></a></td> -->
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