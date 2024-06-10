package Controlador;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="SvModificarAlmacen" , value = "/SvModificarAlmacen")
public class SvModificarAlmacen extends HttpServlet {



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_producto = request.getParameter("id_producto");
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        Boolean estatus = Boolean.parseBoolean(request.getParameter("estatus"));



        try {


        }catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error en el Servlet");
        }
        request.setAttribute("mensajeExito","mensajeExito" );
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-admin/add_producto.jsp");
        rd.forward(request, response);
    }
}
