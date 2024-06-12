package Datos.Main;
import Modelo.contacto;
import Datos.contactoDAO;


public class Main_pruebas {
    public static void main(String[] args) throws Exception {
        contacto contacto = new contacto(0,"prueba","prueba","prueba",12345,"prueba","prueba");
        contactoDAO contactoDAO = new contactoDAO();
        contactoDAO.agregarContacto(contacto);

    }
}
