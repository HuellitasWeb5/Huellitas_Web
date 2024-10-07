<%@page import="clases.DonacionDetalle"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    DonacionDetalle donacionDetalle = new DonacionDetalle();
    List<DonacionDetalle> detalles = donacionDetalle.getId();
%>

<h3>DETALLES DE DONACIÓN</h3>
<p>Código de Donación: <%=id%></p>

<table border="1">
    <tr>
        <th>Código Tipo de Donación</th>
        <th>Concepto de Donación</th>
        <th>Cantidad</th>
    </tr>
    <% for (DonacionDetalle detalle : detalles) { %>
    <tr>
        <td><%=detalle.getCodigoTipoDonacion()%></td>
        <td><%=detalle.getIdConcepto()%></td>
        <td><%=detalle.getCantidad()%></td>
    </tr>
    <% } %>
</table>


<p>
    <input type="button" value="Cancelar" onClick="window.history.back()">
</p>
