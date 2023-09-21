<?php

    include_once 'model/conexion.php';
    $temalta = $_POST["tem_alta"];
    $tembaja = $_POST["tem_baja"];
    $codigo = $_POST["codigo"];
    $sentencia = $bd->prepare("UPDATE preciohabitacion SET tem_alta = ?, tem_baja = ? where id = ?;");
     $resultado = $sentencia->execute([$temalta,$tembaja,$codigo]);

   


    if ($resultado === TRUE) {
        header('Location:cambioprecio.php?mensaje=editado');
    } else  {
        header('Location: formularioprecio.php?mensaje=error');
        exit() ;
    }
    
?>