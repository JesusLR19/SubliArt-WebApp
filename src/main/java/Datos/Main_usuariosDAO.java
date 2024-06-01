package Datos;
import Modelo.usuarios;

public class Main_usuariosDAO {
    public static void main(String[] args) {

        usuariosDAO usuarioDAO = new usuariosDAO();
        //usuarios usu = new usuarios(0, "admin", "admin", "admin", "admin", "root", 0, 1, false);
        //usuarioDAO.agregarAdmin(usu);

        //String username = "ichuchex";
        //String password = "1233";
        //usuarioDAO.verificarUsuario(username,password);

        usuarioDAO.getRol("ichuchex");

    }
}
