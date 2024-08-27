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
public class ConceptoDonacion {
    /*
    */
 private String id;
    private String nombre;
    private String descripcion;
    private String tipo;
    private String idTipoDonacion;
    private String idUnidadDeMedida;

    public ConceptoDonacion() {
    }

    public ConceptoDonacion(String id) {
        String cadenaSQL = "select id, nombre, descripcion,tipo,idTipoDonacion,idUnidadDeMedida from conceptoDonacion";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
                tipo = resultado.getString("tipo");
                idTipoDonacion = resultado.getString("idTipoDonacion");
                idUnidadDeMedida = resultado.getString("idUnidadDeMedida");
            }
        } catch (SQLException ex) {
            System.out.println("Error en la consulta en conceptoDonacion: "+ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
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

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getIdTipoDonacion() {
        return idTipoDonacion;
    }

    public void setIdTipoDonacion(String idTipoDonacion) {
        this.idTipoDonacion = idTipoDonacion;
    }

    public String getIdUnidadDeMedida() {
        return idUnidadDeMedida;
    }

    public void setIdUnidadDeMedida(String idUnidadDeMedida) {
        this.idUnidadDeMedida = idUnidadDeMedida;
    }
    @Override
    
    public String toString(){
        return nombre;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into conceptoDonacion (nombre,descripcion,tipo,idTipoDonacion,descripcion) "
                + " values ('" + nombre + "','" + descripcion + "','" + tipo + "','" + idTipoDonacion + "','" + descripcion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update conceptoDonacion set nombre='" + nombre + "',descripcion='" + descripcion + "',tipo='" + tipo + "',idTipoDonacion='" + idTipoDonacion + "',idUnidadDeMedida='" + idUnidadDeMedida + "' where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from conceptoDonacion where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
}
