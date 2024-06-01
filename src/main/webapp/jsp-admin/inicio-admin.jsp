<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude
  Date: 01/06/2024
  Time: 12:37 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
  <title>Inicio - Subli-Art</title>
  <link href="../css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Barra de navegación -->
<nav class="navbar">
  <div class="navbar-container">
    <a class="navbar-brand" href="index.jsp">Subli-Art</a>
    <div class="navbar-links">
      <a class="nav-link" href="#"></a>
      <a class="nav-link" href="#"></a>
      <a class="nav-link" href="#"></a>
      <a class="nav-link" href="#"></a>
    </div>
    <div class="navbar-login">
      <%
        HttpSession sessionActive = request.getSession(false);
        if (sessionActive != null && sessionActive.getAttribute("username") != null) {
          String username = (String) sessionActive.getAttribute("username");
      %>
      <a class="nav-link" href="#">Bienvenido <%= username %> </a>
      <a class="nav-link" href="../SvLogout">Cerrar sesión</a>
      <% } else { %>
      <a class="nav-link" href="jsp/login.jsp">Login</a>
      <% } %>
    </div>

  </div>
</nav>
</body>
</html>
