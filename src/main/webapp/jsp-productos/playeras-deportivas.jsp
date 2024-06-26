<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.vistaProductos" %>
<%@ page import="Datos.vistaProductosDAO" %>
<%@ page import ="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name ="viewport" content="width=device-width, initial-scale=1.0">
    <title>Playeras deportivas</title>
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/styles.css">
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/productos.css">
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
            <li><a href="<%= request.getContextPath()%>/jsp-productos/productos.jsp">Playeras</a> </li>
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-productos/playeras-deportivas.jsp">Playeras deportivas</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-productos/playeras-oversize.jsp">Playeras oversize personalizadas</a></li>
        </ul>


    </aside>


    <section class="products-section">
        <%
            vistaProductosDAO vistaProductosDAO = new vistaProductosDAO();
            List<vistaProductos> productos = vistaProductosDAO.listarSlimFit();
            if (productos != null) {
                for (vistaProductos producto : productos) {
        %>
        <div class="product-card">
            <img src="<%= request.getContextPath()%>/img-productos/<%=producto.getNombre_producto()%>.jpg" alt="Foto de Cuzco" width="500">
            <h2><%=producto.getNombre_producto()%></h2>
            <h3>$<%=producto.getPrecio()%></h3>
            <p><%=producto.getDescripcion()%></p>
            <form action="<%= request.getContextPath()%>/SvAgregarCarrito" method="post">
                <input type="hidden" name="id_producto" value="<%=producto.getId_producto()%>">
                <input type="hidden" name="nombre_producto" value="<%=producto.getNombre_producto()%>">
                <input type="hidden" name="precio" value="<%=producto.getPrecio()%>">
                <input type="hidden" name="descripcion" value="<%=producto.getDescripcion()%>">
                <input type="hidden" name="categoria" value="<%=producto.getCategoria()%>">
                <div class="button-container">
                    <button type="submit">Agregar al carrito</button>
                </div>
            </form>
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
