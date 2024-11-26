<%@ page import="java.util.List"%> 
<%@ page import="clases.FormularioDeSeguimiento"%>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>

<%
    // Obtener la lista de formularios de seguimiento
    String listaSeguimientos = "";
    List<FormularioDeSeguimiento> formularios = FormularioDeSeguimiento.getListaEnObjetos(null, null);
    listaSeguimientos += "<div class='swiper-wrapper'>";

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeSeguimiento formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());

        // Crear tarjeta con datos del formulario de seguimiento
        listaSeguimientos += "<div class='swiper-slide'>";
        listaSeguimientos += "<div class='card'>";

        // Encabezado de la tarjeta
        listaSeguimientos += "<div class='card-header'>Código de formulario: " + formulario.getCodigo() + "</div>";

        // Cuerpo de la tarjeta
        listaSeguimientos += "<div class='card-body'>";
        listaSeguimientos += "<p><strong>Fecha de visita:</strong> " + formulario.getFecha() + "</p>";

        // Datos del adoptante
        listaSeguimientos += "<div style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaSeguimientos += "<div style='margin-right: 10px;'>";
        listaSeguimientos += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='profile-image'/>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "<div class='prueba'>";
        listaSeguimientos += "<p><strong>Nombre:</strong> " + persona.getNombre() + "</p>";
        listaSeguimientos += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaSeguimientos += "<p><strong>Contacto:</strong> " + persona.getTelefono() + "</p>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "</div>";

        // Datos de la mascota
        listaSeguimientos += "<div style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaSeguimientos += "<div style='margin-right: 10px;'>";
        listaSeguimientos += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' class='profile-image'/>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "<div>";
        listaSeguimientos += "<p><strong>Nombre:</strong> " + mascota.getNombre() + "</p>";
        listaSeguimientos += "<p><strong>Identificación:</strong> " + mascota.getCodigo() + "</p>";
        listaSeguimientos += "<p><strong>Edad:</strong> " + mascota.getEdad() + "</p>";
        listaSeguimientos += "<p><strong>C.Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "<div>";
        listaSeguimientos += "<p><strong>Calificación:</strong> " + formulario.getCalificacion() + " Estrellas</p>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "</div>";

        // Botones de acción
        listaSeguimientos += "<div class='btn-container'>";
        listaSeguimientos += "<form action='7.Adopcion/formularioSegPDF.jsp' method='post' target='_blank'>";
        listaSeguimientos += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
        listaSeguimientos += "<input type='submit' value='Generar PDF' class='btn-otro'>";
        listaSeguimientos += "</form>";
        listaSeguimientos += "<div>";
        listaSeguimientos += "<button class='btn-eliminar' onClick='eliminar(" + formulario.getCodigo() + ")'>Eliminar</button>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "</div>";
        listaSeguimientos += "</div>"; // Fin de la tarjeta
        listaSeguimientos += "</div>"; // Fin de la diapositiva
    }
    listaSeguimientos += "</div>"; // Fin del swiper-wrapper
%>

<h3>LISTA DE FORMULARIOS DE SEGUIMIENTO</h3>

<div class="header-container">
    <!-- Buscar por nombre del adoptante -->
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por el nombre del adoptante" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
        </div>
        <ul id="nameList"></ul>
    </form>

    <a href="principal.jsp?CONTENIDO=7.Adopcion/formularioSeguimiento.jsp&accion=Adicionar">
        <button id="Adicionar" class="btn-adicionar">Realizar seguimiento</button>
    </a>
</div>

<div class="swiper-container">
    <%= listaSeguimientos%>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>

<div id="result"></div>

<script type="text/javascript">
    function eliminar(codigo) {
        let resultado = confirm("¿Realmente desea eliminar el formulario con código " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioSeg.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }

    function filterNames() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const slides = document.getElementsByClassName('swiper-slide');

        for (let i = 0; i < slides.length; i++) {
            const cardHeader = slides[i].querySelector('.prueba');
            if (cardHeader) {
                const textValue = cardHeader.textContent || cardHeader.innerText;

                // Mostrar o esconder el slide según el filtro
                if (textValue.toLowerCase().includes(filter)) {
                    slides[i].style.display = ""; // Mostrar
                } else {
                    slides[i].style.display = "none"; // Ocultar
                }
            }
        }
    }

    const swiper = new Swiper('.swiper-container', {
        loop: false,
        slidesPerView: 3,
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
