package Datos.Main;
import Modelo.contacto;
import Datos.contactoDAO;
import Datos.usuariosDAO;


public class Main_pruebas {
    public static void main(String[] args) throws Exception {
//        contacto contacto = new contacto(0,"prueba","prueba","prueba",12345,"prueba","prueba");
        contactoDAO contactoDAO = new contactoDAO();
//        contactoDAO.agregarContacto(contacto);
        usuariosDAO usuariosDAO = new usuariosDAO();
        usuariosDAO.updateContacto(3,1);
        //FUNCIONA

    }
}
