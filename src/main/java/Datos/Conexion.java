package Datos;

import org.apache.commons.dbcp2.BasicDataSource;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
public class Conexion {
    private static String user = "postgres";
    private static String password = "211910"; //colocar la contraseña que tenga en su sgbd
    private static String bd = "SubliArt"; //colocar el nombre con el que hicieron su bd con los scripts
    private static String server = "jdbc:postgresql://localhost:5432/" + bd;
    private static String driver = "org.postgresql.Driver";

    private static BasicDataSource ds;

    public static DataSource getDataSource(){
        if(ds == null){
            ds = new BasicDataSource();
            ds.setUrl(server);
            ds.setUsername(user);
            ds.setPassword(password);
            ds.setInitialSize(50);
            ds.setDriverClassName(driver);
        }
        return ds;
    }
    public static Connection getConnection() throws SQLException{
        return getDataSource().getConnection();
    }
    public static void close(ResultSet rs){
        try {
            rs.close();
        }catch (SQLException ex){
            ex.printStackTrace(System.out);
        }
    }
    public static void close(PreparedStatement ps){
        try{
            ps.close();
        }catch (SQLException ex){
            ex.printStackTrace(System.out);
        }
    }
    public static void close(Connection conn){
        try{
            conn.close();
        }catch (SQLException ex){
            ex.printStackTrace(System.out);
        }
    }
}
