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
public class UnidadDeMedida {
 /*
    id int primary key auto_increment,
nombre varchar(50),
notacion text
    */   
     private String id;
 private String codigoAdopcion;
 private String codigoMascota;

    public UnidadDeMedida() {
    }
    
    public UnidadDeMedida(String id) {
    String cadenaSQL="select id,codigoAdopcion,codigoMascota from adopcionDetalle";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            this.id = id;
            codigoAdopcion = resultado.getString("codigoAdopcion");
            codigoMascota = resultado.getString("codigoMascota");
        } catch (SQLException ex) {
            System.out.println("Error al consultar en unidad de medida el id: "+ ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCodigoAdopcion() {
        return codigoAdopcion;
    }

    public void setCodigoAdopcion(String codigoAdopcion) {
        this.codigoAdopcion = codigoAdopcion;
    }

    public String getCodigoMascota() {
        return codigoMascota;
    }

    public void setCodigoMascota(String codigoMascota) {
        this.codigoMascota = codigoMascota;
    }
public boolean grabar(){
    String cadenaSQL="inser into UnidadDeMedida (codigoAdopcion,codigoMascota) values ('"+codigoAdopcion+",'"+codigoMascota+"')";
    return ConectorBD.ejecutarQuery(cadenaSQL);
}    
public boolean modificar(){
    String cadenaSQL="update UnidadDeMedida set codigoAdopcion='"+codigoAdopcion+"',codigoMascota='"+codigoMascota+"' where id="+id;
    return ConectorBD.ejecutarQuery(cadenaSQL);
}

public boolean eliminar (){
    String cadenaSQL="delete from UnidadDeMedida where id="+id;
    return ConectorBD.ejecutarQuery(cadenaSQL); 
    }
}
