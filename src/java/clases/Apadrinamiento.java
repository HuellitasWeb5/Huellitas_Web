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
public class Apadrinamiento {
    
    private String codigo;
    private String fecha;
    private String identificacionPadrino;
    private String fotoRecibo;
    private String fotoCedula;

    public Apadrinamiento() {
    }
    public Apadrinamiento(String codigo) {
        String cadenaSQL = "select codigo,planApadrinamiento,fecha,identificacionPadrino, fotoRecibo, fotoCedula where codigo=" + codigo;
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                fecha = resultado.getString("fecha");
                identificacionPadrino = resultado.getString("identificacionPadrino");
                fotoCedula = resultado.getString("fotoCedula");
                fotoRecibo = resultado.getString("fotoRecibo");
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar en apadrinamiento" + ex.getMessage());
        }
    }

    public String getFotoRecibo() {
        return fotoRecibo;
    }

    public void setFotoRecibo(String fotoRecibo) {
        this.fotoRecibo = fotoRecibo;
    }

    public String getFotoCedula() {
        return fotoCedula;
    }

    public void setFotoCedula(String fotoCedula) {
        this.fotoCedula = fotoCedula;
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

    public String getIdentificacionPadrino() {
        return identificacionPadrino;
    }

    public void setIdentificacionPadrino(String identificacionPadrino) {
        this.identificacionPadrino = identificacionPadrino;
    }
    

    public List<ApadrinamientoDetalle> getDetalles() {
        return ApadrinamientoDetalle.getListaEnObjetos("codigoApadrinamiento='" + codigo + "'", null);
    }
    
    public boolean grabar() {
        String cadenaSQL = "insert into Apadrinamiento(fecha,identificacionPadrino,fotoRecibo, fotoCedula) "
                + " values ('" + fecha + "','" + identificacionPadrino + "','" + fotoRecibo + "','" + fotoCedula + "')";
        // System.out.println(cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    
    public boolean grabarConProcedimientoAlmacenado(String mascotasPlan) {
    String cadenaSQL = "CALL registrarPadripet(" + this.identificacionPadrino + ", '" + mascotasPlan + "', '" + this.fotoRecibo + "', '" + this.fotoCedula + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL); 
        
        }

    
    public boolean modificar() {

        String cadenaSQL = "update Apadrinamiento set fecha='" +fecha + "',fotoRecibo='" +fotoRecibo + "',fotoCedula='" +fotoCedula + "',identificacionPadrino='" +identificacionPadrino + "'  where codigo=" + codigo;
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar( String codigo) {
        String cadenaSQL = "delete from Apadrinamiento where codigo=" + codigo;
        System.out.println("cadenaSQL " + cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public static ResultSet getLista(String filtro, String orden){
       if(filtro != null && filtro != ""){
           filtro = " where " + filtro;
       }else{
           filtro= " ";
       }
       if (orden != null && orden != ""){
           orden = " orden by " +orden;
       }else {
           orden = " ";
       }
       String cadenaSQL="Select codigo, fecha, identificacionpadrino,fotoRecibo, fotoCedula from apadrinamiento" +filtro+orden;
       return ConectorBD.consultar(cadenaSQL);
   }
    
    public static List<Apadrinamiento> getListaEnObjetos(String filtro, String orden) {
    List<Apadrinamiento> lista = new ArrayList<>();
    ResultSet datos = Apadrinamiento.getLista(filtro, orden);
    if (datos != null) {
        try {
            while (datos.next()) {
                Apadrinamiento apadrinamiento = new Apadrinamiento();
                apadrinamiento.setCodigo(datos.getString("codigo")); // Asegúrate de usar el nombre correcto de la columna
                apadrinamiento.setFecha(datos.getString("fecha")); // Usa el tipo adecuado
                apadrinamiento.setIdentificacionPadrino(datos.getString("identificacionPadrino")); // Verifica que el tipo sea correcto
                apadrinamiento.setFotoRecibo(datos.getString("fotoRecibo"));
                apadrinamiento.setFotoCedula(datos.getString("fotoCedula"));
                lista.add(apadrinamiento);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Mascota.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    return lista;
}
    public static List<String[]> getApadrinamientosPorMes() {
    List<String[]> lista = new ArrayList<>();
    
    // Consulta SQL para obtener el total de apadrinamientos por mes
    String cadenaSQL = "SELECT MONTH(fecha) AS mes, COUNT(*) AS total_apadrinamientos "
                     + "FROM apadrinamiento "
                     + "GROUP BY MONTH(fecha) "
                     + "ORDER BY mes DESC;";

    ResultSet resultado = ConectorBD.consultar(cadenaSQL);

    try {
        while (resultado != null && resultado.next()) {
            String[] registro = new String[2]; // Array para mes y total de apadrinamientos
            registro[0] = resultado.getString("mes"); // Mes
            registro[1] = resultado.getString("total_apadrinamientos"); // Total de apadrinamientos
            lista.add(registro);
        }
    } catch (SQLException ex) {
        System.err.println("Error en getApadrinamientosPorMes.");
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
    public static List<String[]> getApadrinamientosPorAnio() {
    List<String[]> lista = new ArrayList<>();
    
    // Consulta SQL para obtener el total de apadrinamientos por año
    String cadenaSQL = "SELECT YEAR(fecha) AS anio, COUNT(*) AS total_apadrinamientos "
                     + "FROM apadrinamiento "
                     + "GROUP BY YEAR(fecha) "
                     + "ORDER BY anio DESC;";

    ResultSet resultado = ConectorBD.consultar(cadenaSQL);

    try {
        while (resultado != null && resultado.next()) {
            String[] registro = new String[2]; // Array para año y total de apadrinamientos
            registro[0] = resultado.getString("anio"); // Año
            registro[1] = resultado.getString("total_apadrinamientos"); // Total de apadrinamientos
            lista.add(registro);
        }
    } catch (SQLException ex) {
        System.err.println("Error en getApadrinamientosPorAnio.");
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