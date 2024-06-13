package Controlador;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import Modelo.vistaProductos;

@WebServlet(name ="SvAgregarCarrito" , value = "/SvAgregarCarrito")
public class SvAgregarCarrito extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        List<vistaProductos> carrito = (List<vistaProductos>) session.getAttribute("carrito");

        if (carrito == null) {
            carrito = new ArrayList<vistaProductos>();
        }

        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        String nombre_producto = request.getParameter("nombre_producto");
        float precio = Float.parseFloat(request.getParameter("precio"));
        String descripcion = request.getParameter("descripcion");
        String categoria = request.getParameter("categoria");

        vistaProductos producto = new vistaProductos(id_producto,nombre_producto,descripcion,categoria,precio);

        carrito.add(producto);
        session.setAttribute("carrito", carrito);
        response.sendRedirect(request.getContextPath() + "/jsp-productos/productos.jsp");

    }
}
