package Datos;
import Modelo.almacen;
import java.sql.*;
import java.util.List;
import java.util.ArrayList;
public class almacenDAO {

    public List<almacen> listar(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<almacen> Almacen = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM almacen");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_producto = rs.getInt("id_producto");
                int cantidad = rs.getInt("cantidad");
                boolean estatus = rs.getBoolean("estatus");

                almacen almacen_add = new almacen(id_producto,cantidad,estatus);
                Almacen.add(almacen_add);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return Almacen;
    }
    public almacen identificar(int idProducto) throws Exception{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        almacen producto = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM almacen WHERE id_producto=?");
            ps.setInt(1,idProducto);

            if (rs.next()){
                int id_producto = rs.getInt("id_producto");
                int cantidad = rs.getInt("cantidad");
                boolean estatus = rs.getBoolean("estatus");

                producto = new almacen(id_producto,cantidad,estatus);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("Error al identificar el producto", e);
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return producto;
    }
    public void agregarProducto(almacen producto){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO almacen(id_producto,cantidad,estatus) VALUES (?,?,?)");

            ps.setInt(1,producto.getId_producto());
            ps.setInt(2,producto.getCantidad());
            ps.setBoolean(3,true);
            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }
    }
    public int updateCantidad(almacen producto){
        Connection conn = null;
        PreparedStatement ps = null;
        int registros = 0;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("UPDATE almacen SET cantidad=?");

            ps.setInt(1,producto.getCantidad());

            registros = ps.executeUpdate();
            if(registros > 0) System.out.println("La cantidad se ha actualizado con exito");

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return registros;
    }
    public int desactivarProducto(almacen producto){
        Connection conn = null;
        PreparedStatement ps = null;
        int registros = 0;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("UPDATE almacen SET estatus =?");

            ps.setBoolean(1,false);

            registros = ps.executeUpdate();
            if(registros > 0) System.out.println("El producto se ha desactivado con exito");

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return registros;
    }
}
