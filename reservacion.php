<?php include 'template/header.php' ?>
<body>
<div class="col-md-4">
            <div class="card">
                <div class="card-header">
                    Ingresar Reservacion:
                </div>
                <form class="p-4" method="POST" action="registrar.php">
                    <div class="mb-3">
                        <label class="form-label">Nombre: </label>
                        <input type="text" class="form-control" name="txtNombre" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha DEPS: </label>
                        <input type="date" class="form-control" name="txtEdad" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Telefono: </label>
                        <input type="text" class="form-control" name="txtSigno" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Correo Electronico: </label>
                        <input type="email" class="form-control" name="txtSigno" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Lugar Residencia: </label>
                        <input type="text" class="form-control" name="txtSigno" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha Llegada: </label>
                        <input type="date" class="form-control" name="txtEdad" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Fecha Salida: </label>
                        <input type="date" class="form-control" name="txtEdad" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Habitacion: </label>
                        <input type="text" class="form-control" name="txtSigno" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Numero de Personas: </label>
                        <input type="number" class="form-control" name="txtSigno" autofocus required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Deposito: </label>
                        <input type="number" class="form-control" name="txtDep" autofocus required>
                    </div>
                    <div class="form-group mb-3">
                        <label for="inputState">Tipo Pago</label>
                        <select id="inputState" class="form-control">
                            <option selected>Seleccionar...</option>
                            <option >Efectivo</option>
                            <option >Tarjeta</option>
                            <option >Transferencia</option>
                            <option >Credito</option>
                            <option >Cortesia</option>
                        </select>
                    </div>
                    <div class="d-grid">
                        <input type="hidden" name="oculto" value="1">
                        <input type="submit" class="btn btn-primary" value="Registrar">
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
