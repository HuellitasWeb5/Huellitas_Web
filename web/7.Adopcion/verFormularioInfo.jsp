<%@ page import="java.util.List"%> 
<%@ page import="clases.FormularioDeInformacion"%>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
    <style>
        .foto {
            width: 100px;
            height: auto;
            margin: 10px;
        }
    </style>
</head>

<%
    // Obtener la lista de formularios de adopción
    String listaAdopciones = "";
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos(null, null); // Ajusta el método según tu implementación
    listaAdopciones += "<div class='swiper-wrapper'>"; // Inicio del swiper-wrapper

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeInformacion formulario = formularios.get(i);

        listaAdopciones += "<div class='swiper-slide'>"; // Inicio de la tarjeta
        listaAdopciones += "<div class='card'>"; // Añadido la clase 'card'

        // Añadir la sección de la mascota
        listaAdopciones += "<div class='card-header'>" + formulario.getMascota() + "</div>"; // Código de la mascota
        listaAdopciones += "<div class='card-body'>"; // Cuerpo de la tarjeta
        listaAdopciones += "<p><strong>Adoptante:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaAdopciones += "<p><strong>Ocupación:</strong> " + formulario.getOcupacion() + "</p>";
        listaAdopciones += "<p><strong>Habitantes:</strong> " + formulario.getHabitantes() + "</p>";
        listaAdopciones += "<p><strong>Días de visita:</strong> " + formulario.getFechaVisitaDia() + "</p>";
        listaAdopciones += "<p><strong>Motivación:</strong> " + formulario.getMotivacion() + "</p>";

        // Mostrar las tres fotos
        if (formulario.getFotoVivienda() != null && !formulario.getFotoVivienda().isEmpty()) {
            listaAdopciones += "<p><strong>Foto Vivienda:</strong></p>";
            listaAdopciones += "<img class='foto' src='uploads/" + formulario.getFotoVivienda() + "' alt='Foto Vivienda'>";
        }

        if (formulario.getFotoRecibo() != null && !formulario.getFotoRecibo().isEmpty()) {
            listaAdopciones += "<p><strong>Foto Recibo:</strong></p>";
            listaAdopciones += "<img class='foto' src='uploads/" + formulario.getFotoRecibo() + "' alt='Foto Recibo'>";
        }

        if (formulario.getFotoCedula() != null && !formulario.getFotoCedula().isEmpty()) {
            listaAdopciones += "<p><strong>Foto Cédula:</strong></p>";
            listaAdopciones += "<img class='foto' src='uploads/" + formulario.getFotoCedula() + "' alt='Foto Cédula'>";
        }

        listaAdopciones += "</div>"; // Fin del cuerpo de la tarjeta

        // Botones de acción
        listaAdopciones += "<div class='btn-container'>";
        listaAdopciones += "<a href='principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp&accion=Modificar&codigo=" + formulario.getCodigo() + "'>";
        listaAdopciones += "<button class='btn-adicionar'>Modificar</button></a>";
        listaAdopciones += "<button class='btn-eliminar' onClick='eliminar(" + formulario.getCodigo() + ")'>Eliminar</button>";
        listaAdopciones += "</div>"; // Fin del contenedor de botones

        listaAdopciones += "</div>"; // Fin de la tarjeta
        listaAdopciones += "</div>"; // Fin de la diapositiva
    }
    listaAdopciones += "</div>"; // Fin del swiper-wrapper
%>

<h3>LISTA DE ADOPCIONES</h3>

<div class="header-container">
    <!-- Buscar por nombre del adoptante -->
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por adoptante" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
        </div>
        <ul id="nameList"></ul>
    </form>

    <!-- Botón de adicionar -->
    <button onclick="window.location.href = 'principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp';" class="btn-volver">
        Volver
    </button>

</div>

<div class="swiper-container">
    <%= listaAdopciones%>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>

<div id="result"></div>

<script type="text/javascript">
    function eliminar(codigo) {
        resultado = confirm("¿Realmente desea eliminar el formulario con código " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }

    function filterNames() {
        const input = document.getElementById('searchInput');
        const filter = input.value.toLowerCase();
        const slides = document.getElementsByClassName('swiper-slide');

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

    const swiper = new Swiper('.swiper-container', {
        loop: true,
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
