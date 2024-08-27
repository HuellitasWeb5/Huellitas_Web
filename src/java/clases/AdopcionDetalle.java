
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Base64;

/**
 *
 * @author Luis Eraso
 */
public class AdopcionDetalle {

    private String id;
    private String codigoAdopcion;
    private String codigoMascota;

    public AdopcionDetalle() {
    }

    public AdopcionDetalle(String id) {
        String cadenaSQL = "select id,codigoAdopcion,codigoMascota from adopcionDetalle";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            this.id = id;
            codigoAdopcion = resultado.getString("codigoAdopcion");
            codigoMascota = resultado.getString("codigoMascota");
        } catch (SQLException ex) {
            System.out.println("Error al consultar en adopcionDetalle: " + ex.getMessage());
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
     @Override
    public String toString() {
        return id;
    }

    public boolean grabar() {
        String cadenaSQL = "inser into adopcionDetalle (codigoAdopcion,codigoMascota) values ('" + codigoAdopcion + ",'" + codigoMascota + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update adopcionDetalle set codigoAdopcion='" + codigoAdopcion + "',codigoMascota='" + codigoMascota + "' where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from adopcionDetalle where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
}
