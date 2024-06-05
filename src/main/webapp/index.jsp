<%@ page import="Datos.usuariosDAO" %>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<html>
<head>
    <title>Inicio - Subli-Art</title>
    <link href="./css/styles.css" rel="stylesheet" type="text/css">
    <link href="./css/estilos-registro.css" rel="stylesheet" type="text/css">
<%--    <link rel ="stylesheet" href = "./css/bootstrap.min.css">--%>
</head>
<body>
<!-- Barra de navegación -->
    <nav class="navbar">
        <div class="navbar-container">
            <a class="navbar-brand" href="#">Subli-Art</a>
            <div class="navbar-links">
                <a class="nav-link" href="#">Inicio</a>
                <a class="nav-link" href="#">Productos</a>
                <a class="nav-link" href="#">Quiénes somos</a>
                <a class="nav-link" href="#">Contacto</a>
            </div>
            <div class="navbar-login">
                <%
                %>
                <%
                    HttpSession sessionActive = request.getSession(false);
                    if (sessionActive != null && sessionActive.getAttribute("username") != null) {
                        String username = (String) sessionActive.getAttribute("username");
                %>
                <% usuariosDAO usuarioDAO = new usuariosDAO();
                    int rol = usuarioDAO.getRol(username);
                    if (rol == 1) {
                %>
                <a class="nav-link" href="./jsp-admin/inicio-admin.jsp">Administrar</a>
                <% }%>
                <a class="nav-link" href="#">Bienvenido <%= username %> </a>
                <a class="nav-link" href="./SvLogout">Cerrar sesión</a>
                <% } else { %>
                <a class="nav-link" href="jsp/login.jsp">Login</a>
                <% } %>
            </div>

        </div>
    </nav>

    <div class="posts">
        <h1> </h1>
        <div class="post">
            <img src="./img/dtf.jpg" alt="Foto de Cuzco" width="500">
            <h2>DTF Textil</h2>
            <p>El DTF textil revoluciona la personalización textil. Imprimiendo primero en una película especial, se transfiere el diseño a la prenda mediante calor y presión. Esta técnica ofrece gran versatilidad, permitiendo estampar en telas de cualquier color y material.</p>
        </div>

        <div class="post">
            <img src="./img/serigrafia.jpg" alt="Foto de Cuzco" width="500">
            <h2>Serigrafia</h2>
            <p>La serigrafía, una técnica tradicional con un toque moderno, utiliza mallas y tintas para crear estampados duraderos y vibrantes. Ideal para diseños sencillos o con pocos colores, la serigrafía ofrece un acabado artesanal y auténtico que encanta a muchos.</p>
        </div>

        <div class="post">
            <img src="./img/sublimacion.jpg" alt="Foto de Cuzco" width="500">
            <h2>Sublimacion</h2>
            <p>La sublimación utiliza calor para transferir tintas en estado gaseoso a la tela, logrando una integración total del diseño en las fibras. Esta técnica destaca por sus colores vibrantes y alta definición, siendo ideal para diseños complejos y fotografías.</p>
        </div>

        <div class="post">
            <img src="./img/dtfuv.jpg" alt="Foto de Cuzco" width="500">
            <h2>DTF UV</h2>
            <p>El DTF UV (Direct to Film Ultra Violet) lleva la impresión DTF al siguiente nivel. Utilizando tintas curables con luz UV, esta técnica ofrece una resistencia excepcional al agua, químicos y abrasión. Ideal para aplicaciones en exteriores o prendas que requieran un uso intensivo.</p>
        </div>

    </div>



</body>
</html>
