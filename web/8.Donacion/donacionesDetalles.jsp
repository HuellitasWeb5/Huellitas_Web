<%-- 
    Document   : donacionDetalle
    Created on : 28/08/2024, 10:45:02 AM
    Author     : Luis Eraso
--%>

<%@page import="java.util.List"%>
<%@page import="clases.DonacionDetalle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/unidadDeMedida.css">
</head>


<%
    String codigo = request.getParameter("codigo");
    DonacionDetalle donacionDetalle = new DonacionDetalle();
    String lista = "";
    List<DonacionDetalle> datos = DonacionDetalle.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        donacionDetalle = datos.get(i);

        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>Concepto ID: " + donacionDetalle.getIdConcepto() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Código de Donación:</strong> " + donacionDetalle.getCodigoDonacion() + "</p>";
        lista += "<p><strong>Cantidad:</strong> " + donacionDetalle.getCantidad() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-modificar' onclick='abrirFormulario(\"Modificar\", \"" + donacionDetalle.getId() + "\");'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + donacionDetalle.getId() + "\")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>

<html lang="es">

    <h3>DETALLES DE DONACIÓN</h3> 

    <button class="add-button" onclick="abrirFormulario('Adicionar');">Agregar Detalle de Donación</button>
    

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%= lista %>
            <br><br>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <div id="formulario" title="Adicionar Detalle de Donación">
        <form name="formularioDonacionDetalle"> 
            <table>
                <tr>
                    <th>Concepto ID</th>
                    <td><input type="text" name="idConcepto" id="idConcepto"></td>
                </tr>
                <tr>
                    <th>Cantidad</th>
                    <td><input type="text" name="cantidad" id="cantidad"></td>
                </tr>
                <tr>
                    <th>Código de Donación</th>
                    <td><input type="text" name="codigoDonacion" id="codigoDonacion"></td>
                </tr>
            </table>
            <input type="button" value="Agregar" onclick="agregarDonacionDetalle();">
            <input type="button" value="Cancelar" onclick="cerrarFormulario();">
        </form>    
    </div>

</html>

<script>
    function confirmarEliminacion(id) {
        const respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=1.DonacionDetalle/detallesDonacionActualizar.jsp&accion=Eliminar&id=" + id;
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

    function abrirFormulario(accion, id = null) {
        if (accion === "Modificar") {
            $('#formulario').dialog('option', 'title', 'Modificar Detalle de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Modificar';

            document.querySelector('input[type="button"][value="Modificar"]').setAttribute('onclick', 'modificarDonacionDetalle(' + id + ');');

            cargarDatosDonacionDetalle(id);

        } else if (accion === "Adicionar") {
            $('#formulario').dialog('option', 'title', 'Adicionar Detalle de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Agregar';
            document.querySelector('input[type="button"][value="Agregar"]').setAttribute('onclick', 'agregarDonacionDetalle();');

            document.getElementById('idConcepto').value = '';
            document.getElementById('cantidad').value = '';
            document.getElementById('codigoDonacion').value = '';
        }

        $('#formulario').dialog('open');
    }

    function cargarDatosDonacionDetalle(id) {
        // Aquí puedes realizar una llamada AJAX para obtener los datos del detalle de donación según el ID y cargar los campos del formulario.
    }

    function modificarDonacionDetalle(id) {
        var idConcepto = document.getElementById('idConcepto').value;
        var cantidad = document.getElementById('cantidad').value;
        var codigoDonacion = document.getElementById('codigoDonacion').value;
        var url = "1.DonacionDetalle/detallesDonacionActualizar.jsp?accion=Modificar&id=" + id + "&idConcepto=" + idConcepto + "&cantidad=" + cantidad + "&codigoDonacion=" + codigoDonacion;
        window.location.href = url;
    }

    function agregarDonacionDetalle() {
        var idConcepto = document.getElementById('idConcepto').value;
        var cantidad = document.getElementById('cantidad').value;
        var codigoDonacion = document.getElementById('codigoDonacion').value;
        var url = "1.DonacionDetalle/detallesDonacionActualizar.jsp?accion=Adicionar&idConcepto=" + idConcepto + "&cantidad=" + cantidad + "&codigoDonacion=" + codigoDonacion;
        window.location.href = url;
    }

    function cerrarFormulario() {
        document.getElementById("idConcepto").value = "";
        document.getElementById("cantidad").value = "";
        document.getElementById("codigoDonacion").value = "";
        $('#formulario').dialog('close');
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
