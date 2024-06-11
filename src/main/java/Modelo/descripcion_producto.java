package Modelo;

import java.io.Serializable;

public class descripcion_producto implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_descripcion;
    private String descripcion;
    private String talla;
    private String material;

    public descripcion_producto(){}

    public descripcion_producto(int id_descripcion, String descripcion, String talla, String material) {
        this.id_descripcion = id_descripcion;
        this.descripcion = descripcion;
        this.talla = talla;
        this.material = material;
    }

    public int getId_descripcion() {
        return id_descripcion;
    }

    public void setId_descripcion(int id_descripcion) {
        this.id_descripcion = id_descripcion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getTalla() {
        return talla;
    }

    public void setTalla(String talla) {
        this.talla = talla;
    }

    public String getMaterial() {
        return material;
    }

    public void setMaterial(String material) {
        this.material = material;
    }
}
