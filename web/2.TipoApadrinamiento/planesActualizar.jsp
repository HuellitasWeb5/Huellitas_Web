<%-- 
    Document   : planesActualizar.jsp
    Created on : 5/09/2024, 10:49:01 AM
    Author     : yanda
--%>

<%@page import="clases.PlanesApadrinamiento"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String accion = request.getParameter("accion");
    String nombre = request.getParameter("Nombre");
    String descripcion = request.getParameter("Descripcion");
    PlanesApadrinamiento planes= new PlanesApadrinamiento();
    planes.setNombre(nombre);
    planes.setDescripcion(descripcion);
  
    
    switch (accion) {
        case "Adicionar":
            planes.grabar();
            break; 
        case "Modificar":
            planes.setId(request.getParameter("id"));
            planes.modificar();
            break;
        case "Eliminar":
            planes.setId(request.getParameter("id"));
            planes.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=2.TipoApadrinamiento/planesPadrinos.jsp";
</script>