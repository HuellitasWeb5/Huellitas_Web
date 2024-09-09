
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
//List<Persona> datosp=Persona.getListaEnObjetos(null, null);
for (int i = 0; i < datos.size(); i++) {
    Apadrinamiento apadrinamiento = datos.get(i);
    lista += "<tr>";
    lista += "<td>" +
             "Código: " + apadrinamiento.getCodigo() + "<br>" +
             "Planes: " + apadrinamiento.getPlanApadrinamiento() + "<br>" +
             "Fecha: " + apadrinamiento.getFecha() + "<br>" +
             "Id Padrino: " + apadrinamiento.getIdentificacionPadrino() + "<br>" +
             "<a href='principal.jsp?CONTENIDO=padrinosFormulario.jsp&accion=Modificar&identificacion=" + apadrinamiento.getCodigo() + "' title='Modificar'>" +
             "<img src='presentacion/iconos/modificar.png'></a> " +
             "<img src='presentacion/iconos/eliminar.png' title='Eliminar' onClick='eliminar(" + apadrinamiento.getCodigo() + ")'>" +
             "</td>";
    lista += "</tr>";
}
%>
<h3>PADRIPETS</h3>
<button onclick="window.location.href='principal.jsp?CONTENIDO=padrinosFormulario.jsp&accion=Adicionar'" title="Adicionar">Agregar</button>
<table border="1">
    <tr>
        <th>Detalles</th>
    </tr>
    <%= lista %> 
</table>

<script type="text/javascript">
    function eliminar(codigo){
        resultado=confirm("Realmente desea eliminar el registro padripet con el codigo: "+codigo+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=padrinoActualizar.jsp&accion=Eliminar&codigo="+codigo;
         }
    }
</script>