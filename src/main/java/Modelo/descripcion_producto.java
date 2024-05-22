package Modelo;

import java.io.Serializable;

public class descripcion_producto implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_descripcion;
    private String color;
    private String talla;
    private String material;

    public descripcion_producto(){}

    public descripcion_producto(int id_descripcion, String color, String talla, String material) {
        this.id_descripcion = id_descripcion;
        this.color = color;
        this.talla = talla;
        this.material = material;
    }

    public int getId_descripcion() {
        return id_descripcion;
    }

    public void setId_descripcion(int id_descripcion) {
        this.id_descripcion = id_descripcion;
    }

    public String getColor() {
        return color;
    }

    public void setColor(String color) {
        this.color = color;
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
