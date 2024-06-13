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
    public List<pedidos> listarPorUsuario(int id_usuario){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        List<pedidos> pedido = new ArrayList<>();

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM pedidos where id_usuario = ?");
            ps.setInt(1,id_usuario);
            rs = ps.executeQuery();

            while (rs.next()){
                int id_pedido = rs.getInt("id_pedido");
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
    public void agregarPedido(pedidos pedido){
        Connection conn = null;
        PreparedStatement ps = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("INSERT INTO pedidos (id_usuario,total_productos,total_mxn,estatus) VALUES (?,?,?,?)");

            ps.setInt(1,pedido.getId_usuario());
            ps.setInt(2,pedido.getTotal_productos());
            ps.setDouble(3,pedido.getTotal_mxn());
            ps.setBoolean(4,true);

            ps.executeUpdate();

        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(ps);
            Conexion.close(conn);
        }
    }
    public pedidos identificar(int idPedido) throws Exception{
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        pedidos pedido = null;

        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM pedidos WHERE id_pedido=?");
            ps.setInt(1,idPedido);
            rs = ps.executeQuery();

            if (rs.next()){
                int id_pedido = rs.getInt("id_pedido");
                int id_usuario = rs.getInt("id_usuario");
                int total_productos = rs.getInt("total_productos");
                float total_mxn = rs.getFloat("total_mxn");
                boolean estatus = rs.getBoolean("estatus");

                pedido = new pedidos(id_pedido,id_usuario,total_productos,total_mxn,estatus);
            }
        }catch (Exception e){
            e.printStackTrace();
            throw new Exception("Error al identificar el pedido", e);
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return pedido;
    }
}
