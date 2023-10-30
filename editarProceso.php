<?php
  
    if(empty($_POST["datoNombre"]) 
    || empty($_POST["datoDEPS"]) || empty($_POST["datoTelefono"]) || empty($_POST["datoEmail"]) || empty($_POST["datoResidencia"])
    || empty($_POST["datoFechaLlegada"])|| empty($_POST["datoFechaSalida"])|| empty($_POST["datoHabitacion"])|| empty($_POST["datoNoPersonas"])
    || empty($_POST["datoFolio"]) || empty($_POST["datoTipoPago"])){
      
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
    
    $sentencia = $bd->prepare("select * from reservaciones where idReservaciones = ?;");
    $sentencia->execute([$idReservaciones]);
    $reservacion = $sentencia->fetch(PDO::FETCH_OBJ);

    if(($fecha_llegada!=$reservacion->fecha_llegada||$fecha_salida!=$reservacion->fecha_salida)&&$habitacion==$reservacion->habitacion_id){
        $sql = $bd->query("SELECT *
        FROM reservaciones
        WHERE fecha_salida >= CURDATE() - INTERVAL 30 DAY
        ORDER BY idReservaciones DESC;");
        $reservacion = $sql->fetchAll(PDO::FETCH_OBJ);
        
        foreach ($reservacion as $r) {
            if ((($r->fecha_llegada <= date("Y-m-d", strtotime($_POST["datoFechaLlegada"])) && $r->fecha_salida >= date("Y-m-d", strtotime($_POST["datoFechaSalida"]))) && $r->habitacion_id == $_POST["datoHabitacion"])||(($r->fecha_llegada >= date("Y-m-d", strtotime($_POST["datoFechaLlegada"])) && $r->fecha_salida <= date("Y-m-d", strtotime($_POST["datoFechaSalida"]))) && $r->habitacion_id == $_POST["datoHabitacion"])){
                $disponible = 0;
                header('Location: vista.php?mensaje=fechaigual');
            exit();
        }   
        
        }
    }

    $rom = getRoom($habitacion, $bd);
    $personas = maxper($rom[0]);
    $extra=0;
    $total = 0;
    if ($personas + 2 < $_POST["datoNoPersonas"]){
        header('Location: reservacion.php?mensaje=maxtp');
        exit();
    }else if ($personas + 2 == $_POST["datoNoPersonas"]){
        $extra = 200;
    }else if ($personas + 1 == $_POST["datoNoPersonas"]){
        $extra = 100;
    }
    $sql = $bd -> query("select * from preciohabitacion where habitacion_id = $habitacion");
    $price = $sql->fetchAll(PDO::FETCH_OBJ);

    $datotemporada = $_POST['datoTemporada'];

    
    if($_POST['datoTemporada'] === 'alta') {
        $total = ($extra * $no_noches) + $price[0]->tem_alta * $no_noches;
    } else {
        $total = ($extra * $no_noches) + $price[0]->tem_baja * $no_noches;
    }

    $sentencia = $bd->prepare("UPDATE reservaciones SET nombre = ?, fecha_deps = ?, num_telefono = ?, email = ?, lugar_residencia = ?, fecha_llegada = ?, fecha_salida = ?, habitacion_id = ?, no_personas = ?, deposito = ?, fecha_reservacion = ?, tipo_pago = ?, no_folio = ?, no_noches = ?, total = ?, temporada = ? where idReservaciones = ?;");
     $resultado = $sentencia->execute([$nombre,$deps,$telefono,$correo,$residencia,$fecha_llegada
    ,$fecha_salida,$habitacion,$no_personas,$deposito,$fecha_reservacion,$tipo_pago,$no_folio,intval($no_noches),floatval($total),$datotemporada,$idReservaciones]);

   


    if ($resultado === TRUE) {
        $disponible = get_estatus($fecha_llegada,$fecha_salida);
        $rom = getRoom($habitacion, $bd);
        $query = $bd->prepare("UPDATE habitaciones SET tipo_id = ?, nom_habitacion = ?, planta = ?, disponible = ? where id = ?;");
        $response = $query->execute([$rom[0]->tipo_id, $rom[0]->nom_habitacion, $rom[0]->planta, $disponible, $habitacion]);
        if($response === TRUE) {
            header('Location: vista.php?mensaje=editado');
        } else {
            header('Location: reservacion.php?mensaje=error');
            exit();
        }
    } else {
        header('Location: reservacion.php?mensaje=error');
        exit();
    }

    function getRoom($habitacion, $bd) {

        $sentencia = $bd -> query("select * from habitaciones where id = $habitacion");
        $rom = $sentencia->fetchAll(PDO::FETCH_OBJ);
        return $rom;
    }
        function maxper($rom){
        if($rom->tipo_id==1){
            return 4;
        }
        if($rom->tipo_id==2){
            return 5;
        }
        if($rom->tipo_id==3){
            return 2;
        }
        if($rom->tipo_id==4){
            return 6;
        }

    }
   function get_estatus($fecha_llegada,$fecha_salida){
   
    if(date("Y-m-d") == $fecha_llegada) {
             
        return 0;
    }else {
        return 1;
    }
        
   }

?>