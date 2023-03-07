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
    $habitacion = $_GET['numhab'];
    $disponible = 1;
    $sentencia = $bd -> query("select * from habitaciones where id = $habitacion");
    $rom = $sentencia->fetchAll(PDO::FETCH_OBJ);

    $query = $bd->prepare("UPDATE habitaciones SET tipo_id = ?, nom_habitacion = ?, planta = ?, disponible = ? where id = ?;");
    $response = $query->execute([$rom[0]->tipo_id, $rom[0]->nom_habitacion, $rom[0]->planta, $disponible, $habitacion]);

    $sentencia = $bd->prepare("select * from reservaciones where idReservaciones = ?;");
    $sentencia->execute([$codigo]);
    $reservacion = $sentencia->fetch(PDO::FETCH_OBJ);

    $sql = $bd -> query("select * from habitaciones where disponible = 1");
    $habitaciones = $sql->fetchAll(PDO::FETCH_OBJ);
   // var_dump($reservacion);
    //$sentencia = $bd->query("select * from reservaciones where idReservaciones = ".$codigo.";");
    //$rows = $sentencia->fetchAll();
    //|var_dump("primo". $rows);
?>
<div class="table_title rounded p-2">Editar datos</div>
<div class="card shadow_general">
<div class="container mt-2">
    <div class="row justify-content-center">
        

                <form class="p-4" method="POST" action="editarProceso.php">
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                        <div class="col-sm-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" class="form-control" name="datoNombre" required 
                        value="<?php echo $reservacion->nombre; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Fecha DEPS: </label>
                        <input type="date" class="form-control" name="datoDEPS" autofocus required
                        value="<?php echo $reservacion->fecha_deps; ?>">
                    </div>
                    <div class="col-sm-3">
                    <label class="form-label">Telefono: </label>
                        <input type="text" class="form-control" name="datoTelefono" autofocus required
                        value="<?php echo $reservacion->num_telefono; ?>">
                    </div>
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                    <div class="col-sm-3">
                        <label class="form-label">Correo Electronico: </label>
                        <input type="email" class="form-control" name="datoEmail" autofocus required
                        value="<?php echo $reservacion->email; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Lugar Residencia: </label>
                        <input type="text" class="form-control" name="datoResidencia" autofocus required
                        value="<?php echo $reservacion->lugar_residencia; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Fecha Llegada: </label>
                        <input type="date" class="form-control" name="datoFechaLlegada" autofocus required
                        value="<?php echo $reservacion->fecha_llegada; ?>">
                    </div>
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                    <div class="col-sm-3">
                        <label class="form-label">Fecha Salida: </label>
                        <input type="date" class="form-control" name="datoFechaSalida" autofocus required
                        value="<?php echo $reservacion->fecha_salida; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Habitacion: </label>
                        <select id="inputState" class="form-control" name="datoHabitacion">
                            <?php 
                                foreach ($habitaciones as $habitacion) {
                            ?> 
                                <option value="<?php echo $habitacion->id; ?>" <?php echo (isset($valorSeleccionado) && $valorSeleccionado == $habitacion->id) || (isset($_GET['codigo']) && $_GET['codigo'] == $habitacion->id) ? "selected" : "" ?>><?php  echo $habitacion->nom_habitacion; ?></option>
                            <?php 
                                }
                            ?> 
                        </select>
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Numero de Personas: </label>
                        <input type="number" class="form-control" name="datoNoPersonas" autofocus required
                        value="<?php echo $reservacion->no_personas; ?>">
                    </div>
                    </div>
                    <div class="col-sm-12 input-group mt-3 d-flex justify-content-between">
                    <div class="col-sm-3">
                        <label class="form-label">Deposito: </label>
                        <input type="number" class="form-control" name="datoDeposito" autofocus required
                        value="<?php echo $reservacion->deposito; ?>">
                    </div>
                    <div class="col-sm-3">
                        <label class="form-label">Folio: </label>
                        <input type="number" class="form-control" name="datoFolio" autofocus required
                        value="<?php echo $reservacion->no_folio; ?>">
                    </div>
                    <div class="form-group col-sm-3 mb-3">
                        <label for="inputState" class="form-label">Tipo Pago:</label>
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
                    </div>
                    <div class="col-sm-12 input-group d-flex justify-content-between">
                        <div class="col-sm-3 mb-3">
                            <label for="form-label">Temporada: </label>
                            <select id="inputState" class="form-control" name="datoTemporada">
                                <option selected disabled="true">Seleccionar...</option>
                                <option value = "alta">Alta</option>
                                <option value = "baja">Baja</option>
                            </select>
                        </div>
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