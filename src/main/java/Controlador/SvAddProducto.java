package Controlador;

import Datos.productosDAO;
import Modelo.productos;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name ="SvAddProducto" , value = "/SvAddProducto")
public class SvAddProducto extends HttpServlet {
    private  productosDAO productoDAO = new productosDAO();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre_producto = request.getParameter("nombre_producto");
        int id_descripcion = Integer.parseInt(request.getParameter("id_descripcion"));
        int id_categoria = Integer.parseInt(request.getParameter("id_categoria"));
        float precio = Float.parseFloat(request.getParameter("precio"));
        System.out.println(id_descripcion);

        try {
            productos producto = new productos(0, nombre_producto, id_descripcion, id_categoria, precio);
            productoDAO.addProducto(producto);

        }catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error en el Servlet");
        }
        request.setAttribute("mensajeExito","mensajeExito" );
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-admin/add_producto.jsp");
        rd.forward(request, response);
    }
}
