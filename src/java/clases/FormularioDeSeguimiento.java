/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
public class FormularioDeSeguimiento {

    private String codigo;
    private String fecha;
    private String identificacionAdoptante;
    private String codigoMascota;
    private String foto;
    private String fechaProximaVisita;
    private String descripcion;
    private String evolucionMedica;
    private String masaCorporal;
    private String estadoEmocional;
    private String adaptacion;
    private String vinculo;
    private String calificacion;

    public FormularioDeSeguimiento() {
    }


    public FormularioDeSeguimiento(String codigo) {
        String cadenaSQL = "SELECT fecha, identificacionAdoptante, codigoMascota, foto, fechaProximaVisita, descripcion, evolucionMedica, masaCorporal, estadoEmocional, adaptacion, vinculo, calificacion "
                + "FROM formularioDeSeguimiento WHERE codigo = " + codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                this.fecha = resultado.getString("fecha");
                this.identificacionAdoptante = resultado.getString("identificacionAdoptante");
                this.codigoMascota = resultado.getString("codigoMascota");
                this.foto = resultado.getString("foto");
                this.fechaProximaVisita = resultado.getString("fechaProximaVisita");
                this.descripcion = resultado.getString("descripcion");
                this.evolucionMedica = resultado.getString("evolucionMedica");
                this.masaCorporal = resultado.getString("masaCorporal");
                this.estadoEmocional = resultado.getString("estadoEmocional");
                this.adaptacion = resultado.getString("adaptacion");
                this.vinculo = resultado.getString("vinculo");
                this.calificacion = resultado.getString("calificacion");
            } else {
                System.out.print("No se encontró el formulario de seguimiento con el código: " + codigo);
            }
        } catch (SQLException ex) {
            System.out.print("Error al consultar el código en formularioDeSeguimiento: " + ex.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getFecha() {
        String resultado = fecha;
        if (fecha == null) {
            resultado = "";
        }
        return resultado;

    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public String getIdentificacionAdoptante() {
        return identificacionAdoptante;
    }

    public void setIdentificacionAdoptante(String identificacionAdoptante) {
        this.identificacionAdoptante = identificacionAdoptante;
    }

    public String getCodigoMascota() {
        String resultado = codigoMascota;
        if (codigoMascota == null) {
            resultado = "";
        }

        return resultado;
    }

    public void setCodigoMascota(String codigoMascota) {
        this.codigoMascota = codigoMascota;
    }

    public Mascota getMascota() {
        return new Mascota(codigoMascota);
    }

    public String getFoto() {
        String resultado = foto;
        if (foto == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    public String getFechaProximaVisita() {
        String resultado = fechaProximaVisita;
        if (fechaProximaVisita == null) {
            resultado = "";
        }
        return resultado;

    }

    public void setFechaProximaVisita(String fechaProximaVisita) {
        this.fechaProximaVisita = fechaProximaVisita;
    }

    public String getDescripcion() {
        String resultado = descripcion;
        if (descripcion == null) {
            resultado = "";
        }
        return resultado;

    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getEvolucionMedica() {
        String resultado = evolucionMedica;
        if (evolucionMedica == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setEvolucionMedica(String evolucionMedica) {
        this.evolucionMedica = evolucionMedica;
    }

    public String getMasaCorporal() {
        String resultado = masaCorporal;
        if (masaCorporal == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setMasaCorporal(String masaCorporal) {
        this.masaCorporal = masaCorporal;
    }

    public String getEstadoEmocional() {
        String resultado = estadoEmocional;
        if (estadoEmocional == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setEstadoEmocional(String estadoEmocional) {
        this.estadoEmocional = estadoEmocional;
    }

    public String getAdaptacion() {
        String resultado = adaptacion;
        if (adaptacion == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setAdaptacion(String adaptacion) {
        this.adaptacion = adaptacion;
    }

    public String getVinculo() {
        String resultado = vinculo;
        if (vinculo == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setVinculo(String vinculo) {
        this.vinculo = vinculo;
    }

    public String getCalificacion() {
        String resultado = calificacion;
        if (calificacion == null) {
            resultado = "";
        }
        return resultado;
    }

    public void setCalificacion(String calificacion) {
        this.calificacion = calificacion;
    }

    @Override
    public String toString() {
        return "FormularioDeSeguimiento{codigo=" + codigo + ", fecha=" + fecha + ", identificacionAdoptante='" + identificacionAdoptante + "', codigoMascota='" + codigoMascota + "', foto='" + foto + "', fechaProximaVisita=" + fechaProximaVisita
                + ", descripcion='" + descripcion + "', evolucionMedica='" + evolucionMedica + "', masaCorporal='" + masaCorporal + "', estadoEmocional='" + estadoEmocional + "', adaptacion='" + adaptacion + "', vinculo='" + vinculo + "', calificacion=" + calificacion + '}';
    }

    public boolean grabar() {
        String cadenaSQL = "INSERT INTO formularioDeSeguimiento (codigo, fecha, identificacionAdoptante, codigoMascota, foto, fechaProximaVisita, descripcion, evolucionMedica, masaCorporal, estadoEmocional, adaptacion, vinculo, calificacion) "
                + "VALUES (generarCodigoFormularioSeguimiento(),curdate(), '" + identificacionAdoptante + "', '" + codigoMascota + "', '" + foto + "', '" + fechaProximaVisita + "', '" + descripcion + "', '" + evolucionMedica + "', '" + masaCorporal + "', '" + estadoEmocional + "', '" + adaptacion + "', '" + vinculo + "', " + calificacion + ")";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "DELETE FROM formularioDeSeguimiento WHERE codigo = " + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE formularioDeSeguimiento SET "
                + "fecha = '" + fecha + "', "
                + "identificacionAdoptante = '" + identificacionAdoptante + "', "
                + "codigoMascota = '" + codigoMascota + "', "
                + "foto = '" + foto + "', "
                + "fechaProximaVisita = '" + fechaProximaVisita + "', "
                + "descripcion = '" + descripcion + "', "
                + "evolucionMedica = '" + evolucionMedica + "', "
                + "masaCorporal = '" + masaCorporal + "', "
                + "estadoEmocional = '" + estadoEmocional + "', "
                + "adaptacion = '" + adaptacion + "', "
                + "vinculo = '" + vinculo + "', "
                + "calificacion = " + calificacion + " "
                + "WHERE codigo = " + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden) {
        if (filtro != null && !filtro.isEmpty()) {
            filtro = " WHERE " + filtro;
        } else {
            filtro = " ";
        }
        if (orden != null && !orden.isEmpty()) {
            orden = " ORDER BY " + orden;
        } else {
            orden = " ";
        }

        String cadenaSQL = "SELECT codigo, fecha, identificacionAdoptante, codigoMascota, foto, fechaProximaVisita, descripcion, evolucionMedica, masaCorporal, estadoEmocional, adaptacion, vinculo, calificacion "
                + "FROM formularioDeSeguimiento" + filtro + orden;
        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<FormularioDeSeguimiento> getListaEnObjetos(String filtro, String orden) {
        List<FormularioDeSeguimiento> lista = new ArrayList<>();
        ResultSet datos = FormularioDeSeguimiento.getLista(filtro, orden);
        
        if (datos != null) {
            try {
                while (datos.next()) {
                    FormularioDeSeguimiento formulario = new FormularioDeSeguimiento();
                    formulario.setCodigo(datos.getString("codigo"));
                    formulario.setFecha(datos.getString("fecha"));
                    formulario.setIdentificacionAdoptante(datos.getString("identificacionAdoptante"));
                    formulario.setCodigoMascota(datos.getString("codigoMascota"));
                    formulario.setFoto(datos.getString("foto"));
                    formulario.setFechaProximaVisita(datos.getString("fechaProximaVisita"));
                    formulario.setDescripcion(datos.getString("descripcion"));
                    formulario.setEvolucionMedica(datos.getString("evolucionMedica"));
                    formulario.setMasaCorporal(datos.getString("masaCorporal"));
                    formulario.setEstadoEmocional(datos.getString("estadoEmocional"));
                    formulario.setAdaptacion(datos.getString("adaptacion"));
                    formulario.setVinculo(datos.getString("vinculo"));
                    formulario.setCalificacion(datos.getString("calificacion"));

                    lista.add(formulario);
                }
            } catch (SQLException ex) {
                Logger.getLogger(FormularioDeSeguimiento.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnArregloJS(String filtro, String orden) {
        String lista = "[";

        List<FormularioDeSeguimiento> datos = FormularioDeSeguimiento.getListaEnObjetos(filtro, orden);
        for (int i = 0; i < datos.size(); i++) { // Cambiado de String a int
            FormularioDeSeguimiento formulario = datos.get(i);
            if (i > 0) {
                lista += ", ";
            }
            lista += "{"
                    + "\"codigo\": \"" + formulario.getCodigo() + "\", "
                    + "\"fecha\": \"" + formulario.getFecha() + "\", "
                    + "\"identificacionAdoptante\": \"" + formulario.getIdentificacionAdoptante() + "\", "
                    + "\"codigoMascota\": \"" + formulario.getCodigoMascota() + "\", "
                    + "\"foto\": \"" + formulario.getFoto() + "\", "
                    + "\"fechaProximaVisita\": \"" + formulario.getFechaProximaVisita() + "\", "
                    + "\"descripcion\": \"" + formulario.getDescripcion() + "\", "
                    + "\"evolucionMedica\": \"" + formulario.getEvolucionMedica() + "\", "
                    + "\"masaCorporal\": \"" + formulario.getMasaCorporal() + "\", "
                    + "\"estadoEmocional\": \"" + formulario.getEstadoEmocional() + "\", "
                    + "\"adaptacion\": \"" + formulario.getAdaptacion() + "\", "
                    + "\"vinculo\": \"" + formulario.getVinculo() + "\", "
                    + "\"calificacion\": \"" + formulario.getCalificacion() + "\""
                    + "}";
        }
        lista += "]";
        return lista;
    }
public static List<String[]> getCalificacionesXMes(String anio, String codigoMascota) {
    List<String[]> lista = new ArrayList<>();
    
    // Consulta SQL para obtener calificaciones por mes, mascota y nombre de mascota
    String cadenaSQL = "SELECT MONTH(fecha) AS mes, "
                     + "fs.codigoMascota, "
                     + "m.nombre AS nombreMascota, "
                     + "SUM(fs.calificacion) / COUNT(*) AS promedio_calificacion, "  // Promedio calculado
                     + "COUNT(*) AS total_calificaciones "  // Total de calificaciones
                     + "FROM formularioDeSeguimiento fs "
                     + "LEFT JOIN mascota m ON fs.codigoMascota = m.codigo " // Unir con la tabla mascota
                     + "WHERE YEAR(fecha) = '" + anio + "' "
                     + (codigoMascota != null && !codigoMascota.isEmpty() ? "AND fs.codigoMascota = '" + codigoMascota + "' " : "")
                     + "GROUP BY MONTH(fecha), fs.codigoMascota, nombreMascota "  // Agrupado por mes, mascota y nombre
                     + "ORDER BY mes, fs.codigoMascota;";  // Ordenado por mes y código de mascota

    ResultSet resultado = ConectorBD.consultar(cadenaSQL); // Usar tu método de conexión

    try {
        while (resultado != null && resultado.next()) {
            String[] registro = new String[5]; // Array para mes, código de mascota, nombre de mascota, promedio y total
            registro[0] = resultado.getString("mes"); // Mes
            registro[1] = resultado.getString("codigoMascota"); // Código de mascota
            registro[2] = resultado.getString("nombreMascota"); // Nombre de mascota
            registro[3] = String.valueOf((int) Math.round(resultado.getDouble("promedio_calificacion"))); // Promedio redondeado
            registro[4] = resultado.getString("total_calificaciones"); // Total de calificaciones
            lista.add(registro);
        }
    } catch (SQLException ex) {
        System.err.println("Error en getCalificacionesPorMes.");
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
public static List<String[]> getCalificacionXAnio() {
    List<String[]> lista = new ArrayList<>();
    
    // Consulta SQL para obtener calificaciones por año, mascota y nombre de mascota
    String cadenaSQL = "SELECT YEAR(fs.fecha) AS anio, "
                     + "IFNULL(fs.codigoMascota, 'Sin asignar') AS codigoMascota, "
                     + "m.nombre AS nombreMascota, "
                     + "COUNT(fs.calificacion) AS totalCalificaciones, "
                     + "AVG(fs.calificacion) AS calificaciones "
                     + "FROM formularioDeSeguimiento fs "
                     + "LEFT JOIN mascota m ON fs.codigoMascota = m.codigo " // Unir con la tabla mascota
                     + "GROUP BY anio, fs.codigoMascota, nombreMascota "
                     + "ORDER BY anio, fs.codigoMascota;";
    
    ResultSet resultado = ConectorBD.consultar(cadenaSQL);

    try {
        while (resultado != null && resultado.next()) {
            String[] registro = new String[5]; // Array para año, código de mascota, nombre de mascota, total de calificaciones y promedio
            registro[0] = resultado.getString("anio"); // Año
            registro[1] = resultado.getString("codigoMascota"); // Código de mascota
            registro[2] = resultado.getString("nombreMascota"); // Nombre de mascota
            registro[3] = resultado.getString("totalCalificaciones"); // Total de calificaciones
            registro[4] = resultado.getString("calificaciones"); // Promedio de calificaciones
            lista.add(registro);
        }
    } catch (SQLException ex) {
        System.err.println("Error en getCalificacionXAnio.");
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