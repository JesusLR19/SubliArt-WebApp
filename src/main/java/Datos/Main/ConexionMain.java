package Datos.Main;

import Datos.Conexion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class ConexionMain {
    public static void main(String[]args){
        try{
            Connection conn = Conexion.getConnection();

            String sql = "SELECT * FROM usuarios";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                int id_usuario = rs.getInt("id_usuario");
                String nombre = rs.getString("nombre");
                String apellido_p = rs.getString("apellido_p");
                String apellido_m = rs.getString("apellido_m");
                String username = rs.getString("username");
                int id_contacto = rs.getInt("id_contacto");
                int id_rol = rs.getInt("id_rol");
                boolean estatus = rs.getBoolean("estatus");
                System.out.println("ID="+ id_usuario + "\nNombre:" + nombre +" Apellidos: " + apellido_p + " " + apellido_m + "\nUsername:" + username + "\nID_Contacto: " + id_contacto
                + "\nID_Rol: " + id_rol + "\nEstatus: " + estatus);
            }
        }catch (SQLException ex){
            ex.printStackTrace(System.out.printf("Fallo en la conexion"));
        }
    }
}
