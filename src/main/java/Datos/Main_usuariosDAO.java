package Datos;
import Modelo.usuarios;

public class Main_usuariosDAO {
    public static void main(String[] args) throws Exception {

        usuariosDAO usuarioDAO = new usuariosDAO();
        usuarios usu = new usuarios();
        //usuarioDAO.agregarAdmin(usu);

        //String username = "ichuchex";
        //String password = "1233";
        //usuarioDAO.verificarUsuario(username,password);

        usu = usuarioDAO.identificarNombre("ichuchex");
        System.out.println(usu.getNombre());

    }
}
