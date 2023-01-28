<?php include 'template/header.php' ?>

<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select * from usuario");
    $usuario = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //print_r($persona);
?>
<!-- <nav class="navbar navbar-dark bg-primary">
</nav> -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-15">
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
            <input style="margin-left:73%; border-radius:0%" type="button" onclick = "location='agregarUsuario.php'" value = "Agregar Usuario" class = "btn btn-primary" ></input>
        
            <div class="card col-sm-25">
                
                <div class="card-header">
                    Lista de Reservaciones
                </div>
                
                <div class="mx-auto">
                    <table class="table align-middle table-responsive-xl " >
                        <thead>
                            <tr>
                                <th scope="col">Nombre</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Correo</th>
                                <th scope="col">Direccion</th>
                                <th scope="col">Turno</th>
                                <th scope="col">Rol</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <?php 
                                foreach($usuario as $dato){ 
                            ?>

                             <tr>
                                
                                <td><?php echo $dato->nombre; ?></td>
                                <td><?php echo $dato->telefono; ?></td>                 
                                <td><?php echo $dato->email; ?></td>
                                <td><?php echo $dato->direccion; ?></td>
                                <td><?php echo $dato->turno; ?></td>
                                <td><?php echo $dato->rol; ?></td>
                                <td><a class="text-success" href="editarUsuarios.php?codigo=<?php echo $dato->idUsuario; ?>"><i class="bi bi-pencil-square"></i></a></td>
                                <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger" href="eliminarUsuario.php?codigo=<?php echo $dato->idUsuario; ?>"><i class="bi bi-trash"></i></a></td>
                               <!-- <td><a class="text-success" href="vista.php?codigo=<?//php echo $dato->no_folio; ?>"><i class="bi bi-eye-fill"></i></a></td>-->
                                <!-- <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger" href="eliminar.php?codigo=<?//php echo $dato->codigo; ?>"><i class="bi bi-trash"></i></a></td> -->
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