<%-- 
    Document   : donacionesFormularioActualizar
    Created on : 6/09/2024, 03:15:29 PM
    Author     : Luis Eraso
--%>

<%@page import="clases.Donacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String accion = request.getParameter("accion");
    String identificacionDonante = request.getParameter("identificacionDonante");
    String descripcion = request.getParameter("descripcion");
    String fecha = request.getParameter("fecha");
    Donacion donacion = new Donacion();
    donacion.setIdentificacionDonante(identificacionDonante);
    donacion.setDescripcion(descripcion);
    donacion.setFecha(fecha);
  
    
    switch (accion) {
        case "Adicionar":
            donacion.grabar();
            break; 
        case "Modificar":
            donacion.setCodigo(request.getParameter("codigo"));
            donacion.modificar();
            break;
        case "Eliminar":    
            donacion.setCodigo(request.getParameter("codigo"));
            donacion.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location="/HuellitasWeb/principal.jsp?CONTENIDO=8.Donacion/donacionesDetalles.jsp&codigo="+codigo
</script>