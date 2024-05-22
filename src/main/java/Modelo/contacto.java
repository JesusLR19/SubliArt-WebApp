package Modelo;

import java.io.Serializable;

public class contacto implements Serializable {
    private static final long serialVersionUID = 1L;

    private int id_contacto;
    private String calle;
    private int numero;
    private String colonia;
    private int cp;
    private String referencias;
    private int num_telefonico;

    public contacto(){}

    public contacto(int id_contacto, String calle, int numero, String colonia, int cp, String referencias, int num_telefonico) {
        this.id_contacto = id_contacto;
        this.calle = calle;
        this.numero = numero;
        this.colonia = colonia;
        this.cp = cp;
        this.referencias = referencias;
        this.num_telefonico = num_telefonico;
    }

    public int getId_contacto() {
        return id_contacto;
    }

    public void setId_contacto(int id_contacto) {
        this.id_contacto = id_contacto;
    }

    public String getCalle() {
        return calle;
    }

    public void setCalle(String calle) {
        this.calle = calle;
    }

    public int getNumero() {
        return numero;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public String getColonia() {
        return colonia;
    }

    public void setColonia(String colonia) {
        this.colonia = colonia;
    }

    public int getCp() {
        return cp;
    }

    public void setCp(int cp) {
        this.cp = cp;
    }

    public String getReferencias() {
        return referencias;
    }

    public void setReferencias(String referencias) {
        this.referencias = referencias;
    }

    public int getNum_telefonico() {
        return num_telefonico;
    }

    public void setNum_telefonico(int num_telefonico) {
        this.num_telefonico = num_telefonico;
    }
}
