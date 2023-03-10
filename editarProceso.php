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
    if ($fecha_llegada > $fecha_salida) {
        header('Location: reservacion.php?mensaje=fecha');
        exit();
    }
    $fecha1 = date_create($fecha_llegada);
    $fecha2 = date_create($fecha_salida);
    $diff=date_diff($fecha1,$fecha2);
    $no_noches = $diff->format("%R%a");

    if($fecha_llegada === $fecha_salida) {
        $no_noches = 1;
    }
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

    $sql = $bd -> query("select * from preciohabitacion where habitacion_id = $habitacion");
    $price = $sql->fetchAll(PDO::FETCH_OBJ);

    if($_POST['datoTemporada'] === 'alta') {
        $total = $price[0]->tem_alta * $no_noches;
    } else {
        $total = $price[0]->tem_baja * $no_noches;
    }

    $sentencia = $bd->prepare("UPDATE reservaciones SET nombre = ?, fecha_deps = ?, num_telefono = ?, email = ?, lugar_residencia = ?, fecha_llegada = ?, fecha_salida = ?, habitacion_id = ?, no_personas = ?, deposito = ?, fecha_reservacion = ?, tipo_pago = ?, no_folio = ?, no_noches = ?, total = ? where idReservaciones = ?;");
     $resultado = $sentencia->execute([$nombre,$deps,$telefono,$correo,$residencia,$fecha_llegada
    ,$fecha_salida,$habitacion,$no_personas,$deposito,$fecha_reservacion,$tipo_pago,$no_folio,intval($no_noches),floatval($total),$idReservaciones]);

   


    if ($resultado === TRUE) {
        header('Location: vista.php?mensaje=editado');
    } else {
        header('Location: index.php?mensaje=error');
        exit();
    }
    
?>