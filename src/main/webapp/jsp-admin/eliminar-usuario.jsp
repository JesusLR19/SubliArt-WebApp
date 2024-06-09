<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%
    HttpSession sessionActive = request.getSession(false);
    String usernameA = (String) sessionActive.getAttribute("username");
    usuariosDAO usuarioDAO = new usuariosDAO();
    int rol = 0;

    rol = usuarioDAO.getRol(usernameA);
    if (rol == 0){
        response.sendRedirect("../jsp/error.jsp");
    } else if (rol == 2) {
        response.sendRedirect("../jsp/error.jsp");
    }
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>Desactivar usuario</title>
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
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-admin/eliminar-usuario.jsp">Desactivar usuario</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/cambiar-password.jsp">Cambiar contraseña</a> </li>
            <li><a href="#">Añadir producto</a> </li>
            <li><a href="#">Eliminar producto</a> </li>
            <li><a href="#">Editar producto</a> </li>
            <li><a href="#">Agregar administrador</a></li>
        </ul>


    </aside>
    <section>
        <h2>Desactivar Usuario</h2>
        <h3>Ingresar nombre de usuario para colocar su estatus en false.</h3>
        <form action = "<%= request.getContextPath()%>/SvBorrarUsu"  class="form-register">
            <h4>Usuario a desactivar</h4>
            <input class ="controls" type="text" name="username" id="username" placeholder="Ingrese un nombre de usuario" required>
            <button class="botons" type="submit">Desactivar</button>
        </form>
        <%
            String mensajeExito = (String) request.getAttribute("mensajeExito");
            if (mensajeExito != null) {
        %>
        <p>Usuario desactivado correctamente.</p>

        <% } %>
    </section>
</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>