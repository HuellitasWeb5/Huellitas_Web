<%-- 
    Document   : mascotasActualizar
    Created on : 28/08/2024, 09:13:23 AM
    Author     : URB
--%>

<%@page import="clases.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String accion = request.getParameter("accion");
    String codigoAnterior = request.getParameter("identificacionAnterior");

    Mascota mascota = new Mascota();
    mascota.setCodigo(request.getParameter("codigo"));
    mascota.setNombre(request.getParameter("nombre"));
    mascota.setGenero(request.getParameter("genero"));
    mascota.setTamaño(request.getParameter("tamaño"));
    mascota.setFoto(request.getParameter("foto"));
    mascota.setCuidadosEspeciales(request.getParameter("cuidadosEspeiales"));
    mascota.setFechaNacimientoAproximada(request.getParameter("fechaIngreso"));
    mascota.setFechaIngreso(request.getParameter("fechaIngreso"));
    mascota.setEstado(request.getParameter("estado"));

    switch (accion) {
        case "Adicionar":
            mascota.grabar();
            break;
        case "Modificar":
            mascota.modificar(codigoAnterior);
            break;
        case "Eliminar":
            mascota.eliminar();
            break;
    }
%>

<script type="text/javascript">
    document.location = "principal.jsp?CONTENIDO=mascotas.jsp";
</script>>
