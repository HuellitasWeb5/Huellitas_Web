<%-- 
    Document   : usuariosFormulario
    Created on : 28/08/2024, 09:05:01 AM
    Author     : VALEN
--%>

<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion=request.getParameter("accion");
String identificacion=request.getParameter("identificacion");
Persona usuario=new Persona();
if (accion.equals("Modificar")) {
        usuario=new Persona(identificacion);
    }
%>
<h3><%=accion.toUpperCase() %> USUARIO</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=usuariosActualizar.jsp">
    <table border="0">
        <tr>
            <th>Identificación</th>
            <td><input type="text" name="identificacion" maxlength="12" value="<%=usuario.getIdentificacion()%>" required></td>
        </tr>
        <tr>
            <th>Nombre</th>
            <td><input type="text" name="nombres" value="<%=usuario.getNombre()%>" size="50" maxlength="50"></td>
        </tr>
 
        <tr><th>Género</th><td><%=usuario.getGeneroEnObjeto().getRadioButtons() %></td>   </tr>
        
         <tr><th>Fecha De Nacimiento</th><td><input type="date" name="fechaNacimiento" value="<%=usuario.getFechaNacimiento()%>" maxlength="15"></td></tr>
         
        <tr><th>Teléfono</th><td><input type="tel" name="telefono" value="<%=usuario.getTelefono()%>" maxlength="12"></td></tr>
        
        <tr>
            <th>Correo Electronico</th>
            <td><input type="email" name="email" value="<%=usuario.getEmail() %>" maxlength="80" required></td>
        </tr>
       
        <tr>
        <th>Dirección</th>
        <td><input type="text" name="direccion" value="<%=usuario.getDireccion() %>" size="50" maxlength="100"></td>
    </tr>
    <tr>
        <th>Residencia</th>
        <td><input type="text" name="residencia" value="<%=usuario.getResidencia() %>" size="50" maxlength="100"></td>
    </tr>
    <tr>
        <th>Foto</th>
        <td><input type="file" name="foto" accept="image/*"></td>
    </tr>
    <tr>
        <th>Rol</th>
        <td><select name="tipo"><%=usuario.getTipoEnObjeto().getListaEnOptions()%></select></td>
    </tr>
    <tr>
        
        
        
        <tr><th>Rol</th><td><select name="tipo"><%=usuario.getTipoEnObjeto().getListaEnOptions()%></select></td></tr>
        <tr><th>Contraseña</th><td><input type="password" name="clave" value="<%=usuario.getClave() %>"></td></tr>
    </table>
    <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
    <p><input type="submit" name="accion" value="<%=accion %>"> 
</form>

