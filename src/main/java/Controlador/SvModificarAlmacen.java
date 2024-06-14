package Controlador;

import Datos.almacenDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="SvModificarAlmacen" , value = "/SvModificarAlmacen")
public class SvModificarAlmacen extends HttpServlet {
    private static final long serialVersionUID = 1L;


    private almacenDAO almacenDAO = new almacenDAO();


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_producto = Integer.parseInt(request.getParameter("id_producto"));
        int cantidad = Integer.parseInt(request.getParameter("cantidad"));
        Boolean estatus = Boolean.parseBoolean(request.getParameter("estatus"));


        try {
            int verif = 0;
             verif = almacenDAO.update(id_producto,cantidad,estatus);
             if (verif !=0) {
                 request.setAttribute("mensajeExito","mensajeExito" );
                 RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-admin/eliminar-producto.jsp");
                 rd.forward(request, response);
             }else {
                 request.setAttribute("msgError","msgError" );
                 RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-admin/eliminar-producto.jsp");
                 rd.forward(request, response);
             }
        }catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error en el Servlet");
        }

    }
}
