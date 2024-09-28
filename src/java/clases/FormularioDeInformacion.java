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
public class FormularioDeInformacion {

    private int id;
    private Date fecha;
    private String habitantes;
    private String espacio;
    private String ninos;
    private String tiempoLibre;
    private String responsables;
    private String otrasMascotas;
    private String propietario;
    private String ocupacion;
    private String motivacion;
    private String compromiso;
    private String descripcion;
    private String horarioVisita;
    private String fotoRecibo;
    private String fotoVivienda;
    private String fotoCedula;
    private int codigoAdopcion;

    public FormularioDeInformacion() {
    }

    public FormularioDeInformacion(int id, Date fecha, String habitantes, String espacio, String ninos, String tiempoLibre, String responsables, String otrasMascotas, String propietario, String ocupacion, String motivacion, String compromiso, String descripcion, String horarioVisita, String fotoRecibo, String fotoVivienda, String fotoCedula, int codigoAdopcion) {
        this.id = id;
        this.fecha = fecha;
        this.habitantes = habitantes;
        this.espacio = espacio;
        this.ninos = ninos;
        this.tiempoLibre = tiempoLibre;
        this.responsables = responsables;
        this.otrasMascotas = otrasMascotas;
        this.propietario = propietario;
        this.ocupacion = ocupacion;
        this.motivacion = motivacion;
        this.compromiso = compromiso;
        this.descripcion = descripcion;
        this.horarioVisita = horarioVisita;
        this.fotoRecibo = fotoRecibo;
        this.fotoVivienda = fotoVivienda;
        this.fotoCedula = fotoCedula;
        this.codigoAdopcion = codigoAdopcion;
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

    public String getHabitantes() {
        return habitantes;
    }

    public void setHabitantes(String habitantes) {
        this.habitantes = habitantes;
    }

    public String getEspacio() {
        return espacio;
    }

    public void setEspacio(String espacio) {
        this.espacio = espacio;
    }

    public String getNinos() {
        return ninos;
    }

    public void setNinos(String ninos) {
        this.ninos = ninos;
    }

    public String getTiempoLibre() {
        return tiempoLibre;
    }

    public void setTiempoLibre(String tiempoLibre) {
        this.tiempoLibre = tiempoLibre;
    }

    public String getResponsables() {
        return responsables;
    }

    public void setResponsables(String responsables) {
        this.responsables = responsables;
    }

    public String getOtrasMascotas() {
        return otrasMascotas;
    }

    public void setOtrasMascotas(String otrasMascotas) {
        this.otrasMascotas = otrasMascotas;
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getMotivacion() {
        return motivacion;
    }

    public void setMotivacion(String motivacion) {
        this.motivacion = motivacion;
    }

    public String getCompromiso() {
        return compromiso;
    }

    public void setCompromiso(String compromiso) {
        this.compromiso = compromiso;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getCodigoAdopcion() {
        return codigoAdopcion;
    }

    public void setCodigoAdopcion(int codigoAdopcion) {
        this.codigoAdopcion = codigoAdopcion;
    }

    public String getHorarioVisita() {
        return horarioVisita;
    }

    public void setHorarioVisita(String horarioVisita) {
        this.horarioVisita = horarioVisita;
    }

    public String getFotoRecibo() {
        return fotoRecibo;
    }

    public void setFotoRecibo(String fotoRecibo) {
        this.fotoRecibo = fotoRecibo;
    }

    public String getFotoVivienda() {
        return fotoVivienda;
    }

    public void setFotoVivienda(String fotoVivienda) {
        this.fotoVivienda = fotoVivienda;
    }

    public String getFotoCedula() {
        return fotoCedula;
    }

    public void setFotoCedula(String fotoCedula) {
        this.fotoCedula = fotoCedula;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into formularioDeInformacion (fecha, habitantes, espacio, ninos, tiempoLibre, responsables, otrasMascotas, propietario, ocupacion, motivacion, compromiso, descripcion, horarioVisita, fotoRecibo, fotoVivienda, fotoCedula, codigoAdopcion) "
                + "values('" + fecha + "', '" + habitantes + "', '" + espacio + "', '" + ninos + "', '" + tiempoLibre + "', '" + responsables + "', '" + otrasMascotas + "', '" + propietario + "', '" + ocupacion + "', '" + motivacion + "', '" + compromiso + "', '" + descripcion + "', '" + horarioVisita + "', '" + fotoRecibo + "', '" + fotoVivienda + "', '" + fotoCedula + "', '" + codigoAdopcion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
    String cadenaSQL = "update formularioDeInformacion set " + 
                       "fecha = '" + fecha + "', " + 
                       "habitantes = '" + habitantes + "', " +
                       "espacio = '" + espacio + "', " +
                       "ninos = '" + ninos + "', " + 
                       "tiempoLibre = '" + tiempoLibre + "', " + 
                       "responsables = '" + responsables + "', " +
                       "otrasMascotas = '" + otrasMascotas + "', " +
                       "propietario = '" + propietario + "', " + 
                       "ocupacion = '" + ocupacion + "', " + 
                       "motivacion = '" + motivacion + "', " + 
                       "compromiso = '" + compromiso + "', " + 
                       "descripcion = '" + descripcion + "', " + 
                       "horarioVisita = '" + horarioVisita + "', " + 
                       "fotoRecibo = '" + fotoRecibo + "', " + 
                       "fotoVivienda = '" + fotoVivienda + "', " + 
                       "fotoCedula = '" + fotoCedula + "' " + 
                       "where codigoAdopcion = '" + codigoAdopcion + "'";
    return ConectorBD.ejecutarQuery(cadenaSQL);
}


    public boolean eliminar() {
        String cadenaSQL = "delete from adopcion where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
}
