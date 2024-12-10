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
public class TipoDonacion {

    private String codigo;
    private String nombre;
    private String descripcion;

    public TipoDonacion() {
    }

    public TipoDonacion(String codigo) {
        String cadenaSQL = "select codigo, nombre, descripcion from tipoDonacion where codigo=" + codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                nombre = resultado.getString("nombre");
                descripcion = resultado.getString("descripcion");
            }
        } catch (SQLException ex) {
            System.out.println("Error en la consulta en tipoDonacion: " + ex.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
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

    @Override
    public String toString() {
        return nombre;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into tipoDonacion (nombre,descripcion) "
                + " values ('" + nombre + "','" + descripcion + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update tipoDonacion set nombre='" + nombre + "',descripcion='" + descripcion + "' where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from tipoDonacion where codigo=" + codigo;
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

        String cadenaSQL = "select codigo,nombre,descripcion from tipoDonacion" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<TipoDonacion> getListaEnObjetos(String filtro, String orden) {
        List<TipoDonacion> lista = new ArrayList();
        ResultSet datos = getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    TipoDonacion tipoDonacion = new TipoDonacion();
                    tipoDonacion.setCodigo(datos.getString("Codigo"));
                    tipoDonacion.setNombre(datos.getString("nombre"));
                    tipoDonacion.setDescripcion(datos.getString("descripcion"));
                    lista.add(tipoDonacion);
                }
            } catch (SQLException ex) {
                Logger.getLogger(TipoDonacion.class.getName()).log(Level.SEVERE, (String) null, ex);
            }
        }

        return lista;
    }

    public static String getListaEnOptions(String preseleccionado) {
        if (preseleccionado == null) {
            preseleccionado = "";
        }
        String lista = "";

        List<TipoDonacion> datos = TipoDonacion.getListaEnObjetos(null, "nombre");

        for (int i = 0; i < datos.size(); i++) {
            TipoDonacion tipoDonacion = datos.get(i);

            String auxiliar = "";
            //if (preseleccionado.equals(tipoDonacion.getCodigo())) auxiliar="selected";           
            lista += "<option value='" + tipoDonacion.getCodigo() + "' " + auxiliar + ">" + tipoDonacion.getNombre() + "</option>";
        }

        return lista;
    }
}
