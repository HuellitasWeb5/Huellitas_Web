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
public class Apadrinamiento {
    
    private String codigo;
    private String planApadrinamiento;
    private String fecha;
    private String identificacionPadrino;

    public Apadrinamiento() {
    }
    public Apadrinamiento(String codigo) {
        String cadenaSQL = "select codigo,planApadrinamiento,fecha,identificacionPadrino where codigo=" + codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                planApadrinamiento = resultado.getString("planApadrinamiento");
                fecha = resultado.getString("fecha");
                identificacionPadrino = resultado.getString("identificacionPadrino");
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar en apadrinamiento" + ex.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getPlanApadrinamiento() {
        return planApadrinamiento;
    }

    public void setPlanApadrinamiento(String planApadrinamiento) {
        this.planApadrinamiento = planApadrinamiento;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getIdentificacionPadrino() {
        return identificacionPadrino;
    }

    public void setIdentificacionPadrino(String identificacionPadrino) {
        this.identificacionPadrino = identificacionPadrino;
    }
    
      @Override
    public String toString() {
      
        return planApadrinamiento;
    }

    public List<ApadrinamientoDetalle> getDetalles() {
        return ApadrinamientoDetalle.getListaEnObjetos("codigoApadrinamiento='" + codigo + "'", null);
    }
    
    public boolean grabar() {
        String cadenaSQL = "insert into Apadrinamiento(planApadrinamiento,fecha,identificacionPadrino) "
                + " values ('" + planApadrinamiento + "','" + fecha + "','" + identificacionPadrino + "')";
        // System.out.println(cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean grabarConProcedimientoAlmacenado(String mascotasPlan) {
        String cadenaSQL = "call getRegistrarPadripet('" + this.identificacionPadrino + "','" + mascotasPlan+ "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean modificar() {

        String cadenaSQL = "update Apadrinamiento set planApadrinamiento='" +planApadrinamiento + "',fecha='" +fecha + "',identificacionPadrino='" +identificacionPadrino + "'  where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from Apadrinamiento where codigo=" + codigo;
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
       String cadenaSQL="Select codigo, planApadrinamiento, fecha, identificacionpadrino from apadrinamiento" +filtro+orden;
       return ConectorBD.consultar(cadenaSQL);
   }
    
    public static List<Apadrinamiento> getListaEnObjetos(String filtro, String orden){
       List<Apadrinamiento> lista=new ArrayList<>();
       ResultSet datos= Apadrinamiento.getLista(filtro, orden);
       if (datos != null){
           try {
               while(datos.next()){
                   Apadrinamiento apadrinamiento = new Apadrinamiento();
                   apadrinamiento.setCodigo("codigo");
                   apadrinamiento.setPlanApadrinamiento("planApadrinamiento");
                   apadrinamiento.setFecha("fecha");
                   apadrinamiento.setIdentificacionPadrino("identidicacionPadrino");
                   
                   lista.add(apadrinamiento);
               }
           } catch (SQLException ex) {
               Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
           }
       }
       return lista;
   }
}