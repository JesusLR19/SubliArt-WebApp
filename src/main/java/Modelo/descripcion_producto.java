package Modelo;

import java.io.Serializable;

public class descripcion_producto implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_descripcion;
    private String estilo;
    private String color;
    private String talla;

    public descripcion_producto(){}

    public descripcion_producto(int id_descripcion, String estilo, String color, String talla) {
        this.id_descripcion = id_descripcion;
        this.estilo = estilo;
        this.color = color;
        this.talla = talla;
    }

    public int getId_descripcion() {
        return id_descripcion;
    }

    public void setId_descripcion(int id_descripcion) {
        this.id_descripcion = id_descripcion;
    }

    public String getEstilo() {
        return estilo;
    }

    public void setEstilo(String estilo) {
        this.estilo = estilo;
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
}
