package Datos;

import Modelo.usuarios;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import org.mindrot.jbcrypt.BCrypt;
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
    public usuarios identificarID(int idUsuario) throws Exception{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        usuarios usuario = null;

        try{
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM usuarios WHERE id_usuario=?");
            ps.setInt(1,idUsuario);

            if (rs.next()){
                int id_usuario = rs.getInt("id_usuario");
                String nombre = rs.getString("nombre");
                String apellido_p = rs.getString("apellido_p");
                String apellido_m = rs.getString("apellido_m");
                String username = rs.getString("username");
                String password =  rs.getString("password");
                int id_contacto = rs.getInt("id_contacto");
                int id_rol = rs.getInt("id_rol");
                boolean estatus = rs.getBoolean("estatus");

                usuario = new usuarios(id_usuario,nombre,apellido_p,apellido_m,username,password,id_contacto,id_rol,estatus);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("Error al identificar al usuario", e);
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return usuario;
    }
    public usuarios identificarNombre(String nombre_usuario) throws Exception{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        usuarios usuario_n = null;

        try{
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM usuarios WHERE nombre=?");
            ps.setString(1,nombre_usuario);

            if (rs.next()){
                int id_usuario = rs.getInt("id_usuario");
                String nombre = rs.getString("nombre");
                String apellido_p = rs.getString("apellido_p");
                String apellido_m = rs.getString("apellido_m");
                String username = rs.getString("username");
                String password =  rs.getString("password");
                int id_contacto = rs.getInt("id_contacto");
                int id_rol = rs.getInt("id_rol");
                boolean estatus = rs.getBoolean("estatus");

                usuario_n = new usuarios(id_usuario,nombre,apellido_p,apellido_m,username,password,id_contacto,id_rol,estatus);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("Error al identificar al usuario", e);
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return usuario_n;
    }
    public void agregarUsuario(usuarios usuario){
        Connection conn = null;
        PreparedStatement ps = null;
        //Utilizamos BCrypt para encriptar la contraseña directamente cuando el usuario la ingrese
        String passwordHash = BCrypt.hashpw(usuario.getPassword(),BCrypt.gensalt());

        try{
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO usuarios (nombre,apellido_p,apellido_m,username,password,id_rol,estatus) VALUES (?,?,?,?,?,?,?)");
            // En la consulta no incluimos su id_contacto para que este despues de su registro tambien agregue su direccion/informacion de contacto
            ps.setString(1,usuario.getNombre());
            ps.setString(2,usuario.getApellido_p());
            ps.setString(3,usuario.getApellido_m());
            ps.setString(4,usuario.getUsername());
            ps.setString(5,passwordHash); //Usamos la variable donde guardamos la contraseña encriptada para guardarla en la BD
            ps.setInt(6,2); //Colocamos en 2 para que automaticamente quede registrado con rol de usuario
            ps.setBoolean(7,true); // tambien colocamos su estatus como activo

            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }
    public void agregarAdmin(usuarios usuario){
        Connection conn = null;
        PreparedStatement ps = null;

        try{
            conn = Conexion.getConnection();
            //Para ejecutar la siguiente consulta se debe configurar de nuevo la tabla usuarios ya que se especifico que algunos campos no podian quedar en null
            ps = conn.prepareStatement("INSERT INTO usuarios (username,password,id_rol,estatus)");

            ps.setString(1,usuario.getUsername());
            ps.setString(2,usuario.getPassword());
            ps.setInt(3,2); //Colocamos en 1 para que automaticamente quede registrado con rol de Administrador
            ps.setBoolean(4,true); // tambien colocamos su estatus como activo

            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }

    public int cambiarUsername(usuarios usuario){
        Connection conn = null;
        PreparedStatement ps = null;
        int registros = 0;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("UPDATE usuarios SET username=?");

            ps.setString(1,usuario.getUsername());

            registros = ps.executeUpdate();
            if(registros > 0) System.out.println("Tu nombre de usuario se ha actualizado con exito");

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return registros;
    }

    public int cambiarNombre(usuarios usuario){
        Connection conn = null;
        PreparedStatement ps = null;
        int registros = 0;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("UPDATE usuarios SET nombre=?");

            ps.setString(1,usuario.getNombre());

            registros = ps.executeUpdate();
            if(registros > 0) System.out.println("Tu nombre se ha cambiado correctamente");

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return registros;
    }

    public int cambiarApellidos(usuarios usuario){
        Connection conn = null;
        PreparedStatement ps = null;
        int registros = 0;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("UPDATE usuarios SET apellido_p=?, apellido_m=?");

            ps.setString(1,usuario.getApellido_p());
            ps.setString(2,usuario.getApellido_m());

            registros = ps.executeUpdate();
            if(registros > 0) System.out.println("Tus apellidos se ha cambiado correctamente");

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return registros;
    }

    public int cambiarPassword(usuarios usuario){
        Connection conn = null;
        PreparedStatement ps = null;
        int registros = 0;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("UPDATE usuarios SET password=?");

            String passwordHashed = BCrypt.hashpw(usuario.getPassword(),BCrypt.gensalt());
            ps.setString(1,passwordHashed);

            registros = ps.executeUpdate();
            if(registros > 0) System.out.println("Tu contraseña se ha cambiado correctamente");

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return registros;
    }

    public boolean verificarUsuario(String username, String password) {
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        boolean autenticado = false;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT password FROM usuarios WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();

            if (rs.next()) {
                String hashedPassword = rs.getString("password");
                autenticado = BCrypt.checkpw(password, hashedPassword);
                // Aqui verificamos si la contraseña que ingresa el usuario coincide con la que tenemos en la bd con el hash
                if (autenticado) {
                    System.out.println("Acceso permitido");
                }else {
                    System.out.println("Contraseña incorrecta");
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }

        return autenticado;
    }



}
