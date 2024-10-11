<%-- 
    Document   : tipoDonacion
    Created on : 28/08/2024, 10:45:02 AM
    Author     : Luis Eraso
--%>

<%@page import="java.util.List"%>
<%@page import="clases.TipoDonacion"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>

<%
    TipoDonacion tipoDonacion = new TipoDonacion();
    String lista = "";
    List<TipoDonacion> datos = TipoDonacion.getListaEnObjetos(null, null);
    // Generar la lista de tarjetas para el Swiper
    for (int i = 0; i < datos.size(); i++) {
        tipoDonacion = datos.get(i);

        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>" + tipoDonacion.getNombre() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Código:</strong> " + tipoDonacion.getCodigo() + "</p>";
        lista += "<p><strong>Descripción:</strong> " + tipoDonacion.getDescripcion() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-modificar' onclick='abrirFormulario(\"Modificar\", \""
                + tipoDonacion.getCodigo() + "\", \""
                + tipoDonacion.getNombre() + "\", \""
                + tipoDonacion.getDescripcion() + "\")'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + tipoDonacion.getCodigo() + "\")'>Eliminar</button>";
        lista += "<button class='btn-otro' onclick='abrirFormularioConceptoDonacion(\"" + tipoDonacion.getCodigo() + "\")'>Concepto de Donaciones</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>


<html lang="es">

    <h3>TIPOS DE DONACIONES</h3> 
    <div class="header-container">
        <form id="searchForm">
            <div class="search-container">
                <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
                <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
            </div>
            <ul id="nameList"></ul>
        </form>
        <button class="btn-adicionar" onclick="abrirFormulario('Adicionar');">Agregar Tipo de donacion</button>
    </div>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%= lista%>
            <br><br>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    <div id="formulario" title="Adicionar tipo de donación">
        <form name="formularioTipoDonacion"> 
            <table>
                <tr>
                    <th>Nombre</th>
                    <td><input type="text" name="nombre" id="nombre"></td>
                </tr>
                <tr>
                    <th>Descripción</th>
                    <td><input type="text" name="descripcion" id="descripcion"></td>
                </tr>
            </table>
            <input class="btn-adicionar" type="button" value="Agregar" onclick="agregarTipoDonacion();">
            <input class="btn-eliminar" type="button" value="Cancelar" onclick="cerrarFormulario();">
        </form>    
    </div>

</html>

<script>
    function confirmarEliminacion(codigo) {
        const respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=1.TipoDonacion/tiposDeDonacionesActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }

    $(function () {
        $("#formulario").dialog({
            autoOpen: false,
            width: 400, // Ancho del diálogo en píxeles
            height: 200, // Alto del diálogo en píxeles
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


    function abrirFormulario(accion, codigo = null, nombre = '', descripcion = '') {
        if (accion === "Modificar") {
            $('#formulario').dialog('option', 'title', 'Modificar Tipo de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Modificar';
            document.querySelector('input[type="button"][value="Modificar"]').setAttribute('onclick', 'modificarTipoDonacion("' + codigo + '");');

            // Precargar los datos en los campos del formulario
            document.getElementById('nombre').value = nombre;
            document.getElementById('descripcion').value = descripcion;

        } else if (accion === "Adicionar") {
            $('#formulario').dialog('option', 'title', 'Adicionar Tipo de Donación');
            document.querySelector('input[type="button"][value="Agregar"]').value = 'Agregar';
            document.querySelector('input[type="button"][value="Agregar"]').setAttribute('onclick', 'agregarTipoDonacion();');

            // Limpiar los campos del formulario para una nueva entrada
            document.getElementById('nombre').value = '';
            document.getElementById('descripcion').value = '';
        }

        $('#formulario').dialog('open');
    }


    function abrirFormularioConceptoDonacion(codigo) {
        var url = "principal.jsp?CONTENIDO=1.TipoDonacion/conceptoDonaciones.jsp&codigo=" + codigo;
        window.location.href = url;
    }
    function modificarTipoDonacion(codigo) {
        var nombre = document.getElementById('nombre').value;
        var descripcion = document.getElementById('descripcion').value;
        var url = "1.TipoDonacion/tiposDeDonacionesActualizar.jsp?accion=Modificar&codigo=" + codigo + "&nombre=" + nombre + "&descripcion=" + descripcion;
        window.location.href = url;
    }


    function agregarTipoDonacion() {
        // Obtener los valores de los campos
        var nombre = document.getElementById('nombre').value;
        var descripcion = document.getElementById('descripcion').value;

        // Validar que los campos no estén vacíos
        if (!nombre || !descripcion) {
            alert("Por favor, complete todos los campos.");
            return; // Detiene la ejecución si los campos están vacíos
        }

        // Construir la URL si los campos están completos
        var url = "1.TipoDonacion/tiposDeDonacionesActualizar.jsp?accion=Adicionar&nombre=" + nombre + "&descripcion=" + descripcion;
        window.location.href = url;
    }


    function cerrarFormulario() {
        document.getElementById("nombre").value = "";
        document.getElementById("descripcion").value = "";
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
    function filterNames() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const slides = document.getElementsByClassName('swiper-slide');

        // Recorre cada slide y oculta o muestra dependiendo del filtro
        for (let i = 0; i < slides.length; i++) {
            const cardHeader = slides[i].getElementsByClassName('card-header')[0];
            const textValue = cardHeader.textContent || cardHeader.innerText;

            if (textValue.toLowerCase().indexOf(filter) > -1) {
                slides[i].style.display = "";
            } else {
                slides[i].style.display = "none";
            }
        }
    }
</script>
