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

    private contactoDAO contactoDAO = new contactoDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String calle = request.getParameter("calle");
        String numero = request.getParameter("numero");
        String colonia = request.getParameter("colonia");
        int cp = Integer.parseInt(request.getParameter("cp"));
        String referencias = request.getParameter("referencias");
        String num_telefonico = request.getParameter("num_telefonico");
        int id_usuario = Integer.parseInt(request.getParameter("id_usuario"));

        contacto contacto = new contacto(0,calle,numero,colonia,cp,referencias,num_telefonico);
        try{
            contactoDAO.agregarContacto(contacto);
            int id_contacto = contactoDAO.getIdByNumTel(num_telefonico);

        }catch (Exception e){
            System.out.println(e);
            e.printStackTrace();
        }

    }
}
