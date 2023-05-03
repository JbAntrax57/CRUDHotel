<?php


    include_once 'model/conexion.php';
    // $conn= conn();
    $datoDescripcion = $_POST["concepto"];
    $datoMonto = $_POST["importe"]; 
    $fecha_pago =  date('Y-m-d');

 

        $sentencia = $bd->prepare("INSERT INTO  gasto (concepto,importe,fecha_gasto
        )VALUES(?,?,?);");
         $resultado = $sentencia->execute([$datoDescripcion,$datoMonto,$fecha_pago]);


        if ($resultado === TRUE) {
            header('Location: gastosCaja.php?mensaje=creado');
        } else {
            // header('Location: index.php?mensaje=error');
            exit();
        }




?>