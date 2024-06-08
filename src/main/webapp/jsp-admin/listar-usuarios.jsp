<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page import ="java.io.*, java.util.*"%>
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
    <title>Inicio - Subli-Art</title>
    <link href="../css/styles.css" rel="stylesheet" type="text/css">
    <link href="../css/estilos-registro.css" rel="stylesheet" type="text/css">
</head>

<body>

<header>
    <nav>
        <ul>
            <li><a href="../index.jsp">Inicio</a></li>
        </ul>
    </nav>
</header>


<div class = "row">
    <aside>

        <ul class="lista">
            <li><a href="inicio-admin.jsp">Inicio</a> </li>
            <li><a class = "active" href="listar-usuarios.jsp">Lista Usuarios</a> </li>
            <li><a href="identificar-usuario.jsp">Identificar usuario</a></li>
            <li><a href="#">Cambiar contraseña</a> </li>
            <li><a href="#">Añadir producto</a> </li>
            <li><a href="#">Eliminar producto</a> </li>
            <li><a href="#">Editar producto</a> </li>
            <li><a href="#">Agregar administrador</a></li>
        </ul>


    </aside>
    <section>
        <h2>Lista de usuarios</h2>
        <table>
            <tr>
                <th>id_usuario</th>
                <th>Nombre</th>
                <th>ApellidoP</th>
                <th>ApellidoM</th>
                <th>Username</th>
                <th>id_contacto</th>
                <th>id_rol</th>
                <th>Estatus</th>
            </tr>
            <%
                usuariosDAO usuarioDAO2 = new usuariosDAO();
                List<usuarios> usuarios = usuarioDAO2.listar();
                if(usuarios != null){
                    for (usuarios usuario : usuarios) {
            %>
            <tr>
                <td><%=usuario.getId_usuario() %></td>
                <td><%=usuario.getNombre() %></td>
                <td><%=usuario.getApellido_p() %></td>
                <td><%=usuario.getApellido_m() %></td>
                <td><%=usuario.getUsername() %></td>
                <td><%=usuario.getId_contacto() %></td>
                <td><%=usuario.getId_rol() %></td>
                <td><%=usuario.isEstatus() %></td>
            </tr>
            <%
                    }
                }
            %>
        </table>
    </section>
</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>