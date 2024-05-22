package Modelo;

import java.io.Serializable;

public class usuarios implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_usuario;
    private String nombre;
    private String apellido_p;
    private String apellido_m;
    private String username;
    private String password;
    private int id_contacto;
    private int id_rol;
    private boolean estatus;

    public usuarios(){}

    public usuarios(int id_usuario, String nombre, String apellido_p, String apellido_m, String username, String password, int id_contacto, int id_rol, boolean estatus) {
        this.id_usuario = id_usuario;
        this.nombre = nombre;
        this.apellido_p = apellido_p;
        this.apellido_m = apellido_m;
        this.username = username;
        this.password = password;
        this.id_contacto = id_contacto;
        this.id_rol = id_rol;
        this.estatus = estatus;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido_p() {
        return apellido_p;
    }

    public void setApellido_p(String apellido_p) {
        this.apellido_p = apellido_p;
    }

    public String getApellido_m() {
        return apellido_m;
    }

    public void setApellido_m(String apellido_m) {
        this.apellido_m = apellido_m;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public int getId_contacto() {
        return id_contacto;
    }

    public void setId_contacto(int id_contacto) {
        this.id_contacto = id_contacto;
    }

    public int getId_rol() {
        return id_rol;
    }

    public void setId_rol(int id_rol) {
        this.id_rol = id_rol;
    }

    public boolean isEstatus() {
        return estatus;
    }

    public void setEstatus(boolean estatus) {
        this.estatus = estatus;
    }
}
