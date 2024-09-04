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
        } catch (SQLException e) {
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
    
    public static ResultSet getLista(String filtro, String orden){
       if(filtro != null && filtro != ""){
           filtro = " where " + filtro;
       }else{
           filtro= " ";
       }
       if (orden != null && orden != ""){
           orden = " orden by " +orden;
       }else {
           orden = " ";
       }
       String cadenaSQL="Select id, nombre, descrpcion from Planesapadrinamiento" +filtro+orden;
       return ConectorBD.consultar(cadenaSQL);
   }
    
    public static List<PlanesApadrinamiento> getListaEnObjetos(String filtro, String orden){
       List<PlanesApadrinamiento> lista=new ArrayList<>();
       ResultSet datos= PlanesApadrinamiento.getLista(filtro, orden);
       if (datos != null){
           try {
               while(datos.next()){
                   PlanesApadrinamiento planes = new PlanesApadrinamiento();
                   planes.setId("id");
                   planes.setNombre("nombre");
                   planes.setDescripcion("descripcion");
                   
                   lista.add(planes);
               }
           } catch (SQLException ex) {
               Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       return lista;
   }
}

