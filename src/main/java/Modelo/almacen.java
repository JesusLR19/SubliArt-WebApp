package Modelo;

import java.io.Serializable;

public class almacen implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_producto;
    private int cantidad;
    private boolean estatus;

    public almacen(){
    }

    public almacen(int id_producto, int cantidad, boolean estatus) {
        this.id_producto = id_producto;
        this.cantidad = cantidad;
        this.estatus = estatus;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public boolean isEstatus() {
        return estatus;
    }

    public void setEstatus(boolean estatus) {
        this.estatus = estatus;
    }
}
