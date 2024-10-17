<%-- 
    Document   : adopcion
    Created on : 27 ago 2024, 8:54:07
    Author     : Angie
--%>

<%@page import="clases.Mascota"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Adopcion" %>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Adopcion.css" />
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>

<%
    // Obtener la lista de formularios de adopción
    String listaAdopciones = "";
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos("estado='Aceptado'", null);
    List<Adopcion> adopciones = Adopcion.getListaEnObjetos(null, null);

    listaAdopciones += "<div class='swiper-wrapper'>"; // Inicio del swiper-wrapper

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeInformacion formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());
        Adopcion adopcion = adopciones.get(i);

        listaAdopciones += "<div class='swiper-slide'>"; // Inicio de la tarjeta
        listaAdopciones += "<div class='card'>"; // Añadido la clase 'card'
        listaAdopciones += "<div class='card-header'>Código de adopción: " + adopcion.getCodigo() + "</div>";
        listaAdopciones += "<div class='card-body'>";

        // Sección de adoptante
        listaAdopciones += "<div class='adoptante-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='profile-image'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>Nombre adoptante:</strong> " + persona.getNombre() + "</p>";
        listaAdopciones += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaAdopciones += "<p><strong>Contacto:</strong> " + persona.getTelefono() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>"; // Fin de la sección de adoptante

        // Sección de mascota
        listaAdopciones += "<div class='mascota-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' class='profile-image'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>Nombre mascota:</strong> " + formulario.getMascota() + "</p>";
        listaAdopciones += "<p><strong>Edad:</strong> " + mascota.getEdad() + " años</p>";
        listaAdopciones += "<p><strong>Cuidados Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>"; // Fin de la sección de datos de la mascota

        // Formulario para subir acta
        listaAdopciones += "<form name='formulario' method='post' action='principal.jsp?CONTENIDO=7.Adopcion/Acta.jsp' enctype='multipart/form-data'>";
        listaAdopciones += "<label for='acta'>Por favor, suba el contrato de adopción de la mascota:</label>";
        listaAdopciones += "<br><input type='file' class='btn-archivo' id='acta' name='acta' accept='application/pdf, image/*' required>";
        listaAdopciones += "<br>";
        listaAdopciones += "<input type='hidden' name='accion' value='Acta'>";
        listaAdopciones += "<input type='hidden' id='codigoFormulario' name='codigoFormulario' value='" + adopcion.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Guardar' class='btn-adicionar'>";
        listaAdopciones += "</form>";

        listaAdopciones += "<input type='hidden' name='codigoMascota' value='" + mascota.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Cancelar Adopción' class='btn-cancelar' onclick='return confirm(\"¿Está seguro que desea cancelar la adopción?\");'>";
        listaAdopciones += "</form>";

        // Verificar si hay acta para mostrar el enlace
        if (adopcion.getActaAdopcion() != null && !adopcion.getActaAdopcion().isEmpty()) {
            String rutaArchivo = "uploads/" + adopcion.getActaAdopcion();
            listaAdopciones += "<a href='" + rutaArchivo + "' target='_blank' class='btn-otro'>Ver Contrato de adopción</a>";
        }

        listaAdopciones += "<form action='7.Adopcion/formularioInfoPDF.jsp' method='post' target='_blank'>";
        listaAdopciones += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Generar Formulario de adopción' class='btn-adicionar'>";
        listaAdopciones += "</form>";

        listaAdopciones += "</div>"; // Fin de card-body
        listaAdopciones += "</div>"; // Fin de card
        listaAdopciones += "</div>"; // Fin de swiper-slide
    }

    listaAdopciones += "</div>"; // Fin de swiper-wrapper

%>


<h3>ADOPCIONES</h3>

<div class="header-container">
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por nombre de mascota o adoptante" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon"> 
        </div>
        <ul id="nameList"></ul> 
    </form>
</div>  

<div class="swiper-container">
    <%= listaAdopciones%>

    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>

<script>
    const swiper = new Swiper('.swiper-container', {
        loop: false,
        slidesPerView: 3,
        spaceBetween: 20,
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
</script>
