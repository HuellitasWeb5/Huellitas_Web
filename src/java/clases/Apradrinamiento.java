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
public class Apradrinamiento {
    
    private String codigo;
    private String planApadrinamiento;
    private String fecha;
    private String identificacionPadrino;

    public Apradrinamiento() {
    }
    public Apradrinamiento(String codigo) {
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
            //Logger.getLogger(Persona.class.getName()).log(Level.SEVERE, null, ex);
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


    public boolean grabar() {
        String cadenaSQL = "insert into Apadrinamiento(planApadrinamiento,fecha,identificacionPadrino) "
                + " values ('" + planApadrinamiento + "','" + fecha + "','" + identificacionPadrino + "')";
        // System.out.println(cadenaSQL);
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

}
