<?php 
    if(!isset($_GET['codigo'])){
        header('Location: index.php?mensaje=error');
        exit();
    }

    include 'model/conexion.php';
    $codigo = $_GET['codigo'];

    $sentencia = $bd->prepare("DELETE FROM Reservaciones where idReservaciones = ?;");
    $resultado = $sentencia->execute([$codigo]);

    if ($resultado === TRUE) {
        $disponible = 1;
        $habitacion = $_GET['habitacion'];

        $sentencia = $bd -> query("select * from habitaciones where id = $habitacion");
        $rom = $sentencia->fetchAll(PDO::FETCH_OBJ);

        $query = $bd->prepare("UPDATE habitaciones SET tipo_id = ?, nom_habitacion = ?, planta = ?, disponible = ? where id = ?;");
        $response = $query->execute([$rom[0]->tipo_id, $rom[0]->nom_habitacion, $rom[0]->planta, $disponible, $habitacion]);

        if($response === TRUE) {
            header('Location: vista.php?mensaje=eliminado');
        } else {
            header('Location: vista.php?mensaje=error');
        }
    } else {
        header('Location: vista.php?mensaje=error');
    }
    
?>