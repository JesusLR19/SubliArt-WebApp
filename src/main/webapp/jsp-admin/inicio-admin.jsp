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
<html>
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

  <div class="container">
    <ul class="menu-vertical">
      <li><a href="#">Lista Usuarios</a> </li>
      <li><a href="identificar-usuario.jsp">Identificar usuario</a></li>
      <li><a href="#">Cambiar contraseña</a> </li>
      <li><a href="#">Añadir producto</a> </li>
      <li><a href="#">Eliminar producto</a> </li>
      <li><a href="#">Editar producto</a> </li>
      <li><a href="#">Agregar administrador</a></li>
    </ul>
    <%
      String username = (String) sessionActive.getAttribute("username");
      usuariosDAO usuarioDAOs = new usuariosDAO();
      usuarios usuario;

      usuario = usuarioDAOs.identificarNombre(username);
    %>


    <div class = "element-6">
      <label for="id_usuario">id_usuario: </label>
      <input type="number" name="id_usuario" id="id_usuario" value="<%=usuario.getId_usuario()%>" required readonly>
      <br>
      <label for="id_usuarioN">Username: </label>
      <input type="text" name="id_usuarioN" id="id_usuarioN" value="<%= usuario.getUsername()%>" required readonly>
      <br>
      <label for="nombre">Nombre: </label>
      <input type="text" name="nombre" id="nombre" value="<%= usuario.getNombre()%>" required readonly>
      <br>
      <label for="apellido_p">Apellido Paterno: </label>
      <input type="text" name="apellido_p" id="apellido_p" value="<%= usuario.getApellido_p()%>" required readonly>

      <label for="apellido_m">Apellido Materno: </label>
      <input type="text" name="apellido_m" id="apellido_m" value="<%= usuario.getApellido_p()%>" required readonly>
      <br>
      <label for="id_contacto">id_contacto: </label>
      <input type="text" name="id_contacto" id="id_contacto" value="<%= usuario.getId_contacto()%>" required readonly>
      <br>
      <label for="id_rol">id_rol: </label>
      <input type="text" name="id_rol" id="id_rol" value="<%= usuario.getId_rol()%>" required readonly>
      <br>
      <label for="estatus">Estatus: </label>
      <input type="text" name="estatus" id="estatus" value="<%= usuario.isEstatus()%>" required readonly>
      <br>
    </div>

  </div>

</body>
</html>
