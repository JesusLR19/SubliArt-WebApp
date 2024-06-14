package Datos;

import Modelo.contacto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class contactoDAO {
    public List<contacto> listar(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<contacto> contactos = new ArrayList<>();

        try{
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM contacto");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_contacto = rs.getInt("id_contacto");
                String calle = rs.getString("calle");
                String numero = rs.getString("numero");
                String colonia = rs.getString("colonia");
                int cp = rs.getInt("cp");
                String referencias = rs.getString("referencias");
                String num_telefonico = rs.getString("num_telefonico");

                contacto add_contacto = new contacto(id_contacto,calle,numero,colonia,cp,referencias,num_telefonico);
                contactos.add(add_contacto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return contactos;
    }
    public void agregarContacto(contacto contacto) throws Exception{
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO contacto (calle,numero,colonia,cp,referencias,num_telefonico) VALUES (?,?,?,?,?,?)");

            ps.setString(1, contacto.getCalle());
            ps.setString(2,contacto.getNumero());
            ps.setString(3, contacto.getColonia());
            ps.setInt(4,contacto.getCp());
            ps.setString(5,contacto.getReferencias());
            ps.setString(6,contacto.getNum_telefonico());
            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("Error al agregar el contacto",e);
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }

    public int getIdByNumTel(String num_telefonico){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        int id_contacto = 0;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT id_contacto FROM contacto WHERE num_telefonico =?");
            ps.setString(1, num_telefonico);
            rs = ps.executeQuery();

            if(rs.next()){

                id_contacto = rs.getInt("id_contacto");

/*                if(id_rol > 0){
                    System.out.println("Rol obtenido con exito");
                }else{
                    System.out.println("Rol no encontrado");
                }*/
            }
        }catch (Exception e){
            e.printStackTrace();
        }
        return id_contacto;
    }
    public List<contacto> obtenerById(int idcontacto){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<contacto> contactos = new ArrayList<>();

        try{
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM contacto WHERE id_contacto =?");
            ps.setInt(1, idcontacto);
            rs = ps.executeQuery();

            while (rs.next()){
                int id_contacto = rs.getInt("id_contacto");
                String calle = rs.getString("calle");
                String numero = rs.getString("numero");
                String colonia = rs.getString("colonia");
                int cp = rs.getInt("cp");
                String referencias = rs.getString("referencias");
                String num_telefonico = rs.getString("num_telefonico");

                contacto add_contacto = new contacto(id_contacto,calle,numero,colonia,cp,referencias,num_telefonico);
                contactos.add(add_contacto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return contactos;
    }
}
