package Controlador;
import Datos.contactoDAO;
import Modelo.contacto;
import Datos.usuariosDAO;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name ="SvAgregarDireccion" , value = "/SvAgregarDireccion")
public class SvAgregarDireccion extends HttpServlet {

    private contactoDAO contactoDAO = new contactoDAO();
    private usuariosDAO usuariosDAO = new usuariosDAO();

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
            int verif = 0;
            contactoDAO.agregarContacto(contacto);
            int id_contacto = contactoDAO.getIdByNumTel(num_telefonico);
            verif = usuariosDAO.updateContacto(id_contacto,id_usuario);
            if(verif != 0){
                request.setAttribute("mensajeExito","mensajeExito" );
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-usuario/agregar-direccion.jsp");
                rd.forward(request, response);
            }else {
                request.setAttribute("msgFail","msgFail" );
                RequestDispatcher rd = getServletContext().getRequestDispatcher("/jsp-usuario/agregar-direccion.jsp");
                rd.forward(request, response);
            }
        }catch (Exception e){
            System.out.println(e);
            e.printStackTrace();
        }

    }
}
