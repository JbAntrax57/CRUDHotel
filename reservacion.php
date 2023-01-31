<?php include 'template/header.php' ?>
<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select * from habitaciones where disponible = 1");
    $habitaciones = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //print_r($persona);
?>
<body>
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
                    Ingresar Reservacion:
                </div>
                <form class="p-4" method="POST" action="registrar.php">
                    <div class="mb-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" class="form-control" name="datoNombre" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha DEPS: </label>
                        <input type="date" class="form-control" name="datoDEPS" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Telefono: </label>
                        <input type="text" class="form-control" name="datoTelefono" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Correo Electronico: </label>
                        <input type="email" class="form-control" name="datoEmail" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Lugar Residencia: </label>
                        <input type="text" class="form-control" name="datoResidencia" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha Llegada: </label>
                        <input type="date" class="form-control" name="datoFechaLlegada" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha Salida: </label>
                        <input type="date" class="form-control" name="datoFechaSalida" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Habitacion: </label>
                        <select id="inputState" class="form-control" name="datoHabitacion">
                            <?php 
                                foreach ($habitaciones as $habitacion) {
                            ?> 
                                <option value="<?php  echo $habitacion->nom_habitacion; ?>" <?php echo (isset($valorSeleccionado) && $valorSeleccionado == $habitacion->id) || (isset($_GET['codigo']) && $_GET['codigo'] == $habitacion->id) ? "selected" : "" ?>><?php  echo $habitacion->nom_habitacion; ?></option>
                            <?php 
                                }
                            ?> 
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Numero de Personas: </label>
                        <input type="number" class="form-control" name="datoNoPersonas" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Deposito: </label>
                        <input type="number" class="form-control" name="datoDeposito" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Folio: </label>
                        <input type="number" class="form-control" name="datoFolio" autofocus required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="inputState">Tipo Pago</label>
                        <select id="inputState" class="form-control" name="datoTipoPago">
                            <option selected disabled="true">Seleccionar...</option>
                            <option value = "Efectivo">Efectivo</option>
                            <option value = "Tarjeta">Tarjeta</option>
                            <option value = "Transferencia">Transferencia</option>
                            <option value = "Credito">Credito</option>
                            <option value = "Cortesia">Cortesia</option>
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
</body>