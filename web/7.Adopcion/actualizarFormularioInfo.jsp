<%-- 
    Document   : actualizarFormularioInfo
    Created on : 1 oct 2024, 23:02:13
    Author     : Angie
--%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String accion = request.getParameter("accion");
    String identificacion = request.getParameter("identificacion");
    String nombreAdoptante = request.getParameter("nombreAdoptante");
    String telefono = request.getParameter("telefono");
    String direccion = request.getParameter("direccion");
    String residencia = request.getParameter("residencia");
    String codigoMascota = request.getParameter("codigoMascota");
    String nombreMascota = request.getParameter("nombreMascota");
    String fechaNacimiento = request.getParameter("fechaNacimiento");
    String genero = request.getParameter("genero");
    String cuidadosEspeciales = request.getParameter("cuidadosEspeciales");
    String ocupacion = request.getParameter("ocupacion");
    String tiempoLibre = request.getParameter("tiempoLibre");
    String espacio = request.getParameter("espacio");
    String compromiso = request.getParameter("compromiso");
    String ninos = request.getParameter("ninos");
    String habitantes = request.getParameter("habitantes");
    String responsables = request.getParameter("responsables");
    String otrasMascotas = request.getParameter("otrasMascotas");
    String propietario = request.getParameter("propietario");
    String motivacion = request.getParameter("motivacion");
    String horarioVisitaDias = request.getParameter("horarioVisitaDias");
    String horarioVisitaHora = request.getParameter("horarioVisitaHora");
    String descripcion = request.getParameter("descripcion");
    
    FormularioDeInformacion formulario = new FormularioDeInformacion();
    formulario.setIdentificacion(identificacion);
    formulario.setNombreAdoptante(nombreAdoptante);
    formulario.setTelefono(telefono);
    formulario.setDireccion(direccion);
    formulario.setResidencia(residencia);
    formulario.setCodigoMascota(codigoMascota);
    formulario.setNombreMascota(nombreMascota);
    formulario.setFechaNacimiento(Date.valueOf(fechaNacimiento));
    formulario.setGenero(genero);
    formulario.setCuidadosEspeciales(cuidadosEspeciales);
    formulario.setOcupacion(ocupacion);
    formulario.setTiempoLibre(tiempoLibre);
    formulario.setEspacio(espacio);
    formulario.setCompromiso(compromiso);
    formulario.setNinos(Integer.parseInt(ninos));
    formulario.setHabitantes(Integer.parseInt(habitantes));
    formulario.setResponsables(Integer.parseInt(responsables));
    formulario.setOtrasMascotas(otrasMascotas);
    formulario.setPropietario(propietario);
    formulario.setMotivacion(motivacion);
    formulario.setHorarioVisitaDias(horarioVisitaDias);
    formulario.setHorarioVisitaHora(horarioVisitaHora);
    formulario.setDescripcion(descripcion);

    switch (accion) {
        case "Adicionar":
            formulario.grabar();
            break;
        case "Modificar":
            formulario.setId(request.getParameter("id"));
            formulario.modificar();
            break;
        case "Eliminar":
            formulario.setId(request.getParameter("id"));
            formulario.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location="/HuellitasWeb/principal.jsp?CONTENIDO=7.Adopcion/verFormularioInfo.jsp"
</script>



