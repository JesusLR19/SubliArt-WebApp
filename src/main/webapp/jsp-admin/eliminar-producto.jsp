<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page import="Datos.almacenDAO" %>
<%@ page import="Modelo.almacen" %>
<%@ page import ="java.io.*, java.util.*"%>
<%
    HttpSession sessionActive = request.getSession(false);
    String usernameA = (String) sessionActive.getAttribute("username");
    usuariosDAO usuarioDAO = new usuariosDAO();
    int rol = 0;
    if(usernameA != null) {
        rol = usuarioDAO.getRol(usernameA);
    }
    if (rol != 1){
        response.sendRedirect("../jsp/error.jsp");
    }
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Productos-admin</title>
    <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath()%>/css/estilos-registro.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath()%>/css/tablas.css" rel="stylesheet" type="text/css">
    <link rel = "icon" type="image/x-icon" href="<%= request.getContextPath()%>/assets/subliart.svg">
</head>

<body>

<header>
    <nav>
        <ul>
            <li><a href="<%= request.getContextPath()%>/index.jsp">Inicio</a></li>
        </ul>
    </nav>
</header>


<div class = "row">
    <aside>

        <ul class="lista">
            <li><a href="<%= request.getContextPath()%>/jsp-admin/inicio-admin.jsp">Inicio-admin</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/listar-usuarios.jsp">Lista Usuarios</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/identificar-usuario.jsp">Identificar usuario</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/eliminar-usuario.jsp">Desactivar usuario</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/activar-usuario.jsp">Activar usuario</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/cambiar-password.jsp">Cambiar contraseña</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/add_producto.jsp">Añadir producto</a> </li>
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-admin/eliminar-producto.jsp">Eliminar producto</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/editar-producto.jsp">Editar producto</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/agregar-administrador.jsp">Agregar administrador</a></li>
        </ul>
    </aside>

    <section>
        <h2>Lista de productos en almacen</h2>

        <div class="container">
            <table class="table">
                <caption>Productos en almacen</caption>
                <thead>
                <tr>
                    <th>id_producto</th>
                    <th>cantidad</th>
                    <th>estatus</th>
                </tr>
                </thead>
                <tbody>
                <%
                    almacenDAO almacenDAOs = new almacenDAO();
                    List<almacen> almacen = almacenDAOs.listar();
                    if(almacen != null){
                        for (almacen a : almacen) {
                %>
                <tr>
                    <td data-label="id_producto"><%=a.getId_producto() %></td>
                    <td data-label="cantidad"><%=a.getCantidad() %></td>
                    <td data-label="estatus"><%=a.isEstatus() %></td>
                </tr>
                <%
                        }
                    }
                %>


                </tbody>
            </table>
        </div>


        <form action = "<%= request.getContextPath()%>/SvModificarAlmacen"  class="form-register" method="post">
            <h4>Modificar cantidad y estatus</h4>
            <h5>id_producto</h5>
            <select id="id_producto" name="id_producto" class="controls" required>
                <option value="1">1. Camiseta personalizada</option>
                <option value="2">2. Playera personalizada</option>
            </select>
            <h5>cantidad</h5>
            <input class ="controls" type="text" name="cantidad" id="cantidad" placeholder="Ingresa la cantidad" required>
            <select id="estatus" name="estatus" class="controls" required>
                <option value="true">Activar</option>
                <option value="false">Desactivar</option>
            </select>
            <button class="botons" type="submit">Modificar producto</button>
        </form>
        <%
            String mensajeExito = (String) request.getAttribute("mensajeExito");
            if (mensajeExito != null) {
        %>
        <p>Producto modificado correctamente.</p>

        <% } %>
        <%
            String msgError = (String) request.getAttribute("msgError");
            if (msgError != null) {
        %>
        <p>Error al modificar el producto.</p>

        <% } %>

    </section>
</div>

<footer>
    <h2></h2>
</footer>

</body>
</html>
