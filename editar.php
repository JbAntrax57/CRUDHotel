<?php include 'template/header.php' ?>

<?php
    if(!isset($_GET['codigo'])){
        header('Location: index.php?mensaje=error');
        exit();
    }

    include_once 'model/conexion.php';
    $codigo = $_GET['codigo'];

    $sentencia = $bd->prepare("select * from reservaciones where idReservaciones = ?;");
    $sentencia->execute([$codigo]);
    $reservacion = $sentencia->fetch(PDO::FETCH_OBJ);
   // var_dump($reservacion);
    //$sentencia = $bd->query("select * from reservaciones where idReservaciones = ".$codigo.";");
    //$rows = $sentencia->fetchAll();
    //|var_dump("primo". $rows);
?>

<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Editar datos:
                </div>
                <form class="p-4" method="POST" action="editarProceso.php">
                    <div class="mb-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" class="form-control" name="datoNombre" required 
                        value="<?php echo $reservacion->nombre; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha DEPS: </label>
                        <input type="date" class="form-control" name="datoDEPS" autofocus required
                        value="<?php echo $reservacion->fecha_deps; ?>">
                    </div>
                    <div class="mb-3">
                    <label class="form-label">Telefono: </label>
                        <input type="text" class="form-control" name="datoTelefono" autofocus required
                        value="<?php echo $reservacion->num_telefono; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Correo Electronico: </label>
                        <input type="email" class="form-control" name="datoEmail" autofocus required
                        value="<?php echo $reservacion->email; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Lugar Residencia: </label>
                        <input type="text" class="form-control" name="datoResidencia" autofocus required
                        value="<?php echo $reservacion->lugar_residencia; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha Llegada: </label>
                        <input type="date" class="form-control" name="datoFechaLlegada" autofocus required
                        value="<?php echo $reservacion->fecha_llegada; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha Salida: </label>
                        <input type="date" class="form-control" name="datoFechaSalida" autofocus required
                        value="<?php echo $reservacion->fecha_salida; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Habitacion: </label>
                        <input type="text" class="form-control" name="datoHabitacion" autofocus required
                        value="<?php echo $reservacion->habitacion_id; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Numero de Personas: </label>
                        <input type="number" class="form-control" name="datoNoPersonas" autofocus required
                        value="<?php echo $reservacion->no_personas; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Deposito: </label>
                        <input type="number" class="form-control" name="datoDeposito" autofocus required
                        value="<?php echo $reservacion->deposito; ?>">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Folio: </label>
                        <input type="number" class="form-control" name="datoFolio" autofocus required
                        value="<?php echo $reservacion->no_folio; ?>">
                    </div>
                    <div class="form-group mb-3">
                        <label for="inputState">Tipo Pago</label>
                        <select id="inputState" class="form-control" name="datoTipoPago"
                        value="<?php echo $reservacion->tipo_pago; ?>">
                            <option disabled="true">Seleccionar...</option>
                            <option value = "Efectivo">Efectivo</option>
                            <option value = "Tarjeta">Tarjeta</option>
                            <option value = "Transferencia">Transferencia</option>
                            <option value = "Credito">Credito</option>
                            <option value = "Cortesia">Cortesia</option>
                        </select>
                    </div>
                    <div class="d-grid">
                        <input type="hidden" name="idReservaciones" value="<?php echo $reservacion->idReservaciones; ?>">
                        <input type="submit" class="btn btn-primary" value="Editar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>

<?php include 'template/footer.php' ?>