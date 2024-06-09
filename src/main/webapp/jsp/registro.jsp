<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 30/05/2024
  Time: 11:34 a. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>Registro</title>
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
    <%
        String messageError = (String) request.getAttribute("errorMessage");
        if (messageError != null) {
    %>
    <form action = "#" method="post" class="form-register">
        <h4>Nombre de usuario en existencia.</h4>
    </form>
    <%
        }
    %>

    <form action = "<%= request.getContextPath()%>/SvRegistro" method="post" class="form-register">
        <h4>Registro</h4>
        <input class ="controls" type="text" name="nombre" id="nombre" placeholder="Ingrese su nombre" required>
        <input class ="controls" type="text" name="apellido_p" id="apellido_p" placeholder="Ingrese su apellido paterno" required>
        <input class ="controls" type="text" name="apellido_m" id="apellido_m" placeholder="Ingrese su apellido materno" required>
        <input class ="controls" type="text" name="username" id="username" placeholder="Ingrese un nombre de usuario" required>
        <input class ="controls" type="text" name="password" id="password" placeholder="Ingrese su contraseña" required>
        <p>Estoy de acuerdo con <a href="#">Terminos y condiciones</a> </p>
        <input class ="botons" type="submit" value ="Registrar">

        <p><a href="<%= request.getContextPath()%>/jsp/login.jsp">Ya tengo cuenta</a></p>

    </form>

</body>
</html>
