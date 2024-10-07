/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import static clases.ConceptoDonacion.getLista;
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
public class ConceptoDonacion {

    /*
     */
    private String id;
    private String nombre;
    private String descripcion;
    private String codigoTipoDonacion;
    private String idUnidadDeMedida;

    public ConceptoDonacion() {
    }

    public ConceptoDonacion(String id) {
        String cadenaSQL = "select id, nombre, descripcion,codigoTipoDonacion,idUnidadDeMedida from conceptoDonacion where id=" + id;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.id = id;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
                codigoTipoDonacion = resultado.getString("codigoTipoDonacion");
                idUnidadDeMedida = resultado.getString("idUnidadDeMedida");
            }
        } catch (SQLException ex) {
            System.out.println("Error en la consulta en conceptoDonacion: " + ex.getMessage());
        }
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getCodigoTipoDonacion() {
        return codigoTipoDonacion;
    }

    public void setCodigoTipoDonacion(String codigoTipoDonacion) {
        this.codigoTipoDonacion = codigoTipoDonacion;
    }

    public TipoDonacion getTipoDonacion() {
        return new TipoDonacion(codigoTipoDonacion);
    }

    public String getIdUnidadDeMedida() {
        return idUnidadDeMedida;
    }

    public void setIdUnidadDeMedida(String idUnidadDeMedida) {
        this.idUnidadDeMedida = idUnidadDeMedida;
    }

    public UnidadDeMedida getUnidadDeMedida() {
        return new UnidadDeMedida(idUnidadDeMedida);
    }

    @Override

    public String toString() {
        return nombre;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into conceptoDonacion (nombre,descripcion,codigoTipoDonacion,idUnidadDeMedida) "
                + " values ('" + nombre + "','" + descripcion + "','" + codigoTipoDonacion + "','" + idUnidadDeMedida + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update conceptoDonacion set nombre='" + nombre + "',descripcion='" + descripcion + "',codigoTipoDonacion='" + codigoTipoDonacion + "',idUnidadDeMedida='" + idUnidadDeMedida + "' where id=" + id;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from conceptoDonacion where id=" + id;
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
        String cadenaSql = "select id, nombre, descripcion,codigoTipoDonacion,idUnidadDeMedida from conceptoDonacion" + filtro + orden;
        return ConectorBD.consultar(cadenaSql);
    }

    public static List<ConceptoDonacion> getListaEnObjetos(String filtro, String orden) {
        List<ConceptoDonacion> lista = new ArrayList();
        ResultSet datos = getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    ConceptoDonacion conceptoDonacion = new ConceptoDonacion();
                    conceptoDonacion.setId(datos.getString("id"));
                    conceptoDonacion.setNombre(datos.getString("nombre"));
                    conceptoDonacion.setDescripcion(datos.getString("descripcion"));
                    conceptoDonacion.setCodigoTipoDonacion(datos.getString("codigoTipoDonacion"));
                    conceptoDonacion.setIdUnidadDeMedida(datos.getString("idUnidadDeMedida"));
                    lista.add(conceptoDonacion);
                }
            } catch (SQLException ex) {
                Logger.getLogger(ConceptoDonacion.class.getName()).log(Level.SEVERE, (String) null, ex);
            }
        }

        return lista;
    }

     public static String getListaEnOptions(String preseleccionado) {
        if (preseleccionado == null) {
            preseleccionado = "";
        }
        String lista = "";

        List<ConceptoDonacion> datos = ConceptoDonacion.getListaEnObjetos(null, "nombre");

        for (int i = 0; i < datos.size(); i++) {
            ConceptoDonacion conceptoDonacion = datos.get(i);

            String auxiliar = "";
            //if (preseleccionado.equals(tipoDonacion.getCodigo())) auxiliar="selected";           
            lista += "<option value='" + conceptoDonacion.getId()+ "' " + auxiliar + ">" + conceptoDonacion.getNombre() + "</option>";
        }

        return lista;
    }

}
