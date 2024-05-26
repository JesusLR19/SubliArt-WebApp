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
}
