package Datos.Main;
import Datos.descripcionDAO;
import Datos.productosDAO;
import Modelo.descripcion_producto;
import Modelo.productos;
import Modelo.usuarios;
import java.util.List;
import Datos.almacenDAO;
import Modelo.almacen;
import Datos.categoriaDAO;
import Modelo.categoria_producto;
import Modelo.vistaProductos;
import Datos.vistaProductosDAO;

public class Main_productos {
    public static void main(String[] args) {

//        productosDAO dao = new productosDAO();
//        descripcionDAO descripcionDAO = new descripcionDAO();
//        List<descripcion_producto> descripciones = descripcionDAO.listar();
//        if (descripciones != null) {
//            for (descripcion_producto descripcion : descripciones) {
//                System.out.println(descripcion.getId_descripcion());
//                System.out.println(descripcion.getDescripcion());
//                System.out.println(descripcion.getTalla());
//                System.out.println(descripcion.getMaterial());
//            }
//        }

        vistaProductosDAO vistaProductosDAO = new vistaProductosDAO();
        List<vistaProductos> productos = vistaProductosDAO.listarBasicas();
        if (productos != null) {
            for (vistaProductos producto : productos) {
                System.out.println(producto.getId_producto());
                System.out.println(producto.getNombre_producto());
                System.out.println(producto.getDescripcion());
                System.out.println(producto.getCategoria());
                System.out.println(producto.getPrecio());
                System.out.println("------------------------");
            }
        }


/*        categoriaDAO cdao = new categoriaDAO();
        List<categoria_producto> categorias = cdao.listar();
        if (categorias != null) {
            for (categoria_producto producto : categorias) {
                System.out.println(producto.getId_categoria());
                System.out.println(producto.getNombre_categoria());

            }
        }*/

            //almacenDAO almacenDAOs = new almacenDAO();
//        List<almacen> almacen = almacenDAOs.listar();
//
//        for (almacen a : almacen) {
//            System.out.println(a.getId_producto());
//        }
            //almacenDAOs.update(1,49,true);

//        List<productos> productos = dao.listarProductos();
//        for (productos producto : productos) {
//            System.out.println(producto.getNombre_producto());
//        }

    }
}