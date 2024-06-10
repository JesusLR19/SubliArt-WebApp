package Datos.Main;
import Datos.productosDAO;
import Modelo.productos;
import Modelo.usuarios;
import java.util.List;
import Datos.almacenDAO;
import Modelo.almacen;
public class Main_productos {
    public static void main(String[] args) {

        productosDAO dao = new productosDAO();
        almacenDAO almacenDAOs = new almacenDAO();
//        List<almacen> almacen = almacenDAOs.listar();
//
//        for (almacen a : almacen) {
//            System.out.println(a.getId_producto());
//        }
        almacenDAOs.update(1,49,true);

//        List<productos> productos = dao.listarProductos();
//        for (productos producto : productos) {
//            System.out.println(producto.getNombre_producto());
//        }
    }
}
