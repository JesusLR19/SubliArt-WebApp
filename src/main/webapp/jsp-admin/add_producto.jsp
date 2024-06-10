<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page import="Datos.productosDAO" %>
<%@ page import="Modelo.productos" %>
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
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-admin/add_producto.jsp">Añadir producto</a> </li>
            <li><a href="#">Eliminar producto</a> </li>
            <li><a href="#">Editar producto</a> </li>
            <li><a href="#">Agregar administrador</a></li>
        </ul>
    </aside>

    <section>
        <h2>Lista de productos</h2>

        <div class="container">
            <table class="table">
                <caption>Productos</caption>
                <thead>
                <tr>
                    <th>id_producto</th>
                    <th>nombre_producto</th>
                    <th>id_descripcion</th>
                    <th>id_categoria</th>
                    <th>precio</th>
                </tr>
                </thead>
                <tbody>
                <%
                    productosDAO productoDAO = new productosDAO();
                    List<productos> productosList = productoDAO.listarProductos();
                    if(productosList != null){
                        for (productos producto : productosList) {
                %>
                <tr>
                    <td data-label="id_producto"><%=producto.getId_producto() %></td>
                    <td data-label="nombre_producto"><%=producto.getNombre_producto() %></td>
                    <td data-label="id_descripcion"><%=producto.getId_descripcion() %></td>
                    <td data-label="id_categoria"><%=producto.getId_categoria()%></td>
                    <td data-label="precio"><%=producto.getPrecio() %></td>
                </tr>
                <%
                        }
                    }
                %>


                </tbody>
            </table>
        </div>


        <form action = "<%= request.getContextPath()%>/SvAddProducto"  class="form-register" method="get">
            <h4>Agregar producto</h4>
            <input class ="controls" type="text" name="nombre_producto" id="nombre_producto" placeholder="Nombre del producto" required>
            <h5>id_descripcion</h5>
            <select id="id_descripcion" name="id_descripcion" class="controls" required>
                <option value="1">Negra, Mediana, Poliester</option>
                <option value="2">Blanca, Grande, Algodon</option>
            </select>
            <h5>id_categoria</h5>
            <select id="id_categoria" name="id_categoria" class="controls" required>
                <option value="1">SlimFit</option>
                <option value="2">MuscleFit</option>
                <option value="3">RelaxedFit</option>
                <option value="4">VintageFit</option>
            </select>
            <input class ="controls" type="text" name="precio" id="precio" placeholder="Ingresa el precio" required>
            <button class="botons" type="submit">Agregar producto</button>
        </form>
        <%
        String mensajeExito = (String) request.getAttribute("mensajeExito");
        if (mensajeExito != null) {
        %>
        <p>Producto agregado correctamente.</p>

        <% } %>

    </section>
</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>