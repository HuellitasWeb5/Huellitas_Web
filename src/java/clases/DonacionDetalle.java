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
    private String valorUnitarios;
    private String codigoDonacion;

    public DonacionDetalle() {
    }

    public DonacionDetalle(String id) {
        String cadenaSQL = "select id, idConcepto, cantidad, valorUnitarios, codigoDonacion from donacionesdetalle";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                idConcepto = resultado.getString("idConcepto");
                cantidad = resultado.getString("cantidad");
                valorUnitarios = resultado.getString("valorUnitarios");
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

    public String getValorUnitarios() {
        return valorUnitarios;
    }

    public void setValorUnitarios(String valorUnitarios) {
        this.valorUnitarios = valorUnitarios;
    }

    public String getCodigoDonacion() {
        return codigoDonacion;
    }

    public void setCodigoDonacion(String codigoDonacion) {
        this.codigoDonacion = codigoDonacion;
    }

    @Override
    public String toString() {
        return id;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into donacionesdetalle (idConcepto, cantidad, valorUnitarios, codigoDonacion) "
                + "values ('" + idConcepto + "', '" + cantidad + "', '" + valorUnitarios + "', '" + codigoDonacion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update donacionesdetalle set idConcepto='" + idConcepto + "', cantidad='" + cantidad + "', valorUnitarios='" + valorUnitarios 
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

        String cadenaSQL = "select id, idConcepto, cantidad, valorUnitarios, codigoDonacion from donacionesdetalle" + filtro + orden;
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
                    detalle.setValorUnitarios(datos.getString("valorUnitarios"));
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
