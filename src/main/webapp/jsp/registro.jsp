<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 30/05/2024
  Time: 11:34 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form action="SvLogin" method="post">
    <div>
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="Nombre de usuario" required>
    </div>
    <div>
        <label for="apellido_p">Apellidos:</label>
        <input type="text" id="apellido_p" name="Apellido paterno" required>
        <input type="text" id="apellido_m" name="Apellido materno" required>
    </div>
    <div>
        <label for = "username">Username</label>
        <input type="text" id="username" name="username" required>
    </div>
    <div>
        <label for = "password">Contraseña</label>
        <input type="password" id="password" name="password" required>
    </div>
    <div>
        <button type="submit">Registrarme</button>
    </div>
</form>
</body>
</html>
