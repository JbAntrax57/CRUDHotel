<?php
    
    if(empty($_POST["datoNombre"]) 
    || empty($_POST["datoDEPS"]) || empty($_POST["datoTelefono"]) || empty($_POST["datoEmail"]) || empty($_POST["datoResidencia"])
    || empty($_POST["datoFechaLlegada"])|| empty($_POST["datoFechaSalida"])|| empty($_POST["datoHabitacion"])|| empty($_POST["datoNoPersonas"])
    || empty($_POST["datoDeposito"])|| empty($_POST["datoFolio"]) || empty($_POST["datoTipoPago"])){
        header('Location: index.php?mensaje=warning');
        exit();
    }

    include_once 'model/conexion.php';
    $deps = date("Y-m-d", strtotime($_POST["datoDEPS"]));
    $fecha_llegada = date("Y-m-d", strtotime($_POST["datoFechaLlegada"]));
    $fecha_salida = date("Y-m-d", strtotime($_POST["datoFechaSalida"]));
    $fecha_reservacion = date("Y-m-d");
    $nombre = $_POST["datoNombre"];
    $telefono = $_POST["datoTelefono"];
    $correo = $_POST["datoEmail"];
    $residencia = $_POST["datoResidencia"];
    $habitacion = $_POST["datoHabitacion"];
    $no_personas = $_POST["datoNoPersonas"];
    $deposito = $_POST["datoDeposito"];
    $no_folio = $_POST["datoFolio"];
    $tipo_pago = $_POST["datoTipoPago"];
    $idReservaciones = $_POST["idReservaciones"];

    $sentencia = $bd->prepare("UPDATE reservaciones SET nombre = ?, fecha_deps = ?, num_telefono = ?, email = ?, lugar_residencia = ?, fecha_llegada = ?, fecha_salida = ?, habitacion_id = ?, no_personas = ?, deposito = ?, fecha_reservacion = ?, tipo_pago = ?, no_folio = ? where idReservaciones = ?;");
     $resultado = $sentencia->execute([$nombre,$deps,$telefono,$correo,$residencia,$fecha_llegada
    ,$fecha_salida,$habitacion,$no_personas,$deposito,$fecha_reservacion,$tipo_pago,$no_folio,$idReservaciones]);

   


    if ($resultado === TRUE) {
        header('Location: index.php?mensaje=editado');
    } else {
        header('Location: index.php?mensaje=error');
        exit();
    }
    
?>