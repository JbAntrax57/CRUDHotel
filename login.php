<?php

//   session_start();

//   if (isset($_SESSION['user_id'])) {
//     header('Location: /index.php');
//   }
//   require 'model/conexion.php';

//   if (!empty($_POST['nombre']) && !empty($_POST['password'])) {
//     $records = $conn->prepare('SELECT idUsuario, nombre, password FROM usuario WHERE nombre = :nombre');
//     $records->bindParam(':nombre', $_POST['nombre']);
//     $records->execute();
//     $results = $records->fetch(PDO::FETCH_ASSOC);

//     $message = '';

//     if (count($results) > 0 && password_verify($_POST['password'], $results['password'])) {
//         $_SESSION['user_id'] = $results['id'];
//         header("Location: index.php");
//       } else {
//         $message = 'Sorry, those credentials do not match';
//       }
//     }
  
  ?>
<!doctype html>
<html>
    <head>
        <link rel="shortcut icon" href="#" />
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <title>Login con  PHP - Bootstrap 4</title>

        <link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="css/styleLogin.css">
        <link rel="stylesheet" href="plugins/sweetalert2/sweetalert2.min.css">        
        
        <link rel="stylesheet" type="text/css" href="fuentes/iconic/css/material-design-iconic-font.min.css">
        
    </head>
    
    <body>
     
      <div class="container-login">
        <div class="wrap-login">
            <form class="login-form validate-form" action="acceso.php" method="post">
                <img src="img/logohotel.png" alt="logo" style="height: 90px; widht: 90px; margin-left: 30%; margin-bottom: 10%; margin-top: -10%;">
                
                <div class="wrap-input100" data-validate = "Usuario incorrecto">
                    <input class="input100" type="text" id="usuario" name="user" placeholder="Usuario">
                    <span class="focus-efecto"></span>
                </div>
                
                <div class="wrap-input100" data-validate="Password incorrecto">
                    <input class="input100" type="password" id="password" name="pass" placeholder="Password">
                    <span class="focus-efecto"></span>
                </div>
                
                <div class="container-login-form-btn">
                    <div class="wrap-login-form-btn">
                        <div class="login-form-bgbtn"></div>
                        <button type="submit" class="login-form-btn">CONECTAR</button>
                    </div>
                </div>
            </form>
        </div>
    </div>     
        
    <script>  
            function validation()  
            {  
                var id=document.f1.user.value;  
                var ps=document.f1.pass.value;  
                if(id.length=="" && ps.length=="") {  
                    alert("Error: Usuario o contraseña vacios");  
                    return false;  
                }  
                else  
                {  
                    if(id.length=="") {  
                        alert("El nombre de usuario esta vacio");  
                        return false;  
                    }   
                    if (ps.length=="") {  
                    alert("La contraseña esta vacia");  
                    return false;  
                    }  
                }                             
            }  
        </script>  
     <script src="jquery/jquery-3.3.1.min.js"></script>    
     <script src="bootstrap/js/bootstrap.min.js"></script>    
     <script src="popper/popper.min.js"></script>    
        
     <script src="plugins/sweetalert2/sweetalert2.all.min.js"></script>    
     <!-- <script src="codigo.js"></script> -->
    </body>
</html>