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

        List<usuarios> Usuarios = new ArrayList<>();
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
                Usuarios.add(usuario_add);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return Usuarios;
    }
}
