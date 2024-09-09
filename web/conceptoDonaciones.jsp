<%@page import="clases.UnidadDeMedida"%>
<%@page import="clases.TipoDonacion"%>
<%@page import="java.util.List"%>
<%@page import="clases.ConceptoDonacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/unidadDeMedida.css">
</head>

<%

    String codigo = request.getParameter("nombre");

    TipoDonacion tipoDonacion = new TipoDonacion(codigo);

    String lista = "";
    List<ConceptoDonacion> datos = ConceptoDonacion.getListaEnObjetos("idTipoDonacion=" + tipoDonacion.getCodigo(), null);

    for (int i = 0; i < datos.size(); i++) {
        ConceptoDonacion conceptoDonacion = datos.get(i);

        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>" + conceptoDonacion.getNombre() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>ID:</strong> " + conceptoDonacion.getId() + "</p>";
        lista += "<p><strong>Descripción:</strong> " + conceptoDonacion.getDescripcion() + "</p>";
        lista += "<p><strong>Tipo:</strong> " + conceptoDonacion.getCodigoTipoDonacion() + "</p>";
        lista += "<p><strong>Unidad de Medida:</strong> " + conceptoDonacion.getIdUnidadDeMedida() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-modificar' onclick='abrirFormulario(\"Modificar\", \"" + conceptoDonacion.getId() + "\");'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + conceptoDonacion.getId() + "\")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>

<html lang="es">

    <h3>CONCEPTOS DE DONACIONES</h3> 

    <button class="add-button" onclick="abrirFormulario('Adicionar', '<%= tipoDonacion.getCodigo()%>');">Agregar Concepto de Donación</button>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%= lista%>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <div id="formulario" title="Adicionar Concepto de Donación">
        <form name="formularioConceptoDonacion"> 
            <table>
                <tr>
                    <th>Nombre</th>
                    <td><input type="text" name="nombre" id="nombre"></td>
                </tr>
                <tr>
                    <th>Descripción</th>
                    <td><input type="text" name="descripcion" id="descripcion"></td>
                </tr>
                <tr>
                    <th>Tipo de Donación</th>
                    <td>
                        <input type="text" id="tipoDonacion" name="tipoDonacion" readonly>
                    </td>
                </tr>
                <tr>
                    <th>Unidad de Medida</th>
                    <td><select id="unidadDeMedida" name="unidadDeMedida">
                            <option value="" disabled selected>Seleccione una unidad de medida</option>
                            <%=UnidadDeMedida.getListaEnOptions(null)%>
                        </select></td>
                </tr>
            </table>
            <input type="button" value="Agregar" onclick="agregarConceptoDonacion();">
            <input type="button" value="Cancelar" onclick="cerrarFormulario();">
        </form>    
    </div>

</html>

<script>
    function confirmarEliminacion(id) {
         document.getElementById("frutas").addEventListener("change", function() {
        alert("Has seleccionado: " + this.value);
    });
        const respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=conceptosDeDonacionesActualizar.jsp&accion=Eliminar&id=" + id;
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

    function abrirFormulario(accion, codigoTipoDonacion = null) {
        if (accion === "Modificar") {
            $('#formulario').dialog('option', 'title', 'Modificar Concepto de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Modificar';

            document.querySelector('input[type="button"][value="Modificar"]').setAttribute('onclick', 'modificarConceptoDonacion(' + codigoTipoDonacion + ');');

            cargarDatosConceptoDonacion(codigoTipoDonacion);

        } else if (accion === "Adicionar") {
            $('#formulario').dialog('option', 'title', 'Adicionar Concepto de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Agregar';
            document.querySelector('input[type="button"][value="Agregar"]').setAttribute('onclick', 'agregarConceptoDonacion();');

            document.getElementById('nombre').value = '';
            document.getElementById('descripcion').value = '';
            document.getElementById('unidadDeMedida').value = '';

            // Cargar el código del tipo de donación automáticamente
            if (codigoTipoDonacion !== null) {
                document.getElementById('tipoDonacion').value = codigoTipoDonacion;
            }
        }

        $('#formulario').dialog('open');
    }

    function cargarDatosConceptoDonacion(id) {
        // Aquí puedes implementar la lógica para cargar los datos del concepto de donación
    }

    function modificarConceptoDonacion(id) {
        var nombre = document.getElementById('nombre').value;
        var descripcion = document.getElementById('descripcion').value;
        var tipo = document.getElementById('tipoDonacion').value;
        var unidadDeMedida = document.getElementById('unidadDeMedida').value;
        var url = "conceptosDeDonacionesActualizar.jsp?accion=Modificar&id=" + id + "&nombre=" + nombre + "&descripcion=" + descripcion + "&tipo=" + tipo + "&unidadDeMedida=" + unidadDeMedida;
        window.location.href = url;
    }

    function agregarConceptoDonacion() {
        var nombre = document.getElementById('nombre').value;
        var descripcion = document.getElementById('descripcion').value;
        var tipo = document.getElementById('tipoDonacion').value;
        var unidadDeMedida = document.getElementById('unidadDeMedida').value;
        var url = "conceptosDeDonacionesActualizar.jsp?accion=Adicionar&nombre=" + nombre + "&descripcion=" + descripcion + "&tipo=" + tipo + "&unidadDeMedida=" + unidadDeMedida;
        window.location.href = url;
    }

    function cerrarFormulario() {
        document.getElementById('nombre').value = "";
        document.getElementById('descripcion').value = "";
        document.getElementById('tipoDonacion').value = "";
        document.getElementById('unidadDeMedida').value = "";
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
