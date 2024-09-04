<%-- 
    Document   : planesPadrinos.jsp
    Created on : 3/09/2024, 09:27:55 AM
    Author     : yanda
--%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String lista="";
List<planesApadrinamiento> datos=PlanesApadrinamiento.getListaEnObjetos(null, null);
Planesapadrinamiento plan= new PlanesApadrinamiento ();
    for (int i = 0; i < datos.size(); i++) {
    PlanesApadrinamiento planes = datos.get(i);
    lista += "<tr>";
        lista += "<td>" +
            "Código: " + planes.getId() + "<br>" +
            "Nombre: " + planes.getNombres() + "<br>" +
            "Descripcion: " + planes.getDescripcion() + "<br>" +
            "<a href='principal.jsp?CONTENIDO=planesFormulario.jsp&accion=Modificar&id=" + planes.getId() + "' title='Modificar'>" +
                "<img src='presentacion/iconos/modificar.png'></a> " +
            "<img src='presentacion/iconos/eliminar.png' title='Eliminar' onClick='eliminar(" + planes.getId() + ")'>" +
            "</td>";
        lista += "</tr>";
    }
%>

<h3>PLANES PARA PADRINOS</h3>
<button onclick="abrirFormulario()" title="Adicionar">Agregar plan</button>
<table border="1">
    <tr>
        <th>Detalles</th> 
    </tr>
    <%= lista %> 
</table>
<div id="formulario" title="Adicionar Planes para Padrinos">
    <form name="formularioPlanes">
        <table>
            <tr><th>Nombre: </th><td><input type="text" name="Nombre" id="Nombre"></td></tr>
            <tr><th>Descripcion: </th><input type="text" name="Descripcion" id="Descripcion" ></td></tr>
        </table>
        <input type="button" value="Agregar" onclick="actualizarTabla();">
        <input type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>    
</div>

<script type="text/javascript">
    function eliminar(id) {
        resultado = confirm("Realmente desea eliminar el Plan con el codigo: " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=planActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }
    $(function () {
        $("#formulario").dialog({
            autoOpen: false,
            show: {
                effect: "blind",
                duration: 1000
            },
            hide: {
                effect: "explode",
                duration: 1000
            }
        });
    });

    function abrirFormulario() {
        $('#formulario').dialog('open');
    }

    function cerrarFormulario() {
        document.getElementById("Nombre").innerHTML = "";
        document.getElementById("Descripcion").innerHTML = "";
        $('#formulario').dialog('close');
    }

</script>

