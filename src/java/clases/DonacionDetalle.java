package clases;

import clasesGenericas.ConectorBD;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DonacionDetalle {

    private String id;
    private String idConcepto;
    private String cantidad;
    private String codigoTipoDonacion;
    private String codigoDonacion;
    public DonacionDetalle() {
    }

    public DonacionDetalle(String id) {
        String cadenaSQL = "select id, idConcepto, cantidad, codigoTipoDonacion, codigoDonacion from donacionesdetalle id=" + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                idConcepto = resultado.getString("idConcepto");
                cantidad = resultado.getString("cantidad");
                codigoTipoDonacion = resultado.getString("codigoTipoDonacion");
                codigoDonacion = resultado.getString("codigoDonacion");
            }
        } catch (SQLException ex) {
            System.out.println("Error en la consulta en donacionDetalle: " + ex.getMessage());
        }
    }

    // Getters y Setters
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getIdConcepto() {
        return idConcepto;
    }

    public void setIdConcepto(String idConcepto) {
        this.idConcepto = idConcepto;
    }

    public String getCantidad() {
        return cantidad;
    }

    public void setCantidad(String cantidad) {
        this.cantidad = cantidad;
    }

    public String getCodigoTipoDonacion() {
        return codigoTipoDonacion;
    }

    public void setCodigoTipoDonacion(String codigoTipoDonacion) {
        this.codigoTipoDonacion = codigoTipoDonacion;
    }

    public String getCodigoDonacion() {
        return codigoDonacion;
    }

    public void setCodigoDonacion(String codigoDonacion) {
        this.codigoDonacion = codigoDonacion;
    }
    public TipoDonacion getTipoDonacion() {
        return new TipoDonacion(codigoTipoDonacion);
    }
    public ConceptoDonacion getConceptoDonacion() {
        return new ConceptoDonacion(idConcepto);
    }

    @Override
    public String toString() {
        return id;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into donacionesdetalle (idConcepto, cantidad, codigoTipoDonacion, codigoDonacion) "
                + "values ('" + idConcepto + "', '" + cantidad + "', '" + codigoTipoDonacion + "', '" + codigoDonacion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update donacionesdetalle set idConcepto='" + idConcepto + "', cantidad='" + cantidad + "', codigoTipoDonacion='" + codigoTipoDonacion
                + "', codigoDonacion='" + codigoDonacion + "' where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from donacionesdetalle where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.isEmpty()) {
            filtro = " where " + filtro;
        } else {
            filtro = "";
        }

        if (orden != null && !orden.isEmpty()) {
            orden = " order by " + orden;
        } else {
            orden = "";
        }

        String cadenaSQL = "select id, idConcepto, cantidad, codigoTipoDonacion, codigoDonacion from donacionesdetalle" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<DonacionDetalle> getListaEnObjetos(String filtro, String orden) {
        List<DonacionDetalle> lista = new ArrayList<>();
        ResultSet datos = getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    DonacionDetalle detalle = new DonacionDetalle();
                    detalle.setId(datos.getString("id"));
                    detalle.setIdConcepto(datos.getString("idConcepto"));
                    detalle.setCantidad(datos.getString("cantidad"));
                    detalle.setCodigoTipoDonacion(datos.getString("codigoTipoDonacion"));
                    detalle.setCodigoDonacion(datos.getString("codigoDonacion"));
                    lista.add(detalle);
                }
            } catch (SQLException ex) {
                Logger.getLogger(DonacionDetalle.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }
}