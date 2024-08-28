<%-- 
    Document   : mascotas
    Created on : 28/08/2024, 08:37:21 AM
    Author     : URB
--%>
<%@page import="clases.Mascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String lista="";
List<Mascota> datos=Mascota.getListaEnObjetos("tipo<>'C'", null);
for (int i = 0; i < datos.size(); i++) {
        Mascota mascotas = datos.get(i);
        lista+="<tr>";
        lista+="<td>" + mascotas.getCodigo()+ "</td>";
        lista+="<td>" + mascotas.getNombre()+ "</td>";
        lista+="<td>" + mascotas.getGenero()+ "</td>";
        lista+="<td>" + mascotas.getTamaño()+ "</td>";
        lista+="<td>" + mascotas.getFoto()+ "</td>";
        lista+="<td>" + mascotas.getCuidadosEspeciales()+ "</td>";
        lista+="<td>" + mascotas.getFechaNacimientoAproximada()+ "</td>";
        lista+="<td>" + mascotas.getFechaIngreso()+ "</td>";
        lista+="<td>" + mascotas.getEstado()+ "</td>";
        lista+="<td>";
        lista+="<a href='principal.jsp?CONTENIDO=usuariosFormulario.jsp&accion=Modificar&identificacion=" + mascotas.getCodigo() +
                " 'title='Modificar'><img src='presentacion/imagenes/modificar.png' width='30' heigth='30'></a>  "; 
        lista+="<img src='presentacion/imagenes/eliminar.png' width='30' heigth='30' title='Eliminar' onClick='eliminar("+ mascotas.getCodigo()+")'> ";
        lista+="</td>";
        lista+="</tr>";
  }
%>

<h3>LISTA DE USUARIOS</h3>
<table border="1">
    <tr>
        <th>Codigo</th><th>Nombre</th><th>Genero</th><th>Tamaño</th><th>Foto</th><th>Cuidados Especiales</th><th>Fecha Nacimiento aproximada</th>
        <th>Fecha de ingreso</th><th>Estado</th>
                <th><a href="principal.jsp?CONTENIDO=mascotasFormulario.jsp&accion=Adicionar" title="Adicionar">
                        <img src="presentacion/imagenes/adicionar.png" width='30' heigth='30'>  </a></th>
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