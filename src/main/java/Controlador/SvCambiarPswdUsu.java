package Controlador;

import Datos.usuariosDAO;
import Modelo.usuarios;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name ="SvCambiarPswdUsu" , value = "/SvCambiarPswdUsu")
public class SvCambiarPswdUsu extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));
        String past_password = request.getParameter("past_password");
        String new_password = request.getParameter("new_password");

        usuarios usu = new usuarios();
        usuariosDAO dao = new usuariosDAO();
        try{
            int verif = 0;
            usu = dao.identificarID(id_usuario);
            if(BCrypt.checkpw(past_password, usu.getPassword())){
                verif = dao.cambiarPassword(id_usuario, new_password);
                if(verif != 0){
                    request.setAttribute("mensajeExito", "mensajeExito");
                    RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp-usuario/cambiar-password.jsp");
                    dispatcher.forward(request, response);
                }
            }else {
                request.setAttribute("msgFailed", "msgFailed");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp-usuario/cambiar-password.jsp");
                dispatcher.forward(request, response);
            }

        }catch(Exception e){
            e.printStackTrace();
            throw new ServletException("Error en el servidor");
        }
    }
}
