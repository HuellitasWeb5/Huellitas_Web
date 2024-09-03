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
public class UnidadDeMedida {
  private String id;
   private String nombre;
   private String notacion;

   public UnidadDeMedida() {
   }

   public UnidadDeMedida(String id) {
      String cadenaSQL = "select id,nombre,notacion from UnidadDeMedida";
      ResultSet resultado = ConectorBD.consultar(cadenaSQL);

      try {
         this.id = id;
         this.nombre = resultado.getString("nombre");
         this.notacion = resultado.getString("notacion");
      } catch (SQLException ex) {
         System.out.println("Error al consultar en unidad de medida el id: " + ex.getMessage());
      }

   }

   public String getId() {
      return this.id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getNombre() {
      return this.nombre;
   }

   public void setNombre(String nombre) {
      this.nombre = nombre;
   }

   public String getNotacion() {
      return this.notacion;
   }

   public void setNotacion(String notacion) {
      this.notacion = notacion;
   }

   public boolean grabar() {
      String cadenaSQL = "insert into UnidadDeMedida (nombre,notacion) values ('" + this.nombre + "','" + this.notacion + "')";
      return ConectorBD.ejecutarQuery(cadenaSQL);
   }

   public boolean modificar() {
      String cadenaSQL = "update UnidadDeMedida set nombre='" + this.nombre + "',notacion='" + this.notacion + "' where id=" + this.id;
      return ConectorBD.ejecutarQuery(cadenaSQL);
   }

   public boolean eliminar() {
      String cadenaSQL = "delete from UnidadDeMedida where id=" + this.id;
      return ConectorBD.ejecutarQuery(cadenaSQL);
   }

   public static ResultSet getLista(String filtro, String orden) {
      if (filtro != null && filtro != "") {
         filtro = " where " + filtro;
      } else {
         filtro = "";
      }

      if (orden != null && orden != "") {
         orden = " order by " + orden;
      } else {
         orden = "";
      }

      String cadenaSQL = "select id,nombre,notacion from UnidadDeMedida" + filtro + orden;
      return ConectorBD.consultar(cadenaSQL);
   }

   public static List<UnidadDeMedida> getListaEnObjetos(String filtro, String orden) {
      List<UnidadDeMedida> lista = new ArrayList();
      ResultSet datos = getLista(filtro, orden);
      if (datos != null) {
         try {
            while(datos.next()) {
               UnidadDeMedida unidadDeMedida = new UnidadDeMedida();
               unidadDeMedida.setId(datos.getString("id"));
               unidadDeMedida.setNombre(datos.getString("nombre"));
               unidadDeMedida.setNotacion(datos.getString("notacion"));
               lista.add(unidadDeMedida);
            }
         } catch (SQLException ex) {
            Logger.getLogger(UnidadDeMedida.class.getName()).log(Level.SEVERE, (String)null, ex);
         }
      }

      return lista;
   }
}
    