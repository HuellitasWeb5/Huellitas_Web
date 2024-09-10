<%-- 
    Document   : padripets
    Created on : 02-sep-2024, 14:59:14
    Author     : SENA
--%>

<%@page import="clases.Apadrinamiento"%>
<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<
<%
    String lista = "";
    List<Apadrinamiento> datos = Apadrinamiento.getListaEnObjetos(null, null);
  //  List<Persona> datos = Persona.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        Apadrinamiento apadrinamiento = datos.get(i);
        lista += "<tr>";
        lista += "<td>" + apadrinamiento.getCodigo() + "</td>";
        lista += "<td>" + apadrinamiento.getPlanApadrinamiento() + "</td>";
        lista += "<td>" + apadrinamiento.getFecha() + "</td>";
        lista += "<td>" + apadrinamiento.getIdentificacionPadrino() + "</td>";
        lista += "<td>";
        lista += "<a href='principal.jsp?CONTENIDO=padrinosFormulario.jsp&accion=Modificar&identificacion=" + apadrinamiento.getCodigo()
                + " 'title='Modificar'><img src='presentacion/iconos/modificar.png' ></a>  ";
        lista += "<img src='presentacion/iconos/eliminar.png' title='Eliminar' onClick='eliminar(" + apadrinamiento.getCodigo() + ")'> ";
        lista += "</td>";
        lista += "</tr>";
    }
%>
<h3>PADRIPETS</h3>
<table border="1">
    <tr>
        <th>Código</th><th>Planes</th><th>Fecha</th><th>Id Padripet</th>
        <th><a href="principal.jsp?CONTENIDO=padrinosFormulario.jsp&accion=Adicionar" title="Adicionar">
                <img src="presentacion/iconos/agregar.png">  </a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(codigo) {
        resultado = confirm("Realmente desea eliminar el registro padripet con el codigo: " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=padrinoActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }
</script>