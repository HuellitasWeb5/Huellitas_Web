<%@page import="clases.FormularioDeInformacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    // Capturar los parámetros enviados desde el formulario
    String accion = request.getParameter("accion");
    String fecha = request.getParameter("fecha");
    String identificacionAdoptante = request.getParameter("identificacionAdoptante");
    String codigoMascota = request.getParameter("codigoMascota");

    // Capturar los demás valores
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

    // Capturar todas las selecciones de los checkboxes
    String[] diasVisitaSeleccionados = request.getParameterValues("fechaVisitaDia");

    // Verificar si se seleccionaron días de visita
    String fechaVisitaDia = "";
    if (diasVisitaSeleccionados != null) {
        fechaVisitaDia = String.join("|", diasVisitaSeleccionados);  // Unir los valores con el delimitador "|"
    }

    String fechaVisitaHora = request.getParameter("fechaVisitaHora");
    String fotoRecibo = request.getParameter("fotoRecibo");
    String fotoVivienda = request.getParameter("fotoVivienda");
    String fotoCedula = request.getParameter("fotoCedula");
    String descripcion = request.getParameter("descripcion");
    String autorizacionDatos = request.getParameter("autorizacion");

    // Crear el objeto y asignar los valores capturados
    FormularioDeInformacion formularioDeInformacion = new FormularioDeInformacion();

    formularioDeInformacion.setFecha(fecha);
    formularioDeInformacion.setIdentificacionAdoptante(identificacionAdoptante);
    formularioDeInformacion.setCodigoMascota(codigoMascota);
    formularioDeInformacion.setOcupacion(ocupacion);
    formularioDeInformacion.setTiempoLibre(tiempoLibre);
    formularioDeInformacion.setEspacio(espacio);
    formularioDeInformacion.setCompromiso(compromiso);
    formularioDeInformacion.setNinos(ninos);
    formularioDeInformacion.setHabitantes(habitantes);
    formularioDeInformacion.setResponsables(responsables);
    formularioDeInformacion.setOtrasMascotas(otrasMascotas);
    formularioDeInformacion.setPropietario(propietario);
    formularioDeInformacion.setMotivacion(motivacion);
    formularioDeInformacion.setFechaVisitaDia(fechaVisitaDia);  // Guardar el valor concatenado
    formularioDeInformacion.setFechaVisitaHora(fechaVisitaHora);
    formularioDeInformacion.setFotoRecibo(fotoRecibo);
    formularioDeInformacion.setFotoVivienda(fotoVivienda);
    formularioDeInformacion.setFotoCedula(fotoCedula);
    formularioDeInformacion.setDescripcion(descripcion);
    formularioDeInformacion.setAutorizacionDatos(autorizacionDatos);

    // Gestionar la acción solicitada (Adicionar, Modificar o Eliminar)
    switch (accion) {
        case "Adicionar":
            formularioDeInformacion.grabar(); // Método para guardar
            break;
        case "Modificar":
            formularioDeInformacion.modificar(); // Método para modificar
            break;
        case "Eliminar":
            formularioDeInformacion.setCodigo(request.getParameter("codigo"));
            formularioDeInformacion.eliminar(); // Método para eliminar
            break;
        default:
            out.println("Acción no válida.");
            break;
    }
%>

<script type="text/javascript">
    // Redirigir después de la acción
    document.location = "principal.jsp?CONTENIDO=7.Adopcion/verFormularioInfo.jsp";
</script>
