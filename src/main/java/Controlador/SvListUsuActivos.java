package Controlador;
import Modelo.usuarios;
import Datos.usuariosDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet (name ="SvListUsuActivos" , value = "/SvListUsuActivos")
public class SvListUsuActivos extends HttpServlet{

    private usuariosDAO usuariosDAO = new usuariosDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            List<usuarios> listaUsuarios = usuariosDAO.listarActivos();

            if(listaUsuarios.isEmpty()){
                request.setAttribute("msgFail","msgFail" );
                RequestDispatcher rd = request.getRequestDispatcher("/jsp-admin/listar-usuarios.jsp");
                rd.forward(request, response);
            }else {
                request.setAttribute("listaUsuarios", listaUsuarios);
                RequestDispatcher rd = request.getRequestDispatcher("/jsp-admin/listar-usuarios.jsp");
                rd.forward(request, response);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new ServletException("Error en el Servlet");
        }




    }

}
