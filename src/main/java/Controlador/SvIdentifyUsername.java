package Controlador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Datos.usuariosDAO;

public class SvIdentifyUsername extends HttpServlet{
    private usuariosDAO usuariosDAO;

    public void init() {
        usuariosDAO = new usuariosDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
    }
}
