<?php
include_once "model/conexion.php";
$sentencia = $bd -> query("select * from cortecaja ");
$reservacion = $sentencia->fetchAll(PDO::FETCH_OBJ); 
header("Pragma: public");
header("Expires: 0");
$filename = "cortecaja.xls";
header("Content-type: application/x-msdownload");
header("Content-Disposition: attachment; filename=$filename");
header("Pragma: no-cache");
header("Cache-Control: must-revalidate, post-check=0, pre-check=0");
?>

<table>
                        <thead>
                            <tr>
                                <th scope="col">Folio</th>
                                <th scope="col">Total de Caja</th>
                                <th scope="col">Gasto Total</th>
                                <th scope="col">Saldo Restante</th>
                                <th scope="col">Saldo Contado</th>
                                <th scope="col">Fecha del Corte</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                            <?php 
                                foreach($reservacion as $dato){ 
                            ?>

                             <tr>
                                <td scope="row"><?php echo $dato->folio; ?></td>
                                <td><?php echo $dato->total_caja; ?></td>
                                <td><?php echo $dato->gasto_total; ?></td>
                                <td><?php echo $dato->saldo_restante; ?></td>
                                <td><?php echo $dato->saldo_contado; ?></td>
                                <td><?php echo $dato->fecha_corte; ?></td>
                               
                            </tr>

                            <?php 
                                }
                            ?>

                        </tbody>
                    </table>