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
  <form action="../SvLogin" method="post">
    <div>
      <label for="username">Username:</label>
      <input type="text" id="username" name="username" required>
    </div>
    <div>
      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required>
    </div>
    <div>
      <button type="submit">Iniciar sesion</button>
    </div>
    <li><a href="registro.jsp">Quiero registrarme</a></li>
  </form>
</body>
</html>
