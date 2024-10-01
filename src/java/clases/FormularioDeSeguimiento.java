/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Luis Eraso
 */
public class FormularioDeSeguimiento {

    private int codigo;
    private Date fecha;
    private String foto;
    private Date fechaProximaVisita;
    private String descripcion;
    private String evolucionMedica;
    private String masaCorporal;
    private String estadoEmocional;
    private String adaptacion;
    private String vinculo;
    private int calificacion;

    public FormularioDeSeguimiento() {
    }

    public FormularioDeSeguimiento(int codigo, Date fecha, String foto, Date fechaProximaVisita, String descripcion, String evolucionMedica, String masaCorporal, String estadoEmocional, String adaptacion, String vinculo, int calificacion) {
        this.codigo = codigo;
        this.fecha = fecha;
        this.foto = foto;
        this.fechaProximaVisita = fechaProximaVisita;
        this.descripcion = descripcion;
        this.evolucionMedica = evolucionMedica;
        this.masaCorporal = masaCorporal;
        this.estadoEmocional = estadoEmocional;
        this.adaptacion = adaptacion;
        this.vinculo = vinculo;
        this.calificacion = calificacion;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
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

    public int getCalificacion() {
        return calificacion;
    }

    public void setCalificacion(int calificacion) {
        this.calificacion = calificacion;
    }

    @Override
    public String toString() {
        return "FormularioDeSeguimiento{" + "codigo=" + codigo + ", fecha=" + fecha + ", foto='" + foto + '\'' + ", fechaProximaVisita=" + fechaProximaVisita
                + ", descripcion='" + descripcion + '\'' + ", evolucionMedica='" + evolucionMedica + '\'' + ", masaCorporal='" + masaCorporal + '\'' + ", estadoEmocional='" + estadoEmocional + '\''
                + ", adaptacion='" + adaptacion + '\'' + ", vinculo='" + vinculo + '\'' + ", calificacion=" + calificacion
                + '}';
    }

    public boolean grabar() {
        String cadenaSQL = "INSERT INTO formularioDeSeguimiento "
                + "(fecha, foto, fechaProximaVisita, descripcion, evolucionMedica, masaCorporal, estadoEmocional, adaptacion, vinculo, calificacion) "
                + "VALUES ('" + fecha + "', '" + foto + "', '" + fechaProximaVisita + "', '" + descripcion + "', '" + evolucionMedica + "', '" + masaCorporal + "', '" + estadoEmocional + "', '" + adaptacion + "', '" + vinculo + "', " + calificacion + ")";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean grabarFormularioConProcedimientoAlmacenado() {
        String cadenaSQL = "CALL insertarFormularioDeSeguimiento('"
                + this.fecha + "','"
                + this.foto + "','"
                + this.fechaProximaVisita + "','"
                + this.descripcion + "','"
                + this.evolucionMedica + "','"
                + this.masaCorporal + "','"
                + this.estadoEmocional + "','"
                + this.adaptacion + "','"
                + this.vinculo + "',"
                + this.calificacion + ")";

        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE formularioDeSeguimiento SET "
                + "fecha = '" + fecha + "', "
                + "foto = '" + foto + "', "
                + "fechaProximaVisita = '" + fechaProximaVisita + "', "
                + "descripcion = '" + descripcion + "', "
                + "evolucionMedica = '" + evolucionMedica + "', "
                + "masaCorporal = '" + masaCorporal + "', "
                + "estadoEmocional = '" + estadoEmocional + "', "
                + "adaptacion = '" + adaptacion + "', "
                + "vinculo = '" + vinculo + "', "
                + "calificacion = " + calificacion + " "
                + "WHERE codigo = " + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM formularioDeSeguimiento WHERE codigo = " + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.isEmpty()) {
            filtro = " WHERE " + filtro;
        } else {
            filtro = " ";
        }
        if (orden != null && !orden.isEmpty()) {
            orden = " ORDER BY " + orden;
        } else {
            orden = " ";
        }

        String cadenaSQL = "SELECT codigo, fecha, foto, fechaProximaVisita, descripcion, evolucionMedica, masaCorporal, estadoEmocional, adaptacion, vinculo, calificacion "
                + "FROM formularioDeSeguimiento" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<FormularioDeSeguimiento> getListaEnObjetos(String filtro, String orden) {
        List<FormularioDeSeguimiento> lista = new ArrayList<>();
        ResultSet datos = FormularioDeSeguimiento.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    FormularioDeSeguimiento formulario = new FormularioDeSeguimiento();
                    formulario.setCodigo(datos.getInt("codigo"));
                    formulario.setFecha(datos.getDate("fecha"));
                    formulario.setFoto(datos.getString("foto"));
                    formulario.setFechaProximaVisita(datos.getDate("fechaProximaVisita"));
                    formulario.setDescripcion(datos.getString("descripcion"));
                    formulario.setEvolucionMedica(datos.getString("evolucionMedica"));
                    formulario.setMasaCorporal(datos.getString("masaCorporal"));
                    formulario.setEstadoEmocional(datos.getString("estadoEmocional"));
                    formulario.setAdaptacion(datos.getString("adaptacion"));
                    formulario.setVinculo(datos.getString("vinculo"));
                    formulario.setCalificacion(datos.getInt("calificacion"));

                    lista.add(formulario);
                }
            } catch (SQLException ex) {
                Logger.getLogger(FormularioDeSeguimiento.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnArregloJS(String filtro, String orden) {
        String lista = "[";

        List<FormularioDeSeguimiento> datos = FormularioDeSeguimiento.getListaEnObjetos(filtro, orden);
        for (int i = 0; i < datos.size(); i++) {
            FormularioDeSeguimiento formulario = datos.get(i);
            if (i > 0) {
                lista += ", ";
            }
            lista += "{"
                    + "\"codigo\": " + formulario.getCodigo() + ", "
                    + "\"fecha\": \"" + formulario.getFecha() + "\", "
                    + "\"foto\": \"" + formulario.getFoto() + "\", "
                    + "\"fechaProximaVisita\": \"" + formulario.getFechaProximaVisita() + "\", "
                    + "\"descripcion\": \"" + formulario.getDescripcion() + "\", "
                    + "\"evolucionMedica\": \"" + formulario.getEvolucionMedica() + "\", "
                    + "\"masaCorporal\": \"" + formulario.getMasaCorporal() + "\", "
                    + "\"estadoEmocional\": \"" + formulario.getEstadoEmocional() + "\", "
                    + "\"adaptacion\": \"" + formulario.getAdaptacion() + "\", "
                    + "\"vinculo\": \"" + formulario.getVinculo() + "\", "
                    + "\"calificacion\": " + formulario.getCalificacion()
                    + "}";
        }
        lista += "]";
        return lista;
    }

}
