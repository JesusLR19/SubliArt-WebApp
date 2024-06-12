package Controlador;
import Datos.contactoDAO;
import Modelo.contacto;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name ="SvAgregarDireccion" , value = "/SvAgregarDireccion")
public class SvAgregarDireccion extends HttpServlet {
    private contactoDAO contacto = new contactoDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id_contacto = Integer.parseInt(request.getParameter("id_contacto"));
        String calle = request.getParameter("calle");
        String numero = request.getParameter("numero");
        String colonia = request.getParameter("colonia");
        int cp = Integer.parseInt(request.getParameter("cp"));
        String referencias = request.getParameter("referencias");
        String num_telefonico = request.getParameter("num_telefonico");


    }
}
