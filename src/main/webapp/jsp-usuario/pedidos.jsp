<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
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
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-usuario/pedidos.jsp">Pedidos</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/agregar-direccion.jsp">Agregar direccion</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/agregar-info-contacto.jsp">Agregar informacion de contacto</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/cambiar-password.jsp">Cambiar contraseña</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/cambiar-username.jsp">Cambiar nombre usuario</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/desactivar-cuenta.jsp">Desactivar mi cuenta</a></li>
        </ul>


    </aside>

    <%
        String username = (String) sessionActive.getAttribute("username");
        usuariosDAO usuarioDAOs = new usuariosDAO();
        usuarios usuario;

        usuario = usuarioDAOs.identificarNombre(username);
    %>
    <section>
        <h2>Informacion general de tus pedidos</h2>
        <h3>En este apartado se encuentran todos tus pedidos</h3>




    </section>

</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>
