<%-- 
    Document   : padrinosActualizar.jsp
    Created on : 8/09/2024, 10:19:54 PM
    Author     : Yandar96
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.Apadrinamiento"%>
<%
    String accion = request.getParameter("accion");
    Apadrinamiento padrino= new Apadrinamiento();
    switch (accion) {
        case "Adicionar":
            String identificacion = request.getParameter("identificacion");
            String mascotasPlan = request.getParameter("mascotasPlan");
            padrino.setIdentificacionPadrino(identificacion);
            padrino.grabarConProcedimientoAlmacenado(mascotasPlan);
            break;
        case "Eliminar":
            padrino.setCodigo(request.getParameter("numero"));
            padrino.eliminar();
            break;
    }
%>
<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=padripets.jsp";
</script>