/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.Connection;
import java.sql.Date;
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
public class FormularioDeInformacion {

    private int codigo;
    private Date fecha;
    private String ocupacion;
    private String tiempoLibre;
    private String espacio;
    private String compromiso;
    private int ninos;
    private int habitantes;
    private int responsables;
    private String otrasMascotas;
    private String propietario;
    private String motivacion;
    private String descripcion;
    private String fechaVisitaDia;
    private String fechaVisitaHora;
    private String fotoRecibo;
    private String fotoVivienda;
    private String fotoCedula;
    private String autorizacionDatos;

    public FormularioDeInformacion() {
    }

    public FormularioDeInformacion(int codigo) {
        String cadenaSQL = "select fecha, ocupacion, tiempoLibre, espacio, compromiso, ninos, habitantes, responsables, otrasMascotas, propietario, motivacion, descripcion, fechaVisitaDia, fechaVisitaHora, fotoRecibo, fotoVivienda, fotoCedula, autorizacionDatos "
                + "from formularioDeInformacion where codigo = '" + codigo + "'";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                this.fecha = resultado.getDate("fecha");
                this.ocupacion = resultado.getString("ocupacion");
                this.tiempoLibre = resultado.getString("tiempoLibre");
                this.espacio = resultado.getString("espacio");
                this.compromiso = resultado.getString("compromiso");
                this.ninos = resultado.getInt("ninos");
                this.habitantes = resultado.getInt("habitantes");
                this.responsables = resultado.getInt("responsables");
                this.otrasMascotas = resultado.getString("otrasMascotas");
                this.propietario = resultado.getString("propietario");
                this.motivacion = resultado.getString("motivacion");
                this.descripcion = resultado.getString("descripcion");
                this.fechaVisitaDia = resultado.getString("fechaVisitaDia");
                this.fechaVisitaHora = resultado.getString("fechaVisitaHora");
                this.fotoRecibo = resultado.getString("fotoRecibo");
                this.fotoVivienda = resultado.getString("fotoVivienda");
                this.fotoCedula = resultado.getString("fotoCedula");
                this.autorizacionDatos = resultado.getString("autorizacionDatos");
            } else {
                System.out.println("No se encontró el formulario de información con el código: " + codigo);
            }
        } catch (SQLException ex) {
            System.out.println("Error al consultar el código en formularioDeInformacion: " + ex.getMessage());
        }
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getOcupacion() {
        return ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getTiempoLibre() {
        return tiempoLibre;
    }

    public void setTiempoLibre(String tiempoLibre) {
        this.tiempoLibre = tiempoLibre;
    }

    public String getEspacio() {
        return espacio;
    }

    public void setEspacio(String espacio) {
        this.espacio = espacio;
    }

    public String getCompromiso() {
        return compromiso;
    }

    public void setCompromiso(String compromiso) {
        this.compromiso = compromiso;
    }

    public int getNinos() {
        return ninos;
    }

    public void setNinos(int ninos) {
        this.ninos = ninos;
    }

    public int getHabitantes() {
        return habitantes;
    }

    public void setHabitantes(int habitantes) {
        this.habitantes = habitantes;
    }

    public int getResponsables() {
        return responsables;
    }

    public void setResponsables(int responsables) {
        this.responsables = responsables;
    }

    public String getOtrasMascotas() {
        return otrasMascotas;
    }

    public void setOtrasMascotas(String otrasMascotas) {
        this.otrasMascotas = otrasMascotas;
    }

    public String getPropietario() {
        return propietario;
    }

    public void setPropietario(String propietario) {
        this.propietario = propietario;
    }

    public String getMotivacion() {
        return motivacion;
    }

    public void setMotivacion(String motivacion) {
        this.motivacion = motivacion;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getFechaVisitaDia() {
        return fechaVisitaDia;
    }

    public void setFechaVisitaDia(String fechaVisitaDia) {
        this.fechaVisitaDia = fechaVisitaDia;
    }

    public String getFechaVisitaHora() {
        return fechaVisitaHora;
    }

    public void setFechaVisitaHora(String fechaVisitaHora) {
        this.fechaVisitaHora = fechaVisitaHora;
    }

    public String getFotoRecibo() {
        return fotoRecibo;
    }

    public void setFotoRecibo(String fotoRecibo) {
        this.fotoRecibo = fotoRecibo;
    }

    public String getFotoVivienda() {
        return fotoVivienda;
    }

    public void setFotoVivienda(String fotoVivienda) {
        this.fotoVivienda = fotoVivienda;
    }

    public String getFotoCedula() {
        return fotoCedula;
    }

    public void setFotoCedula(String fotoCedula) {
        this.fotoCedula = fotoCedula;
    }

    public String getAutorizacionDatos() {
        return autorizacionDatos;
    }

    public void setAutorizacionDatos(String autorizacionDatos) {
        this.autorizacionDatos = autorizacionDatos;
    }

    @Override
    public String toString() {
        return "FormularioDeInformacion{" + "codigo=" + codigo + ", fecha=" + fecha + ", ocupacion=" + ocupacion + ", tiempoLibre=" + tiempoLibre + ", espacio=" + espacio + ", compromiso=" + compromiso + ", ninos=" + ninos + ", habitantes=" + habitantes + ", responsables=" + responsables + ", otrasMascotas=" + otrasMascotas + ", propietario=" + propietario + ", motivacion=" + motivacion + ", descripcion=" + descripcion + ", fechaVisitaDia=" + fechaVisitaDia + ", fechaVisitaHora=" + fechaVisitaHora + ", fotoRecibo=" + fotoRecibo + ", fotoVivienda=" + fotoVivienda + ", fotoCedula=" + fotoCedula + ", autorizacionDatos=" + autorizacionDatos + '}';
    }

    public boolean grabar() {
        String cadenaSQL = "insert into formularioDeInformacion (fecha, habitantes, espacio, ninos, tiempoLibre, responsables, otrasMascotas, propietario, ocupacion, motivacion, compromiso, descripcion, fechaVisitaDia, fechaVisitaHora, fotoRecibo, fotoVivienda, fotoCedula, autorizacionDatos) "
                + "values('" + fecha + "', '" + habitantes + "', '" + espacio + "', '" + ninos + "', '" + tiempoLibre + "', '" + responsables + "', '" + otrasMascotas + "', '" + propietario + "', '" + ocupacion + "', '" + motivacion + "', '" + compromiso + "', '" + descripcion + "', '" + fechaVisitaDia + "', '" + fechaVisitaHora + "', '" + fotoRecibo + "', '" + fotoVivienda + "', '" + fotoCedula + "', '" + autorizacionDatos + "')";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean grabarFormularioConProcedimientoAlmacenado() {
        String cadenaSQL = "CALL insertarFormularioDeInformacion('"
                + this.fecha + "','"
                + this.ocupacion + "','"
                + this.tiempoLibre + "','"
                + this.espacio + "','"
                + this.compromiso + "',"
                + this.ninos + ","
                + this.habitantes + ","
                + this.responsables + ",'"
                + this.otrasMascotas + "','"
                + this.propietario + "','"
                + this.motivacion + "','"
                + this.descripcion + "','"
                + this.fechaVisitaDia + "','"
                + this.fechaVisitaHora + "','"
                + this.fotoRecibo + "','"
                + this.fotoVivienda + "','"
                + this.fotoCedula + "','"
                + this.autorizacionDatos + "')";

        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "update formularioDeInformacion set "
                + "fecha = '" + fecha + "', "
                + "habitantes = '" + habitantes + "', "
                + "espacio = '" + espacio + "', "
                + "ninos = '" + ninos + "', "
                + "tiempoLibre = '" + tiempoLibre + "', "
                + "responsables = '" + responsables + "', "
                + "otrasMascotas = '" + otrasMascotas + "', "
                + "propietario = '" + propietario + "', "
                + "ocupacion = '" + ocupacion + "', "
                + "motivacion = '" + motivacion + "', "
                + "compromiso = '" + compromiso + "', "
                + "descripcion = '" + descripcion + "', "
                + "fechaVisitaDia = '" + fechaVisitaDia + "', "
                + "fechaVisitaHora = '" + fechaVisitaHora + "', "
                + "fotoRecibo = '" + fotoRecibo + "', "
                + "fotoVivienda = '" + fotoVivienda + "', "
                + "fotoCedula = '" + fotoCedula + "' "
                + "where codigo = '" + codigo + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from formularioDeInformacion where codigo=" + codigo;
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

        String cadenaSQL = "select codigo, fecha, ocupacion, tiempoLibre, espacio, compromiso, ninos, habitantes, responsables, otrasMascotas, propietario, motivacion, descripcion, fechaVisitaDia, fechaVisitaHora, fotoRecibo, fotoVivienda, fotoCedula, autorizacionDatos "
                + "from formularioDeInformacion" + filtro + orden;

        return ConectorBD.consultar(cadenaSQL);
    }

    public static List<FormularioDeInformacion> getListaEnObjetos(String filtro, String orden) {
        List<FormularioDeInformacion> lista = new ArrayList<>();
        ResultSet datos = FormularioDeInformacion.getLista(filtro, orden);
        if (datos != null) {
            try {
                while (datos.next()) {
                    FormularioDeInformacion formulario = new FormularioDeInformacion();
                    formulario.setCodigo(datos.getInt("codigo"));
                    formulario.setFecha(datos.getDate("fecha"));
                    formulario.setOcupacion(datos.getString("ocupacion"));
                    formulario.setTiempoLibre(datos.getString("tiempoLibre"));
                    formulario.setEspacio(datos.getString("espacio"));
                    formulario.setCompromiso(datos.getString("compromiso"));
                    formulario.setNinos(datos.getInt("ninos"));
                    formulario.setHabitantes(datos.getInt("habitantes"));
                    formulario.setResponsables(datos.getInt("responsables"));
                    formulario.setOtrasMascotas(datos.getString("otrasMascotas"));
                    formulario.setPropietario(datos.getString("propietario"));
                    formulario.setMotivacion(datos.getString("motivacion"));
                    formulario.setDescripcion(datos.getString("descripcion"));
                    formulario.setFechaVisitaDia(datos.getString("fechaVisitaDia"));
                    formulario.setFechaVisitaHora(datos.getString("fechaVisitaHora"));
                    formulario.setFotoRecibo(datos.getString("fotoRecibo"));
                    formulario.setFotoVivienda(datos.getString("fotoVivienda"));
                    formulario.setFotoCedula(datos.getString("fotoCedula"));
                    formulario.setAutorizacionDatos(datos.getString("autorizacionDatos"));

                    lista.add(formulario);
                }
            } catch (SQLException ex) {
                Logger.getLogger(FormularioDeInformacion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        return lista;
    }

    public static String getListaEnArregloJS(String filtro, String orden) {
        String lista = "[";

        List<FormularioDeInformacion> datos = FormularioDeInformacion.getListaEnObjetos(filtro, orden);
        for (int i = 0; i < datos.size(); i++) {
            FormularioDeInformacion formulario = datos.get(i);
            if (i > 0) {
                lista += ", ";
            }
            lista += "{"
                    + "\"codigo\": " + formulario.getCodigo() + ", " // int, sin comillas
                    + "\"fecha\": \"" + formulario.getFecha() + "\", " // String, con comillas dobles
                    + "\"ocupacion\": \"" + formulario.getOcupacion() + "\", "
                    + "\"tiempoLibre\": " + formulario.getTiempoLibre() + ", " // int, sin comillas
                    + "\"espacio\": " + formulario.getEspacio() + ", " // int, sin comillas
                    + "\"compromiso\": " + formulario.getCompromiso() + ", " // int, sin comillas
                    + "\"ninos\": " + formulario.getNinos() + ", " // int, sin comillas
                    + "\"habitantes\": " + formulario.getHabitantes() + ", " // int, sin comillas
                    + "\"responsables\": " + formulario.getResponsables() + ", " // int, sin comillas
                    + "\"otrasMascotas\": " + formulario.getOtrasMascotas() + ", " // int, sin comillas
                    + "\"propietario\": \"" + formulario.getPropietario() + "\", " // String, con comillas
                    + "\"motivacion\": \"" + formulario.getMotivacion() + "\", "
                    + "\"descripcion\": \"" + formulario.getDescripcion() + "\", "
                    + "\"fechaVisitaDia\": \"" + formulario.getFechaVisitaDia() + "\", "
                    + "\"fechaVisitaHora\": \"" + formulario.getFechaVisitaHora() + "\", "
                    + "\"fotoRecibo\": \"" + formulario.getFotoRecibo() + "\", "
                    + "\"fotoVivienda\": \"" + formulario.getFotoVivienda() + "\", "
                    + "\"fotoCedula\": \"" + formulario.getFotoCedula() + "\", "
                    + "\"autorizacionDatos\": " + formulario.getAutorizacionDatos() // boolean, sin comillas
                    + "}";
        }

        lista += "];";
        return lista;
    }

    public static List<FormularioDeInformacion> listarFormularios(Connection conn) {
        List<FormularioDeInformacion> formularios = new ArrayList<>();
        String cadenaSQL = "SELECT codigo FROM formularioDeInformacion";

        try ( PreparedStatement pstmt = conn.prepareStatement(cadenaSQL);  ResultSet resultado = pstmt.executeQuery()) {

            while (resultado.next()) {
                int codigo = resultado.getInt("codigo");
                formularios.add(new FormularioDeInformacion(codigo));
            }

        } catch (SQLException ex) {
            System.out.println("Error al listar formularios: " + ex.getMessage());
        }
        return formularios;
    }
}
