package Controlador;

import Datos.usuariosDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

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
            HttpSession session = request.getSession();

            if (verificado){
                switch (rol){
                    case 1:
                        session.setAttribute("username", username);
                        response.sendRedirect("jsp-admin/inicio-admin.jsp");
                        break;
                    case 2:
                        session.setAttribute("username", username);
                        response.sendRedirect("./index.jsp");
                        break;
                }
            }else {
                request.setAttribute("errorMessage", "Username o contraseña incorrectos");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/jsp/login.jsp");
                dispatcher.forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new ServletException("Login error", e);
        }
    }
}
