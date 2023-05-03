<?php
    date_default_timezone_set('America/Mexico_City');
    // if(empty($_POST["datoFolio"]) 
    // || empty($_POST["datoNombre"]) || empty($_POST["datoTotal"]) || empty($_POST["datoMonto"])){
    //     header('Location: index.php?mensaje=warning');
    //     exit();
     //}

    include_once 'model/conexion.php';
    if ($_SERVER["REQUEST_METHOD"] == "POST") {
    
    $nombre = $_POST["datoNombre"];
    $total = $_POST["datoTotal"];
    $saldoR = $_POST["datoSaldoR"];
    $monto = $_POST["datoMonto"];
    $id = $_POST["datoId"];
    $fecha_pago =  date('Y-m-d');
    $folio = isset($_POST["datoFolio"])?$_POST["datoFolio"]:0;
        }
    if($total === $saldoR){
        if($monto < ($total/2) ){
           header('Location: vista.php?mensaje=cantidad');
           exit();
    
          } 
   }
   else if ( $saldoR==0 ) {
    header('Location: vista.php?mensaje=pagado');
           exit();
   }
   else if ($monto != $saldoR){
     
        header('Location: vista.php?mensaje=errcant');
           exit();
    
   }
  
  
// var_dump($id);
// var_dump($monto);
// var_dump($fecha_pago);
// var_dump($folio);
// die();
    $sentencia = $bd->prepare("INSERT INTO pagos(reservacion_id,monto, fecha_registro, folio_c) VALUES (?, ?, ?, ?);");
    $resultado = $sentencia->execute([$id,$monto,$fecha_pago,$folio]);
   


    if ($resultado === TRUE) {
        header('Location: vista.php?mensaje=correcto');
    } else {
        header('Location: index.php?mensaje=error');
        exit();
    }
    
?>