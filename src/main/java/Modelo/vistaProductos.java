package Modelo;

import java.io.Serializable;

public class vistaProductos implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_producto;
    private String nombre_producto;
    private String descripcion;
    private String categoria;
    private float precio;

    public vistaProductos() {}

    public vistaProductos(int id_producto, String nombre_producto, String descripcion, String categoria, float precio) {
        this.id_producto = id_producto;
        this.nombre_producto = nombre_producto;
        this.descripcion = descripcion;
        this.categoria = categoria;
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

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
}
