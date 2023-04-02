<?php include 'template/header.php' ?>
<head>
    <link rel="stylesheet" href="css/styleGeneral.css">
</head>
<div class="container mt-5">
<div class="margin_formulario">
    <div class="row">
        <div class="col-sm-12">
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
    //var_dump($usuarios->rol);
    //var_dump($usuarios->turno);
?>

<div class="table_title rounded p-2">Editar Usuarios</div>
<div class="card shadow_general">
<div class="container mt-2">
    <div class="row justify-content-center">
                <form class="p-4" method="POST" action="UpdateUsuarios.php">
                <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                        <div class="col-sm-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" class="form-control" name="datoNombre" required 
                        value="<?php echo $usuarios->nombre; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Apellido Paterno: </label>
                        <input type="text" class="form-control" name="datoApellido_pat" required 
                        value="<?php echo $usuarios->apellido_pat; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Apellido Materno: </label>
                        <input type="text" class="form-control" name="datoApellido_mat" required 
                        value="<?php echo $usuarios->apellido_mat; ?>">
                    </div>
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                    <div class="col-sm-3">
                        <label class="form-label">Telefono: </label>
                        <input type="text" class="form-control" name="datoTelefono" required 
                        value="<?php echo $usuarios->telefono; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Correo Electronico: </label>
                        <input type="text" class="form-control" name="datoEmail" required 
                        value="<?php echo $usuarios->email; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Direccion: </label>
                        <input type="text" class="form-control" name="datoDireccion" required 
                        value="<?php echo $usuarios->direccion; ?>">
                    </div>
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                    <div class="form-group col-sm-3">
                        <label class="form-label" for="inputState">Turno</label>
                        <select id="inputState" class="form-control" name="datoTurno"
                        value="<?php echo $usuarios->turno; ?>">
                            <option disabled="true">Seleccionar...</option>
                            <option value ="matutino"<?php echo isset($usuarios->turno) && $usuarios->turno == "matutino" ? "selected" : ''?>>Matutino</option>
                            <option value ="vespertino"<?php echo isset($usuarios->turno) && $usuarios->turno == "vespertino" ? "selected" : ''?>>Vespertino</option>
                            <option value ="nocturno"<?php echo isset($usuarios->turno) && $usuarios->turno == "nocturno" ? "selected" : ''?>>Nocturno</option>
                        </select>
                    </div>
                    <div class="col-sm-3 ">
                        <label class="form-label" >Contraseña:</label>
                        <input type="password" class="form-control" name="datoContraseña" required 
                        value="<?php echo $usuarios->password; ?>">
                    </div>
                    <div class="form-group col-sm-3 ">
                        <label class="form-label" for="inputState">Rol</label>
                        <select  id="inputState" class="form-control" name="datoRol"
                        value="<?php echo $usuarios->rol; ?>">
                            <option disabled="true">Seleccionar...</option>
                            <option value ="administrador"<?php echo isset($usuarios->rol) && $usuarios->rol == "administrador" ? "selected" : ''?>>Administrador</option>
                            <option value ="usuario"<?php echo isset($usuarios->rol) && $usuarios->rol == "usuario" ? "selected" : ''?>>Usuario</option>
                        </select>
                    </div>
                    </div>
                    <div class="d-grid mt-3">
                        <input type="hidden" name="codigo" value="<?php echo $usuarios->idUsuario; ?>">
                        <input type="submit" class="btn btn-primary" value="Actualizar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include 'template/footer.php' ?>