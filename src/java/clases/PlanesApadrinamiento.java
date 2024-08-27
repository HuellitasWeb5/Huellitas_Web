/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;

/**
 *
 * @author Luis Eraso
 */
public class PlanesApadrinamiento {
    private String id;
    private String nombre;
    private String descripcion;

    public PlanesApadrinamiento() {
    }

    public PlanesApadrinamiento(String id) {
       String cadenaSQL="select id, nombre, descripcion from planesApadrinamiento";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
            }
        } catch (Exception e) {
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

    public boolean grabar(){
        String cadenaSQL="insert into planesApadrinamiento (nombre,descripcion) "
        + " values ('"+nombre+"','"+descripcion+"') where id="+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public boolean modificar(){
        String cadenaSQL="update planesApadrinamiento set nombre='"+nombre+"',descripcion='"+descripcion+"' where id="+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public boolean eliminar(){
        String cadenaSQL="delete from planesApadrinamiento where id="+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
}

