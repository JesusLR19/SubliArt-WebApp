package Modelo;

import java.io.Serializable;

public class rol implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_rol;
    private String nombre_rol;
    private String descripcion;

    public rol(){}

    public rol(int id_rol, String nombre_rol, String descripcion) {
        this.id_rol = id_rol;
        this.nombre_rol = nombre_rol;
        this.descripcion = descripcion;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public String getNombre_rol() {
        return nombre_rol;
    }

    public void setNombre_rol(String nombre_rol) {
        this.nombre_rol = nombre_rol;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
}
