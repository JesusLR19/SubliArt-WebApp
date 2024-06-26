<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page import ="java.util.*"%>
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

<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>Listado de usuarios</title>
    <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css">
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
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-admin/listar-usuarios.jsp">Lista Usuarios</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/identificar-usuario.jsp">Identificar usuario</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/eliminar-usuario.jsp">Desactivar usuario</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/activar-usuario.jsp">Activar usuario</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/cambiar-password.jsp">Cambiar contraseña</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/add_producto.jsp">Añadir producto</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/eliminar-producto.jsp">Eliminar producto</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/editar-producto.jsp">Editar producto</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-admin/agregar-administrador.jsp">Agregar administrador</a></li>
        </ul>


    </aside>
    <section>
        <h2>Lista de usuarios</h2>

        <div class="container">
            <table class="table">
                <caption>Usuarios Activos</caption>
                <thead>
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
                </thead>
                <tbody>
                <%

                    List<usuarios> usuariosActivos = usuarioDAO.listarActivos();
                    if(usuariosActivos != null){
                        for (usuarios usuario : usuariosActivos) {
                %>
                <tr>
                    <td data-label="id_usuario"><%=usuario.getId_usuario() %></td>
                    <td data-label="Nombre"><%=usuario.getNombre() %></td>
                    <td data-label="ApellidoP"><%=usuario.getApellido_p() %></td>
                    <td data-label="ApellidoM"><%=usuario.getApellido_m() %></td>
                    <td data-label="Username"><%=usuario.getUsername() %></td>
                    <td data-label="id_contacto"><%=usuario.getId_contacto() %></td>
                    <td data-label="id_rol"><%=usuario.getId_rol() %></td>
                    <td data-label="id_rol"><%=usuario.isEstatus() %></td>
                </tr>
                <%
                        }
                    }
                %>


                </tbody>
            </table>
        </div>

  <%--      <div class="container">
            <table class="table">
                <caption>Usuarios Desactivados</caption>
                <thead>
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
                </thead>
                <tbody>
                <%

                    List<usuarios> usuariosInactivos = usuarioDAO.listarInactivos();
                    if(usuariosInactivos != null){
                        for (usuarios usuario : usuariosInactivos) {
                %>
                <tr>
                    <td data-label="id_usuario"><%=usuario.getId_usuario() %></td>
                    <td data-label="Nombre"><%=usuario.getNombre() %></td>
                    <td data-label="ApellidoP"><%=usuario.getApellido_p() %></td>
                    <td data-label="ApellidoM"><%=usuario.getApellido_m() %></td>
                    <td data-label="Username"><%=usuario.getUsername() %></td>
                    <td data-label="id_contacto"><%=usuario.getId_contacto() %></td>
                    <td data-label="id_rol"><%=usuario.getId_rol() %></td>
                    <td data-label="id_rol"><%=usuario.isEstatus() %></td>
                </tr>
                <%
                        }
                    }
                %>


                </tbody>
            </table>
        </div>

        <div class="container">
            <table class="table">
                <caption>Usuarios registrados</caption>
                <thead>
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
                </thead>
                <tbody>
                <%
                    usuariosDAO usuarioDAO2 = new usuariosDAO();
                    List<usuarios> usuarios = usuarioDAO2.listar();
                    if(usuarios != null){
                        for (usuarios usuario : usuarios) {
                %>
                <tr>
                    <td data-label="id_usuario"><%=usuario.getId_usuario() %></td>
                    <td data-label="Nombre"><%=usuario.getNombre() %></td>
                    <td data-label="ApellidoP"><%=usuario.getApellido_p() %></td>
                    <td data-label="ApellidoM"><%=usuario.getApellido_m() %></td>
                    <td data-label="Username"><%=usuario.getUsername() %></td>
                    <td data-label="id_contacto"><%=usuario.getId_contacto() %></td>
                    <td data-label="id_rol"><%=usuario.getId_rol() %></td>
                    <td data-label="id_rol"><%=usuario.isEstatus() %></td>
                </tr>
                <%
                        }
                    }
                %>
                </tbody>
            </table>
        </div>--%>



    </section>
</div>

<footer>
    <h2></h2>
</footer>

</body>
</html>