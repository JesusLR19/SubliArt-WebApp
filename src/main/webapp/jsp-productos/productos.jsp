<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ page import="Datos.usuariosDAO" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name ="viewport" content="width=device-width, initial-scale=1.0">
    <title>Productos</title>
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/styles.css">
    <link rel = "stylesheet" href="<%= request.getContextPath()%>/css/productos.css">
</head>
<body>
    <header>
        <nav>
            <ul>
                <li><a href="<%= request.getContextPath()%>/index.jsp">Inicio</a></li>
                <li><a href="<%= request.getContextPath()%>/jsp-productos/productos.jsp">Productos</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contacto</a></li>
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
                <li class="login"><a href="<%= request.getContextPath()%>/jsp-admin/inicio-admin.jsp">Administrar</a></li>
                <% }%>
                <li class="login"><a href="#">Bienvenido <%= username %> </a></li>
                <li class="login"><a href="./SvLogout">Cerrar sesion</a></li>
                <% } else { %>
                <li class="login"><a href="<%= request.getContextPath()%>/jsp/login.jsp">Iniciar sesion</a></li>
                <% } %>
            </ul>
        </nav>
    </header>

    <div class = "row">
        <aside>

            <ul class="lista">
                <li><a class = "active" href="<%= request.getContextPath()%>/jsp-productos/productos.jsp">Playeras</a> </li>
                <li><a href="<%= request.getContextPath()%>/jsp-productos/playeras-deportivas.jsprtivas.jsp">Playeras deportivas</a> </li>
                <li><a href="<%= request.getContextPath()%>/jsp-admin/identificar-usuario.jsp">Playeras oversize</a></li>
            </ul>


        </aside>


        <section class="products-section">
            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/negra_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>Basica negra</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button>Agregar al carrito</button>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/blanca_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>Basica blanca</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button formaction="" formmethod="">Agregar al carrito</button>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/kaki_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>Basica caqui</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button>Agregar al carrito</button>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/gris_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>Basica gris</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button>Agregar al carrito</button>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/rosa_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>Basica rosa</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button>Agregar al carrito</button>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/vino_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>Basica vino</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button>Agregar al carrito</button>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/roja_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>Basica roja</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button>Agregar al carrito</button>
                </div>
            </div>

            <div class="product-card">
                <img src="<%= request.getContextPath()%>/img-productos/blanca_corte_normal.jpg" alt="Foto de Cuzco" width="500">
                <h2>DTF Textil</h2>
                <h3>$150</h3>
                <p>Confort,durabilidad y resistencia al mejor precio del mercado,si buscas una playera básica para serigrafía,bordado o cualquier otro proceso de decorado,estás en el lugar correcto.</p>
                <div class="button-container">
                    <button>Agregar al carrito</button>
                </div>
            </div>


        </section>

    </div>

    <footer>
        <h2>Footer</h2>
    </footer>

</body>
</html>
