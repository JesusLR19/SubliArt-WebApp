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
    public void agregarContacto(contacto contacto){
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

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }
}
