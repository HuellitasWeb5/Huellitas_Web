
/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;

import clasesGenericas.ConectorBD;
import java.sql.Connection;
import java.sql.DriverManager;
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
    private String fecha;
    private String identificacionAdoptante;
    private String codigoMascota;
    private String estadoCivil;
    private String ocupacion;
    private String motivacion;
    private String otrasMascotas;
    private String otrasMascotasR;
    private String esterilizados;
    private String esterilizadosR;
    private String anteriorMascotas;
    private String anteriorMascotasR;
    private String habitantes;
    private String habitantesR;
    private String ninos;
    private String ninosR;
    private String alergias;
    private String vivienda;
    private String permiteMascotas;
    private String cambiarDomicilio;
    private String rupturaFamiliar;
    private String proyeccionFutura;
    private String espacio;
    private String responsables;
    private String compromiso;
    private String autorizaVisitas;
    private String autorizaVisitasR;
    private String fechaVisitaDia;
    private String fechaVisitaHora;
    private String refNombre1;
    private String refCedula1;
    private String refDireccion1;
    private String refCelular1;
    private String refNombre2;
    private String refCedula2;
    private String refDireccion2;
    private String refCelular2;
    private String refNombre3;
    private String refCedula3;
    private String refDireccion3;
    private String refCelular3;
    private String refNombre4;
    private String refCedula4;
    private String refDireccion4;
    private String refCelular4;
    private String fotoCedula;
    private String fotoRecibo;
    private String fotoVivienda;
    private String descripcion;
    private String autorizacionDatos;
    private String estado;

    public FormularioDeInformacion() {
    }

    public FormularioDeInformacion(String codigo) {
        String cadenaSQL = "SELECT fecha, identificacionAdoptante, codigoMascota, estadoCivil, ocupacion, motivacion, otrasMascotas, otrasMascotasR, esterilizados, "
                + "esterilizadosR, anteriorMascotas, anteriorMascotasR, habitantes, habitantesR, ninos, ninosR, alergias, vivienda, permiteMascotas, cambiarDomicilio, "
                + "rupturaFamiliar, proyeccionFutura, espacio, responsables, compromiso, autorizaVisitas, autorizaVisitasR, fechaVisitaDia, fechaVisitaHora, "
                + "refNombre1, refCedula1, refDireccion1, refCelular1, refNombre2, refCedula2, refDireccion2, refCelular2, refNombre3, refCedula3, "
                + "refDireccion3, refCelular3, refNombre4, refCedula4, refDireccion4, refCelular4, fotoCedula, fotoRecibo, fotoVivienda, descripcion, "
                + "autorizacionDatos, estado FROM formularioDeInformacion WHERE codigo='" + codigo + "'";
        ResultSet resultado = ConectorBD.consultar(cadenaSQL);

        try {
            if (resultado.next()) {
                this.codigo = codigo;
                fecha = resultado.getString("fecha");
                identificacionAdoptante = resultado.getString("identificacionAdoptante");
                codigoMascota = resultado.getString("codigoMascota");
                estadoCivil = resultado.getString("estadoCivil");
                ocupacion = resultado.getString("ocupacion");
                motivacion = resultado.getString("motivacion");
                otrasMascotas = resultado.getString("otrasMascotas");
                otrasMascotasR = resultado.getString("otrasMascotasR");
                esterilizados = resultado.getString("esterilizados");
                esterilizadosR = resultado.getString("esterilizadosR");
                anteriorMascotas = resultado.getString("anteriorMascotas");
                anteriorMascotasR = resultado.getString("anteriorMascotasR");
                habitantes = resultado.getString("habitantes");
                habitantesR = resultado.getString("habitantesR");
                ninos = resultado.getString("ninos");
                ninosR = resultado.getString("ninosR");
                alergias = resultado.getString("alergias");
                vivienda = resultado.getString("vivienda");
                permiteMascotas = resultado.getString("permiteMascotas");
                cambiarDomicilio = resultado.getString("cambiarDomicilio");
                rupturaFamiliar = resultado.getString("rupturaFamiliar");
                proyeccionFutura = resultado.getString("proyeccionFutura");
                espacio = resultado.getString("espacio");
                responsables = resultado.getString("responsables");
                compromiso = resultado.getString("compromiso");
                autorizaVisitas = resultado.getString("autorizaVisitas");
                autorizaVisitasR = resultado.getString("autorizaVisitasR");
                fechaVisitaDia = resultado.getString("fechaVisitaDia");
                fechaVisitaHora = resultado.getString("fechaVisitaHora");
                refNombre1 = resultado.getString("refNombre1");
                refCedula1 = resultado.getString("refCedula1");
                refDireccion1 = resultado.getString("refDireccion1");
                refCelular1 = resultado.getString("refCelular1");
                refNombre2 = resultado.getString("refNombre2");
                refCedula2 = resultado.getString("refCedula2");
                refDireccion2 = resultado.getString("refDireccion2");
                refCelular2 = resultado.getString("refCelular2");
                refNombre3 = resultado.getString("refNombre3");
                refCedula3 = resultado.getString("refCedula3");
                refDireccion3 = resultado.getString("refDireccion3");
                refCelular3 = resultado.getString("refCelular3");
                refNombre4 = resultado.getString("refNombre4");
                refCedula4 = resultado.getString("refCedula4");
                refDireccion4 = resultado.getString("refDireccion4");
                refCelular4 = resultado.getString("refCelular4");
                fotoCedula = resultado.getString("fotoCedula");
                fotoRecibo = resultado.getString("fotoRecibo");
                fotoVivienda = resultado.getString("fotoVivienda");
                descripcion = resultado.getString("descripcion");
                autorizacionDatos = resultado.getString("autorizacionDatos");
                estado = resultado.getString("estado");
            } else {
                System.out.print("No se encontró el formulario de información con el código: " + codigo);
            }
        } catch (SQLException ex) {
            System.out.print("Error al consultar el código en formularioDeInformacion: " + ex.getMessage());
        }
    }

    public String getCodigo() {
        return codigo;
    }

    public void setCodigo(String codigo) {
        this.codigo = codigo;
    }

    public String getFecha() {
        return fecha == null ? "" : fecha;
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
        return codigoMascota == null ? "" : codigoMascota;
    }

    public void setCodigoMascota(String codigoMascota) {
        this.codigoMascota = codigoMascota;
    }

    public String getEstadoCivil() {
        return estadoCivil == null ? "" : estadoCivil;
    }

    public void setEstadoCivil(String estadoCivil) {
        this.estadoCivil = estadoCivil;
    }

    public String getOcupacion() {
        return ocupacion == null ? "" : ocupacion;
    }

    public void setOcupacion(String ocupacion) {
        this.ocupacion = ocupacion;
    }

    public String getMotivacion() {
        return motivacion == null ? "" : motivacion;
    }

    public void setMotivacion(String motivacion) {
        this.motivacion = motivacion;
    }

    public String getOtrasMascotas() {
        return otrasMascotas == null ? "" : otrasMascotas;
    }

    public void setOtrasMascotas(String otrasMascotas) {
        this.otrasMascotas = otrasMascotas;
    }

    public String getOtrasMascotasR() {
        return otrasMascotasR == null ? "" : otrasMascotasR;
    }

    public void setOtrasMascotasR(String otrasMascotasR) {
        this.otrasMascotasR = otrasMascotasR;
    }

    public String getEsterilizados() {
        return esterilizados == null ? "" : esterilizados;
    }

    public void setEsterilizados(String esterilizados) {
        this.esterilizados = esterilizados;
    }

    public String getEsterilizadosR() {
        return esterilizadosR == null ? "" : esterilizadosR;
    }

    public void setEsterilizadosR(String esterilizadosR) {
        this.esterilizadosR = esterilizadosR;
    }

    public String getAnteriorMascotas() {
        return anteriorMascotas == null ? "" : anteriorMascotas;
    }

    public void setAnteriorMascotas(String anteriorMascotas) {
        this.anteriorMascotas = anteriorMascotas;
    }

    public String getAnteriorMascotasR() {
        return anteriorMascotasR == null ? "" : anteriorMascotasR;
    }

    public void setAnteriorMascotasR(String anteriorMascotasR) {
        this.anteriorMascotasR = anteriorMascotasR;
    }

    public String getHabitantes() {
        return habitantes == null ? "" : habitantes;
    }

    public void setHabitantes(String habitantes) {
        this.habitantes = habitantes;
    }
    
    public String getHabitantesR() {
        return habitantesR == null ? "" : habitantesR;
    }

    public void setHabitantesR(String habitantesR) {
        this.habitantesR = habitantesR;
    }

    public String getNinos() {
        return ninos == null ? "" : ninos;
    }

    public void setNinos(String ninos) {
        this.ninos = ninos;
    }

    public String getNinosR() {
        return ninosR == null ? "" : ninosR;
    }

    public void setNinosR(String ninosR) {
        this.ninosR = ninosR;
    }

    public String getAlergias() {
        return alergias == null ? "" : alergias;
    }

    public void setAlergias(String alergias) {
        this.alergias = alergias;
    }

    public String getVivienda() {
        return vivienda == null ? "" : vivienda;
    }

    public void setVivienda(String vivienda) {
        this.vivienda = vivienda;
    }

    public String getPermiteMascotas() {
        return permiteMascotas == null ? "" : permiteMascotas;
    }

    public void setPermiteMascotas(String permiteMascotas) {
        this.permiteMascotas = permiteMascotas;
    }

    public String getCambiarDomicilio() {
        return cambiarDomicilio == null ? "" : cambiarDomicilio;
    }

    public void setCambiarDomicilio(String cambiarDomicilio) {
        this.cambiarDomicilio = cambiarDomicilio;
    }

    public String getRupturaFamiliar() {
        return rupturaFamiliar == null ? "" : rupturaFamiliar;
    }

    public void setRupturaFamiliar(String rupturaFamiliar) {
        this.rupturaFamiliar = rupturaFamiliar;
    }

    public String getProyeccionFutura() {
        return proyeccionFutura == null ? "" : proyeccionFutura;
    }

    public void setProyeccionFutura(String proyeccionFutura) {
        this.proyeccionFutura = proyeccionFutura;
    }

    public String getEspacio() {
        return espacio == null ? "" : espacio;
    }

    public void setEspacio(String espacio) {
        this.espacio = espacio;
    }

    public String getResponsables() {
        return responsables == null ? "" : responsables;
    }

    public void setResponsables(String responsables) {
        this.responsables = responsables;
    }

    public String getCompromiso() {
        return compromiso == null ? "" : compromiso;
    }

    public void setCompromiso(String compromiso) {
        this.compromiso = compromiso;
    }

    public String getAutorizaVisitas() {
        return autorizaVisitas == null ? "" : autorizaVisitas;
    }

    public void setAutorizaVisitas(String autorizaVisitas) {
        this.autorizaVisitas = autorizaVisitas;
    }

    public String getAutorizaVisitasR() {
        return autorizaVisitasR == null ? "" : autorizaVisitasR;
    }

    public void setAutorizaVisitasR(String autorizaVisitasR) {
        this.autorizaVisitasR = autorizaVisitasR;
    }

    public String getFechaVisitaDia() {
        return fechaVisitaDia == null ? "" : fechaVisitaDia;
    }

    public void setFechaVisitaDia(String fechaVisitaDia) {
        this.fechaVisitaDia = fechaVisitaDia;
    }

    public String getFechaVisitaHora() {
        return fechaVisitaHora == null ? "" : fechaVisitaHora;
    }

    public void setFechaVisitaHora(String fechaVisitaHora) {
        this.fechaVisitaHora = fechaVisitaHora;
    }

    public String getRefNombre1() {
        return refNombre1 == null ? "" : refNombre1;
    }

    public void setRefNombre1(String refNombre1) {
        this.refNombre1 = refNombre1;
    }

    public String getRefCedula1() {
        return refCedula1 == null ? "" : refCedula1;
    }

    public void setRefCedula1(String refCedula1) {
        this.refCedula1 = refCedula1;
    }

    public String getRefDireccion1() {
        return refDireccion1 == null ? "" : refDireccion1;
    }

    public void setRefDireccion1(String refDireccion1) {
        this.refDireccion1 = refDireccion1;
    }

    public String getRefCelular1() {
        return refCelular1 == null ? "" : refCelular1;
    }

    public void setRefCelular1(String refCelular1) {
        this.refCelular1 = refCelular1;
    }

    public String getRefNombre2() {
        return refNombre2 == null ? "" : refNombre2;
    }

    public void setRefNombre2(String refNombre2) {
        this.refNombre2 = refNombre2;
    }

    public String getRefCedula2() {
        return refCedula2 == null ? "" : refCedula2;
    }

    public void setRefCedula2(String refCedula2) {
        this.refCedula2 = refCedula2;
    }

    public String getRefDireccion2() {
        return refDireccion2 == null ? "" : refDireccion2;
    }

    public void setRefDireccion2(String refDireccion2) {
        this.refDireccion2 = refDireccion2;
    }

    public String getRefCelular2() {
        return refCelular2 == null ? "" : refCelular2;
    }

    public void setRefCelular2(String refCelular2) {
        this.refCelular2 = refCelular2;
    }

    public String getRefNombre3() {
        return refNombre3 == null ? "" : refNombre3;
    }

    public void setRefNombre3(String refNombre3) {
        this.refNombre3 = refNombre3;
    }

    public String getRefCedula3() {
        return refCedula3 == null ? "" : refCedula3;
    }

    public void setRefCedula3(String refCedula3) {
        this.refCedula3 = refCedula3;
    }

    public String getRefDireccion3() {
        return refDireccion3 == null ? "" : refDireccion3;
    }

    public void setRefDireccion3(String refDireccion3) {
        this.refDireccion3 = refDireccion3;
    }

    public String getRefCelular3() {
        return refCelular3 == null ? "" : refCelular3;
    }

    public void setRefCelular3(String refCelular3) {
        this.refCelular3 = refCelular3;
    }

      public String getRefNombre4() {
        return refNombre4 == null ? "" : refNombre4;
    }

    public void setRefNombre4(String refNombre4) {
        this.refNombre4 = refNombre4;
    }
    
    public String getRefCedula4() {
        return refCedula4 == null ? "" : refCedula4;
    }

    public void setRefCedula4(String refCedula4) {
        this.refCedula4 = refCedula4;
    }

    public String getRefDireccion4() {
        return refDireccion4 == null ? "" : refDireccion4;
    }

    public void setRefDireccion4(String refDireccion4) {
        this.refDireccion4 = refDireccion4;
    }
    
    public String getRefCelular4() {
        return refCelular4 == null ? "" : refCelular4;
    }

    public void setRefCelular4(String refCelular4) {
        this.refCelular4 = refCelular4;
    }
    
    public String getFotoCedula() {
        return fotoCedula == null ? "" : fotoCedula;
    }

    public void setFotoCedula(String fotoCedula) {
        this.fotoCedula = fotoCedula;
    }

    public String getFotoRecibo() {
        return fotoRecibo == null ? "" : fotoRecibo;
    }

    public void setFotoRecibo(String fotoRecibo) {
        this.fotoRecibo = fotoRecibo;
    }

    public String getFotoVivienda() {
        return fotoVivienda == null ? "" : fotoVivienda;
    }

    public void setFotoVivienda(String fotoVivienda) {
        this.fotoVivienda = fotoVivienda;
    }

    public String getDescripcion() {
        return descripcion == null ? "" : descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getAutorizacionDatos() {
        return autorizacionDatos == null ? "" : autorizacionDatos;
    }

    public void setAutorizacionDatos(String autorizacionDatos) {
        this.autorizacionDatos = autorizacionDatos;
    }

    public String getEstado() {
        if (estado == null) {
            return "Pendiente";
        } else if (estado.equals("P")) {
            return "Prestado";
        } else if (estado.equals("A")) {
            return "Aceptado";
        }
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "FormularioDeInformacion{codigo=" + codigo + "}";
    }

    public boolean grabar() {
        String cadenaSQL = "INSERT INTO formularioDeInformacion (codigo, fecha, identificacionAdoptante, codigoMascota, estadoCivil, ocupacion, motivacion, otrasMascotas, otrasMascotasR, esterilizados, "
                + "esterilizadosR, anteriorMascotas, anteriorMascotasR, habitantes, habitantesR, ninos, ninosR, alergias, vivienda, permiteMascotas, cambiarDomicilio, "
                + "rupturaFamiliar, proyeccionFutura, espacio, responsables, compromiso, autorizaVisitas, autorizaVisitasR, fechaVisitaDia, fechaVisitaHora, "
                + "refNombre1, refCedula1, refDireccion1, refCelular1, refNombre2, refCedula2, refDireccion2, refCelular2, refNombre3, refCedula3, "
                + "refDireccion3, refCelular3, refNombre4, refCedula4, refDireccion4, refCelular4, fotoCedula, fotoRecibo, fotoVivienda, descripcion, "
                + "autorizacionDatos, estado) VALUES ("
                + "generarCodigoFormularioInformacion(), CURDATE(), '" + identificacionAdoptante + "', '" + codigoMascota + "', '" + estadoCivil + "', '"
                + ocupacion + "', '" + motivacion + "', '" + otrasMascotas + "', '" + otrasMascotasR + "', '" + esterilizados + "', '" + esterilizadosR + "', '"
                + anteriorMascotas + "', '" + anteriorMascotasR + "', '" + habitantes + "', '" + habitantesR + "', '" + ninos + "', '" + ninosR + "', '" + alergias + "', '" + vivienda
                + "', '" + permiteMascotas + "', '" + cambiarDomicilio + "', '" + rupturaFamiliar + "', '" + proyeccionFutura + "', '" + espacio + "', '"
                + responsables + "', '" + compromiso + "', '" + autorizaVisitas + "', '" + autorizaVisitasR + "', '" + fechaVisitaDia + "', '" + fechaVisitaHora
                + "', '" + refNombre1 + "', '" + refCedula1 + "', '" + refDireccion1 + "', '" + refCelular1 + "', '" + refNombre2 + "', '" + refCedula2 + "', '"
                + refDireccion2 + "', '" + refCelular2 + "', '" + refNombre3 + "', '" + refCedula3 + "', '" + refDireccion3 + "', '" + refCelular3 + "', '"
                + refNombre4 + "', '" + refCedula4 + "', '" + refDireccion4 + "', '" + refCelular4 + "', '" + fotoCedula + "', '" + fotoRecibo + "', '"
                + fotoVivienda + "', '" + descripcion + "', '" + autorizacionDatos + "', 'pendiente')";

        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean aceptarFormulario() {
        String cadenaSQL = "update formularioDeInformacion set estado='Aceptado' where codigo='" + codigo + "'";
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean grabarFormularioConProcedimientoAlmacenado(String formularioInfo) {
        // Validación de la fecha para que CURDATE() sea manejado correctamente
        String fecha = (this.fecha != null && !this.fecha.isEmpty()) ? "'" + this.fecha + "'" : "CURDATE()";

        // Construcción del SQL con todos los datos y la cadena de detalles de mascotas
        String cadenaSQL = "CALL insertarFormularioDeInformacion("
                + fecha + ",'"
                + this.identificacionAdoptante + "','"
                + formularioInfo + "','"
                + this.estadoCivil + "','"
                + this.ocupacion + "','"
                + this.motivacion + "','"
                + this.otrasMascotas + "','"
                + this.otrasMascotasR + "','"
                + this.esterilizados + "','"
                + this.esterilizadosR + "','"
                + this.anteriorMascotas + "','"
                + this.anteriorMascotasR + "',"
                + this.habitantes + ",'"
                + this.habitantesR + ",'"
                + this.ninos + "','"
                + this.ninosR + "','"
                + this.alergias + "','"
                + this.vivienda + "','"
                + this.permiteMascotas + "','"
                + this.cambiarDomicilio + "','"
                + this.rupturaFamiliar + "','"
                + this.proyeccionFutura + "','"
                + this.espacio + "','"
                + this.responsables + "','"
                + this.compromiso + "','"
                + this.autorizaVisitas + "','"
                + this.autorizaVisitasR + "','"
                + this.fechaVisitaDia + "','"
                + this.fechaVisitaHora + "','"
                + this.refNombre1 + "','"
                + this.refCedula1 + "','"
                + this.refDireccion1 + "','"
                + this.refCelular1 + "','"
                + this.refNombre2 + "','"
                + this.refCedula2 + "','"
                + this.refDireccion2 + "','"
                + this.refCelular2 + "','"
                + this.refNombre3 + "','"
                + this.refCedula3 + "','"
                + this.refDireccion3 + "','"
                + this.refCelular3 + "','"
                + this.refNombre4 + "','"
                + this.refCedula4 + "','"
                + this.refDireccion4 + "','"
                + this.refCelular4 + "','"
                + this.fotoCedula + "','"
                + this.fotoRecibo + "','"
                + this.fotoVivienda + "','"
                + this.descripcion + "','"
                + this.autorizacionDatos + "')";

        System.out.println("Cadena procedimiento: " + cadenaSQL);
        return ConectorBD.ejecutarQuery(cadenaSQL);
    }

    public boolean modificar() {
        String cadenaSQL = "UPDATE formularioDeInformacion SET "
                + "fecha = '" + fecha + "', "
                + "identificacionAdoptante = '" + identificacionAdoptante + "', "
                + "codigoMascota = '" + codigoMascota + "', "
                + "estadoCivil = '" + estadoCivil + "', "
                + "ocupacion = '" + ocupacion + "', "
                + "motivacion = '" + motivacion + "', "
                + "otrasMascotas = '" + otrasMascotas + "', "
                + "otrasMascotasR = '" + otrasMascotasR + "', "
                + "esterilizados = '" + esterilizados + "', "
                + "esterilizadosR = '" + esterilizadosR + "', "
                + "anteriorMascotas = '" + anteriorMascotas + "', "
                + "anteriorMascotasR = '" + anteriorMascotasR + "', "
                + "habitantes = '" + habitantes + "', "
                + "habitantesR = '" + habitantesR + "', "
                + "ninos = '" + ninos + "', "
                + "ninosR = '" + ninosR + "', "
                + "alergias = '" + alergias + "', "
                + "vivienda = '" + vivienda + "', "
                + "permiteMascotas = '" + permiteMascotas + "', "
                + "cambiarDomicilio = '" + cambiarDomicilio + "', "
                + "rupturaFamiliar = '" + rupturaFamiliar + "', "
                + "proyeccionFutura = '" + proyeccionFutura + "', "
                + "espacio = '" + espacio + "', "
                + "responsables = '" + responsables + "', "
                + "compromiso = '" + compromiso + "', "
                + "autorizaVisitas = '" + autorizaVisitas + "', "
                + "autorizaVisitasR = '" + autorizaVisitasR + "', "
                + "fechaVisitaDia = '" + fechaVisitaDia + "', "
                + "fechaVisitaHora = '" + fechaVisitaHora + "', "
                + "refNombre1 = '" + refNombre1 + "', "
                + "refCedula1 = '" + refCedula1 + "', "
                + "refDireccion1 = '" + refDireccion1 + "', "
                + "refCelular1 = '" + refCelular1 + "', "
                + "refNombre2 = '" + refNombre2 + "', "
                + "refCedula2 = '" + refCedula2 + "', "
                + "refDireccion2 = '" + refDireccion2 + "', "
                + "refCelular2 = '" + refCelular2 + "', "
                + "refNombre3 = '" + refNombre3 + "', "
                + "refCedula3 = '" + refCedula3 + "', "
                + "refDireccion3 = '" + refDireccion3 + "', "
                + "refCelular3 = '" + refCelular3 + "', "
                + "refNombre4 = '" + refNombre4 + "', "
                + "refCedula4 = '" + refCedula4 + "', "
                + "refDireccion4 = '" + refDireccion4 + "', "
                + "refCelular4 = '" + refCelular4 + "', "
                + "fotoCedula = '" + fotoCedula + "', "
                + "fotoRecibo = '" + fotoRecibo + "', "
                + "fotoVivienda = '" + fotoVivienda + "', "
                + "descripcion = '" + descripcion + "', "
                + "autorizacionDatos = '" + autorizacionDatos + "', "
                + "estado = '" + estado + "' "
                + "WHERE codigo = '" + codigo + "'";

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

        String cadenaSQL = "select codigo, fecha, identificacionAdoptante, codigoMascota, ocupacion, tiempoLibre, espacio, compromiso, ninos, habitantes, habitantesR, responsables, otrasMascotas, propietario, motivacion, descripcion, fechaVisitaDia, fechaVisitaHora, fotoRecibo, fotoVivienda, fotoCedula, autorizacionDatos, estado "
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
                    formulario.setFecha(datos.getString("fecha"));
                    formulario.setIdentificacionAdoptante(datos.getString("identificacionAdoptante"));
                    formulario.setCodigoMascota(datos.getString("codigoMascota"));
                    formulario.setEstadoCivil(datos.getString("estadoCivil"));
                    formulario.setOcupacion(datos.getString("ocupacion"));
                    formulario.setMotivacion(datos.getString("motivacion"));
                    formulario.setOtrasMascotas(datos.getString("otrasMascotas"));
                    formulario.setOtrasMascotasR(datos.getString("otrasMascotasR"));
                    formulario.setEsterilizados(datos.getString("esterilizados"));
                    formulario.setEsterilizadosR(datos.getString("esterilizadosR"));
                    formulario.setAnteriorMascotas(datos.getString("anteriorMascotas"));
                    formulario.setAnteriorMascotasR(datos.getString("anteriorMascotasR"));
                    formulario.setHabitantes(datos.getString("habitantes"));
                    formulario.setHabitantesR(datos.getString("habitantesR"));
                    formulario.setNinos(datos.getString("ninos"));
                    formulario.setNinosR(datos.getString("ninosR"));
                    formulario.setAlergias(datos.getString("alergias"));
                    formulario.setVivienda(datos.getString("vivienda"));
                    formulario.setPermiteMascotas(datos.getString("permiteMascotas"));
                    formulario.setCambiarDomicilio(datos.getString("cambiarDomicilio"));
                    formulario.setRupturaFamiliar(datos.getString("rupturaFamiliar"));
                    formulario.setProyeccionFutura(datos.getString("proyeccionFutura"));
                    formulario.setEspacio(datos.getString("espacio"));
                    formulario.setResponsables(datos.getString("responsables"));
                    formulario.setCompromiso(datos.getString("compromiso"));
                    formulario.setAutorizaVisitas(datos.getString("autorizaVisitas"));
                    formulario.setAutorizaVisitasR(datos.getString("autorizaVisitasR"));
                    formulario.setFechaVisitaDia(datos.getString("fechaVisitaDia"));
                    formulario.setFechaVisitaHora(datos.getString("fechaVisitaHora"));
                    formulario.setRefNombre1(datos.getString("refNombre1"));
                    formulario.setRefCedula1(datos.getString("refCedula1"));
                    formulario.setRefDireccion1(datos.getString("refDireccion1"));
                    formulario.setRefCelular1(datos.getString("refCelular1"));
                    formulario.setRefNombre2(datos.getString("refNombre2"));
                    formulario.setRefCedula2(datos.getString("refCedula2"));
                    formulario.setRefDireccion2(datos.getString("refDireccion2"));
                    formulario.setRefCelular2(datos.getString("refCelular2"));
                    formulario.setRefNombre3(datos.getString("refNombre3"));
                    formulario.setRefCedula3(datos.getString("refCedula3"));
                    formulario.setRefDireccion3(datos.getString("refDireccion3"));
                    formulario.setRefCelular3(datos.getString("refCelular3"));
                    formulario.setRefNombre4(datos.getString("refNombre4"));
                    formulario.setRefCedula4(datos.getString("refCedula4"));
                    formulario.setRefDireccion4(datos.getString("refDireccion4"));
                    formulario.setRefCelular4(datos.getString("refCelular4"));
                    formulario.setFotoCedula(datos.getString("fotoCedula"));
                    formulario.setFotoRecibo(datos.getString("fotoRecibo"));
                    formulario.setFotoVivienda(datos.getString("fotoVivienda"));
                    formulario.setDescripcion(datos.getString("descripcion"));
                    formulario.setAutorizacionDatos(datos.getString("autorizacionDatos"));
                    formulario.setEstado(datos.getString("estado"));

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
                + "\"codigo\": \"" + formulario.getCodigo() + "\", "
                + "\"fecha\": \"" + formulario.getFecha() + "\", "
                + "\"identificacionAdoptante\": \"" + formulario.getIdentificacionAdoptante() + "\", "
                + "\"codigoMascota\": \"" + formulario.getCodigoMascota() + "\", "
                + "\"estadoCivil\": \"" + formulario.getEstadoCivil() + "\", "
                + "\"ocupacion\": \"" + formulario.getOcupacion() + "\", "
                + "\"motivacion\": \"" + formulario.getMotivacion() + "\", "
                + "\"otrasMascotas\": \"" + formulario.getOtrasMascotas() + "\", "
                + "\"otrasMascotasR\": \"" + formulario.getOtrasMascotasR() + "\", "
                + "\"esterilizados\": \"" + formulario.getEsterilizados() + "\", "
                + "\"esterilizadosR\": \"" + formulario.getEsterilizadosR() + "\", "
                + "\"anteriorMascotas\": \"" + formulario.getAnteriorMascotas() + "\", "
                + "\"anteriorMascotasR\": \"" + formulario.getAnteriorMascotasR() + "\", "
                + "\"habitantes\": " + formulario.getHabitantes() + ", "
                + "\"habitantesR\": " + formulario.getHabitantesR() + ", "
                + "\"ninos\": \"" + formulario.getNinos() + "\", "
                + "\"ninosR\": \"" + formulario.getNinosR() + "\", "
                + "\"alergias\": \"" + formulario.getAlergias() + "\", "
                + "\"vivienda\": \"" + formulario.getVivienda() + "\", "
                + "\"permiteMascotas\": \"" + formulario.getPermiteMascotas() + "\", "
                + "\"cambiarDomicilio\": \"" + formulario.getCambiarDomicilio() + "\", "
                + "\"rupturaFamiliar\": \"" + formulario.getRupturaFamiliar() + "\", "
                + "\"proyeccionFutura\": \"" + formulario.getProyeccionFutura() + "\", "
                + "\"espacio\": \"" + formulario.getEspacio() + "\", "
                + "\"responsables\": " + formulario.getResponsables() + ", "
                + "\"compromiso\": \"" + formulario.getCompromiso() + "\", "
                + "\"autorizaVisitas\": \"" + formulario.getAutorizaVisitas() + "\", "
                + "\"autorizaVisitasR\": \"" + formulario.getAutorizaVisitasR() + "\", "
                + "\"fechaVisitaDia\": \"" + formulario.getFechaVisitaDia() + "\", "
                + "\"fechaVisitaHora\": \"" + formulario.getFechaVisitaHora() + "\", "
                + "\"refNombre1\": \"" + formulario.getRefNombre1() + "\", "
                + "\"refCedula1\": \"" + formulario.getRefCedula1() + "\", "
                + "\"refDireccion1\": \"" + formulario.getRefDireccion1() + "\", "
                + "\"refCelular1\": \"" + formulario.getRefCelular1() + "\", "
                + "\"refNombre2\": \"" + formulario.getRefNombre2() + "\", "
                + "\"refCedula2\": \"" + formulario.getRefCedula2() + "\", "
                + "\"refDireccion2\": \"" + formulario.getRefDireccion2() + "\", "
                + "\"refCelular2\": \"" + formulario.getRefCelular2() + "\", "
                + "\"refNombre3\": \"" + formulario.getRefNombre3() + "\", "
                + "\"refCedula3\": \"" + formulario.getRefCedula3() + "\", "
                + "\"refDireccion3\": \"" + formulario.getRefDireccion3() + "\", "
                + "\"refCelular3\": \"" + formulario.getRefCelular3() + "\", "
                + "\"refNombre4\": \"" + formulario.getRefNombre4() + "\", "
                + "\"refCedula4\": \"" + formulario.getRefCedula4() + "\", "
                + "\"refDireccion4\": \"" + formulario.getRefDireccion4() + "\", "
                + "\"refCelular4\": \"" + formulario.getRefCelular4() + "\", "
                + "\"fotoCedula\": \"" + formulario.getFotoCedula() + "\", "
                + "\"fotoRecibo\": \"" + formulario.getFotoRecibo() + "\", "
                + "\"fotoVivienda\": \"" + formulario.getFotoVivienda() + "\", "
                + "\"descripcion\": \"" + formulario.getDescripcion() + "\", "
                + "\"autorizacionDatos\": \"" + formulario.getAutorizacionDatos() + "\", "
                + "\"estado\": \"" + formulario.getEstado() + "\""
                + "}";
    }

    lista += "];";
    return lista;
}

    public static List<FormularioDeInformacion> listarFormularios(Connection conn) {
        List<FormularioDeInformacion> formularios = new ArrayList<>();
        String cadenaSQL = "SELECT codigo, identificacionCliente, codigoMascota, FROM formularioDeInformacion";

        try ( PreparedStatement pstmt = conn.prepareStatement(cadenaSQL);  ResultSet resultado = pstmt.executeQuery()) {

            while (resultado.next()) {
                FormularioDeInformacion formulario = new FormularioDeInformacion();
                formulario.setCodigo(resultado.getString("codigo"));
                formulario.setIdentificacionAdoptante(resultado.getString("identificacionCliente"));
                formulario.setCodigoMascota(resultado.getString("codigoMascota"));
                formularios.add(formulario);
            }

        } catch (SQLException ex) {
            System.out.print("Error al listar formularios: " + ex.getMessage());
        }
        return formularios;
    }

    public static List<String[]> getAdopcionesPorFechaSolicitud() {
        List<String[]> lista = new ArrayList<>();
        String cadenaSQL = "SELECT YEAR(fecha) AS anio, COUNT(*) AS cantidad "
                + "FROM FormularioDeInformacion GROUP BY YEAR(fecha);";

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
        String cadenaSQL = "SELECT DATE_FORMAT(fecha, '%Y-%m') AS mes, COUNT(*) AS cantidad "
                + "FROM FormularioDeInformacion "
                + "WHERE YEAR(fecha) = " + anio + " "
                + "GROUP BY DATE_FORMAT(fecha, '%Y-%m') "
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
            System.err.println("Error en getFormulariosPorMes.");
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
