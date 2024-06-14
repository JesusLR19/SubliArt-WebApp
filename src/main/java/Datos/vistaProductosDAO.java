package Datos;

import Modelo.vistaProductos;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class vistaProductosDAO {

    public List<vistaProductos> listarBasicas(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<vistaProductos> lista_productos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM vista_productos WHERE categoria ='Basica' ORDER BY id_producto ASC ");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_producto = rs.getInt("id_producto");
                String nombre_producto = rs.getString("nombre_producto");
                String descripcion = rs.getString("descripcion");
                String categoria = rs.getString("categoria");
                Float precio = rs.getFloat("precio");

                vistaProductos producto = new vistaProductos(id_producto,nombre_producto,descripcion,categoria,precio);
                lista_productos.add(producto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return lista_productos;
    }
    public List<vistaProductos> listarSlimFit(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<vistaProductos> lista_productos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM vista_productos WHERE categoria ='SlimFit' ORDER BY id_producto ASC ");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_producto = rs.getInt("id_producto");
                String nombre_producto = rs.getString("nombre_producto");
                String descripcion = rs.getString("descripcion");
                String categoria = rs.getString("categoria");
                Float precio = rs.getFloat("precio");

                vistaProductos producto = new vistaProductos(id_producto,nombre_producto,descripcion,categoria,precio);
                lista_productos.add(producto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return lista_productos;
    }

    public List<vistaProductos> listarRelaxedFit(){
        Connection conn = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        List<vistaProductos> lista_productos = new ArrayList<>();
        try {
            conn = Conexion.getConnection();
            ps = conn.prepareStatement("SELECT * FROM vista_productos WHERE categoria ='RelaxedFit' ORDER BY id_producto ASC ");
            rs = ps.executeQuery();

            while (rs.next()){
                int id_producto = rs.getInt("id_producto");
                String nombre_producto = rs.getString("nombre_producto");
                String descripcion = rs.getString("descripcion");
                String categoria = rs.getString("categoria");
                Float precio = rs.getFloat("precio");

                vistaProductos producto = new vistaProductos(id_producto,nombre_producto,descripcion,categoria,precio);
                lista_productos.add(producto);
            }
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            Conexion.close(rs);
            Conexion.close(ps);
            Conexion.close(conn);
        }
        return lista_productos;
    }
}
