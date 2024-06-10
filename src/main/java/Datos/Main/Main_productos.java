package Datos.Main;
import Datos.productosDAO;
import Modelo.productos;
import Modelo.usuarios;
import java.util.List;

public class Main_productos {
    public static void main(String[] args) {

        productosDAO dao = new productosDAO();

        List<productos> productos = dao.listarProductos();
        for (productos producto : productos) {
            System.out.println(producto.getNombre_producto());
        }
    }
}
