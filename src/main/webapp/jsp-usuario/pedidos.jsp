<%@ page import="Datos.usuariosDAO" %>
<%@ page import="Modelo.usuarios" %>
<%@ page import="Modelo.pedidos" %>
<%@ page import="Datos.pedidosDAO" %>
<%@ page import="java.util.List" %>
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
    }
%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<head>
    <title>Pedidos</title>
    <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" type="text/css">
    <link href="<%= request.getContextPath()%>/css/estilos-registro.css" rel="stylesheet" type="text/css">
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
            <li><a class = "active" href="<%= request.getContextPath()%>/jsp-usuario/pedidos.jsp">Pedidos</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/agregar-direccion.jsp">Agregar direccion</a> </li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/cambiar-password.jsp">Cambiar contraseña</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/cambiar-username.jsp">Cambiar nombre usuario</a></li>
            <li><a href="<%= request.getContextPath()%>/jsp-usuario/desactivar-cuenta.jsp">Desactivar mi cuenta</a></li>
        </ul>


    </aside>

    <%
        String username = (String) sessionActive.getAttribute("username");
        usuariosDAO usuarioDAOs = new usuariosDAO();
        usuarios usuario;

        usuario = usuarioDAOs.identificarNombre(username);
    %>
    <section>
        <h2>Informacion general de tus pedidos</h2>
        <h3>En este apartado se encuentran todos tus pedidos</h3>
        <div class="container">
            <table class="table">
                <caption>Pedidos realizados</caption>
                <thead>
                <tr>
                    <th>id_pedido</th>
                    <th>total_productos</th>
                    <th>total_mxn</th>
                    <th>estatus</th>
                </tr>
                </thead>
                <tbody>
                <%
                    int usuario_id = usuarioDAO.getIdByUsername(usernameA);
                    pedidosDAO pedidosDAO = new pedidosDAO();
                    List<pedidos> pedidos = pedidosDAO.listarPorUsuario(usuario_id);
                    if(pedidos != null){
                        for (pedidos pedido : pedidos) {
                %>
                <tr>
                    <td data-label="id_pedido"><%=pedido.getId_pedido()%></td>
                    <td data-label="total_productos"><%=pedido.getTotal_productos()%></td>
                    <td data-label="total_mxn"><%=pedido.getTotal_mxn()%></td>
                    <td data-label="estatus"><%=pedido.isEstatus()%></td>
                </tr>
                <%
                        }
                    }
                %>


                </tbody>
            </table>
        </div>



    </section>

</div>

<footer>
    <h2>Footer</h2>
</footer>

</body>
</html>
