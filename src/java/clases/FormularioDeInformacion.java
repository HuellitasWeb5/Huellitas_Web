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

    private String codigo;
    private Date fecha;
    private String identificacionAdoptante;
    private String codigoMascota;
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

    public FormularioDeInformacion(String codigo) {
        String cadenaSQL = "select fecha, identificacionAdoptante, codigoMascota, ocupacion, tiempoLibre, espacio, compromiso, ninos, habitantes, responsables, otrasMascotas, propietario, motivacion, descripcion, fechaVisitaDia, fechaVisitaHora, fotoRecibo, fotoVivienda, fotoCedula, autorizacionDatos "
                + "from formularioDeInformacion where codigo = '" + codigo + "'";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);
        try {
            if (resultado.next()) {
                this.codigo = codigo;
                this.fecha = resultado.getDate("fecha");
                this.identificacionAdoptante = resultado.getString("identificacionAdoptante");
                this.codigoMascota = resultado.getString("codigoMascota");
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

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
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
        return "FormularioDeInformacion{" + "codigo=" + codigo + ", fecha=" + fecha + ", identificacionAdoptante='" + identificacionAdoptante + "', codigoMascota='" + codigoMascota + "', ocupacion=" + ocupacion + ", tiempoLibre=" + tiempoLibre + ", espacio=" + espacio + ", compromiso=" + compromiso + ", ninos=" + ninos + ", habitantes=" + habitantes + ", responsables=" + responsables + ", otrasMascotas=" + otrasMascotas + ", propietario=" + propietario + ", motivacion=" + motivacion + ", descripcion=" + descripcion + ", fechaVisitaDia=" + fechaVisitaDia + ", fechaVisitaHora=" + fechaVisitaHora + ", fotoRecibo=" + fotoRecibo + ", fotoVivienda=" + fotoVivienda + ", fotoCedula=" + fotoCedula + ", autorizacionDatos=" + autorizacionDatos + '}';
    }

    public boolean grabar() {
        String cadenaSQL = "insert into formularioDeInformacion (fecha, identificacionAdoptante, codigoMascota, habitantes, espacio, ninos, tiempoLibre, responsables, otrasMascotas, propietario, ocupacion, motivacion, compromiso, descripcion, fechaVisitaDia, fechaVisitaHora, fotoRecibo, fotoVivienda, fotoCedula, autorizacionDatos) "
                + "values('" + fecha + "', '" + identificacionAdoptante + "', '" + codigoMascota + "', '" + habitantes + "', '" + espacio + "', '" + ninos + "', '" + tiempoLibre + "', '" + responsables + "', '" + otrasMascotas + "', '" + propietario + "', '" + ocupacion + "', '" + motivacion + "', '" + compromiso + "', '" + descripcion + "', '" + fechaVisitaDia + "', '" + fechaVisitaHora + "', '" + fotoRecibo + "', '" + fotoVivienda + "', '" + fotoCedula + "', '" + autorizacionDatos + "')";
        System.out.println(cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }
    

   public boolean grabarFormularioConProcedimientoAlmacenado() {
    String codigosMascotas = String.join(",", this.codigoMascota);  // Unimos los códigos con comas
    
    String cadenaSQL = "CALL insertarFormularioDeInformacion('"
            + this.fecha + "','"
            + this.identificacionAdoptante + "','"
            + codigosMascotas + "','" 
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
                + "fecha = '" + fecha + "', identificacionAdoptante = '" + identificacionAdoptante + "', codigoMascota = '" + codigoMascota + "', "
                + "habitantes = '" + habitantes + "', espacio = '" + espacio + "', ninos = '" + ninos + "', "
                + "tiempoLibre = '" + tiempoLibre + "', responsables = '" + responsables + "', otrasMascotas = '" + otrasMascotas + "', "
                + "propietario = '" + propietario + "', ocupacion = '" + ocupacion + "', motivacion = '" + motivacion + "', "
                + "compromiso = '" + compromiso + "', descripcion = '" + descripcion + "', fechaVisitaDia = '" + fechaVisitaDia + "', "
                + "fechaVisitaHora = '" + fechaVisitaHora + "', fotoRecibo = '" + fotoRecibo + "', fotoVivienda = '" + fotoVivienda + "', "
                + "fotoCedula = '" + fotoCedula + "' "
                + "where codigo = '" + codigo + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean eliminar() {
        String cadenaSQL = "delete from formularioDeInformacion where codigo = " + codigo;
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

        String cadenaSQL = "select codigo, fecha, identificacionAdoptante, codigoMascota, ocupacion, tiempoLibre, espacio, compromiso, ninos, habitantes, responsables, otrasMascotas, propietario, motivacion, descripcion, fechaVisitaDia, fechaVisitaHora, fotoRecibo, fotoVivienda, fotoCedula, autorizacionDatos "
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
                    formulario.setCodigo(datos.getString("codigo"));
                    formulario.setFecha(datos.getDate("fecha"));
                    formulario.setIdentificacionAdoptante(datos.getString("identificacionAdoptante"));
                    formulario.setCodigoMascota(datos.getString("codigoMascota"));
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
                    + "\"codigo\": " + formulario.getCodigo() + ", "
                    + "\"fecha\": \"" + formulario.getFecha() + "\", "
                    + "\"identificacionAdoptante\": \"" + formulario.getIdentificacionAdoptante() + "\", "
                    + "\"codigoMascota\": \"" + formulario.getCodigoMascota() + "\", "
                    + "\"ocupacion\": \"" + formulario.getOcupacion() + "\", "
                    + "\"tiempoLibre\": \"" + formulario.getTiempoLibre() + "\", "
                    + "\"espacio\": \"" + formulario.getEspacio() + "\", "
                    + "\"compromiso\": \"" + formulario.getCompromiso() + "\", "
                    + "\"ninos\": " + formulario.getNinos() + ", "
                    + "\"habitantes\": " + formulario.getHabitantes() + ", "
                    + "\"responsables\": " + formulario.getResponsables() + ", "
                    + "\"otrasMascotas\": \"" + formulario.getOtrasMascotas() + "\", "
                    + "\"propietario\": \"" + formulario.getPropietario() + "\", "
                    + "\"motivacion\": \"" + formulario.getMotivacion() + "\", "
                    + "\"descripcion\": \"" + formulario.getDescripcion() + "\", "
                    + "\"fechaVisitaDia\": \"" + formulario.getFechaVisitaDia() + "\", "
                    + "\"fechaVisitaHora\": \"" + formulario.getFechaVisitaHora() + "\", "
                    + "\"fotoRecibo\": \"" + formulario.getFotoRecibo() + "\", "
                    + "\"fotoVivienda\": \"" + formulario.getFotoVivienda() + "\", "
                    + "\"fotoCedula\": \"" + formulario.getFotoCedula() + "\", "
                    + "\"autorizacionDatos\": \"" + formulario.getAutorizacionDatos() + "\""
                    + "}";
        }

        lista += "];";
        return lista;
    }

    public static List<FormularioDeInformacion> listarFormularios(Connection conn) {
        List<FormularioDeInformacion> formularios = new ArrayList<>();
        String cadenaSQL = "SELECT codigo, identificacionCliente, codigoMascota, FROM formularioDeInformacion";

        try (PreparedStatement pstmt = conn.prepareStatement(cadenaSQL);
             ResultSet resultado = pstmt.executeQuery()) {

            while (resultado.next()) {
                FormularioDeInformacion formulario = new FormularioDeInformacion();
                formulario.setCodigo(resultado.getString("codigo"));
                formulario.setIdentificacionAdoptante(resultado.getString("identificacionCliente"));
                formulario.setCodigoMascota(resultado.getString("codigoMascota"));
                formularios.add(formulario);
            }

        } catch (SQLException ex) {
            System.out.println("Error al listar formularios: " + ex.getMessage());
        }
        return formularios;
    }
}
