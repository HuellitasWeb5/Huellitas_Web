/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.Date;

/**
 *
 * @author Luis Eraso
 */
public class FormularioDeSeguimiento {

    private int id;
    private Date fecha;
    private String foto;
    private Date fechaProximaVisita;
    private String descripcion;
    private String evolucionMedica;
    private String masaCorporal;
    private String estadoEmocional;
    private String adaptacion;
    private String vinculo;
    private int codigoAdopcion;

    public FormularioDeSeguimiento() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public Date getFechaProximaVisita() {
        return fechaProximaVisita;
    }

    public void setFechaProximaVisita(Date fechaProximaVisita) {
        this.fechaProximaVisita = fechaProximaVisita;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEvolucionMedica() {
        return evolucionMedica;
    }

    public void setEvolucionMedica(String evolucionMedica) {
        this.evolucionMedica = evolucionMedica;
    }

    public String getMasaCorporal() {
        return masaCorporal;
    }

    public void setMasaCorporal(String masaCorporal) {
        this.masaCorporal = masaCorporal;
    }

    public String getEstadoEmocional() {
        return estadoEmocional;
    }

    public void setEstadoEmocional(String estadoEmocional) {
        this.estadoEmocional = estadoEmocional;
    }

    public String getAdaptacion() {
        return adaptacion;
    }

    public void setAdaptacion(String adaptacion) {
        this.adaptacion = adaptacion;
    }

    public String getVinculo() {
        return vinculo;
    }

    public void setVinculo(String vinculo) {
        this.vinculo = vinculo;
    }

    public int getCodigoAdopcion() {
        return codigoAdopcion;
    }

    public void setCodigoAdopcion(int codigoAdopcion) {
        this.codigoAdopcion = codigoAdopcion;
    }

    public boolean grabar() {
    String cadenaSQL = "insert into formularioDeInformacion (fecha, foto,  fechaProximaVisita, descripcion, evolucionMedica, masaCorporal, estadoEmocional, adaptacion, vinculo codigoAdopcion) " +
                       "values('" + fecha + "', '" + foto + "', '" + fechaProximaVisita + "', '" + descripcion + "', '" + evolucionMedica + "', '" + masaCorporal + "', '" + estadoEmocional + "', '" + adaptacion + "', '" + vinculo + codigoAdopcion + "')";
    return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean modificar() {
    String cadenaSQL = "update formularioDeInformacion set " + "fecha = '" + fecha + "', " + "foto = '" + foto + "', " + "fechaProximaVisita = '" + fechaProximaVisita + "', " + "descripcion = '" + descripcion + "', " + 
                       "evolucionMedica = '" + evolucionMedica + "', " + "masaCorporal = '" + masaCorporal + "', " + "estadoEmocional = '" + estadoEmocional + "', " + "adaptacion = '" + adaptacion + "', " + 
                       "vinculo = '" + vinculo + "' " + "where codigoAdopcion = '" + codigoAdopcion + "'";
    return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean eliminar () {
       String cadenaSQL="delete from adopcion where id="+id;
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
    
}

