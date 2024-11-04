<%-- 
    Document   : donacions
    Created on : 07/09/2024
    Author     : Luis Eraso
--%>

<%@page import="clases.TipoDonacion"%>
<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page import="clases.Donacion"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>

<%
    Donacion donacion = new Donacion();
    String lista = "";
    List<Donacion> datos = Donacion.getListaEnObjetos(null, "donacion.codigo, donacion.fecha, donacion.descripcion, donacion.identificacionDonante");
    for (int i = 0; i < datos.size(); i++) {
        donacion = datos.get(i);
        Persona persona = new Persona(donacion.getIdentificacionDonante());
        TipoDonacion tipoDonacion = new TipoDonacion();
        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2 style='font-weight: bold;'>Código de donación: " + donacion.getCodigo() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Fecha:</strong> " + donacion.getFecha() + "</p>";

        lista += "<div style='display: flex; margin-bottom: 20px;'>";
        lista += "<div style='margin-right: 20px;'>";
        lista += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' style='width: 170px; height: 170px; border-radius: 50%; object-fit: cover; border: 5px solid #05af8b;'/>";
        lista += "</div>";

        lista += "<div>";
        lista += "<p><strong>Nombre:</strong> " + persona.getNombre() + "</p>";
        lista += "<p><strong>Identificación:</strong> " + persona.getIdentificacion() + "</p>";
        lista += "<p><strong>Teléfono:</strong> " + persona.getTelefono() + "</p>";
        lista += "<p><strong>Ubicación:</strong> " + persona.getResidencia() + "-" + persona.getDireccion() + "</p>";
        lista += "<p><strong>Correo:</strong> " + persona.getEmail() + "</p>";
        lista += "</div>";
        lista += "</div>";

        //  lista += "<p><strong>Donación:</strong> " + tipoDonacion.getNombre() + "</p>";
        lista += "<p><strong>Descripción:</strong> " + donacion.getDescripcion() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-otro' onclick='verDetalles(\"" + donacion.getCodigo() + "\", \"" + persona.getIdentificacion() + "\");'>Detalles</button>";
        // lista += "<button class='btn-modificar' onclick='abrirFormularioAdicionar(\"" + donacion.getCodigo() + "\");'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + donacion.getCodigo() + "\")'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>
<h3>DONACIONES</h3> 



<div class="header-container">
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
        </div>
        <ul id="nameList"></ul>
    </form>
    <div style="display: flex; gap: 10px;">
        <button class="btn-adicionar" onclick="abrirFormularioAdicionar();">Adicionar Donacion</button>
    </div>
</div>


<div class="swiper-container">
    <div class="swiper-wrapper">
        <%=lista%>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
</div>

<script>
    function confirmarEliminacion(codigo) {
        const respuesta = confirm("¿Realmente desea eliminar el registro?");
        if (respuesta) {
            document.location = "principal.jsp?CONTENIDO=8.Donacion/donacionesFormularioActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }


    function verDetalles(codigo, iden) {
        var url = "principal.jsp?CONTENIDO=8.Donacion/verDetalles.jsp&codigo=" + codigo + "&identificacion=" + iden;
        window.location.href = url;
    }
    function abrirFormularioAdicionar() {
        var url = "principal.jsp?CONTENIDO=8.Donacion/donacionesFormulario.jsp&accion=Adicionar";
        window.location.href = url;
    }
    function agregarTipoDonacion() {
        var url = "principal.jsp?CONTENIDO=1.TipoDonacion/tiposDonaciones.jsp?"
        window.location.href = url;
    }
    function filterNames() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const slides = document.getElementsByClassName('swiper-slide');

        // Filtrar por nombre del adoptante o mascota
        for (let i = 0; i < slides.length; i++) {
            const cardBody = slides[i].getElementsByClassName('card-body')[0];
            const textValue = cardBody.textContent || cardBody.innerText;

            if (textValue.toLowerCase().indexOf(filter) > -1) {
                slides[i].style.display = "";
            } else {
                slides[i].style.display = "none";
            }
        }
    }

    const swiper = new Swiper('.swiper-container', {
        loop: false,
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
