<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 29/05/2024
  Time: 10:44 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
  <div align="center">
    <h1>User Login</h1>
  </div>
  <form action="<%= request.getContextPath()%>/login" method="post" class="login">
    <input type="text" placeholder="Nombre de usuario" name="username">
    <input type="password" placeholder="Contraseña" name="password">
    <button type="submit">Iniciar sesion</button>
  </form>
</body>
</html>
