<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
HttpSession sessionActive = request.getSession(false);
String usernameA = (String) sessionActive.getAttribute("username");
usuariosDAO usuarioDAO = new usuariosDAO();
%>
<html>
<head>
    <title>Inicio - Subli-Art</title>
    <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath()%>/css/estilos-registro.css" rel="stylesheet" type="text/css">
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
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/agregar-direccion.jsp">Agregar direccion</a> </li>
            <li><a class="active" href="<%= request.getContextPath()%>/jsp-usuario/cambiar-password.jsp">Cambiar contraseña</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/cambiar-username.jsp">Cambiar nombre usuario</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/desactivar-cuenta.jsp">Desactivar mi cuenta</a></li>
        </ul>

    </aside>

    <%
        usuarios usu = usuarioDAO.identificarNombre(usernameA);
    %>


    <section>
        <h2>Cambiar contraseña</h2>
        <h3>Ingresa tu nueva contraseña y envia el formulario.</h3>
        <form action = "<%= request.getContextPath()%>/SvCambiarPswdUsu"  class="form-register" method="post">
            <h4>Cambiar contraseña</h4>
            <input type="hidden" name="id_usuario" id="id_usuario" value="<%=usu.getId_usuario() %>">
            <input class ="controls" type="password" name="past_password" id="past_password" placeholder="Ingresa tu anterior contraseña" required>
            <input class ="controls" type="password" name="new_password" id="new_password" placeholder="Ingresa tu nueva contraseña" required>
            <button class="botons" type="submit">Cambiar contraseña</button>
        </form>
        <%
            String mensajeExito = (String) request.getAttribute("mensajeExito");
            if (mensajeExito != null) {
        %>
        <p>Contraseña cambiada correctamente.</p>

        <% } %>
        <%
            String msgFailed = (String) request.getAttribute("msgFailed");
            if (msgFailed != null) {
        %>
        <p>No se pudo cambiar la contraseña.</p>
        <p style = "color: red">Error:contraseña anterior incorrecta.</p>
        <% } %>

    </section>
</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>
