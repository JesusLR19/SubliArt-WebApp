package Modelo;

import java.io.Serializable;

public class pedidos implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_pedido;
    private int id_usuario;
    private int total_productos;
    private float total_mxn;
    private boolean estatus;

    public pedidos(){}

    public pedidos(int id_pedido, int id_usuario, int total_productos, float total_mxn, boolean estatus) {
        this.id_pedido = id_pedido;
        this.id_usuario = id_usuario;
        this.total_productos = total_productos;
        this.total_mxn = total_mxn;
        this.estatus = estatus;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public int getTotal_productos() {
        return total_productos;
    }

    public void setTotal_productos(int total_productos) {
        this.total_productos = total_productos;
    }

    public float getTotal_mxn() {
        return total_mxn;
    }

    public void setTotal_mxn(float total_mxn) {
        this.total_mxn = total_mxn;
    }

    public boolean isEstatus() {
        return estatus;
    }

    public void setEstatus(boolean estatus) {
        this.estatus = estatus;
    }
}
