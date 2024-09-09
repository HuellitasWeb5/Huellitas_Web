<%-- 
    Document   : administradoresFormulario
    Created on : 30/08/2024, 10:50:29 AM
    Author     : VALEN
--%>

<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion=request.getParameter("accion");
String identificacion=request.getParameter("identificacion");
Persona administrador=new Persona();
if (accion.equals("Modificar")) {
        administrador=new Persona(identificacion);
    }
%>

<h3><%= accion.toUpperCase() %>   ADMINISTRADOR </h3>
<table border="0"><tr><td><!-- para la tabla que se creó para la imagen-->
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=administradoresActualizar.jsp" enctype="multipart/form-data">
    <table border="0">
    
        <tr>
            <th>Identificación</th>
            <td><input type="text" name="identificacion" maxlength="12" value="<%=administrador.getIdentificacion()%>" required></td>
        </tr>
        
        <tr>
            <th>Nombre</th>
            <td><input type="text" name="nombre" value="<%=administrador.getNombre()%>" size="50" maxlength="50"></td>
        </tr>
         
 
        <tr><th>Género</th><td><%=administrador.getGeneroEnObjeto().getRadioButtons() %></td></tr>
        
        <tr><th>Fecha De Nacimiento</th><td><input type="date" name="fechaNacimiento" value="<%=administrador.getFechaNacimiento()%>" maxlength="15" required></td></tr>
       
         
        <tr>
            <th>Correo Electronico</th>
            <td><input type="text" name="email" value="<%=administrador.getEmail() %>" maxlength="80" required></td>
        </tr>
        <tr><th>Teléfono</th><td><input type="text" name="telefono" value="<%=administrador.getTelefono()%>" maxlength="12"></td></tr>
       <tr>
        <th>Dirección</th>
        <td><input type="text" name="direccion" value="<%=administrador.getDireccion() %>" size="50" maxlength="100"></td>
        </tr>
        
        <tr>
        <th>Residencia</th>
        <td><input type="text" name="residencia" value="<%=administrador.getResidencia() %>" size="50" maxlength="100"></td>
        </tr>
        
       <tr>
            <th>Foto</th>
            <td>
                <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();">
            </td>
         </tr>
        <tr>
            <th>Rol</th>
            <td><select class="recuadro" name="tipo"><%=administrador.getTipoEnObjeto().getListaEnOptions()%></select></td>
        </tr>
        <tr>
            <th>Contraseña</th>
            <td><input type="password" name="clave" required></td>
        </tr>
    </table>
        <input type="hidden" name="identificacionAnterior" value="<%=identificacion%>">
        <input type="submit" name="accion" value="<%=accion%>">
        <input type="button" value="Cancelar" onClick="window.history.back()">
</form>
   
    </td><td><img src="presentacion/administrador/<%=administrador.getFoto()%>" id="foto" width="auto" height="350"></td></table>
    <script> 
    function mostrarFoto(){
        var lector=new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend= function(){
            document.getElementById("foto").src=lector.result;
        }
    }
</script>
    
    
