<%--
  Created by IntelliJ IDEA.
  User: jesus
  Date: 30/05/2024
  Time: 12:31 p. m.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<head>
    <title>Error credenciales incorrectas</title>
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

<form action = "#"  class="form-register">
    <h4>Credenciales incorrectas</h4>
    <button class="botons" value="">
        <a href="<%= request.getContextPath()%>/index.jsp">Volver a inicio</a>
    </button>



</form>

</body>
</html>
