    <%@page import="clases.Persona"%>
    <%@page import="clases.Mascota"%>
    <%@page import="clases.FormularioDeInformacion"%>
    <%@page import="java.util.List"%>
    <%@page import="java.sql.Date"%>
    <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <%
    String accion = request.getParameter("accion");
    String mensaje = "";

    // Recuperar parámetros del formulario
    String identificacionAdoptante = request.getParameter("identificacionAdoptante"); 
    String codigosMascotasConcatenados = String.join(",", codigosMascotas);
    formulario.setCodigoMascota(codigosMascotasConcatenados);  // Puede haber más de un código de mascota
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
    String fechaVisitaDia = request.getParameter("horarioVisitaDia");
    String fechaVisitaHora = request.getParameter("horarioVisitaHora");
    String descripcion = request.getParameter("descripcion");

    FormularioDeInformacion formulario = new FormularioDeInformacion();

    formulario.setIdentificacionAdoptante(identificacionAdoptante);
    formulario.setCodigosMascotas(codigosMascotasConcatenados);  // Establece la lista de códigos de mascota
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
    formulario.setFechaVisitaDia(fechaVisitaDia);
    formulario.setFechaVisitaHora(fechaVisitaHora);
    formulario.setDescripcion(descripcion);

    try {
        switch(accion){
        case "Adicionar":
            if (formulario.grabarFormularioConProcedimientoAlmacenado()) {
                mensaje = "Formulario de adopción guardado correctamente.";
            } else {
                mensaje = "Error al guardar el formulario de adopción.";
            }
            break;
        case "Modificar":
            formulario.setCodigo(request.getParameter("codigo"));
            if (formulario.modificar()) {
                mensaje = "Formulario modificado correctamente.";
            } else {
                mensaje = "Error al modificar el formulario.";
            }
            break;
        case "Eliminar":
            formulario.setCodigo(request.getParameter("codigo"));
            if (formulario.eliminar()) {
                mensaje = "Formulario eliminado correctamente.";
            } else {
                mensaje = "Error al eliminar el formulario.";
            }
            break;
        default:
            mensaje = "Acción no reconocida.";
        }
    } catch (Exception e) {
        mensaje = "Ocurrió un error: " + e.getMessage();
    }

    if (!mensaje.isEmpty()) {
        out.println("<script>alert('" + mensaje + "');</script>");
    }
    %>

    <script type="text/javascript">
    document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=7.Adopcion/verFormularioInfo.jsp"
    </script>