<%-- 
    Document   : mascotas
    Created on : 28/08/2024, 08:37:21 AM
    Author     : URB
--%>
<%@page import="clases.Mascota"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String lista = "";
List<Mascota> datos = Mascota.getListaEnObjetos(null, null);
boolean mostrarApadrinar = "Apadrinar".equals(request.getParameter("accion"));

for (int i = 0; i < datos.size(); i++) {
    Mascota mascotas = datos.get(i);
    lista += "<tr>";
    lista += "<td>" + mascotas.getCodigo() + "</td>";
    lista += "<td>" + mascotas.getNombre() + "</td>";
    lista += "<td>" + mascotas.getGenero() + "</td>";
    lista += "<td>" + mascotas.getTamaño() + "</td>";
    lista += "<td>" + mascotas.getFoto() + "</td>";
    lista += "<td>" + mascotas.getCuidadosEspeciales() + "</td>";
    lista += "<td>" + mascotas.getFechaNacimientoAproximada() + "</td>";
    lista += "<td>" + mascotas.getFechaIngreso() + "</td>";
    lista += "<td>" + mascotas.getEstado() + "</td>";
    lista += "<td>";
    lista += "<a href='principal.jsp?CONTENIDO=mascotasFormulario.jsp&accion=Modificar&identificacion=" + mascotas.getCodigo() + "' title='Modificar'>" +
             "<img src='presentacion/iconos/modificar.png' alt='Modificar'></a> ";
    lista += "<img src='presentacion/iconos/eliminar.png' title='Eliminar' onClick='eliminar(" + mascotas.getCodigo() + ")'> ";
    if (mostrarApadrinar) {
        lista += "<button onclick='apadrinar(" + mascotas.getCodigo() + ")'>Apadrinar</button>"; // Botón "Apadrinar" si el parámetro está presente
    }
    lista += "</td>";
    lista += "</tr>";
}
%>

<h3>MASCOTAS</h3>
<table border="1">
    <tr>
        <th>Código</th><th>Nombre</th><th>Género</th><th>Tamaño</th><th>Foto</th><th>Cuidados Especiales</th><th>Fecha De Nacimiento Aproximada</th>
        <th>Fecha De Ingreso</th><th>Estado</th>
                <th><a href="principal.jsp?CONTENIDO=mascotasFormulario.jsp&accion=Adicionar" title="Adicionar">
                        <img src="presentacion/iconos/agregar.png">  </a></th>
    </tr>
    <%=lista%>
</table>

<script type="text/javascript">
    function eliminar(codigo){
        resultado=confirm("Realmente desea eliminar la mascota con el codigo: "+codigo+"?");
        if (resultado) {
            document.location="principal.jsp?CONTENIDO=mascotasActualizar.jsp&accion=Eliminar&codigo="+codigo;
         }
    }
</script>