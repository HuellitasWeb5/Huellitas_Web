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
 * @author Angie
 */
public class AdopcionDetalle {

    private String id;
    private String codigoAdopcion;
    private String codigoFormularioInformacion;
    private String codigoFormularioSeguimiento;

    public AdopcionDetalle() {
    }

    public AdopcionDetalle(String id) {
        String cadenaSQL = "select id, codigoAdopcion, codigoFormularioInformacion, codigoFormularioSeguimiento from adopcionDetalle where id = '" + id + "'";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                codigoAdopcion = resultado.getString("codigoAdopcion");
                codigoFormularioInformacion = resultado.getString("codigoFormularioInformacion");
                codigoFormularioSeguimiento = resultado.getString("codigoFormularioSeguimiento");
            } else {
                System.out.println("No se encontró el detalle de adopción con el ID: " + id);
            }
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

    public String getCodigoFormularioInformacion() {
        return codigoFormularioInformacion;
    }

    public void setCodigoFormularioInformacion(String codigoFormularioInformacion) {
        this.codigoFormularioInformacion = codigoFormularioInformacion;
    }

    public String getCodigoFormularioSeguimiento() {
        return codigoFormularioSeguimiento;
    }

    public void setCodigoFormularioSeguimiento(String codigoFormularioSeguimiento) {
        this.codigoFormularioSeguimiento = codigoFormularioSeguimiento;
    }

    @Override
    public String toString() {
        return id;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into adopcionDetalle (codigoAdopcion, codigoFormularioInformacion, codigoFormularioSeguimiento) "
                + "values ('" + codigoAdopcion + "', '" + codigoFormularioInformacion + "', '" + codigoFormularioSeguimiento + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update adopcionDetalle set codigoAdopcion='" + codigoAdopcion + "', codigoFormularioInformacion='"
                + codigoFormularioInformacion + "', codigoFormularioSeguimiento='" + codigoFormularioSeguimiento + "' where id='" + id + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from adopcionDetalle where id='" + id + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.isEmpty()) {
            filtro = " where " + filtro;
        } else {
            filtro = " ";
        }
        if (orden != null && !orden.isEmpty()) {
            orden = " order by " + orden;
        } else {
            orden = " ";
        }

        String cadenaSQL = "select id, codigoAdopcion, codigoFormularioInformacion, codigoFormularioSeguimiento from adopcionDetalle" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<AdopcionDetalle> getListaEnObjetos(String filtro, String orden) {
        List<AdopcionDetalle> lista = new ArrayList<>();  
        ResultSet datos = AdopcionDetalle.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    AdopcionDetalle adopcionDetalle = new AdopcionDetalle();
                    adopcionDetalle.setId(datos.getString("id"));
                    adopcionDetalle.setCodigoAdopcion(datos.getString("codigoAdopcion"));
                    adopcionDetalle.setCodigoFormularioInformacion(datos.getString("codigoFormularioInformacion"));
                    adopcionDetalle.setCodigoFormularioSeguimiento(datos.getString("codigoFormularioSeguimiento"));

                    lista.add(adopcionDetalle);
                }
            } catch (SQLException ex) {
                Logger.getLogger(AdopcionDetalle.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
}
