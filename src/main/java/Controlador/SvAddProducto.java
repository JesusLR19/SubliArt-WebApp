package Controlador;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Datos.productosDAO;
import Modelo.productos;

@WebServlet (name ="SvAddProducto" , value = "/SvAddProducto")
public class SvAddProducto extends HttpServlet {
    private  productosDAO productoDAO = new productosDAO();


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre_producto = request.getParameter("nombre_producto");
        String id_desc = request.getParameter("id_descripcion");
        String id_cat = request.getParameter("id_categoria");
        String precio_t = request.getParameter("precio");

        Float precio = Float.parseFloat(precio_t);
        int id_descripcion = Integer.parseInt(id_desc);
        int id_categoria = Integer.parseInt(id_cat);


        try {
            productos producto = new productos(0, nombre_producto, id_descripcion, id_categoria, precio);
            productoDAO.addProducto(producto);

        }catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error en el Servlet");
        }
        request.setAttribute("mensajeExito","mensajeExito" );
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-admin/add-producto.jsp");
        rd.forward(request, response);
    }
}
