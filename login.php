<html>  
<head>  
    <title>Ingreso al Sistema de Hotel Jardin de Jaluco</title>  
    <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <link rel = "stylesheet" type = "text/css" href = "style.css">   
</head>  
<style>
	body{
		width: 100%;
	    height: calc(100%);
	    /*background: #007bff;*/
	}
	main#main{
		width:100%;
		height: calc(100%);
		background:white;
	}
	#login-right{
		position: absolute;
		right:0;
		width:40%;
		height: calc(100%);
		background:white;
		display: flex;
		align-items: center;
	}
	#login-left{
		position: absolute;
		left:0;
		width:60%;
		height: calc(100%);
		background:#59b6ec61;
		display: flex;
		align-items: center;
		background: url(img/login.jpg);
	    background-repeat: no-repeat;
	    background-size: cover;
	}
	#login-right .card{
		margin: auto;
		z-index: 1
	}
	.logo {
    margin: auto;
    font-size: 8rem;
    background: white;
    padding: .5em 0.7em;
    border-radius: 50% 50%;
    color: #000000b3;
    z-index: 10;
    background: url(img/logohotel.png);
}
div#login-left::before,div#login-right::before {
    content: "";
    position: absolute;
    top: 0;
    left: 0;
    width: calc(100%);
    height: calc(100%);
    background: #00c4ff36;
}

</style>
<body>  
    
<main id="main" class=" bg-dark">
  		<div id="login-left">
  			<div class="logo">
  				<span class="icofont-5-star-hotel"></span>
  			</div>
  		</div>
  		<div id="login-right">
  			<div class="card col-md-8">
  				<div class="card-body">
  					<form id="login-form" name="f1" action = "acceso.php" onsubmit = "return validation()" method = "POST">
  						<div class="form-group">
  							<label for="user" class="control-label">Nombre de Usuario</label>
  							<input type="text" id="user" name="user" class="form-control">
  						</div>
  						<div class="form-group">
  							<label for="pass" class="control-label">Contraseña</label>
  							<input type="password" id="pass" name="pass" class="form-control">
  						</div>
  						<input type =  "submit" id = "btn" value = "Entrar" class="btn-sm btn-block btn-wave col-md-6 btn-primary"/>

  					</form>
  				</div>
  			</div>
  		</div>
   

  </main>


  <a href="#" class="back-to-top"><i class="icofont-5-star-hotel"></i></a>



    <!--<div id = "frm">  
        <h1>Bienvenido al Sistema</h1>  
        <form name="f1" action = "acceso.php" onsubmit = "return validation()" method = "POST">  
            <p>  
                <label> Nombre de Usuario: </label>  
                <input type = "text" id ="user" name  = "user" />  
            </p>  
            <p>  
                <label> Contraseña: </label>  
                <input type = "password" id ="pass" name  = "pass" />  
            </p>  
            <p>     
                <input type =  "submit" id = "btn" value = "Entrar" class="btn-sm btn-block btn-wave col-md-6 btn-primary"/>  
            </p>  
        </form>  
    </div>  
--> 
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
</body>     
</html> 