<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";
   
    //print_r($persona);
?>

<div class="container mt-5">
    <div class="row justify-content-center">
<div class="col-md-4">
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

            
           
            <div class="card">
                <div class="card-header">
                    Agregar Usuario:
                </div>
                <form class="p-4" method="POST" action="CreateUsuarios.php">
                    <div class="mb-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" class="form-control" name="datoNombre" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Apellido Paterno: </label>
                        <input type="text" class="form-control" name="datoApellido_pat" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Apellido Materno: </label>
                        <input type="text" class="form-control" name="datoApellido_mat" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Telefono: </label>
                        <input type="text" class="form-control" name="datoTelefono" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Correo Electronico: </label>
                        <input type="text" class="form-control" name="datoEmail" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Direccion: </label>
                        <input type="text" class="form-control" name="datoDireccion" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="inputState">Turno</label>
                        <select id="inputState" class="form-control" name="datoTurno">
                            <option selected disabled="true">Seleccionar...</option>
                            <option value = "matutino">Matutino</option>
                            <option value = "vespertino">Vespertino</option>
                            <option value = "nocturno">Nocturno</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contraseña: </label>
                        <input type="text" class="form-control" name="datoContraseña" required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="inputState">Rol</label>
                        <select id="inputState" class="form-control" name="datoRol">
                            <option selected disabled="true">Seleccionar...</option>
                            <option value = "administrador">Administrador</option>
                            <option value = "usuario">Usuario</option>
                        </select>
                    </div>
                    <div class="d-grid">
                    <input type="hidden" name="oculto" value="1">
                    <input type="submit" class="btn btn-primary" value="Registrar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<?php include 'template/footer.php' ?>