<?php
if(isset($_POST['filterFechaLlegada']) && isset($_POST['filterFechaSalida'])){
    $fsalida =  date('Y-m-d', strtotime($_POST['filterFechaSalida']));  
    $fllegada =  date('Y-m-d', strtotime($_POST['filterFechaLlegada']));  
    header('Location: vista.php?fllegada='.$fllegada.'&fsalida='.$fsalida);
    exit();
}
header('Location: vista.php');
exit();


?>