package Datos;
import Modelo.pedidos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class pedidosDAO {

    public List<pedidos> listar(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<pedidos> pedido = new ArrayList<>();

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM pedidos");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_pedido = rs.getInt("id_pedido");
                int id_usuario = rs.getInt("id_usuario");
                int total_productos = rs.getInt("total_productos");
                float total_mxn = rs.getFloat("total_mxn");
                boolean estatus = rs.getBoolean("estatus");

                pedidos add_pedido = new pedidos(id_pedido,id_usuario,total_productos,total_mxn,estatus);
                pedido.add(add_pedido);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return pedido;
    }
}
