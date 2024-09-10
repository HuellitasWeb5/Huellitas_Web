<%-- 
    Document   : clientesFormulario
    Created on : 27/05/2024, 03:20:46 PM
    Author     : URB
--%>

<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion=request.getParameter("accion");
String identificacion=request.getParameter("identificacion");
Persona clientes=new Persona();
if (accion.equals("Modificar")) {
        clientes=new Persona(identificacion);
    }
%>
<h3><%=accion.toUpperCase() %> CLIENTE</h3>
<table border="0"><tr><td><!-- para la tabla que se creó para la imagen-->
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=4.Clientes/clientesActualizar.jsp" enctype="multipart/form-data">
    <table border="0">
        <tr>
            <th>Identificacion</th>
            <td><input type="text" name="identificacion" maxlength="12" value="<%=clientes.getIdentificacion()%>" required></td>
        </tr>
        <tr>
            <th>Nombres</th>
            <td><input type="text" name="nombre" value="<%=clientes.getNombre()%>" size="30" maxlength="50" required=""></td>
        </tr>
        <tr>
            <th>Genero</th><td><%=clientes.getGeneroPersona().getRadioButtons() %></td>   
        </tr>
        <tr>
            <th>Fecha de nacimiento</th>
            <td><input type="date" name="fechaNacimiento" value="<%=clientes.getFechaNacimiento()%>" size="50" maxlength="50"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input type="email" name="email" value="<%=clientes.getEmail() %>" maxlength="80" required></td>
        </tr>
        <tr><th>Telefono</th><td><input type="tel" name="telefono" value="<%=clientes.getTelefono()%>" maxlength="12"></td></tr>
        <tr><th>Direccion</th><td><input type="text" name="direccion" value="<%=clientes.getDireccion()%>" maxlength="12"></td></tr>
        <tr><th>Residencia</th><td><input type="text" name="residencia" value="<%=clientes.getResidencia()%>" maxlength="12"></td></tr>
        <tr>
            <th>Foto</th>
            <td> <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();"></td>
        </tr>
        <tr><th>Contraseña</th><td><input type="password" name="clave" value="" required></td></tr>
    </table>
    <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
    <input type="submit" name="accion" value="<%=accion %>">
    <input type="button" value="Cancelar" onClick="window.history.back()">
</form>
    <td><img src="presentacion/clientes/<%=clientes.getFoto()%>" id="foto" width="auto" height="200"></td></table>
<script> 
    function mostrarFoto(){
        var lector=new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend= function(){
            document.getElementById("foto").src=lector.result;
        }
    }
</script>
