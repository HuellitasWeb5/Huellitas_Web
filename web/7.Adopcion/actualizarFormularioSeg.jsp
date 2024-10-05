<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.FormularioDeSeguimiento"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String accion = request.getParameter("accion");
    String mensaje = "";
    
    String fecha = new java.sql.Date(System.currentTimeMillis()).toString();
    String identificacionAdoptante = request.getParameter("identificacionAdoptante"); 
    String codigoMascota = request.getParameter("codigoMascota");  
    String evolucionMedica = request.getParameter("evolucionMedica");
    String masaCorporal = request.getParameter("masaCorporal");
    String estadoEmocional = request.getParameter("estadoEmocional");
    String adaptacion = request.getParameter("adaptacion");
    String vinculo = request.getParameter("vinculo");
    String descripcion = request.getParameter("descripcion");
    String calificacion = request.getParameter("calificacion");
    String fechaProximaVisita = request.getParameter("fechaProximaVisita");
    String foto = request.getParameter("foto");

    FormularioDeSeguimiento formulario = new FormularioDeSeguimiento();

    formulario.setIdentificacionAdoptante(identificacionAdoptante);
    formulario.setCodigoMascota(codigoMascota);  
    formulario.setEvolucionMedica(evolucionMedica);
    formulario.setMasaCorporal(masaCorporal);
    formulario.setEstadoEmocional(estadoEmocional);
    formulario.setAdaptacion(adaptacion);
    formulario.setVinculo(vinculo);
    formulario.setDescripcion(descripcion);
    formulario.setCalificacion(Integer.parseInt(calificacion));
    formulario.setFechaProximaVisita(Date.valueOf(fechaProximaVisita));  
    formulario.setFoto(foto);  

    try {
        switch(accion){
        case "grabar":
            if (formulario.grabarFormularioConProcedimientoAlmacenado()) {
                mensaje = "Formulario de seguimiento guardado correctamente.";
            } else {
                mensaje = "Error al guardar el formulario de seguimiento.";
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
    document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=7.Adopcion/verFormularioSeg.jsp"
</script>
