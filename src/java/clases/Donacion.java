/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
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
public class Donacion {

    private String codigo;
    private String fecha;
    private String descripcion;
    private String identificacionDonante;

    public Donacion() {
    }

    public Donacion(String codigo) {
        String cadenaSQL = "select codigo,fecha,descripcion,identificacionDonante from donacion where codigo="+codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            this.codigo = codigo;
            fecha = resultado.getString("fecha");
            descripcion = resultado.getString("descripcion");
            identificacionDonante = resultado.getString("identificacionDonante");
        } catch (SQLException ex) {
            System.out.println("Error al consultar en donacion " + ex.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getIdentificacionDonante() {
        return identificacionDonante;
    }

    public void setIdentificacionDonante(String identificacionDonante) {
        this.identificacionDonante = identificacionDonante;
    }

    @Override
    
    public String toString() {
        return codigo;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into donacion(codigo,fecha,descripcion,identificacionDonante) values ('" + codigo + "','" + fecha + "','" + descripcion + "','" + identificacionDonante + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update donacion set fecha='" + fecha + "',descripcion='" + descripcion + "',identificacionDonante='" + identificacionDonante + "' where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from donacion where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null & filtro != "") {
            filtro = " where " + filtro;
        } else {
            filtro = "";
        }

        if (orden != null & orden != "") {
            orden = " order by" + orden;
        } else {
            orden = "";
        }
        String cadenSQL = "select codigo,fecha,descripcion,identificacionDonante from donacion ";
        return ConectorBD.consultar(cadenSQL);

    }

    public static List<Donacion> getListaEnObjetos(String filtro, String orden) {
       List<Donacion> lista = new ArrayList<>();
        ResultSet datos = getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    Donacion donacion = new Donacion();
                   donacion.setCodigo(datos.getString("codigo"));
                    donacion.setFecha(datos.getString("fecha"));
                    donacion.setDescripcion(datos.getString("descripcion"));
                    donacion.setIdentificacionDonante(datos.getString("identificacionDonante"));
                    lista.add(donacion);
                }

            } catch (SQLException ex) {
                Logger.getLogger(ConceptoDonacion.class.getName()).log(Level.SEVERE, (String) null, ex);

            }
        }
        return lista;
    }
}   
    
