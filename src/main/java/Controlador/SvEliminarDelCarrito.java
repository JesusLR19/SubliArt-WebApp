package Controlador;

import Modelo.vistaProductos;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;

@WebServlet(name ="SvEliminarDelCarrito" , value = "/SvEliminarDelCarrito")
public class SvEliminarDelCarrito extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        //Obtenemos la lista del carrito
        List<vistaProductos> carrito = (List<vistaProductos>) session.getAttribute("carrito");
        if (carrito != null) {
            String nombreProducto = request.getParameter("nombre_producto");
            //Usamos un iterador para recorrer la lista de productos del carrito
            Iterator<vistaProductos> iterator = carrito.iterator();
            //Recorremos la lista
            while (iterator.hasNext()) {
                vistaProductos producto = iterator.next(); //Asignamos el siguiente producto a nuestro objeto tipo vistaproductos
                //Si el nombre del producto obtenido desde el form coincide en la lista lo removemos
                if (producto.getNombre_producto().equals(nombreProducto)) {
                    iterator.remove();
                    break;
                }
            }

            session.setAttribute("carrito", carrito);
        }

        response.sendRedirect(request.getContextPath() + "/jsp-productos/carrito.jsp");
    }
}