package Controlador;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Datos.usuariosDAO;

@WebServlet(name ="SvCambiarPswd" , value = "/SvCambiarPswd")
public class SvCambiarPswd extends HttpServlet {
    usuariosDAO usuarioDAO = new usuariosDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id_usuario = request.getParameter("id_usuario");
        String password = request.getParameter("password");
        int id_usu = Integer.parseInt(id_usuario);
        int valido = 0;

        try {
            valido = usuarioDAO.cambiarPassword(id_usu, password);
            if (valido != 0) {
                request.setAttribute("mensajeExito", "mensajeExito");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp-admin/cambiar-password.jsp");
                dispatcher.forward(request, response);
            }else {
                request.setAttribute("msgFailed", "msgFailed");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp-admin/cambiar-password.jsp");
                dispatcher.forward(request, response);
            }
        }catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Error al modificar la BD", e);
        }

    }

}
