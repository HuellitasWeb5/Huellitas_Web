<%-- 
    Document   : mascotasFormulario
    Created on : 28/08/2024, 09:12:29 AM
    Author     : URB
--%>

<%@page import="clases.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion=request.getParameter("accion");
String codigo=request.getParameter("codigo");
Mascota mascota=new Mascota();
if (accion.equals("Modificar")) {
        mascota=new Mascota(codigo);
    }
%>
<h3><%=accion.toUpperCase() %> USUARIO</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=usuariosActualizar.jsp">
    <table border="0">
        <tr>
            <th>Codigo</th>
            <td><input type="text" name="codigon" maxlength="12" value="<%=mascota.getCodigo()%>" required></td>
        </tr>
        <tr>
            <th>Nombre</th>
            <td><input type="text" name="nombre" value="<%=mascota.getNombre()%>" size="50" maxlength="50"></td>
        </tr>
        <tr>
            <tr><th>Genero</th><td><%=mascota.getGeneroEnObjeto().getRadioButtons() %></td>   </tr>
        </tr>
        <tr><th>Tamaño</th><td><input type="tamaño" name="telefono" value="<%=mascota.getTamaño()%>" maxlength="12"></td></tr>
        <tr>
            <th>Foto</th>
            <td><input type="email" name="foto" value="<%=mascota.getFoto()%>" maxlength="80" required></td>
        </tr>
        <tr>
            <th>Cuidados especiales/th>
            <td><input type="email" name="cuidadosEspeciales" value="<%=mascota.getCuidadosEspeciales()%>" maxlength="80" required></td>
        </tr>
        <tr>
            <th>fecha aproximada de nacimineto</th>
            <td><input type="email" name="fechaAproximadaNacimiento" value="<%=mascota.getFechaNacimientoAproximada()%>" maxlength="80" required></td>
        </tr>
        <tr>
            <th>fecha de ingreso</th>
            <td><input type="email" name="fechaIngreso" value="<%=mascota.getFechaIngreso()%>" maxlength="80" required></td>
        </tr>
        <tr>
            <th>Estado</th>
            <td><input type="email" name="estado" value="<%=mascota.getEstado()%>" maxlength="80" required></td>
        </tr>
    </table>
    <input type="hidden" name="identificacionAnterior" value="<%=codigo%>">
    <p><input type="submit" name="accion" value="<%=accion %>"></p>
</form>
