<%@ page import="Datos.usuariosDAO" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>Inicio - Subli-Art</title>
    <link href="./css/styles.css" rel="stylesheet" type="text/css">
    <link href="./css/estilos-registro.css" rel="stylesheet" type="text/css">
<%--    <link rel ="stylesheet" href = "./css/bootstrap.min.css">--%>
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

    <div class="posts">
        <h1> </h1>
        <div class="post">
            <img src="./img/dtf.jpg" alt="Foto de Cuzco" width="500">
            <h2>Tecnologia DTF</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error iste sint amet aliquid, debitis vitae, praesentium adipisci laborum inventore facilis ut ducimus voluptate blanditiis non neque quod dolorem quisquam quo.</p>
        </div>

        <div class="post">
            <img src="./img/serigrafia.jpg" alt="Foto de Cuzco" width="500">
            <h2>Serigrafia</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error iste sint amet aliquid, debitis vitae, praesentium adipisci laborum inventore facilis ut ducimus voluptate blanditiis non neque quod dolorem quisquam quo.</p>
        </div>

        <div class="post">
            <img src="./img/sublimacion.jpg" alt="Foto de Cuzco" width="500">
            <h2>Sublimacion</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error iste sint amet aliquid, debitis vitae, praesentium adipisci laborum inventore facilis ut ducimus voluptate blanditiis non neque quod dolorem quisquam quo.</p>
        </div>

        <div class="post">
            <img src="./img/cuzco.jpg" alt="Foto de Cuzco" width="500">
            <h2>Titulo del Post</h2>
            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Error iste sint amet aliquid, debitis vitae, praesentium adipisci laborum inventore facilis ut ducimus voluptate blanditiis non neque quod dolorem quisquam quo.</p>
        </div>

    </div>



</body>
</html>
