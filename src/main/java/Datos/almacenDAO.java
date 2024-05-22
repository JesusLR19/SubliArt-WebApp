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
}
