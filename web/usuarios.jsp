<%-- 
    Document   : usuarios
    Created on : 28/08/2024, 09:04:02 AM
    Author     : VALEN
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%
String lista="";
List<Persona> datos=Persona.getListaEnObjetos("tipo<>'C'", null);
for (int i = 0; i < datos.size(); i++) {
        Persona usuario = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + usuario.getIdentificacion() + "</td>";
        lista+="<td>" + usuario.getNombre()+ "</td>";
        lista+="<td>" + usuario.getGenero() + "</td>";
        lista+="<td>" + usuario.getFechaNacimiento() + "</td>";
        lista+="<td>" + usuario.getEmail()+ "</td>";
        lista+="<td>" + usuario.getTelefono() + "</td>";
        lista+="<td>" + usuario.getDireccion()+ "</td>";
        lista+="<td>" + usuario.getResidencia()+ "</td>";
        lista+="<td>" + usuario.getFoto()+ "</td>";
        
        lista+="<td>" + usuario.getTipoEnObjeto()+ "</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=usuariosFormulario.jsp&accion=Modificar&identificacion=" + usuario.getIdentificacion() +
                " 'title='Modificar'><img src='presentacion/imagenes/modificar.png'></a>  "; 
        lista+="<img src='presentacion/imagenes/eliminar.png' title='Eliminar' onClick='eliminar("+ usuario.getIdentificacion()+")'> ";
        lista+="</td>";
        lista+="</tr>";
  }
%>

<h3>LISTA DE USUARIOS HUELLITAS WEB</h3>
<table border="1">
    <tr>
        <th>Identificacion</th><th>Nombres</th><th>Genero</th><th>FechaNacimiento</th><th>Email</th><th>Telefono</th><th>Dirección</th><th>Residencia</th><th>foto</th><th>Tipo</th>
                <th><a href="principal.jsp?CONTENIDO=usuariosFormulario.jsp&accion=Adicionar" title="Adicionar">
                        <img src="presentacion/imagenes/agregar.png"></a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el usuario con identificacion"+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=usuariosActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
         }
    }
</script>