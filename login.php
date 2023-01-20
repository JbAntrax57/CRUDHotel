<html>  
<head>  
    <title>Ingreso al Sistema de Hotel Jardin de Jaluco</title>  
   
    <link rel = "stylesheet" type = "text/css" href = "style.css">   
</head>  
<style>
    body{   
    background: #eee;  
}  
#frm{  
    border: solid gray 1px;  
    width:25%;  
    border-radius: 2px;  
    margin: 120px auto;  
    background: white;  
    padding: 50px;  
}  
#btn{  
    color: #fff;  
    background: #337ab7;  
    padding: 7px;  
    margin-left: 70%;  
}  
</style>
<body>  
    <div id = "frm">  
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
                <input type =  "submit" id = "btn" value = "Entrar" />  
            </p>  
        </form>  
    </div>  
      
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