<%-- 
    Document   : usuariosActualizar
    Created on : 28/08/2024, 09:04:30 AM
    Author     : VALEN
--%>
<%@page import="clases.Persona"%>
<%
String accion=request.getParameter("accion");
String identificacionAnterior=request.getParameter("identificacionAnterior");

Persona administrador = new Persona();

administrador.setIdentificacion(request.getParameter("identificacion"));
administrador.setNombre(request.getParameter("nombre"));
administrador.setGenero(request.getParameter("genero"));
administrador.setFechaNacimiento(request.getParameter("fechaNacimiento"));
administrador.setEmail(request.getParameter("email"));
administrador.setTelefono(request.getParameter("telefono"));
administrador.setDireccion(request.getParameter("direccion"));
administrador.setResidencia(request.getParameter("reseidencia"));
administrador.setFoto(request.getParameter("foto"));
administrador.setTipo(request.getParameter("tipo"));
administrador.setClave(request.getParameter("clave"));

switch(accion){
    case "Adicionar":
        administrador.grabar();
        break;
    case "Modificar":
        administrador.modificar(identificacionAnterior);
        break;
    case "Eliminar":
        administrador.eliminar();
        break;
}
%>

<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=administradores.jsp"
</script>
