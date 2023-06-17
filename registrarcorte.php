<?php


    include_once 'model/conexion.php';
    // $conn= conn();
    $folio = $_POST["folio"];
    $total_caja = $_POST["total_caja"];
    $gasto_total = $_POST["gasto_total"]; 
    $fecha_corte =  date('Y-m-d');
    $saldo_restante = $_POST["saldo_restante"]; 
    $saldo_contado = $_POST["saldo_contado"]; 
     

        $sentencia = $bd->prepare("INSERT INTO  cortecaja (folio,total_caja,gasto_total,fecha_corte,saldo_restante,saldo_contado
        )VALUES(?,?,?,?,?,?);");
         $resultado = $sentencia->execute([$folio,$total_caja,$gasto_total,$fecha_corte,$saldo_restante,$saldo_contado]);

         
        if ($resultado === TRUE) {
         
          $sentencia = $bd->prepare("UPDATE gasto SET gasto_aplicado = ?;");
          $resultado = $sentencia->execute([1]);

          $sentencia = $bd->prepare("UPDATE pagos SET pago_aplicado = ?;");
          $resultado = $sentencia->execute([1]);


            header('Location: corte_caja.php?mensaje=creado');
        } else {

            // header('Location: index.php?mensaje=error');
            exit();
        }




?>