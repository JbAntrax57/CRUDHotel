<?php include 'template/header.php' ?>

<?php
    include_once "model/conexion.php";
    $sentencia = $bd -> query("select * from reservaciones");
    $reservacion = $sentencia->fetchAll(PDO::FETCH_OBJ);
    //print_r($persona);
?>
<nav class="navbar navbar-dark bg-primary">
  <!-- Navbar content -->
</nav>
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">
         
                        </tbody>
                    </table>
                    
                </div>
            </div>
        </div>
        

<?php include 'template/footer.php' ?>