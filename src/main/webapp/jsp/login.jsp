<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 29/05/2024
  Time: 10:44 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>Login</title>
  <link href="../css/styles.css" rel="stylesheet" type="text/css">
  <link href="../css/estilos-registro.css" rel="stylesheet" type="text/css">
</head>
<body>
  <header>
    <nav>
      <ul>
        <li><a href="../index.jsp">Inicio</a></li>
      </ul>
    </nav>
  </header>

  <form action = "../SvLogin" method="post" class="form-register">
    <h4>Inicio de sesion</h4>
    <input class ="controls" type="text" name="username" id="username" placeholder="Ingrese un nombre de usuario" required>
    <input class ="controls" type="password" name="password" id="password" placeholder="Ingrese su contraseña" required>
    <p>Estoy de acuerdo con <a href="#">Terminos y condiciones</a> </p>
    <input class ="botons" type="submit" value ="Iniciar sesion">
    <p><a href="./registro.jsp">Aun no tengo cuenta</a></p>
  </form>




</body>
</html>
