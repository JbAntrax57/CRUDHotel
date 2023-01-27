<?php include 'template/header.php' ?>

<?php
    if(!isset($_GET['codigo'])){
        header('Location: index.php?mensaje=error');
        exit();
    }

    include_once 'model/conexion.php';
    $codigo = $_GET['codigo'];

    $sentencia = $bd->prepare("select * from usuario where idUsuario = ?;");
    $sentencia->execute([$codigo]);
    $usuarios = $sentencia->fetch(PDO::FETCH_OBJ);
    //print_r($persona);
?>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Editar datos:
                </div>
                <form class="p-4" method="POST" action="UpdateUsuarios.php">
                    <div class="mb-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" class="form-control" name="datoNombre" required 
                        value="<?php echo $usuarios->nombre; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Apellido Paterno: </label>
                        <input type="text" class="form-control" name="datoApellido_pat" required 
                        value="<?php echo $usuarios->apellido_pat; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Apellido Materno: </label>
                        <input type="text" class="form-control" name="datoApellido_mat" required 
                        value="<?php echo $usuarios->apellido_mat; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Telefono: </label>
                        <input type="text" class="form-control" name="datoTelefono" required 
                        value="<?php echo $usuarios->telefono; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Correo Electronico: </label>
                        <input type="text" class="form-control" name="datoEmail" required 
                        value="<?php echo $usuarios->email; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Direccion: </label>
                        <input type="text" class="form-control" name="datoDireccion" required 
                        value="<?php echo $usuarios->direccion; ?>">
                    </div>
                    <div class="form-group mb-3">
                        <label for="inputState">Turno</label>
                        <select id="inputState" class="form-control" name="datoTurno"
                        value="<?php echo $usuarios->turno; ?>">
                            <option disabled="true">Seleccionar...</option>
                            <option value = "matutino">Matutino</option>
                            <option value = "vespertino">Vespertino</option>
                            <option value = "nocturno">Nocturno</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Contraseña: </label>
                        <input type="text" class="form-control" name="datoContraseña" required 
                        value="<?php echo $usuarios->password; ?>">
                    </div>
                    <div class="d-grid">
                        <input type="hidden" name="codigo" value="<?php echo $usuarios->idUsuario; ?>">
                        <input type="submit" class="btn btn-primary" value="Editar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include 'template/footer.php' ?>