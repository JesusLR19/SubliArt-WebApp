package Controlador;

import Modelo.vistaProductos;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;
import Modelo.pedidos;
import Datos.pedidosDAO;
import Datos.usuariosDAO;

@WebServlet(name = "SvProcesarPago", value = "/SvProcesarPago")
public class SvProcesarPago extends HttpServlet {

    private static final double COSTO_ENVIO = 129.00;
    private usuariosDAO usuariosDAO = new usuariosDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<vistaProductos> carrito = (List<vistaProductos>) session.getAttribute("carrito");

        if (carrito == null || carrito.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/jsp-usuario/carrito.jsp");
            return;
        }

        double subtotal = 0.0;
        for (vistaProductos producto : carrito) {
            subtotal += producto.getPrecio();
        }
        double total = subtotal + COSTO_ENVIO;

        String username = session.getAttribute("username").toString();
        int idUsuario = usuariosDAO.getIdByUsername(username);
        int total_productos = carrito.size();

        try {
            pedidos pedido = new pedidos(0,idUsuario,total_productos,total,true);
            pedidosDAO pedidosDAO = new pedidosDAO();

            pedidosDAO.agregarPedido(pedido);

            session.removeAttribute("carrito"); // Limpiar el carrito después de procesar el pago

            response.sendRedirect(request.getContextPath() + "/jsp-productos/pago-completo.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al procesar el pago", e);
        }
    }
}
