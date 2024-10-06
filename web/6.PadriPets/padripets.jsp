<%-- 
    Document   : padripets
    Created on : 02-sep-2024, 14:59:14
    Author     : SENA
--%>


<%@page import="clases.Apadrinamiento"%>
<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String lista="";
List<Apadrinamiento> datos=Apadrinamiento.getListaEnObjetos(null, null);
for (int i = 0; i < datos.size(); i++) {
    Apadrinamiento apadrinamiento = datos.get(i);
    lista += "<tr>";
    lista += "<td>" +
             "Código: " + apadrinamiento.getCodigo() + "<br>" +
             "Fecha: " + apadrinamiento.getFecha() + "<br>" +
             "Id Padrino: " + apadrinamiento.getIdentificacionPadrino() + "<br>" +
             "<img src='presentacion/iconos/eliminar.png' title='Eliminar' onClick='eliminar(" + apadrinamiento.getCodigo() + ")'>" +
             "</td>";
    lista += "</tr>";
}
%>
<h3>PADRIPETS</h3>
<a href="principal.jsp?CONTENIDO=6.PadriPets/padrinosFormulario.jsp&accion=Adicionar">
    <button type="button">Adicionar Padripet</button>
</a><table border="1">
    <tr>
        <th>Detalles</th>
    </tr>
    <%= lista %> 
</table>

<script type="text/javascript">
    function eliminar(codigo){
        resultado=confirm("Realmente desea eliminar el registro padripet con el codigo: "+codigo+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=6.PadriPets/padrinoActualizar.jsp&accion=Eliminar&codigo="+codigo;
         }
    }
</script>