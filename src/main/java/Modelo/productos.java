package Modelo;

import java.io.Serializable;

public class productos implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_producto;
    private String nombre_producto;
    private int id_descripcion;
    private int id_categoria;
    private float precio;

    public productos(){}

    public productos(int id_producto, String nombre_producto, int id_descripcion, int id_categoria, float precio) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.id_descripcion = id_descripcion;
        this.id_categoria = id_categoria;
        this.precio = precio;
    }

    public int getId_producto() {
        return id_producto;
    }

    public void setId_producto(int id_producto) {
        this.id_producto = id_producto;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public int getId_descripcion() {
        return id_descripcion;
    }

    public void setId_descripcion(int id_descripcion) {
        this.id_descripcion = id_descripcion;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
}
