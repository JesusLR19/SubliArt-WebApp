<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.vistaProductos" %>
<%@ page import="Datos.vistaProductosDAO" %>
<%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name ="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pago</title>
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/styles.css">
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/productos.css">
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/tablas.css">
    <link rel = "icon" type="image/x-icon" href="<%= request.getContextPath()%>/assets/subliart.svg">
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="<%= request.getContextPath()%>/index.jsp">Inicio</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-productos/productos.jsp">Productos</a></li>
            <li><a href="#">Blog</a></li>
            <li><a href="#">Contacto</a></li>
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
            <li class="login"><a href="<%= request.getContextPath()%>/jsp-admin/inicio-admin.jsp">Administrar</a></li>
            <% }%>
            <li class="login"><a href="<%= request.getContextPath()%>/jsp-usuario/panel-usuario.jsp">Bienvenido <%= username %> </a></li>

            <li class="login">
                <a href="<%= request.getContextPath() %>/jsp-productos/carrito.jsp">
                    <img class = "logo" src="<%= request.getContextPath() %>/assets/carrito.svg" alt="Carrito">
                </a>
            </li>

            <li class="login"><a href="<%= request.getContextPath()%>/SvLogout">Cerrar sesion</a></li>

            <% } else { %>
            <li class="login"><a href="<%= request.getContextPath()%>/jsp/login.jsp">Iniciar sesion</a></li>
            <% } %>
        </ul>
    </nav>
</header>

<div class = "row">
    <aside>
        <ul class="lista">
            <li><a href="<%= request.getContextPath()%>/jsp-productos/productos.jsp">Playeras</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-productos/playeras-deportivas.jsp">Playeras deportivas</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-productos/playeras-oversize.jsp">Playeras oversize</a></li>
        </ul>
    </aside>

    <section>
        <h1>Pago Completado</h1>
        <p>Tu pago ha sido procesado exitosamente. Gracias por tu compra.</p>

        <a href="<%= request.getContextPath() %>/index.jsp">Volver al inicio</a>

    </section>

</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>
