package Controlador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Datos.usuariosDAO;
import Modelo.usuarios;
@WebServlet(name = "SvRegistro" , value = "/SvRegistro")
public class SvRegistro extends HttpServlet{
    private static final long serialVersionID = 1L;
    private usuarios usuario;
    private usuariosDAO usuariosDAO;

    public void init(){usuariosDAO = new usuariosDAO();}
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nombre = request.getParameter("nombre");
        String apellido_p = request.getParameter("apellido_p");
        String apellido_m = request.getParameter("apellido_m");
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            usuario = new usuarios(0,nombre,apellido_p,apellido_m,username,password,0,0,false);
            int verificacion = usuariosDAO.agregarUsuario(usuario);
            if(verificacion > 0){
                response.sendRedirect("jsp/autenticado.jsp");
            }else {
                response.sendRedirect("jsp/error.jsp");
            }

        }catch (Exception e){
            e.printStackTrace();
            throw new ServletException("Error en el registro", e);
        }
    }

}
