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

@WebServlet(name = "SvIrAPago", value = "/SvIrAPago")
public class SvIrAPago extends HttpServlet {

    private static final double COSTO_ENVIO = 129.00;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<vistaProductos> carrito = (List<vistaProductos>) session.getAttribute("carrito");

        double subtotal = 0.0;

        if (carrito != null) {
            for (vistaProductos producto : carrito) {
                subtotal += producto.getPrecio();
            }
        }

        double total = subtotal + COSTO_ENVIO;

        request.setAttribute("subtotal", subtotal);
        request.setAttribute("total", total);
        request.setAttribute("costoEnvio", COSTO_ENVIO);

        request.getRequestDispatcher("/jsp-usuario/pago.jsp").forward(request, response);
    }
}

