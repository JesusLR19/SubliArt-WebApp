package Datos;
import Modelo.descripcion_producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class descripcionDAO {
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
                String color = rs.getString("color");
                String talla = rs.getString("talla");
                String material = rs.getString("material");

                descripcion_producto add_descripcion = new descripcion_producto(id_descripcion,color,talla,material);
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
}
