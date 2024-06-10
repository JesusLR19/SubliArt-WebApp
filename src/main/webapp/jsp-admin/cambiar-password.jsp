<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
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
    <title>Inicio - Subli-Art</title>
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
            <li><a href="<%= request.getContextPath()%>/jsp-admin/inicio-admin.jsp">Inicio</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/listar-usuarios.jsp">Lista Usuarios</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/identificar-usuario.jsp">Identificar usuario</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/eliminar-usuario.jsp">Desactivar usuario</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/activar-usuario.jsp">Activar usuario</a> </li>
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-admin/cambiar-password.jsp">Cambiar contraseña</a> </li>
            <li><a href="#">Añadir producto</a> </li>
            <li><a href="#">Eliminar producto</a> </li>
            <li><a href="#">Editar producto</a> </li>
            <li><a href="#">Agregar administrador</a></li>
        </ul>
    </aside>

    <%
        usuarios usu = usuarioDAO.identificarNombre(usernameA);
    %>


    <section>
        <h2>Cambiar contraseña</h2>
        <h3>Ingresa tu nueva contraseña y envia el formulario.</h3>
        <form action = "<%= request.getContextPath()%>/SvCambiarPswd"  class="form-register" method="post">
            <h4>Cambiar contraseña</h4>
            <h5>id_usuario</h5>
            <input class ="controls" type="text" name="id_usuario" id="id_usuario" value="<%=usu.getId_usuario() %>" readonly>
            <input class ="controls" type="password" name="password" id="password" placeholder="Ingresa nueva contraseña" required>
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

        <% } %>

    </section>
</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>
