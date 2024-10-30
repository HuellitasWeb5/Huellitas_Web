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
 * @author Angie
 */
public class Adopcion {

    private String codigo;
    private String identificacionAdoptante;
    private String codigoMascota;
    private String fechaAdopcion;
    private String actaAdopcion;
    private String estado;

    public Adopcion() {
    }

    public Adopcion(String codigo) {
        String cadenaSQL = "select codigo, identificacionAdoptante, codigoMascota, fechaAdopcion, actaAdopcion, estado from adopcion where codigo = '" + codigo + "'";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                identificacionAdoptante = resultado.getString("identificacionAdoptante");
                codigoMascota = resultado.getString("codigoMascota");
                fechaAdopcion = resultado.getString("fechaAdopcion");
                actaAdopcion = resultado.getString("actaAdopcion");
                estado = resultado.getString("estado");
            } else {
                System.out.println("No se encontró la adopción con el código: " + codigo);
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el código en adopcion: " + ex.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getIdentificacionAdoptante() {
        return identificacionAdoptante;
    }

    public void setIdentificacionAdoptante(String identificacionAdoptante) {
        this.identificacionAdoptante = identificacionAdoptante;
    }

    public String getCodigoMascota() {
        return codigoMascota;
    }

    public void setCodigoMascota(String codigoMascota) {
        this.codigoMascota = codigoMascota;
    }

    public String getFechaAdopcion() {
        return fechaAdopcion;
    }

    public void setFechaAdopcion(String fechaAdopcion) {
        this.fechaAdopcion = fechaAdopcion;
    }

    public String getActaAdopcion() {
        return actaAdopcion;
    }

    public void setActaAdopcion(String actaAdopcion) {
        this.actaAdopcion = actaAdopcion;
    }

    public String getEstado() {
        if (estado == null) {
            estado = "Vigente";
        } else if (estado.equals("C")) {
            return "Cancelado";
        }

        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public Persona getAdoptante() {
        return new Persona(identificacionAdoptante);
    }

    @Override

    public String toString() {
        return identificacionAdoptante;
    }

    public boolean grabar() {
        String cadenaSQL = "insert into adopcion (identificacionAdoptante, codigoMascota, fechaAdopcion, actaAdopcion, estado) values ('" + identificacionAdoptante + "','" + codigoMascota + "',curdate(),'" + actaAdopcion + "', 'Vigente')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE adopcion SET estado='cancelado' WHERE codigo=" + codigo;
        System.out.println("SQL: " + cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from adopcion where codigo=" + codigo;

        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean SubirArchivo() {
        String cadenaSQL = "update adopcion set actaAdopcion='" + actaAdopcion + "' where codigo='" + codigo + "'";
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
        String cadenaSQL = "select codigo, identificacionAdoptante, codigoMascota, fechaAdopcion, actaAdopcion, estado from adopcion" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<Adopcion> getListaEnObjetos(String filtro, String orden) {
        List<Adopcion> lista = new ArrayList<>();
        ResultSet datos = Adopcion.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    Adopcion adopcion = new Adopcion();
                    adopcion.setCodigo(datos.getString("codigo"));
                    adopcion.setIdentificacionAdoptante(datos.getString("identificacionAdoptante"));
                    adopcion.setCodigoMascota(datos.getString("codigoMascota"));
                    adopcion.setFechaAdopcion(datos.getString("fechaAdopcion"));
                    adopcion.setActaAdopcion(datos.getString("actaAdopcion"));
                    adopcion.setEstado(datos.getString("estado"));
                    lista.add(adopcion);
                }
            } catch (SQLException ex) {
                Logger.getLogger(Adopcion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static List<String[]> getAdopcionesPorFechaSolicitud() {
    List<String[]> lista = new ArrayList<>();
    String cadenaSQL = "SELECT YEAR(fechaAdopcion) AS anio, COUNT(*) AS cantidad "
            + "FROM adopcion GROUP BY YEAR(fechaAdopcion);";

    ResultSet resultado = ConectorBD.consultar(cadenaSQL);

    try {
        while (resultado.next()) {
            String[] registro = new String[2];
            registro[0] = resultado.getString("anio");
            registro[1] = resultado.getString("cantidad");
            lista.add(registro);
        }
    } catch (SQLException ex) {
        System.out.println("Error en getAdopcionesPorFechaSolicitud. \nCadenaSQL: " + cadenaSQL + "\nError: " + ex.getMessage());
    } finally {
        try {
            if (resultado != null && !resultado.isClosed()) {
                resultado.close();
            }
        } catch (SQLException ex) {
            System.out.println("Error al cerrar el ResultSet en getAdopcionesPorFechaSolicitud. \nError: " + ex.getMessage());
        }
    }
    return lista;
}

public static List<String[]> getAdopcionesPorMes(String anio) {
    List<String[]> lista = new ArrayList<>();
    String cadenaSQL = "SELECT DATE_FORMAT(fechaAdopcion, '%Y-%m') AS mes, COUNT(*) AS cantidad "
            + "FROM adopcion "
            + "WHERE YEAR(fechaAdopcion) = " + anio + " "
            + "GROUP BY DATE_FORMAT(fechaAdopcion, '%Y-%m') "
            + "ORDER BY mes "
            + "LIMIT 0, 200;";

    ResultSet resultado = ConectorBD.consultar(cadenaSQL);

    try {
        while (resultado != null && resultado.next()) {
            String[] registro = new String[2];
            registro[0] = resultado.getString("mes");
            registro[1] = resultado.getString("cantidad");
            lista.add(registro);
        }
    } catch (SQLException ex) {
        System.err.println("Error en getAdopcionesPorMes.");
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
