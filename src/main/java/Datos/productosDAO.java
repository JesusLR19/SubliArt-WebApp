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
}
