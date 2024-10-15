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
public class Donacion {

    private String codigo;
    private String fecha;
    private String descripcion;
    private String identificacionDonante;

    public Donacion() {
    }

    public Donacion(String codigo) {
        String cadenaSQL = "SELECT \n"
                + "    donacion.codigo, \n"
                + "    donacion.fecha, \n"
                + "    donacion.descripcion, \n"
                + "    donacion.identificacionDonante, \n"
                + "    donacionesdetalle.id AS detalleId, \n"
                + "    donacionesdetalle.idConcepto, \n"
                + "    donacionesdetalle.cantidad\n"
                + "FROM \n"
                + "    donacion\n"
                + "INNER JOIN \n"
                + "    donacionesdetalle ON donacion.codigo = donacionesdetalle.codigoDonacion where codigo=" + codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            this.codigo = codigo;
            fecha = resultado.getString("fecha");
            descripcion = resultado.getString("descripcion");
            identificacionDonante = resultado.getString("identificacionDonante");
        } catch (SQLException ex) {
            System.out.println("Error al consultar en donacion " + ex.getMessage());
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

    public Persona getPersona() {
        return new Persona(identificacionDonante);
    }

    @Override

    public String toString() {
        return codigo;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into donacion(fecha,descripcion,identificacionDonante) values (curdate(),'" + descripcion + "','" + identificacionDonante + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    /* public boolean grabarProcedimiento(String donaciones){
        String cadenaSQL = "call registrarDonacion("+ this.identificacionDonante+",'"+ descripcion+"')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }*/
    public boolean modificar() {
        String cadenaSQL = "update donacion set fecha='" + fecha + "',descripcion='" + descripcion + "',identificacionDonante='" + identificacionDonante + "' where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from donacion where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean grabarProcedimientoAlmacenado(String cadenaDonaciones) {
        // Usar un procedimiento almacenado que capture los datos necesarios para registrar la donación y sus detalles
        String cadenaSQL = "CALL registrarDonacion(" + this.identificacionDonante + ", '"
                + this.descripcion + "', '"
                + cadenaDonaciones + "')";

        System.out.println("Cadena procedimiento: " + cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null & filtro != "") {
            filtro = " where " + filtro;
        } else {
            filtro = "";
        }

        if (orden != null & orden != "") {
            orden = " order by" + orden;
        } else {
            orden = "";
        }
        String cadenSQL = "SELECT \n"
                + "    donacion.codigo, \n"
                + "    donacion.fecha, \n"
                + "    donacion.descripcion, \n"
                + "    donacion.identificacionDonante, \n"
                + "    donacionesdetalle.id AS detalleId, \n"
                + "    donacionesdetalle.idConcepto, \n"
                + "    donacionesdetalle.cantidad\n"
                + "FROM \n"
                + "    donacion\n"
                + "INNER JOIN \n"
                + "    donacionesdetalle ON donacion.codigo = donacionesdetalle.codigoDonacion" + filtro + orden;
        return ConectorBD.consultar(cadenSQL);

    }

    public static List<Donacion> getListaEnObjetos(String filtro, String orden) {
        List<Donacion> lista = new ArrayList<>();
        ResultSet datos = getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    Donacion donacion = new Donacion();
                    donacion.setCodigo(datos.getString("codigo"));
                    donacion.setFecha(datos.getString("fecha"));
                    donacion.setDescripcion(datos.getString("descripcion"));
                    donacion.setIdentificacionDonante(datos.getString("identificacionDonante"));
                    lista.add(donacion);
                }

            } catch (SQLException ex) {
                Logger.getLogger(ConceptoDonacion.class.getName()).log(Level.SEVERE, (String) null, ex);

            }
        }
        return lista;
    }

    public static List<String[]> getDonacionesPorMes() {
        List<String[]> lista = new ArrayList<>();

        // Consulta SQL para obtener el total de donaciones por mes
        String cadenaSQL = "SELECT MONTH(d.fecha) AS mes, SUM(dd.cantidad) AS total_donaciones "
                + "FROM donacion d "
                + "JOIN donacionesDetalle dd ON d.codigo = dd.codigoDonacion "
                + "GROUP BY MONTH(d.fecha) "
                + "ORDER BY mes DESC;";

        ResultSet resultado = ConectorBD.consultar(cadenaSQL);

        try {
            while (resultado != null && resultado.next()) {
                String[] registro = new String[2]; // Array para mes y total de donaciones
                registro[0] = resultado.getString("mes"); // Mes
                registro[1] = resultado.getString("total_donaciones"); // Total de donaciones
                lista.add(registro);
            }
        } catch (SQLException ex) {
            System.err.println("Error en getDonacionesPorMes.");
            System.err.println("Consulta SQL: " + cadenaSQL);
            System.err.println("Error: " + ex.getMessage());
        } finally {
            try {
                if (resultado != null) {
                    resultado.close();
                }
            } catch (SQLException ex) {
                System.err.println("Error al cerrar el ResultSet: " + ex.getMessage());
            }
        }

        return lista;
    }

    public static List<String[]> getDonacionesPorAnio() {
        List<String[]> lista = new ArrayList<>();

        // Consulta SQL para obtener el total de donaciones por año
        String cadenaSQL = "SELECT YEAR(d.fecha) AS anio, SUM(dd.cantidad) AS total_donaciones "
                + "FROM donacion d "
                + "JOIN donacionesDetalle dd ON d.codigo = dd.codigoDonacion "
                + "GROUP BY YEAR(d.fecha) "
                + "ORDER BY anio DESC;";

        ResultSet resultado = ConectorBD.consultar(cadenaSQL);

        try {
            while (resultado != null && resultado.next()) {
                String[] registro = new String[2]; // Array para año y total de donaciones
                registro[0] = resultado.getString("anio"); // Año
                registro[1] = resultado.getString("total_donaciones"); // Total de donaciones
                lista.add(registro);
            }
        } catch (SQLException ex) {
            System.err.println("Error en getDonacionesPorAnio.");
            System.err.println("Consulta SQL: " + cadenaSQL);
            System.err.println("Error: " + ex.getMessage());
        } finally {
            try {
                if (resultado != null) {
                    resultado.close();
                }
            } catch (SQLException ex) {
                System.err.println("Error al cerrar el ResultSet: " + ex.getMessage());
            }
        }

        return lista;
    }
}
