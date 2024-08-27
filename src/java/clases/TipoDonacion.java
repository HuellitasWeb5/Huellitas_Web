/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Luis Eraso
 */
public class TipoDonacion {

    private String codigo;
    private String nombre;
    private String descripcion;

    public TipoDonacion() {
    }

    public TipoDonacion(String codigo) {
        String cadenaSQL = "select codigo, nombre, descripcion from planesApadrinamiento";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
            }
        } catch (SQLException ex) {
            System.out.println("Error en la consulta en tipoDonacion: "+ex.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
     @Override
    public String toString() {
        String datos = "";
        if (codigo != null) {
            datos = nombre;
        }
        return datos;
    }


    public boolean grabar() {
        String cadenaSQL = "insert into tipoDonacion (nombre,descripcion) "
                + " values ('" + nombre + "','" + descripcion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update tipoDonacion set nombre='" + nombre + "',descripcion='" + descripcion + "' where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from tipoDonacion where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
}
