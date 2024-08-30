<%-- 
    Document   : unidadesDeMedida
    Created on : 28/08/2024, 10:45:02 AM
    Author     : Luis Eraso
--%>

<%@page import="java.util.List"%>
<%@page import="clases.UnidadDeMedida"%>
<%@page import="clases.UnidadDeMedida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String lista = "";
    List<UnidadDeMedida> datos = UnidadDeMedida.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        UnidadDeMedida unidadDeMedida = datos.get(i);
        
        
       lista += "<div class='card'>";
       lista += "<div class='card-header'>";
       lista += "<h2>"+unidadDeMedida.getNombre()+"<h2>";
       lista += "</div>";
       lista += "<class='card-body'>";
       lista += "<p>"+"Código: "+unidadDeMedida.getId()+"<p>";
       lista += "<p>"+"Notación: "+unidadDeMedida.getNotacion()+"<p>";
       lista += "<button>"+"Modificar"+"</button>"+"<button>"+"Eiminar"+"</button>";
       
     //  lista += "<input type='submit' value='Adicionar' id='Adicionar'>";
       lista += "</div>";
       lista += "<div class='card-footer'>";
       lista += "</div>";
       lista += "</div>";
       lista += "</div>";
     
     
       // lista += "<a href='principal.jsp?CONTENIDO=unidadDeMedidasFormulario.jsp&accion=Modificar&id=" + unidadDeMedida.getId() + "'><img src='presentacion/Imagenes/editar.png'></a>";
        //lista += "<label onClick='confirmarEliminacion(" + unidadDeMedida.getId() + ");'><img src='presentacion/Imagenes/eliminar.png'></label>";

    }
%>
<!DOCTYPE html>
<html>
 <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet"  href="Presentacion/unidadesDeMedida.css">
    </head>
    <body>
        
        <%=lista%>
    </body>
</html>

