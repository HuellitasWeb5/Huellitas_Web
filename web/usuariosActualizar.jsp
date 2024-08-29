<%-- 
    Document   : usuariosActualizar
    Created on : 28/08/2024, 09:04:30 AM
    Author     : VALEN
--%>
<%@page import="clases.Persona"%>
<%
String accion=request.getParameter("accion");
String identificacionAnterior=request.getParameter("identificacionAnterior");

Persona usuario = new Persona();

usuario.setIdentificacion(request.getParameter("identificacion"));
usuario.setNombre(request.getParameter("nombre"));
usuario.setGenero(request.getParameter("genero"));
usuario.setFechaNacimiento(request.getParameter("genero"));
usuario.setEmail(request.getParameter("email"));
usuario.setTelefono(request.getParameter("telefono"));
usuario.setDireccion(request.getParameter("direccion"));
usuario.setResidencia(request.getParameter("reseidencia"));
usuario.setFoto(request.getParameter("foto"));
usuario.setTipo(request.getParameter("tipo"));
usuario.setClave(request.getParameter("clave"));

switch(accion){
    case "Adicionar":
        usuario.grabar();
        break;
    case "Modificar":
        usuario.modificar(identificacionAnterior);
        break;
    case "Eliminar":
        usuario.eliminar();
        break;
}
%>

<script type="text/javascript">
    document.location="principal.jsp?CONTENIDO=usuarios.jsp"
</script>
