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
        <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel" style="color: white;">la gruesa pa mi primo</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
      </div>
      <div class="offcanvas-body">
        <ul class="navbar-nav justify-content-start flex-grow-1 pe-3">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.php"><i class="bi bi-speedometer2"></i>&nbsp;&nbsp;&nbsp;Dashboard</a>
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
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              Dropdown
            </a>
            <ul class="dropdown-menu" style="background: rgba(7,163,222,1);">
              <li><a class="dropdown-item" href="reservacion.php"><i class="bi bi-card-checklist"></i>Registro</a></li>
              <li><a class="dropdown-item" href="#">Another action</a></li>
              <li>
                <hr class="dropdown-divider">
              </li>
              <li><a class="dropdown-item" href="#">Something else here</a></li>
            </ul>
          </li>
        </ul>
        <form class="d-flex mt-3" role="search">
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
          <button class="btn btn-success" type="submit">Search</button>
        </form>
      </div>
    </div>
    <img src="img/logohotel.png" alt="logo" style="height: 5%; width: 5%; margin-right: 3%;">
  </div>
</nav>
<!--<div class="clearfix"></div>-->