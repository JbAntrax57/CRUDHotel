<?php

include_once 'model/conexion.php';

    date_default_timezone_set('America/Mexico_City');
    if(empty($_POST["datoNombre"]) 
    || empty($_POST["datoDEPS"]) || empty($_POST["datoTelefono"]) || empty($_POST["datoEmail"]) || empty($_POST["datoResidencia"])
    || empty($_POST["datoFechaLlegada"])|| empty($_POST["datoFechaSalida"])|| empty($_POST["datoHabitacion"])|| empty($_POST["datoNoPersonas"])
    || empty($_POST["datoFolio"]) || empty($_POST["datoTipoPago"])){
        header('Location: index.php?mensaje=falta');
        exit();
    }

    $sql = $bd->query("select * from reservaciones order by idReservaciones desc");
    $reservacion = $sql->fetchAll(PDO::FETCH_OBJ);
    
    foreach ($reservacion as $r) {
        if ((($r->fecha_llegada <= date("Y-m-d", strtotime($_POST["datoFechaLlegada"])) && $r->fecha_salida >= date("Y-m-d", strtotime($_POST["datoFechaSalida"]))) && $r->habitacion_id == $_POST["datoHabitacion"])||(($r->fecha_llegada >= date("Y-m-d", strtotime($_POST["datoFechaLlegada"])) && $r->fecha_salida <= date("Y-m-d", strtotime($_POST["datoFechaSalida"]))) && $r->habitacion_id == $_POST["datoHabitacion"])){
            $disponible = 0;
            header('Location: reservacion.php?mensaje=fechaigual');
        exit();
        }else{
            $disponible = 1;
            //var_dump($r->habitacion_id. ' '. $disponible);   
        }
    
    }

    
    $deps = date("Y-m-d", strtotime($_POST["datoDEPS"]));

    $fecha_llegada = date("Y-m-d", strtotime($_POST["datoFechaLlegada"]));
    $fecha_salida = date("Y-m-d", strtotime($_POST["datoFechaSalida"]));
    if ($fecha_llegada > $fecha_salida) {
        header('Location: reservacion.php?mensaje=fecha');
        exit();
    }
 
    
    if ($fecha_llegada < date("Y-m-d") ) {
        header('Location: reservacion.php?mensaje=fmenor');
        exit();
    }

    if ($deps < $fecha_llegada || $deps > $fecha_salida ) {
        header('Location: reservacion.php?mensaje=fdeps');
        exit();
    }
    // Proceso de llenado para la cantidad de las personas
    // $max_person = array();
    // for ($cont = 1; $cont <= 20; $cont++) {
    //     if ($cont != 7 && $cont <= 11) {
    //         $max_person['Habitacion '.$cont] = 4;
    //     }
    //     if ($cont === 7 || $cont === 17 || $cont === 18) {
    //         $max_person['Habitacion '.$cont] = 5;
    //     }
    //     if ($cont === 13 || $cont === 14) {
    //         $max_person['Habitacion '.$cont] = 1;
    //     }
    //     if ($cont === 15 || $cont === 16) {
    //         $max_person['Habitacion '.$cont] = 6;
    //     }
    //     if ($cont === 19) {
    //         $max_person['Bungalow '.$cont] = 5;
    //     }
    //     if ($cont === 20) {
    //         $max_person['Bungalow '.$cont] = 4;
    //     }
    // }
   

    // if($no_personas > $habitacion || $no_personas){
    //     header('Location: reservacion.php?mensaje=npersonas');
    //     exit();
    // }


    // Restar fechas para poder sacar los no_días 
    $fecha1 = date_create($fecha_llegada);
    $fecha2 = date_create($fecha_salida);
    $diff=date_diff($fecha1,$fecha2);
    $no_noches = $diff->format("%R%a");

    if($fecha_llegada === $fecha_salida) {
        header('Location: reservacion.php?mensaje=fdia');
        exit();

    }

    $fecha_reservacion = date("Y-m-d");
    
    $nombre = $_POST["datoNombre"];
    $telefono = $_POST["datoTelefono"];
    $correo = $_POST["datoEmail"];
    $residencia = $_POST["datoResidencia"];
    $habitacion = $_POST["datoHabitacion"];
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

    if($_POST['datoTemporada'] === 'alta') {
        $total = ($extra * $no_noches) + $price[0]->tem_alta * $no_noches;
    } else {
        $total = ($extra * $no_noches) + $price[0]->tem_baja * $no_noches;
    }

    $no_personas = $_POST["datoNoPersonas"];
    if($no_personas < 1){
        header('Location: reservacion.php?mensaje=npersonas');
        exit();
    }
    // $deposito = $_POST["datoDeposito"];
    $deposito = 0;
    $no_folio = $_POST["datoFolio"];
    $tipo_pago = $_POST["datoTipoPago"];
    $sentencia = $bd->prepare("INSERT INTO reservaciones(nombre, fecha_deps, num_telefono, email, lugar_residencia, fecha_llegada, fecha_salida, habitacion_id, no_personas, deposito, fecha_reservacion, tipo_pago, no_folio, no_noches, total, temporada) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);");
    $resultado = $sentencia->execute([$nombre,$deps,$telefono,$correo,$residencia,$fecha_llegada
    ,$fecha_salida,$habitacion,$no_personas,$deposito,$fecha_reservacion,$tipo_pago,$no_folio,intval($no_noches), floatval($total),$_POST['datoTemporada']]);



    if ($resultado === TRUE) {
        $disponible = get_estatus($fecha_llegada,$fecha_salida);
        $rom = getRoom($habitacion, $bd);
        $query = $bd->prepare("UPDATE habitaciones SET tipo_id = ?, nom_habitacion = ?, planta = ?, disponible = ? where id = ?;");
        $response = $query->execute([$rom[0]->tipo_id, $rom[0]->nom_habitacion, $rom[0]->planta, $disponible, $habitacion]);
        if($response === TRUE) {
            header('Location: vista.php?mensaje=registrado');
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