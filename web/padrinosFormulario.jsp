<%-- 
    Document   : padrinosFormulario.jsp
    Created on : 02-sep-2024, 16:58:56
    Author     : SENA
--%>

<%@page import="clases.Apadrinamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion=request.getParameter("accion");
String codigo=request.getParameter("codigo");
Apadrinamiento apadrinamiento=new Apadrinamiento();
apadrinamiento.setCodigo(codigo);
if (accion.equals("Modificar")) {
        apadrinamiento=new Apadrinamiento(codigo);
    }
%>

<h3><%=accion.toUpperCase() %>  PADRIPET</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=mascotasActualizar.jsp">
    <table border="0">
        <tr>
            <th>Código</th><td><%=apadrinamiento.getCodigo()%></td>
        </tr>
        <tr>
            <th>Identificacion</th>
            <td> <input type="text" name="identificacion" ></td>
        </tr>
        <tr>
            <th>Plan Apadrinamiento</th>
            <td><select  name="Planes" ></select></td>
        </tr>
        <tr>
            <th>Fecha</th>
            <td><input type="date" name="fecha" value="<%=apadrinamiento.getFecha()%>" required></td>
        </tr>
        
        <button onclick="window.location.href='principal.jsp?CONTENIDO=mascotas.jsp&accion=Apadrinar'" title="Apadrinar">Apadrinar</button>  
    </table>
    <input type="hidden" name="identificacionAnterior" value="<%=codigo%>">
    <p><input type="submit" name="accion" value="<%=accion %>"></p>
</form>