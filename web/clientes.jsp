<%-- 
    Document   : clientes
    Created on : 27/05/2024, 03:11:27 PM
    Author     : URB
--%>

<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String lista="";
List<Persona> datos=Persona.getListaEnObjetos("tipo<>'A' && tipo<>'V'", null);
for (int i = 0; i < datos.size(); i++) {
        Persona clientes = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + clientes.getIdentificacion() + "</td>";
        lista+="<td>" + clientes.getNombre()+ "</td>";
        lista+="<td>" + clientes.getGeneroPersona()+ "</td>";
        lista+="<td>" + clientes.getFechaNacimiento()+ "</td>";
        lista+="<td>" + clientes.getEmail()+ "</td>";
        lista+="<td>" + clientes.getTelefono()+ "</td>";
        lista+="<td>" + clientes.getDireccion()+ "</td>";
        lista+="<td>" + clientes.getResidencia()+ "</td>";
        lista+="<td><img src='presentacion/clientes/" + clientes.getFoto() + "' width='30' height='auto'></td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=clientesFormulario.jsp&accion=Modificar&identificacion=" + clientes.getIdentificacion() +
                " 'title='Modificar'><img src='presentacion/imagenes/modificar.png' ></a>  "; 
        lista+="<img src='presentacion/iconos/eliminar.png' title='Eliminar' onClick='eliminar("+ clientes.getIdentificacion()+")'> ";
        lista+="</td>";
        lista+="</tr>";
    }
%>
<h3>LISTA DE CLIENTES</h3>
<table border="1">
    <tr>
        <th>Identificacion</th><th>Nombres</th><th>Genero</th><th>Fecha de nacimiento</th><th>Email</th><th>Telefono</th><th>Direccion</th>
        <th>Residencia</th><th>Foto</th>
                <th><a href="principal.jsp?CONTENIDO=clientesFormulario.jsp&accion=Adicionar" title="Adicionar">
                        <img src="presentacion/imagenes/agregar.png" >  </a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el usuario con identificacion"+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=clientesActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
         }
    }
</script>