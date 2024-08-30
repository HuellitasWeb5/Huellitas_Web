/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author Luis Eraso
 */
public class Adopcion {


    private String codigo;
    private String identificacionAdoptante;
    private String fechaAdopcion;
    private String actaAdopcion;

    public Adopcion() {
    }

    public Adopcion(String codigo) {
        String cadenaSQL = "select codigo,identificacionAdoptante,fechaAdopcion,actaAdopcion from adopcion";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            this.codigo = codigo;
            identificacionAdoptante=resultado.getString("identificacionAdoptante");
            fechaAdopcion=resultado.getString("fechaAdopcion");
            actaAdopcion=resultado.getString("actaAdopcion");

        } catch (SQLException ex) {
            System.out.println("Error al consultar el codigo en adopcion: " + ex.getMessage());
        }

    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getIdentificacionAdoptante() {
        return identificacionAdoptante;
    }

    public void setIdentificacionAdoptante(String identificacionAdoptante) {
        this.identificacionAdoptante = identificacionAdoptante;
    }

    public String getFechaAdopcion() {
        return fechaAdopcion;
    }

    public void setFechaAdopcion(String fechaAdopcion) {
        this.fechaAdopcion = fechaAdopcion;
    }

    public String getActaAdopcion() {
        return actaAdopcion;
    }

    public void setActaAdopcion(String actaAdopcion) {
        this.actaAdopcion = actaAdopcion;
    }
    
    
     @Override
    public String toString() {
        return identificacionAdoptante;
    }
    
   public boolean grabar () {
       String cadenaSQL="insert into adopcion (identificacionAdoptante,fechaAdopcion,actaAdopcion) values ('"+identificacionAdoptante+"','"+fechaAdopcion+"','"+actaAdopcion+"')";
       
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
   
   
   public boolean modificar () {
       String cadenaSQL="update adopcion set identificacionAdoptante='"+identificacionAdoptante+"',identificacionAdoptante='"+fechaAdopcion+"',actaAdopcion='"+actaAdopcion+"' where codigo="+codigo;
       
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
   
   
   public boolean eliminar () {
       String cadenaSQL="delete from adopcion where codigo="+codigo;
       
       return ConectorBD.ejecutarQuery(cadenaSQL);
   }
   

}
