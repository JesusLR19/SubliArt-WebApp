<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 05/06/2024
  Time: 01:26 a. m.
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

<div class="container-form">
    <ul class="menu-vertical">
        <li><a href="#">Lista Usuarios</a> </li>
        <li><a href="#">Identificar usuario</a></li>
        <li><a href="#">Cambiar contraseña</a> </li>
        <li><a href="#">Añadir producto</a> </li>
        <li><a href="#">Eliminar producto</a> </li>
        <li><a href="#">Editar producto</a> </li>
        <li><a href="#">Agregar administrador</a></li>
    </ul>

    <form action="#" method="post" class="element-6">
        <label for="id_usuario">id_usuario: </label>
        <input type="text" name="id_usuario" id="id_usuario" value="" required >
        <br>
        <input type="submit" value="Identificar">

    </form>

    <div class = "element-5">
        <label for="id_usuario">id_usuario: </label>
        <input type="text" name="id_usuario" id="" value="" required readonly>
        <br>
        <label for="id_usuarioN">Username: </label>
        <input type="text" name="id_usuarioN" id="id_usuarioN" value="" required readonly>
        <br>
        <label for="nombre">Nombre: </label>
        <input type="text" name="nombre" id="nombre" value="" required readonly>
        <br>
        <label for="apellido_p">Apellido Paterno: </label>
        <input type="text" name="apellido_p" id="apellido_p" value="" required readonly>

        <label for="apellido_m">Apellido Materno: </label>
        <input type="text" name="apellido_m" id="apellido_m" value="" required readonly>
        <br>
        <label for="id_contacto">id_contacto: </label>
        <input type="text" name="id_contacto" id="id_contacto" value="" required readonly>
        <br>
        <label for="id_rol">id_rol: </label>
        <input type="text" name="id_rol" id="id_rol" value="" required readonly>
        <br>
        <label for="estatus">Estatus: </label>
        <input type="text" name="estatus" id="estatus" value="" required readonly>
        <br>
    </div>

</div>

</body>
</html>