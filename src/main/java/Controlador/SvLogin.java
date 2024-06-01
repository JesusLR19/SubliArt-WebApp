package Controlador;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import Datos.usuariosDAO;

@WebServlet(name ="SvLogin" , value = "/SvLogin")
public class SvLogin extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private usuariosDAO usuariosDAO;

    public void init() {
        usuariosDAO = new usuariosDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        try {
            int rol = usuariosDAO.getRol(username);
            boolean verificado = usuariosDAO.verificarUsuario(username, password);
            if (usuariosDAO.verificarUsuario(username, password)){

                HttpSession session = request.getSession();
                session.setAttribute("username", username);

                switch (rol){
                    case 1:
                        response.sendRedirect("jsp/autenticado.jsp");
                        break;
                    case 2:
                        response.sendRedirect("jsp/login.jsp");
                        break;
                }
            } else {
                response.sendRedirect("jsp/login.jsp");
                request.setAttribute("errorMessage", "Username o contraseña incorrectos");
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login error", e);
        }
    }
}
