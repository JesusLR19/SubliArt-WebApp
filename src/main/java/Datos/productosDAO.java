package Datos;
import Modelo.productos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class productosDAO {
    //No habia notado que me hacia falta esta clase DAO jaja
    public void addProducto(productos producto){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO pedidos (nombre_producto,id_descripcion,id_categoria,precio) VALUES (?,?,?,?)");

            ps.setString(1,producto.getNombre_producto());
            ps.setInt(2,producto.getId_descripcion());
            ps.setInt(3,producto.getId_categoria());
            ps.setFloat(4,producto.getPrecio());
            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public productos identificar(String nombreProducto) throws Exception{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        productos producto = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM productos WHERE nombre_producto =?");
            ps.setString(1,nombreProducto);

            if (rs.next()){
                int id_producto = rs.getInt("id_producto");
                String nombre_producto = rs.getString("nombre_producto");
                int id_descripcion = rs.getInt("id_descripcion");
                int id_categoria = rs.getInt("id_categoria");
                Float precio = rs.getFloat("precio");

                producto = new productos(id_producto,nombre_producto,id_descripcion,id_categoria,precio);
            }

        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("Error al identificar el producto",e);
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return producto;
    }
}
