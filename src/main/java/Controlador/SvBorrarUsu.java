package Controlador;

import Datos.usuariosDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="SvBorrarUsu" , value = "/SvBorrarUsu")
public class        SvBorrarUsu extends HttpServlet {

    private usuariosDAO usuariosDAO = new usuariosDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        try {
            usuariosDAO.desactivarUsuario(username);

        }catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al identificar el nombre de usuario");
        }
        request.setAttribute("mensajeExito","mensajeExito" );
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-admin/eliminar-usuario.jsp");
        rd.forward(request, response);
    }

}
