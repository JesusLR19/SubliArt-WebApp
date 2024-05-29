package Datos;
import Modelo.categoria_producto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class categoriaDAO {

    public List<categoria_producto> listar(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<categoria_producto> categorias = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM categoria_producto");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_categoria = rs.getInt("id_categoria");
                String nombre_categoria = rs.getString("nombre_categoria");
                String descripcion = rs.getString("descripcion");

                categoria_producto add_categoria = new categoria_producto(id_categoria,nombre_categoria,descripcion);
                categorias.add(add_categoria);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return categorias;
    }
    public void agregarCategoria(categoria_producto categoria){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO categoria_producto (nombre_categoria,descripcion) VALUES (?,?)");

            ps.setString(1,categoria.getNombre_categoria());
            ps.setString(2,categoria.getDescripcion());

            ps.executeUpdate();
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }
}
