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
            System.out.println(username);
            System.out.println(password);
            boolean verificado = usuariosDAO.verificarUsuario(username, password);
            if (usuariosDAO.verificarUsuario(username, password)) {
                HttpSession session = request.getSession();
                session.setAttribute("username", username);
                response.sendRedirect("jsp/autenticado.jsp");
            } else {
                request.setAttribute("errorMessage", "Username o contraseña incorrectos");
                request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login error", e);
        }
    }
}
