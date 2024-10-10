<%-- 
    Document   : unidadDeMedidaActualizar
    Created on : 28/08/2024, 07:49:31 AM
    Author     : Luis Eraso
--%>

<%@page import="clases.UnidadDeMedida"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombre");
    String notacion = request.getParameter("notacion");
    UnidadDeMedida unidadDeMedida = new UnidadDeMedida();
    unidadDeMedida.setNombre(nombre);
    unidadDeMedida.setNotacion(notacion);
  
    
    switch (accion) {
        case "Adicionar":
            unidadDeMedida.grabar();
            break; 
        case "Modificar":
            unidadDeMedida.setId(request.getParameter("id"));
            unidadDeMedida.modificar();
            break;
        case "Eliminar":
            unidadDeMedida.setId(request.getParameter("id"));
            unidadDeMedida.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location="/HuellitasWeb/principal.jsp?CONTENIDO=1.TipoDonacion/unidadesDeMedida.jsp"
</script>