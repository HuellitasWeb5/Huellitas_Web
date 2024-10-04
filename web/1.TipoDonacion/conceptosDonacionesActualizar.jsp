<%-- 
    Document   : conceptosDonacionesActualizar
    Created on : 6/09/2024, 03:15:29 PM
    Author     : Luis Eraso
--%>

<%@page import="clases.ConceptoDonacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<%
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    String codigoTipoDonacion = request.getParameter("codigoTipoDonacion");
    String idUnidadDeMedida = request.getParameter("idUnidadDeMedida");

    ConceptoDonacion conceptoDonacion = new ConceptoDonacion();
    conceptoDonacion.setNombre(nombre);
    conceptoDonacion.setDescripcion(descripcion);
    conceptoDonacion.setCodigoTipoDonacion(codigoTipoDonacion);
    conceptoDonacion.setIdUnidadDeMedida(idUnidadDeMedida);

    switch (accion) {
        case "Adicionar":
            conceptoDonacion.grabar();
            break;
        case "Modificar":
            conceptoDonacion.setId(request.getParameter("id"));
            conceptoDonacion.modificar();
            break;
        case "Eliminar":
            conceptoDonacion.setId(request.getParameter("id"));
            conceptoDonacion.eliminar();
            break;
    }
%>

<script type="text/javascript">
    // Incrustar las variables JSP en el script JavaScript
    var codigo = "<%= codigo%>";
    var accion = "<%= accion%>";

 
    document.location = "/HuellitasWeb/principal.jsp?CONTENIDO=1.TipoDonacion/conceptoDonaciones.jsp&codigo=" + codigo;
</script>

