<?php
    
    if(empty($_POST["datoNombre"]) 
    || empty($_POST["datoApellido_pat"]) || empty($_POST["datoApellido_mat"]) || empty($_POST["datoTelefono"]) || empty($_POST["datoEmail"])
    || empty($_POST["datoDireccion"])|| empty($_POST["datoTurno"])|| empty($_POST["datoContraseña"])){
        header('Location: index.php?mensaje=warning');
        exit();
    }

    include_once 'model/conexion.php';
    $nombre = $_POST["datoNombre"];
    $apellido_pat = $_POST["datoApellido_pat"];
    $apellido_mat = $_POST["datoApellido_mat"];
    $telefono = $_POST["datoTelefono"];
    $email = $_POST["datoEmail"];
    $direccion = $_POST["datoDireccion"];
    $turno = $_POST["datoTurno"];
    $password = $_POST["datoContraseña"];
    $idUsuario = $_POST["codigo"];
    $sentencia = $bd->prepare("UPDATE usuario SET nombre = ?, apellido_pat = ?, apellido_mat= ?, telefono = ?, email = ?, direccion = ?, turno = ?, password = ? where idUsuario = ?;");
     $resultado = $sentencia->execute([$nombre,$apellido_pat,$apellido_mat,$telefono,$email,$direccion
    ,$turno,$password,$idUsuario]);

   


    if ($resultado === TRUE) {
        header('Location: usuarios.php?mensaje=editado');
    } else {
        header('Location: index.php?mensaje=error');
        exit();
    }
    
?>