package Controlador;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Datos.usuariosDAO;
import Modelo.usuarios;
@WebServlet(name ="SvIdentifyUsername" , value = "/SvIdentifyUsername")
public class SvIdentifyUsername extends HttpServlet{

    private usuariosDAO usuariosDAO = new usuariosDAO();
    private usuarios usuario = new usuarios();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");

        try{
            usuario = usuariosDAO.identificarNombre(username);
            if(usuario != null){
                System.out.println("Usuario encontrado");
            }else {
                System.out.println("Usuario no encontrado");
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new ServletException("Error al identificar el nombre de usuario");
        }
        request.setAttribute("usuario", usuario);
        RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-admin/identificar-usuario.jsp");
        rd.forward(request, response);
    }
}
