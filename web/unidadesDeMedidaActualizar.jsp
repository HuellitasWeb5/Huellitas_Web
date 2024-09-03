<%-- 
    Document   : unidadDeMedidaActualizar
    Created on : 28/08/2024, 07:49:31 AM
    Author     : Luis Eraso
--%>

<%@page import="clases.UnidadDeMedida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombre");
    String notacion = request.getParameter("notacion");
    UnidadDeMedida cargo = new UnidadDeMedida();
    cargo.setNombre(nombre);
    cargo.setNotacion(notacion);
  
    
    switch (accion) {
        case "Adicionar":
            cargo.grabar();
            break; 
        case "Modificar":
            cargo.setId(request.getParameter("id"));
            cargo.modificar();
            break;
        case "Eliminar":
            cargo.setId(request.getParameter("id"));
            cargo.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=unidadesDeMedida.jsp"
</script>