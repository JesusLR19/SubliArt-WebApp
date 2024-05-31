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
  <link href="../css/styles.css" rel="stylesheet" type="text/css">
  </script>
</head>
<body>
<nav class="navbar">
  <div class="navbar-container">
    <a class="navbar-brand" href="../index.jsp">Inicio</a>
  </div>
</nav>
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
    <a href="registro.jsp">Quiero registrarme</a>
  </form>
  <%
    String errorMessage = (String) request.getAttribute("errorMessage");
    if (errorMessage != null) {
  %>
  <div style="color: red;"><%= errorMessage %></div>
  <%
    }
  %>
</body>
</html>
