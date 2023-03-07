<?php
include_once "model/conexion.php";
$sentencia = $bd -> query("select * from reservaciones");
$reservacion = $sentencia->fetchAll(PDO::FETCH_OBJ); 
header("Pragma: public");
header("Expires: 0");
$filename = "reporte.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
?>

<table>
                        <thead>
                            <tr>
                                <th scope="col">Folio</th>
                                <th scope="col">Nombre</th>
                                <th scope="col">Fecha DEPS</th>
                                <th scope="col">Telefono</th>
                                <th scope="col">Residencia</th>
                                <th scope="col">Llegada</th>
                                <th scope="col">Salida</th>
                                <th scope="col">Habitacion</th>
                                <th scope="col">No. Personas</th>
                                <!-- <th scope="col">Deposito</th> -->
                                <th scope="col">Fecha Reservacion</th>
                                <th scope="col">Tipo Pago</th>
                                <th scope="col">Numero de Noches</th>
                                <th scope="col">Total</th>
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
                                <td><?php echo $dato->habitacion_id; ?></td>
                                <td><?php echo $dato->no_personas; ?></td>
                                <!-- <td><?php //echo $dato->deposito; ?></td> -->
                                <td><?php echo $dato->fecha_reservacion; ?></td>
                                <td><?php echo $dato->tipo_pago; ?></td>
                                <td><?php echo $dato->no_noches; ?></td>
                                <td><?php echo $dato->total; ?></td>
                            </tr>

                            <?php 
                                }
                            ?>

                        </tbody>
                    </table>