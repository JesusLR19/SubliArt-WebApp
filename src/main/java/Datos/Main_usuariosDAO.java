package Datos;
import Modelo.usuarios;

public class Main_usuariosDAO {
    public static void main(String[] args) {

        usuariosDAO usuarioDAO = new usuariosDAO();
        usuarios usu = new usuarios(0, "Jesus", "Lopez", "Rodriguez", "ichuchex", "123", 1, 1, true);
        usuarioDAO.agregarUsuario(usu);
    }
}
