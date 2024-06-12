<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.vistaProductos" %>
<%@ page import="Datos.vistaProductosDAO" %>
<%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name ="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/styles.css">
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/productos.css">
</head>
<body>
<header>
    <nav>
        <ul>
            <li><a href="<%= request.getContextPath()%>/index.jsp">Inicio</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-productos/productos.jspductos.jsp">Productos</a></li>
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
            <li class="login"><a href="#">Bienvenido <%= username %> </a></li>
            <li class="login"><a href="./SvLogout">Cerrar sesion</a></li>
            <% } else { %>
            <li class="login"><a href="<%= request.getContextPath()%>/jsp/login.jsp">Iniciar sesion</a></li>
            <% } %>
        </ul>
    </nav>
</header>

<div class = "row">
    <aside>

        <ul class="lista">
            <li><a href="<%= request.getContextPath()%>/jsp-productos/productos.jspductos.jsp">Playeras</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-productos/playeras-deportivas.jsp">Playeras deportivas</a> </li>
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-productos/playeras-oversize.jsp">Playeras oversize</a></li>
        </ul>


    </aside>


    <section class="products-section">
        <%
            vistaProductosDAO vistaProductosDAO = new vistaProductosDAO();
            List<vistaProductos> productos = vistaProductosDAO.listarRelaxedFit();
            if (productos != null) {
                for (vistaProductos producto : productos) {
        %>
        <div class="product-card">
            <img src="<%= request.getContextPath()%>/img-productos/<%=producto.getNombre_producto()%>.jpg" alt="Foto de Cuzco" width="500">
            <h2><%=producto.getNombre_producto()%></h2>
            <h3>$<%=producto.getPrecio()%></h3>
            <p><%=producto.getDescripcion()%></p>
            <div class="button-container">
                <button>Agregar al carrito</button>
            </div>
        </div>
        <%
                }
            }
        %>

    </section>

</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>