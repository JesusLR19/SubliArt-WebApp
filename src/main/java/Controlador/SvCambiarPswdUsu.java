package Controlador;

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
    }
}
