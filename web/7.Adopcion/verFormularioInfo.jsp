<%@ page import="java.util.List"%> 
<%@ page import="clases.FormularioDeInformacion"%>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>

<%
    // Obtener la lista de formularios de adopción
    String listaAdopciones = "";
    String estado = request.getParameter("estado");
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos("estado<>'Aceptado'", null);
    listaAdopciones += "<div class='swiper-wrapper'>";

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeInformacion formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());

        // Crear tarjeta con datos del formulario
        listaAdopciones += "<div class='swiper-slide'>";
        listaAdopciones += "<div class='card'>";

        // Encabezado de la tarjeta
        listaAdopciones += "<div class='card-header'>Código de formulario: " + formulario.getCodigo() + "</div>";

        // Cuerpo de la tarjeta
        listaAdopciones += "<div class='card-body'>";
        listaAdopciones += "<p><strong>Fecha de solicitud:</strong> " + formulario.getFecha() + "</p>";

        // Datos del adoptante
        listaAdopciones += "<div style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='profile-image'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div>";
        listaAdopciones += "<p><strong>Nombre adoptante:</strong> " + persona.getNombre() + "</p>";
        listaAdopciones += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaAdopciones += "<p><strong>Contacto:</strong> " + persona.getTelefono() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        // Datos de la mascota
        listaAdopciones += "<div style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' class='profile-image'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div>";
        listaAdopciones += "<p><strong>Nombre mascota:</strong> " + formulario.getMascota() + "</p>";
        listaAdopciones += "<p><strong>Edad:</strong> " + mascota.getEdad() + " años</p>";
        listaAdopciones += "<p><strong>Cuidados Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>"; // Fin del cuerpo de la tarjeta

        // Botones de acción
        listaAdopciones += "<div class='btn-container'>";
        listaAdopciones += "<form action='7.Adopcion/formularioInfoPDF.jsp' method='post' target='_blank'>";
        listaAdopciones += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Descargar PDF' class='btn-otro'>";
        listaAdopciones += "</form>";
        listaAdopciones += "<button class='btn-adicionar' onClick='aceptarFormulario(\"" + formulario.getCodigo() + "\", \"" + persona.getIdentificacion() + "\", \"" + formulario.getCodigoMascota() + "\")'>Aceptar</button>";

        listaAdopciones += "<button class='btn-eliminar' onClick='eliminar(" + formulario.getCodigo() + ")'>Rechazar</button>";
        listaAdopciones += "</div>"; // Fin del contenedor de botones

        listaAdopciones += "</div>"; // Fin de la tarjeta
        listaAdopciones += "</div>"; // Fin de la diapositiva
    }
    listaAdopciones += "</div>"; // Fin del swiper-wrapper
%>

<h3>LISTA DE FORMULARIOS DE ADOPCIÓN</h3>

<div class="header-container">
    <!-- Buscar por nombre del adoptante -->
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por adoptante" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
        </div>
        <ul id="nameList"></ul>
    </form>

    <div class="btn-container">
    <a href="principal.jsp?CONTENIDO=7.Adopcion/formularioInformacion.jsp&accion=Adicionar">
        <button id="Adicionar" class="btn-adicionar">Realizar Adopción</button>
    </a>
</div>
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
        let resultado = confirm("¿Realmente desea eliminar el formulario con código " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }

    function aceptarFormulario(codigo,identificacion,codigoMascota) {
        let respuesta = confirm("¿Realmente quieres aceptar el formulario con código: " + codigo + "?");
        if (respuesta) {
           document.location = "principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp&accion=Aceptar&codigo=" + codigo + "&identificacionAdoptante=" + identificacion + "&codigoMascota="+codigoMascota;
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
