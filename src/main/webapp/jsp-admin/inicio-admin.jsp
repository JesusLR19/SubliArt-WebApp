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
  } else if (rol == 2) {
    response.sendRedirect("../jsp/error.jsp");
  }
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
  <title>Inicio - Administrador</title>
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
        <li><a class = "active" href="<%= request.getContextPath()%>/jsp-admin/inicio-admin.jsp">Inicio-admin</a> </li>
        <li><a href="<%= request.getContextPath()%>/jsp-admin/listar-usuarios.jsp">Lista Usuarios</a> </li>
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

    <%
      String username = (String) sessionActive.getAttribute("username");
      usuariosDAO usuarioDAOs = new usuariosDAO();
      usuarios usuario;

      usuario = usuarioDAOs.identificarNombre(username);
    %>
    <section>
      <h2>Informacion de cuenta</h2>
      <h3>Informacion de la cuenta de administrador actual</h3>
      <form action = "#"  class="form-register">
        <label for="id_usuario">id_usuario: </label>
        <input class = 'controls' type="number" name="id_usuario" id="id_usuario" value="<%=usuario.getId_usuario()%>" required readonly>
        <br>
        <label for="id_usuarioN">Username: </label>
        <input class = 'controls' type="text" name="id_usuarioN" id="id_usuarioN" value="<%= usuario.getUsername()%>" required readonly>
        <br>
        <label for="nombre">Nombre: </label>
        <input class = 'controls' type="text" name="nombre" id="nombre" value="<%= usuario.getNombre()%>" required readonly>
        <br>
        <label for="apellido_p">Apellido Paterno: </label>
        <input class = 'controls' type="text" name="apellido_p" id="apellido_p" value="<%= usuario.getApellido_p()%>" required readonly>

        <label for="apellido_m">Apellido Materno: </label>
        <input class = 'controls' type="text" name="apellido_m" id="apellido_m" value="<%= usuario.getApellido_p()%>" required readonly>
        <br>
        <label for="id_contacto">id_contacto: </label>
        <input class = 'controls' type="text" name="id_contacto" id="id_contacto" value="<%= usuario.getId_contacto()%>" required readonly>
        <br>
        <label for="id_rol">id_rol: </label>
        <input class = 'controls' type="text" name="id_rol" id="id_rol" value="<%= usuario.getId_rol()%>" required readonly>
        <br>
        <label for="estatus">Estatus: </label>
        <input class = 'controls' type="text" name="estatus" id="estatus" value="<%= usuario.isEstatus()%>" required readonly>
        <br>
      </form>

    </section>

  </div>

  <footer>
    <h2></h2>
  </footer>

</body>
</html>
