<?php      
    include_once "model/conexion.php"; 
    $username = $_POST['user'];  
    $password = $_POST['pass'];  
      
      
        $sql = "select * from usuario where nombre = '$username' and password = '$password'";  
     //   $result = mysqli_query($bd, $sql); 
        $resultado = $bd->query($sql);
        //$row = mysqli_fetch_array($result, MYSQLI_ASSOC);  
        //$count = mysqli_num_rows($result);  
        $filas = $resultado->fetchAll();
        $GLOBALS['username'];
        
        if (count($filas)) {
            header('Location: index.php?mensaje=registrado');
        } else {
            header('Location: login.php?mensaje=error');
            exit();
        }
?>  