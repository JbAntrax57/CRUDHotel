<?php include 'template/header.php' ?>

<?php
    include_once "model/conexion.php";
    $data = getAll($bd);
    
    $reservacion = $data["reservacion"];
    $total_paginas = $data["total_paginas"];
    $pagina_actual = $data["pagina_actual"];
   function getAll ($bd){
    $where='';
    if(isset($_GET['fllegada']) && isset($_GET['fsalida'])){
        $fsalida =  date('Y-m-d', strtotime($_GET['fsalida']));  
        $fllegada =  date('Y-m-d', strtotime($_GET['fllegada']));  
        $where.=" where reservaciones.fecha_llegada >= '$fllegada' and reservaciones.fecha_salida <= '$fsalida'";
        
    }
    
    $registros_por_pagina = 10;
    $pagina_actual = isset($_GET['pagina']) ? $_GET['pagina'] : 1;
    $inicio = ($pagina_actual - 1) * $registros_por_pagina;
    $contador = $bd->query("select COUNT(*) as total from reservaciones JOIN habitaciones ON id = reservaciones.habitacion_id order by reservaciones.idReservaciones desc");
    $cantidad= $contador->fetch(PDO::FETCH_OBJ);
    $sentencia = $bd->query("select reservaciones.*, habitaciones.nom_habitacion from reservaciones JOIN habitaciones ON id = reservaciones.habitacion_id $where order by reservaciones.idReservaciones desc LIMIT $inicio, $registros_por_pagina");
    
    $reservacion = $sentencia->fetchAll(PDO::FETCH_OBJ);
    $total_paginas = ceil($cantidad->total / $registros_por_pagina);
    return ["reservacion"=>$reservacion,"total_paginas"=>$total_paginas,"pagina_actual"=>$pagina_actual];
 }
 function dateFilter (){
    
 }
?>

<head>
    <link rel="stylesheet" href="css/styleGeneral.css">
    
</head>
<div class="margin_table">
    <div class="row">
        <div class="col-sm-12">
            <!-- inicio alerta -->
            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'falta'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Error!</strong> Rellena todos los campos.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>


            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'registrado'){
            ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Registrado!</strong> Se agregaron los datos.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>



            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'error'){
            ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <strong>Error!</strong> Vuelve a intentar.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>



            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'editado'){
            ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Cambiado!</strong> Los datos fueron actualizados.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>

            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'cantidad'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Error!</strong> La cantidad no puede ser menor a la mitad del total.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'errcant'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Error!</strong> La cantidad debe coincidir con el restante a pagar.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'pagado'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Error!</strong> Monto Pagado.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'correcto'){
            ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <strong>Correcto!</strong> Se agrego el pago correctamente.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>

            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'eliminado'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Eliminado!</strong> Los datos fueron borrados.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>
            <?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'excede'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
                <strong>Eliminado!</strong> El pago excede el total.
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?>




            <input style="float: right;" type="button" onclick="location='reservacion.php'" value="Agregar Reservacion"
                class="btn btn_general rounded"></input>
            <button class="btn btn-success float-right" onclick="location='excel.php'"><i
                    class="bi bi-file-earmark-excel"></i></button>
            <br><br>
         
            <form method="POST" action="filtrar.php">
            <div class="mt-2">          
            <div class="col-sm-12 input-group mt-3 d-flex ">
            <div class="col-sm-2">
                
                            <label class="form-label">Fecha Llegada: </label>
                            <input type="date" class="form-control" name="filterFechaLlegada" autofocus required>
                        </div>
                        <div class="col-sm-2">
                            <label class="form-label">Fecha Salida: </label>
                            <input type="date" class="form-control" name="filterFechaSalida" autofocus required>

                        </div>
                        <div class="col-sm-2" style="margin-top: 2.8%;margin-left:0.5%">
                      <button class="btn btn-primary" onclick="location='vista.php'"><i class="bi bi-search"></i></button>
            <input type="submit" class="btn btn-primary" value="Registrar">
                   


                    </div>
                        </div>
                        
                </form>
                <div class="table_title rounded p-2">LISTA DE RESERVACIONES</div>
                <div class="mx-auto">
                
                    <!-- <table class="table align-middle table-responsive-xl"> -->
                    <div class="table-responsive">
                        <table class="table table-striped  table-hover table-borderless">
                            <thead class="table_theme">

                                <tr>
                                    <th scope="col">Folio</th>
                                    <th scope="col">Nombre</th>
                                    <th scope="col">Fecha DEPS</th>
                                    <th scope="col">Telefono</th>
                                    <th scope="col">Residencia</th>
                                    <th scope="col">Llegada</th>
                                    <th scope="col">Salida</th>
                                    <th scope="col">Habitacion</th>
                                    <th scope="col">N° Personas</th>
                                    <!--<th scope="col">Deposito</th>-->
                                    <th scope="col">Fecha Reservacion</th>
                                    <th scope="col">Tipo Pago</th>
                                    <th scope="col">Num Noches</th>
                                    <th scope="col">Total</th>
                                    <th scope="col" colspan="3">Opciones</th>
                                </tr>
                            </thead>
                            <tbody>

                                <?php 
                                foreach($reservacion as $dato){ 
                            ?>

                                <tr>
                                    <td scope="row"><?php echo $dato->no_folio; ?></td>
                                    <td><?php echo $dato->nombre; ?></td>
                                    <td><?php echo $dato->fecha_deps; ?></td>
                                    <td><?php echo $dato->num_telefono; ?></td>
                                    <td><?php echo $dato->lugar_residencia; ?></td>
                                    <td><?php echo $dato->fecha_llegada; ?></td>
                                    <td><?php echo $dato->fecha_salida; ?></td>
                                    <td><?php echo $dato->nom_habitacion; ?></td>
                                    <td style="text-align: center;"><?php echo $dato->no_personas; ?></td>
                                    <!--<td><//?php echo $dato->deposito; ?></td>-->
                                    <td><?php echo $dato->fecha_reservacion; ?></td>
                                    <td><?php echo $dato->tipo_pago; ?></td>
                                    <td style="text-align: center;"><?php echo $dato->no_noches; ?></td>
                                    <td><?php echo $dato->total; ?></td>
                                    <?php if ($dato->tipo_pago != 'Cortesia'){ ?>
                                    <td><a class="text-success"
                                            href="pagos.php?codigo=<?php echo $dato->idReservaciones; ?>&numhab=<?php echo $dato->habitacion_id; ?>"><i
                                                class="bi bi-currency-dollar"></i></a></td>
                                    <?php }?>
                                    <td><a class="text-success"
                                            href="editar.php?codigo=<?php echo $dato->idReservaciones; ?>&numhab=<?php echo $dato->habitacion_id; ?>"><i
                                                class="bi bi-pencil-square"></i></a></td>
                                    <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger"
                                            href="eliminar.php?codigo=<?php echo $dato->idReservaciones; ?>&habitacion=<?php echo $dato->habitacion_id; ?>"><i
                                                class="bi bi-trash"></i></a></td>
                                    <!-- <td><a class="text-success" href="vista.php?codigo=<?//php echo $dato->no_folio; ?>"><i class="bi bi-eye-fill"></i></a></td>-->
                                    <!-- <td><a onclick="return confirm('Estas seguro de eliminar?');" class="text-danger" href="eliminar.php?codigo=<?php echo $dato->idReservaciones; ?>"><i class="bi bi-trash"></i></a></td> -->
                                </tr>
                               
                            <?php 
                                
                            }
                            if($pagina_actual >1){                  
                        ?>
                            <a class = "pagination-link prev"href='vista.php?pagina=<?php echo ($pagina_actual-1); ?>'>
                                <?php 
                                echo '<';
                        ?>
                            </a>
                            <?php 
                            }
                           // for ($i = 1; $i <= $total_paginas; $i++) {                               
                        ?>
                            <!--<a class="pagination-link" href='vista.php?pagina=<?php echo $i; ?>'>
                                <?php 
                               // echo $i;
                        ?>
                            </a>-->
                            <?php 
                            //}
                             if($pagina_actual < $total_paginas){
                        ?>
                            <a class="pagination-link next" href='vista.php?pagina=<?php echo ($pagina_actual+1); ?>'>
                                <?php 
                                echo '>';
                        ?>
                            </a>
                            <?php
                         } 
                         ?>

<?php 
                if(isset($_GET['mensaje']) and $_GET['mensaje'] == 'fechaigual'){
            ?>
            <div class="alert alert-warning alert-dismissible fade show" role="alert">
            <strong>Error!</strong> Estas fechas ya no estan disponibles!
            <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
            <?php 
                }
            ?> 
                               
                              

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

        <?php include 'template/footer.php' ?>