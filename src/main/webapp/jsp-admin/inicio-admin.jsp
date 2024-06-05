<%--
  Created by IntelliJ IDEA.
  User: Dell Latitude
  Date: 01/06/2024
  Time: 12:37 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
  <title>Inicio - Subli-Art</title>
  <link href="../css/styles.css" rel="stylesheet" type="text/css">
</head>

<body>

  <nav class="navbar">
    <div class="navbar-container">
      <a class="navbar-brand" href="../index.jsp">Inicio</a>
    </div>
  </nav>

  <div class="container">
    <ul class="menu-vertical">
      <li><a href="#">Lista Usuarios</a> </li>
      <li><a href="#">Identificar usuario</a></li>
      <li><a href="#">Cambiar contraseña</a> </li>
      <li><a href="#">Añadir producto</a> </li>
      <li><a href="#">Eliminar producto</a> </li>
      <li><a href="#">Editar producto</a> </li>
      <li><a href="#">Agregar administrador</a></li>
    </ul>

    <form action="../SvEliminarUs" method="post" class="element element-6">
      <label for="id_usuarioN">Usuario nombre: </label>
      <input type="text" id="id_usuarioN" name="id_usuarioN" placeholder="Un nombre de usuario.." required>
      <br>
      <input type="submit" value="Eliminar">
    </form>

  </div>

</body>
</html>
