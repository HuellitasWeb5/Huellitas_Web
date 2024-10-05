
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    // Obtener los parámetros enviados desde el formulario de adopción
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    String fecha = request.getParameter("fecha");
   

    // Adoptante
    String identificacionAdoptante = request.getParameter("identificacionAdoptante");

    // Mascota
    String codigoMascota = request.getParameter("codigoMascota");

    // Formulario
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
    String fechaVisitaDia = request.getParameter("fechaVisitaDia");
    String fechaVisitaHora = request.getParameter("fechaVisitaHora");
    String descripcion = request.getParameter("descripcion");
    String autorizacionDatos = request.getParameter("autorizacion");

    // Crear una instancia de la clase FormularioDeInformacion
    FormularioDeInformacion formulario = new FormularioDeInformacion();

    // Asignar los valores a la clase
    formulario.setFecha(fecha);
    formulario.setIdentificacionAdoptante(identificacionAdoptante);
    formulario.setCodigoMascota(codigoMascota);
    formulario.setOcupacion(ocupacion);
    formulario.setTiempoLibre(tiempoLibre);
    formulario.setEspacio(espacio);
    formulario.setCompromiso(compromiso);
    formulario.setNinos(ninos);
    formulario.setHabitantes(habitantes);
    formulario.setResponsables(responsables);
    formulario.setOtrasMascotas(otrasMascotas);
    formulario.setPropietario(propietario);
    formulario.setMotivacion(motivacion);
    formulario.setDescripcion(descripcion);
    formulario.setFechaVisitaDia(fechaVisitaDia);
    formulario.setFechaVisitaHora(fechaVisitaHora);
    formulario.setAutorizacionDatos(autorizacionDatos);

    // Guardar o modificar los datos en la base de datos según la acción
    switch (accion) {
        case "Adicionar":
            formulario.grabar();
            break;
        case "Modificar":
            formulario.setCodigo(request.getParameter("codigo"));
            formulario.modificar();
            break;
        case "Eliminar":
            formulario.setCodigo(request.getParameter("codigo"));
            formulario.eliminar();
            break;
    }
%>

<script type="text/javascript">
    // Redirigir al usuario a la página principal después de guardar los datos
    //document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=7.Adopcion/verFormulariosInfo.jsp";
</script>
