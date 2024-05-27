package Datos;

import Modelo.usuarios;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class usuariosDAO {
    public List<usuarios> listar(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<usuarios> lista_usuarios = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM usuarios");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_usuario = rs.getInt("id_usuario");
                String nombre = rs.getString("nombre");
                String apellido_p = rs.getString("apellido_p");
                String apellido_m = rs.getString("apellido_m");
                String username = rs.getString("username");
                String password =  rs.getString("password");
                int id_contacto = rs.getInt("id_contacto");
                int id_rol = rs.getInt("id_rol");
                boolean estatus = rs.getBoolean("estatus");

                usuarios usuario_add = new usuarios(id_usuario,nombre,apellido_p,apellido_m,username,password,id_contacto,id_rol,estatus);
                lista_usuarios.add(usuario_add);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return lista_usuarios;
    }

    public void agregarUsuario(usuarios usuario){
        Connection conn = null;
        PreparedStatement ps = null;

        try{
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO usuarios(nombre,apellido_p,apellido_m,username,password,id_rol,estatus)");
            // En la consulta no incluimos su id_contacto para que este despues de su registro tambien agregue su direccion/informacion de contacto
            ps.setString(1,usuario.getNombre());
            ps.setString(2,usuario.getApellido_p());
            ps.setString(3,usuario.getApellido_m());
            ps.setString(3,usuario.getUsername());
            ps.setString(4,usuario.getPassword());
            ps.setInt(5,2); //Colocamos en 2 para que automaticamente quede registrado con rol de usuario
            ps.setBoolean(6,true); // tambien colocamos su estatus como activo

            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }


}
