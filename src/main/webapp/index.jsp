<%@ page import="Datos.usuariosDAO" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>Inicio - Subli-Art</title>
    <link href="./css/styles.css" rel="stylesheet" type="text/css">
    <link rel ="stylesheet" href = "./css/bootstrap.min.css">
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
    <div class="container text-center">
        <div class="row">
            <div class="col">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card" style="width: 18rem;">
                    <img src="..." class="card-img-top" alt="...">
                    <div class="card-body">
                        <h5 class="card-title">Card title</h5>
                        <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                        <a href="#" class="btn btn-primary">Go somewhere</a>
                    </div>
                </div>
            </div>
        </div>
    </div>




</body>
</html>
