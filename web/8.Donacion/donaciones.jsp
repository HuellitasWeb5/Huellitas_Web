<%-- 
    Document   : donacions
    Created on : 07/09/2024
    Author     : Luis Eraso
--%>

<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page import="clases.Donacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/prueba.css">

</head>

<%
    Donacion donacion = new Donacion();
    String lista = "";
    List<Donacion> datos = Donacion.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        donacion = datos.get(i);

        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>Código: " + donacion.getCodigo() + " - Fecha: " + donacion.getFecha() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Donacion</strong></p>";
        lista += "<p>" + donacion.getCodigo() + "</p>";
        lista += "<p>" + donacion.getCodigo() + "</p>";
        lista += "<p><strong>Teléfono:</strong> " + donacion.getCodigo() + "</p>";
        lista += "<p><strong>Ubicación:</strong> " + donacion.getCodigo() + "</p>";
        lista += "<p><strong>Correo:</strong> " + donacion.getCodigo() + "</p>";
        lista += "<p><strong>Donación:</strong> " + donacion.getCodigo() + "</p>";
        lista += "<p><strong>Descripción:</strong> " + donacion.getDescripcion() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-detalles' onclick='verDetalles(\"" + donacion.getCodigo() + "\");'>Detalles</button>";
        lista += "<button class='btn-modificar' onclick='abrirFormularioAdicionar(\"" + donacion.getCodigo() + "\");'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + donacion.getCodigo() + "\")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>

<html lang="es">

    <h3>DONADORES</h3> 

    <div class="filter-container">
        <input type="text" id="filtroDonacions" placeholder="Filtrar donacions...">
        <button class="add-button" onclick="abrirFormularioAdicionar();">Adicionar Donacion</button>
        <button class="add-button" onclick="agregarTipoDonacion();">Adicionar Tipo de Donación</button>
    </div>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%=lista%>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>

    

</html>

<script>
    function confirmarEliminacion(codigo) {
        const respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=8.Donacion/donacionsActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }

    function verDetalles(codigo) {
        // Debo hacer el boton de ver detalles
    }
    function abrirFormularioAdicionar(codigo) {
        var url="principal.jsp?CONTENIDO=8.Donacion/donacionesFormulario.jsp&accion=Adicionar";
        window.location.href=url;
    }
    function agregarTipoDonacion() {
        var url = "principal.jsp?CONTENIDO=1.TipoDonacion/tiposDonaciones.jsp?"
        window.location.href = url;
    }
    const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 3, // Ayuda a mostrarme 3 tarjetas a la vez
        spaceBetween: 20, // poner el espacio entre las tarjetas
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
