<%-- 
    Document   : tiposDeDonacionesActualizar
    Created on : 4/09/2024, 11:57:43 AM
    Author     : Luis Eraso
--%>


<%@page import="clases.TipoDonacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    String accion = request.getParameter("accion");
    String nombre = request.getParameter("nombre");
    String descripcion = request.getParameter("descripcion");
    TipoDonacion tipoDonacion = new TipoDonacion();
    tipoDonacion.setNombre(nombre);
    tipoDonacion.setDescripcion(descripcion);
  
    
    switch (accion) {
        case "Adicionar":
            tipoDonacion.grabar();
            break; 
        case "Modificar":
            tipoDonacion.setCodigo(request.getParameter("codigo"));
            tipoDonacion.modificar();
            break;
        case "Eliminar":
            tipoDonacion.setCodigo(request.getParameter("codigo"));
            tipoDonacion.eliminar();
            break;
    }
%>
<script type="text/javascript">
   document.location="principal.jsp?CONTENIDO=tiposDonaciones.jsp"
</script>