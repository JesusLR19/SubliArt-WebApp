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
                <li><a href="#home">Home</a></li>
                <li><a class="active" href="#news">Identificar usuario</a></li>
                <li><a href="#contact">Contact</a></li>
                <li><a href="#about">About</a></li>
            </ul>


        </aside>
        <section>
            <h2>Identificar Usuario</h2>
            <form action = "#"  class="form-register">
                <h4>Identificar usuario</h4>
                <button class="botons" value="">
                    <a href="../index.jsp">Volver a inicio</a>
                </button>
            </form>
        </section>
    </div>

    <footer>
        <h2>Footer</h2>
    </footer>

</body>
</html>