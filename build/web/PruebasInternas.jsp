<%-- 
    Document   : PruebasInternas
    Created on : 28/08/2024, 11:01:27 AM
    Author     : Luis Eraso
--%>

<%@page import="java.util.List"%>
<%@page import="clases.UnidadDeMedida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String lista = "";

    List<UnidadDeMedida> datos = UnidadDeMedida.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        UnidadDeMedida unidadDeMedida = datos.get(i);

        lista += "<div class='slide-container swiper'>";
        lista += "<div class='slide-content'>";
        lista += "<div class='card-wrapper swiper-wrapper'>";
        lista += "<div class='card swiper-slide'>";
        lista += "<div class='image-content'>";
        lista += "<span class='overlay'></span>";
        lista += "<div class='card-image'><img src='presentacion/foto.png' alt='' class='card-img'></div>";
        lista += "</div>";
        lista += "<div class='card-content'>";
        lista += "<h2 class='codigo'>Codigo: " + unidadDeMedida.getId() + "</h2>";
        lista += "<p class='notacion'>Notacion: " + unidadDeMedida.getNotacion() + "</p>";
        lista += "<button class='button' onClick='abrirFormulario()'>Modificar</button>";
        lista += "<button class='button' onClick='eliminar()' >Eliminar</button>";
        lista += "</div>";

        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "<div class='swiper-button-next'></div>";
        lista += "<div class='swiper-button-prev'></div>";
        lista += "<div class='swiper-pagination'></div>";
        lista += "</div>";
    }
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pruebas Internas</title>
        <link rel="stylesheet" href="Recursos/swiper-bundle.min.css">

        <link rel="stylesheet" href="Presentacion/Banner.css">
        <script src="Recursos/swiper-bundle.min.js"></script>
        <script src="Recursos/prueba.js"></script>
    </head>
    <body>
        <%= lista%>
        
        
        
        <div id="formulario" title="Adicionar ">
            <form name="formularioUnidadDeMedida"> 
                <table>
                    <tr><th>Nombre</th><td><input type="text" name="Nombre" id="Nombre"></td></tr>
                    <tr><th>Notacion</th><td><input type="text" name="Notacion" id="Notacion"></td></tr>
                    
                   
                </table>
                <input type="button" value="Agregar" onclick="actualizarTabla();">
                <input type="button" value="Cancelar" onclick="cerrarFormulario();">
            </form>    
        </div>
        
        
    </body>
    <script>
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

        function eliminar(id) {
            resultado = confirm("Realmente desea eliminar la unidad de medida con codigo " + id + "?");
            if (resultado) {
                document.location = "principal.jsp?CONTENIDO=unidadesDeMedidaActualizar.jsp&accion=Eliminar&id=" + id;
            }
            }
    </script>
</html> 
