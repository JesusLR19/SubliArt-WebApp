package Datos.Main;
import Modelo.contacto;
import Datos.contactoDAO;
import Datos.usuariosDAO;

import java.util.List;


public class Main_pruebas {
    public static void main(String[] args) throws Exception {
//        contacto contacto = new contacto(0,"prueba","prueba","prueba",12345,"prueba","prueba");
        contactoDAO contactoDAO = new contactoDAO();
//        contactoDAO.agregarContacto(contacto);
//        usuariosDAO usuariosDAO = new usuariosDAO();
//        usuariosDAO.updateContacto(3,1);
        List<contacto> contactoList = contactoDAO.obtenerById(1);
        for (contacto contacto : contactoList) {
            System.out.println(contacto.getCalle());
        }
        //FUNCIONA

    }
}
