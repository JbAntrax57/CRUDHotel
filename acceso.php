<?php      
    include_once "model/conexion.php"; 
   
    $username = $_POST['user'];  
    $password = $_POST['pass'];  
    
    
      
        //$sql = "select * from usuario where nombre = '$username' and password = '$password'";  
     //   $result = mysqli_query($bd, $sql); 
        //$resultado = $bd->query($sql);
        //$row = mysqli_fetch_array($result, MYSQLI_ASSOC);  
        //$count = mysqli_num_rows($result);  
       //$filas = $resultado->fetchAll();
        //$GLOBALS['username'];
       
        $sql = $bd -> query("select * from usuario where nombre = '$username' and password = '$password'");
        $filas = $sql->fetchAll(PDO::FETCH_OBJ);

        if (count($filas)) {
            session_start();
            $_SESSION["rol"] = $filas[0]->rol;
            $_SESSION["usuario"] = $filas[0]->nombre;
          
            header('Location: index.php');
           
        } else {
            header('Location: login.php?mensaje=error');
            exit();
        }
?>  