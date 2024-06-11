package Datos.Main;
import Datos.usuariosDAO;
import Modelo.usuarios;

public class Main_usuariosDAO {
    public static void main(String[] args) throws Exception {

        usuariosDAO usuarioDAO = new usuariosDAO();

//        List<usuarios> usuarios = usuarioDAO.listar();
//        for (usuarios usuario : usuarios) {
//            System.out.println(usuario.getUsername());
//        }
        //usuarios usu = new usuarios();
        //usuarioDAO.agregarAdmin(usu);

        //String username = "ichuchex";
        //String password = "1233";
        //usuarioDAO.verificarUsuario(username,password);

        //usu = usuarioDAO.identificarNombre("ichuchex");
        //System.out.println(usu.getNombre());

        //usuarioDAO.activarUsuario("ichuchex");
        usuarioDAO.cambiarPassword(1,"12345");
    }
}
