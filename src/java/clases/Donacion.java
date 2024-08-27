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
public class Donacion {

    private String codigo;
    private String fecha;
    private String descripcion;
    private String identificacionDonante;

    public Donacion() {
    }
    
    public  Donacion(String codigo) {
        String cadenaSQL="select codigo,fecha,descipcion,identificacaionDonante from donacion";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            this.codigo = codigo;
           fecha = resultado.getString("fecha");
           descripcion = resultado.getString("descripcion");
           identificacionDonante = resultado.getString("identificacionDonante");
        } catch (SQLException ex) {
            System.out.println("Error al consultar en donacion" + ex.getMessage());
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
    public boolean grabar (){
       String cadenaSQL="insert into donacion(fecha,descipcion,identificacaionDonante) values ('"+fecha+"','"+descripcion+"','"+identificacionDonante+"')";
       return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean modificar (){
       String cadenaSQL="update donacion set fecha='"+fecha+"',descripcion='"+descripcion+"',identificacionDonante='"+identificacionDonante+"' where codigo="+codigo;
       return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    public boolean eliminar (){
        String cadenaSQL="delete from donacion where codigo="+codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
}   
