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
        usuarios usu = new usuarios();
        //usuarioDAO.agregarAdmin(usu);
//        usuarioDAO.cambiarPassword(1,"12345");
//        String username = "jesuslr";
//        String password = "12345";
//        usuarioDAO.verificarUsuario(username,password);
        usu = usuarioDAO.identificarID(1);
        System.out.printf(usu.getUsername());
        //usu = usuarioDAO.identificarNombre("ichuchex");
        //System.out.println(usu.getNombre());

        //usuarioDAO.activarUsuario("ichuchex");
        //usuarioDAO.cambiarPassword(1,"12345");
//        int id = usuarioDAO.getIdByUsername("jesuslr");
//        System.out.println(id);
    }
}
