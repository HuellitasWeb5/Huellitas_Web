<%@page import="clases.UnidadDeMedida"%>
<%@page import="clases.TipoDonacion"%>
<%@page import="java.util.List"%>
<%@page import="clases.ConceptoDonacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>

<%
    String codigo = request.getParameter("codigo");

    TipoDonacion tipoDonacion = new TipoDonacion(codigo);
    ConceptoDonacion conceptoDonacion = new ConceptoDonacion();
    List<ConceptoDonacion> datos = ConceptoDonacion.getListaEnObjetos("codigoTipoDonacion=" + codigo, null);
%>

<script>
    // Crear un objeto en JavaScript para almacenar los conceptos de donación
    const conceptoDonacion = {};

    <% for (int i = 0; i < datos.size(); i++) {
            ConceptoDonacion concepto = datos.get(i); %>
    conceptoDonacion["<%= concepto.getId()%>"] = {
        nombre: "<%= concepto.getNombre()%>",
        descripcion: "<%= concepto.getDescripcion()%>",
        tipoDonacion: "<%= concepto.getTipoDonacion() %>", // Asegúrate de que este campo es correcto
        idUnidadDeMedida: "<%= concepto.getIdUnidadDeMedida() %>"  // Asegúrate de que este campo también es correcto
    };
    <% } %>
</script>

<%
    String lista = "";
    for (int i = 0; i < datos.size(); i++) {
        conceptoDonacion = datos.get(i);
        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>" + conceptoDonacion.getNombre() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>ID:</strong> " + conceptoDonacion.getId() + "</p>";
        lista += "<p><strong>Descripción:</strong> " + conceptoDonacion.getDescripcion() + "</p>";
        lista += "<p><strong>Tipo:</strong> " + conceptoDonacion.getTipoDonacion() + "</p>";
        lista += "<p><strong>Unidad de Medida:</strong> " + conceptoDonacion.getIdUnidadDeMedida() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-modificar' onclick='abrirFormulario(\"Modificar\", \"" + conceptoDonacion.getId() + "\", \"" + codigo + "\");'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + conceptoDonacion.getId() + "\", \"" + codigo + "\")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>

<html lang="es">
    <h3>CONCEPTOS DE DONACIONES</h3> 

    <button class="btn-adicionar" onclick="abrirFormulario('Adicionar', null, '<%= tipoDonacion.getCodigo()%>');">Agregar Concepto de Donación</button>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%= lista %>
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
                    <td><input type="text" id="codigoTipoDonacion" name="codigoTipoDonacion" readonly></td>
                </tr>
                <tr>
                    <th>Unidad de Medida</th>
                    <td>
                        <select id="idUnidadDeMedida" name="idUnidadDeMedida">
                            <option value="" disabled selected>Seleccione una unidad de medida</option>
                            <%= UnidadDeMedida.getListaEnOptions(null) %>
                        </select>
                    </td>
                </tr>
            </table>
            <input class="btn-adicionar" type="button" value="Agregar" onclick="agregarConceptoDonacion('<%= codigo %>');">
            <input class="btn-eliminar" type="button" value="Cancelar" onclick="cerrarFormulario();">
        </form>    
    </div>
</html>

<script>
    function confirmarEliminacion(id, codigo) {
        const respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=1.TipoDonacion/conceptosDonacionesActualizar.jsp&accion=Eliminar&id=" + id + "&codigo=" + codigo;
        }
    }

    $(function () {
        $("#formulario").dialog({
            autoOpen: false,
            width: 400,
            modal: true,
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

    function cargarDatosConceptoDonacion(id) {
        const concepto = conceptoDonacion[id]; // Obteniendo el concepto por su ID

        if (concepto) {
            document.getElementById('nombre').value = concepto.nombre;
            document.getElementById('descripcion').value = concepto.descripcion;
            document.getElementById('codigoTipoDonacion').value = concepto.tipoDonacion;
            document.getElementById('idUnidadDeMedida').value = concepto.idUnidadDeMedida;
        } else {
            console.error('No se encontró el concepto con ID: ' + id);
        }
    }

    function abrirFormulario(accion, idConcepto = null, codigoTipoDonacion = null) {
        if (accion === "Modificar") {
            $('#formulario').dialog('option', 'title', 'Modificar Concepto de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Modificar';
            document.querySelector('input[type="button"][value="Modificar"]').setAttribute('onclick', 'modificarConceptoDonacion("' + idConcepto + '", "' + codigoTipoDonacion + '");');
            cargarDatosConceptoDonacion(idConcepto);  // Precargar datos
        } else if (accion === "Adicionar") {
            $('#formulario').dialog('option', 'title', 'Adicionar Concepto de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Agregar';
            document.querySelector('input[type="button"][value="Agregar"]').setAttribute('onclick', 'agregarConceptoDonacion("' + codigoTipoDonacion + '");');
            document.getElementById('nombre').value = '';
            document.getElementById('descripcion').value = '';
            document.getElementById('codigoTipoDonacion').value = codigoTipoDonacion;
            document.getElementById('idUnidadDeMedida').value = '';
        }
        $('#formulario').dialog('open');
    }

    function agregarConceptoDonacion(codigo) {
        var nombre = document.getElementById('nombre').value;
        var descripcion = document.getElementById('descripcion').value;
        var idUnidadDeMedida = document.getElementById('idUnidadDeMedida').value;
        var url = "1.TipoDonacion/conceptosDonacionesActualizar.jsp?accion=Adicionar&nombre=" + nombre + "&descripcion=" + descripcion + "&codigoTipoDonacion=" + codigo + "&idUnidadDeMedida=" + idUnidadDeMedida+ "&codigo=" + codigo;
        window.location.href = url;
    }

    function modificarConceptoDonacion(id, codigo) {
        var nombre = document.getElementById('nombre').value;
        var descripcion = document.getElementById('descripcion').value;
        var idUnidadDeMedida = document.getElementById('idUnidadDeMedida').value;
        var url = "1.TipoDonacion/conceptosDonacionesActualizar.jsp?accion=Modificar&id=" + id + "&nombre=" + nombre + "&descripcion=" + descripcion + "&codigoTipoDonacion=" + codigo + "&idUnidadDeMedida=" + idUnidadDeMedida+ "&codigo=" + codigo;
        window.location.href = url;
    }

    function cerrarFormulario() {
        document.getElementById('nombre').value = "";
        document.getElementById('descripcion').value = "";
        document.getElementById('codigoTipoDonacion').value = "";
        document.getElementById('idUnidadDeMedida').value = "";
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
