<?php

  session_start();
  if (!isset($_SESSION['rol'])) {
    header('Location: login.php');
  }

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Admin| Hotel Jardin de Jaluco</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS v5.0.2 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"  integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <!-- cdn icnonos-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">

    <link rel="stylesheet" href="css/styleHeader.css">
    <script src="https://kit.fontawesome.com/41bcea2ae3.js" crossorigin="anonymous"></script>

</head>
<body>
    

<nav class="navbar navbar-dark bg_header fixed-top">
  <div class="container-fluid">
    <!--<a class="navbar-brand" href="#">Offcanvas dark navbar</a>-->
    <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="offcanvas offcanvas-start bg_menu text-bg-primary" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
      <div class="offcanvas-header">
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel" style="color: white;">Bienvenido...</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
        <!--<li><a class="nav-link"><?//= $user['nombre']; ?></a></li>-->
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-start flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.php"><i class="bi bi-house"></i>&nbsp;&nbsp;&nbsp;Inicio</a>
          </li>

          <!--<li class="nav-item">
            <a class="nav-link" href="#">Link</a>
          </li>-->
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-card-checklist"></i>&nbsp;&nbsp;&nbsp;Reservaciones
            </a>
            <ul class="dropdown-menu menu-bg-light">
              <li><a class="dropdown-item" href="reservacion.php"><i class="bi bi-pencil-fill"></i>&nbsp;&nbsp;&nbsp;Registrar</a></li>
              <li><a class="dropdown-item" href="vista.php"><i class="bi bi-card-list"></i>&nbsp;&nbsp;&nbsp;Mostrar reservaciones</a></li>
            </ul>
          </li>


          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-door-open"></i>&nbsp;&nbsp;&nbsp;Habitaciones
            </a>
            <ul class="dropdown-menu menu-bg-light">
              <li><a class="dropdown-item" href="habitaciones.php"><i class="bi bi-door-closed"></i>&nbsp;&nbsp;&nbsp;Estado Habitaciones</a></li>
             <li><a class="dropdown-item" href="cambioprecio.php"><i class="bi bi-currency-dollar"></i>&nbsp;&nbsp;&nbsp;Precios Habitaciones</a></li>
            </ul>
            
             
          </li>


        

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="fa-solid fa-bell-concierge"></i>&nbsp;&nbsp;&nbsp;Recepcion
            </a>
            <ul class="dropdown-menu menu-bg-light">
              <li><a class="dropdown-item" href="corte_caja.php"><i class="bi bi-vector-pen"></i>&nbsp;&nbsp;&nbsp;Corte de Caja</a></li>
              <!--<li><a class="dropdown-item" href="caja.php"><i class="bi bi-safe"></i>&nbsp;&nbsp;&nbsp;Deposito Caja</a></li>-->
              <li><a class="dropdown-item" href="gastosCaja.php"><i class="bi bi-cash-coin"></i>&nbsp;&nbsp;&nbsp;Pagos Caja</a></li>
           
            </ul>
          </li>  
<?php
if($_SESSION['rol']!='usuario'){
?>

          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            <i class="bi bi-people"></i>&nbsp;&nbsp;&nbsp;Usuarios
            </a>
            <ul class="dropdown-menu menu-bg-light">
              <li><a class="dropdown-item" href="usuarios.php"><i class="bi bi-person"></i>&nbsp;&nbsp;&nbsp;Lista Usuarios</a></li>
              <li><a class="dropdown-item" href="agregarUsuario.php"><i class="bi bi-person-plus"></i>&nbsp;&nbsp;&nbsp;Agregar Usuario</a></li>
                
            </ul>
          </li>
  <?php  
 }       
?>


<li class="nav-item">
            <a class="nav-link active" aria-current="page" href="sesionOut.php"><i class="bi bi-power"></i>&nbsp;&nbsp;&nbsp;Cerrar Sesion</a>
          </li>
       
        </ul>
        
      </div>
    </div>
    <img src="img/logohotel.png" alt="logo" style="height: 5%; width: 5%; margin-right: 3%;">
  </div>
</nav>

