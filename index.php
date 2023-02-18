<?php include 'template/header.php' ?>

<?php
  include_once "model/conexion.php";
  $datos = array();
  $sql = $bd -> query("select deposito from reservaciones order by idReservaciones asc");
  $reservaciones = $sql->fetchAll(PDO::FETCH_OBJ);

  foreach ($reservaciones as $reservacion) {
    array_push($datos, $reservacion->deposito);
  }
  // print_r($datos);
?>
<!-- <div class="row mt-4">
      <div class="">
        <img src="img/login.jpg" class="img-fluid" alt="Responsive image">
      </div>
    </div>
</div> -->
<div>
  <div class="row">
    <div class="col-sm-12">
      <div class="col-sm-5" style="margin-top: 10%; margin-left: 10%">
        <div class="card shadow_general">
          <div style="" >
            <canvas id="grafica"></canvas>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js@latest/dist/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/axios/dist/axios.min.js"></script>
<script type="text/javascript">
  const axios = require('axios');
  const labels = ['Enero', 'Febrero', 'Marzo'];
  const gastos = {
      label: "Gastos",
      data: [10, 55, 60],
      borderColor: 'rgba(248, 37, 37, 0.8)',
      fill: false,
      tension: 0.1
  };

  const ingresos = {
      label: "Ingresos",
      data: [10, 40, 60],
      borderColor: 'rgba(69, 248, 84, 0.8)',
      fill: false,
      tension: 0.1
  };

  const dataset3 = {
      label: "Dataset 3",
      data: [20, 40, 55],
      borderColor: 'rgba(69, 140, 248, 0.8)',
      fill: false,
      tension: 0.1
  };

  const dataset4 = {
      label: "Dataset 4",
      data: [18, 40, 20],
      borderColor: 'rgba(245, 40, 145, 0.8)',
      fill: false,
      tension: 0.1
  };

  const graph = document.querySelector("#grafica");

  const data = {
      labels: labels,
      datasets: [gastos,ingresos,dataset3,dataset4]
  };

  const config = {
      type: 'line',
      data: data,
  };

  new Chart(graph, config);
</script>
<?php include 'template/footer.php' ?>