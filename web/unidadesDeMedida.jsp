<%-- 
    Document   : unidadesDeMedida
    Created on : 28/08/2024, 10:45:02 AM
    Author     : Luis Eraso
--%>

<%@page import="java.util.List"%>
<%@page import="clases.UnidadDeMedida"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="Presentacion/unidadesDeMedida.css">
</head>

<%
    String accion = request.getParameter("accion");
    String id = request.getParameter("id");
    UnidadDeMedida unidadDeMedida = new UnidadDeMedida();
    String lista = "";
    List<UnidadDeMedida> datos = UnidadDeMedida.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        unidadDeMedida = datos.get(i);

        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>" + unidadDeMedida.getNombre() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Código:</strong> " + unidadDeMedida.getId() + "</p>";
        lista += "<p><strong>Notación:</strong> " + unidadDeMedida.getNotacion() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-modificar' onclick='abrirFormulario();'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(" + unidadDeMedida.getId() + ")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>

<html lang="es">

    <h3>UNIDADES DE MEDIDA</h3> 


    <button class="add-button" onclick="abrirFormulario();">Agregar Tipo de Medida</button>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%= lista%>
            <br><br>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <div id="formulario" title="Adicionar unidad de ">

        <form name="formularioUnidadDemedida"> 
            <table>
                <tr>
                    <th>Nombre</th>
                    <td><input type="text" name="nombre" id="nombre"></td>
                </tr>
                <tr>
                    <th>Notación</th>
                    <td><input type="text" name="notacion" id="notacion"></td>
                </tr>
            </table>
            <input type="button" value="Agregar" onclick="agregarUnidadDeMedida();">
            <input type="button" value="Cancelar" onclick="cerrarFormulario();">
        </form>    
    </div>
</html>

    <script>
        function confirmarEliminacion(id) {
            const respuesta = confirm("¿Realmente desea eliminar el registro?");
            if (respuesta) {
                document.location = "principal.jsp?CONTENIDO=unidadesDeMedidaActualizar.jsp&accion=Eliminar&id=" + id;
            }
        }

        $(function () {
            $("#formulario").dialog({
                autoOpen: false,
                show: {
                    effect: "blind",
                    duration: 500
                },
                hide: {
                    effect: "explode",
                    duration: 500
                }
            });
        });

        function abrirFormulario() {
            //alert("Hello moto");
            // document.getElementById("formulario").setAttribute("title","Modificar...");
            //$('#formulario').attr("title","Modificar");
            $('#formulario').dialog('open');
        }

        function cerrarFormulario() {
            document.formularioUnidadDemedida.nombre.value = "";
            document.formularioUnidadDemedida.notacion.value = "";
            $('#formulario').dialog('close');
        }

        function agregarUnidadDeMedida() {
            var nombre = document.getElementById('nombre').value;
            var notacion = document.getElementById('notacion').value
            var url = "unidadesDeMedidaActualizar.jsp?accion=Adicionar&nombre=" + nombre + "&notacion=" + notacion;
            window.location.href = url;
        }
        function modificarUnidadDeMedida(){
            var nombre = document.getElementById('nombre').value;
            var notacion = document.getElementById('notacion').value
            var url = "unidadesDeMedidaActualizar.jsp?accion=Modificar&nombre=" + nombre + "&notacion=" + notacion;
            window.location.href = url;
        }
        
        const swiper = new Swiper('.swiper-container', {
            loop: true,
            slidesPerView: 4,
            spaceBetween: 10,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            }
        });
    </script>
