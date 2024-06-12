<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page import="Modelo.pedidos" %>
<%@ page import="Datos.pedidosDAO" %>
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
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/agregar-info-contacto.jsp">Agregar informacion de contacto</a> </li>
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
        <h3>Ingresa todos los datos de contacto</h3>
        <form action = "<%= request.getContextPath()%>/SvAgregarDireccion"  class="form-register" method="post">
            <h4>Agregar informacion de contacto</h4>
            <input class ="controls" type="text" name="calle" id="calle" placeholder="Ingresa la calle" required>
            <input class ="controls" type="text" name="numero" id="numero" placeholder="Ingresa el numero" required>
            <input class ="controls" type="text" name="colonia" id="colonia" placeholder="Ingresa la colonia" required>
            <input class ="controls" type="text" name="cp" id="cp" placeholder="Ingresa el codigo postal" required>
            <input class ="controls" type="text" name="referencias" id="referencias" placeholder="Ingresa las referencias del lugar" required>
            <input class ="controls" type="text" name="num_telefonico" id="num_telefonico" placeholder="Ingrese el numero telefonico" required maxlength="10">
            <input type = "hidden" name = "id_usuario" id = "id_usuario" value =<%usuario.getId_usuario();%>>
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
