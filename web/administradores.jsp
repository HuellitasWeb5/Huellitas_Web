<%-- 
    Document   : usuarios
    Created on : 28/08/2024, 09:04:02 AM
    Author     : VALEN
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%
String lista="";
List<Persona> datos=Persona.getListaEnObjetos(null, null);
for (int i = 0; i < datos.size(); i++) {
        Persona administrador = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + administrador.getIdentificacion() + "</td>";
        lista+="<td>" + administrador.getNombre()+ "</td>";
        lista+="<td>" + administrador.getGenero() + "</td>";
        lista+="<td>" + administrador.getFechaNacimiento() + "</td>";
        lista+="<td>" + administrador.getEmail()+ "</td>";
        lista+="<td>" + administrador.getTelefono() + "</td>";
        lista+="<td>" + administrador.getDireccion()+ "</td>";
        lista+="<td>" + administrador.getResidencia()+ "</td>";
        lista+="<td><img src='presentacion/administrador/" + administrador.getFoto() + "' width='30' height='auto'></td>";
 
        lista+="<td>" + administrador.getTipoEnObjeto()+ "</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=administradoresFormulario.jsp&accion=Modificar&identificacion=" + administrador.getIdentificacion() +
                " 'title='Modificar'><img src='presentacion/imagenes/modificar.png'></a>  "; 
        lista+="<img src='presentacion/imagenes/eliminar.png' title='Eliminar' onClick='eliminar("+ administrador.getIdentificacion()+")'> ";
        lista+="</td>";
        lista+="</tr>";
  }
%>

<h3>LISTA  DE  ADMINISTRADORES  </h3>
<table border="1">
    <tr>
        <th>Identificacion</th><th>Nombres</th><th>Genero</th><th>FechaNacimiento</th><th>Email</th><th>Telefono</th><th>Dirección</th><th>Residencia</th><th>foto</th><th>Tipo</th>
                <th><a href="principal.jsp?CONTENIDO=administradoresFormulario.jsp&accion=Adicionar" title="Adicionar  ">
                        <img src="presentacion/imagenes/agregar.png"></a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(identificacion){
        resultado=confirm("Realmente desea eliminar el administrador con identificacion"+identificacion+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=administradoresActualizar.jsp&accion=Eliminar&identificacion="+identificacion;
         }
    }
</script>