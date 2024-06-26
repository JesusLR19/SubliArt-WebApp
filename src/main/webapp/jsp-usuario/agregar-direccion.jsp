<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page import="Modelo.contacto" %>
<%@ page import="Datos.contactoDAO" %>
<%@ page import="java.util.List" %>
<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude
  Date: 01/06/2024
  Time: 12:37 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%
    HttpSession sessionActive = request.getSession(false);
    String usernameA = (String) sessionActive.getAttribute("username");
    usuariosDAO usuarioDAO = new usuariosDAO();
    int rol = 0;

    rol = usuarioDAO.getRol(usernameA);
    if (rol == 0){
        response.sendRedirect("../jsp/error.jsp");
    }
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>Pedidos</title>
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
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/pedidos.jsp">Pedidos</a></li>
            <li><a class="active" href="<%= request.getContextPath()%>/jsp-usuario/agregar-direccion.jsp">Agregar direccion</a> </li>

            <li><a href="<%= request.getContextPath()%>/jsp-usuario/cambiar-password.jsp">Cambiar contraseña</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/cambiar-username.jsp">Cambiar nombre usuario</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/desactivar-cuenta.jsp">Desactivar mi cuenta</a></li>
        </ul>


    </aside>

    <%
        usuariosDAO usuarioDAOs = new usuariosDAO();
        usuarios usuario;

        usuario = usuarioDAOs.identificarNombre(usernameA);

    %>
    <section>
        <h2>Agregar direccion</h2>
        <h3>Direccion predeterminada</h3>
        <div class="container">
            <table class="table">

                <thead>
                <tr>
                    <th>calle</th>
                    <th>numero</th>
                    <th>colonia</th>
                    <th>cp</th>
                    <th>referencias</th>
                    <th>num_telefonico</th>
                </tr>
                </thead>
                <tbody>
                <%
                    contactoDAO contactoDAOs = new contactoDAO();
                    List<contacto> direccion = contactoDAOs.obtenerById(usuario.getId_contacto());
                    if(direccion != null){
                        for (contacto dir : direccion) {
                %>
                <tr>
                    <td data-label="calle"><%=dir.getCalle() %></td>
                    <td data-label="numero"><%=dir.getNumero() %></td>
                    <td data-label="colonia"><%=dir.getColonia() %></td>
                    <td data-label="cp"><%=dir.getCp() %></td>
                    <td data-label="referencias"><%=dir.getReferencias() %></td>
                    <td data-label="num_telefonico"><%=dir.getNum_telefonico() %></td>
                </tr>
                <%
                        }
                    }
                %>


                </tbody>
            </table>
        </div>

        <h3>Ingresa todos los datos de contacto</h3>
        <form action="<%= request.getContextPath()%>/SvAgregarDireccion" class="form-register" method="post">
            <h4>Actualizar/Agregar información de contacto</h4>
            <input class="controls" type="text" name="calle" id="calle" placeholder="Ingresa la calle" required>
            <input class="controls" type="text" name="numero" id="numero" placeholder="Ingresa el número" required>
            <input class="controls" type="text" name="colonia" id="colonia" placeholder="Ingresa la colonia" required>
            <input class="controls" name="cp" id="cp" placeholder="Ingresa el código postal" required>
            <input class="controls" type="text" name="referencias" id="referencias" placeholder="Ingresa las referencias del lugar" required>
            <input class="controls" type="text" name="num_telefonico" id="num_telefonico" placeholder="Ingrese el número telefónico" required maxlength="10" pattern="\d{10}" title="Debe contener 10 dígitos numéricos">
            <input type="hidden" name="id_usuario" id="id_usuario" value="<%= usuario.getId_usuario() %>">
            <button class="botons" type="submit">Enviar</button>
        </form>
        <%
            String mensajeExito = (String) request.getAttribute("mensajeExito");
            if (mensajeExito != null) {
        %>
        <p>Direccion agregada correctamente</p>

        <% } %>

    </section>

</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>
