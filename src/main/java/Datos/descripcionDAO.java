package Datos;
import Modelo.descripcion_producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class descripcionDAO {
    // Los DAO hasta el momento no he visto que mas necesitare para cada uno de ellos por es solo avanzo hasta aqui
    public List<descripcion_producto> listar(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<descripcion_producto> descripciones = new ArrayList<>();

        try{
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM descripcion_producto");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_descripcion = rs.getInt("id_descripcion");
                String descripcion = rs.getString("descripcion");
                String talla = rs.getString("talla");
                String material = rs.getString("material");

                descripcion_producto add_descripcion = new descripcion_producto(id_descripcion,descripcion,talla,material);
                descripciones.add(add_descripcion);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return descripciones;
    }
    public void agregarDescripcion(descripcion_producto descripcion){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO descripcion_producto (descripcion,talla,material) VALUES (?,?,?)");

            ps.setString(1,descripcion.getDescripcion());
            ps.setString(2,descripcion.getTalla());
            ps.setString(3,descripcion.getMaterial());
            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }
    }
}
