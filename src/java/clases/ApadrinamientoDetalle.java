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
public class ApadrinamientoDetalle {
    private String id;
    private String codigoApadrinamiento;
    private String planApadrinamiento;
    private String idPlanApadrinamiento;
    private String codigoMascota;
    private String lapsoApadrinamiento;

    public ApadrinamientoDetalle() {
    }
    public ApadrinamientoDetalle(String CodPadripet) {
        String cadenaSQL = "select id,codigoApadrinamiento,idPlanApadrinamiento,codigoMascota,lapsoApadrinamiento from apadrinamientoDetalles where codigoApadrinamiento=" + CodPadripet;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigoApadrinamiento = CodPadripet;
                id = resultado.getString("id");
                idPlanApadrinamiento = resultado.getString("idPlanApadrinamiento");
                codigoMascota = resultado.getString("codigoMascota");
                lapsoApadrinamiento = resultado.getString("lapsoApadrinamiento");
                
            }
        } catch (SQLException ex) {
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Error al consultar ApadrinamientoDetalle" + ex.getMessage());
        }
    }

    public String getFechaInicio() {
        // Divide la cadena por '/'
        String[] fechas = lapsoApadrinamiento.split("/");
        // Retorna la primera fecha
        return fechas.length > 0 ? fechas[0] : null;
    }

    public String getFechaFin() {
        // Divide la cadena por '/'
        String[] fechas = lapsoApadrinamiento.split("/");
        // Retorna la segunda fecha
        return fechas.length > 1 ? fechas[1] : null;
    }
    
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCodigoApadrinamiento() {
        return codigoApadrinamiento;
    }

    public void setCodigoApadrinamiento(String codigoApadrinamiento) {
        this.codigoApadrinamiento = codigoApadrinamiento;
    }

    public String getPlanApadrinamiento() {
        return planApadrinamiento;
    }

    public void setPlanApadrinamiento(String planApadrinamiento) {
        this.planApadrinamiento = planApadrinamiento;
    }

    public String getIdPlanApadrinamiento() {
        return idPlanApadrinamiento;
    }

    public void setIdPlanApadrinamiento(String idPlanApadrinamiento) {
        this.idPlanApadrinamiento = idPlanApadrinamiento;
    }

    public String getCodigoMascota() {
        return codigoMascota;
    }

    public void setCodigoMascota(String codigoMascota) {
        this.codigoMascota = codigoMascota;
    }

    public String getLapsoApadrinamiento() {
        return lapsoApadrinamiento;
    }

    public void setLapsoApadrinamiento(String lapsoApadrinamiento) {
        this.lapsoApadrinamiento = lapsoApadrinamiento;
    }

    @Override
    public String toString(){
      String datos = "";
        if (id != null) {
            datos = planApadrinamiento;
        }
        return datos;
    }
    
    public boolean grabar(){
        String cadenaSQL="insert into apadrinamientoDetalle(id,codigoApadrinamiento,planApadrinamiento,idPlanApadrinamiento,codigoMascota,lapsoApadrinamiento)"
                + " Values('"+id+"','"+codigoApadrinamiento+"','"+planApadrinamiento+"','"+idPlanApadrinamiento+"','"+codigoMascota+"','"+lapsoApadrinamiento+"')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public boolean modificar(){
        String cadenaSQL="update apadrimientoDetalle set id='"+id+"',codigoApadrinamiento='"+codigoApadrinamiento+"',planApadrinamiento='"+planApadrinamiento+"',"
                + "idPlanApadrinamiento='"+idPlanApadrinamiento+"',codigoMascota='"+codigoMascota+"',lapsoApadrinamiento='"+lapsoApadrinamiento+"' where id="+id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
        
    public boolean eliminar(){
        String cadenaSQL="delete from apadrinamientoDetalle where id="+id;
        System.out.println("cadenaSQL " + cadenaSQL);
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
       String cadenaSQL="select id,codigoApadrinamiento,idPlanApadrinamiento,codigoMascota,lapsoApadrinamiento from apadrinamientoDetalles" +filtro+orden;
       return ConectorBD.consultar(cadenaSQL);
   }
    
    public static List<ApadrinamientoDetalle> getListaEnObjetos(String filtro, String orden){
       List<ApadrinamientoDetalle> lista=new ArrayList<>();
       ResultSet datos= ApadrinamientoDetalle.getLista(filtro, orden);
       if (datos != null){
           try {
               while(datos.next()){
                   ApadrinamientoDetalle detalles = new ApadrinamientoDetalle();
                   detalles.setId(datos.getString("id"));
                   detalles.setCodigoApadrinamiento(datos.getString("codigoApadrinamiento"));
                   detalles.setIdPlanApadrinamiento(datos.getString("idPlanApadrinamiento"));
                   detalles.setCodigoMascota(datos.getString("codigoMascota"));
                   detalles.setLapsoApadrinamiento(datos.getString("lapsoApadrinamiento"));
                   
                   lista.add(detalles);
               }
           } catch (SQLException ex) {
               Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       return lista;
   }
    
}