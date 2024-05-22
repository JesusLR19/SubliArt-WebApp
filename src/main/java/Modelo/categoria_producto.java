package Modelo;

import java.io.Serializable;

public class categoria_producto implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_categoria;
    private String nombre_categoria;
    private String descripcion;

    public categoria_producto(){

    }

    public categoria_producto(int id_categoria, String nombre_categoria, String descripcion) {
        this.id_categoria = id_categoria;
        this.nombre_categoria = nombre_categoria;
        this.descripcion = descripcion;
    }

    public int getId_categoria() {
        return id_categoria;
    }

    public void setId_categoria(int id_categoria) {
        this.id_categoria = id_categoria;
    }

    public String getNombre_categoria() {
        return nombre_categoria;
    }

    public void setNombre_categoria(String nombre_categoria) {
        this.nombre_categoria = nombre_categoria;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
