<%@ page import="Datos.usuariosDAO" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>Inicio - Subli-Art</title>
    <link href="./css/styles.css" rel="stylesheet" type="text/css">
</head>
<body>
<!-- Barra de navegación -->
<nav class="navbar">
    <div class="navbar-container">
        <a class="navbar-brand" href="#">Subli-Art</a>
        <div class="navbar-links">
            <a class="nav-link" href="#">Inicio</a>
            <a class="nav-link" href="#">Productos</a>
            <a class="nav-link" href="#">Quiénes somos</a>
            <a class="nav-link" href="#">Contacto</a>
        </div>
        <div class="navbar-login">
            <%
            %>
            <%
                HttpSession sessionActive = request.getSession(false);
                if (sessionActive != null && sessionActive.getAttribute("username") != null) {
                    String username = (String) sessionActive.getAttribute("username");
            %>
            <% usuariosDAO usuarioDAO = new usuariosDAO();
                int rol = usuarioDAO.getRol(username);
                if (rol == 1) {
            %>
            <a class="nav-link" href="./jsp-admin/inicio-admin.jsp">Administrar</a>
            <% }%>
            <a class="nav-link" href="#">Bienvenido <%= username %> </a>
            <a class="nav-link" href="./SvLogout">Cerrar sesión</a>
            <% } else { %>
            <a class="nav-link" href="jsp/login.jsp">Login</a>
            <% } %>
        </div>

    </div>
</nav>




</body>
</html>
