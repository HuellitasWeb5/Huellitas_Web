<%@ page import="java.util.List"%> 
<%@ page import="clases.FormularioDeSeguimiento"%>
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
    // Obtener la lista de formularios de seguimiento
    String listaSeguimientos = "";
    List<FormularioDeSeguimiento> formularios = FormularioDeSeguimiento.getListaEnObjetos(null, null); // Ajusta el método según tu implementación
    listaSeguimientos += "<div class='swiper-wrapper'>"; // Inicio del swiper-wrapper

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeSeguimiento formulario = formularios.get(i);

        listaSeguimientos += "<div class='swiper-slide'>"; // Inicio de la tarjeta
        listaSeguimientos += "<div class='card'>"; // Añadido la clase 'card'

        // Añadir la sección del formulario de seguimiento
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());
        
        listaSeguimientos += "<div class='card-header'>Código de formulario: " + formulario.getCodigo() + "</div>"; // Código de la mascota
        listaSeguimientos += "<div class='card-body'>"; // Cuerpo de la tarjeta
        listaSeguimientos += "<p><strong>Fecha de solicitud:</strong> " + formulario.getFecha() + "</p>";
        

        // Aquí se añade la foto
        listaSeguimientos += "<div style='margin-right: 20px;'>";
        listaSeguimientos += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' style='width: 100px; height: auto;'/>";
        listaSeguimientos += "</div>"; // Fin del cuerpo de la tarjeta
        
        listaSeguimientos += "<p><strong>Nombre adoptante:</strong> " + persona.getNombre() + "</p>";
        listaSeguimientos += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaSeguimientos += "<p><strong>Contacto:</strong> " + persona.getTelefono() + "</p>";
        listaSeguimientos += "<p><strong>Direccion:</strong> " + persona.getDireccion() + "</p>";
         // Aquí se añade la foto
        listaSeguimientos += "<div style='margin-right: 20px;'>";
        listaSeguimientos += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' style='width: 100px; height: auto;'/>";
        listaSeguimientos += "</div>"; // Fin del cuerpo de la tarjeta
        
        listaSeguimientos += "<p><strong>Nombre mascota:</strong> " + formulario.getMascota() + "</p>";
        listaSeguimientos += "<p><strong>Edad:</strong> " + mascota.getEdad() + " años</p>";
        listaSeguimientos += "<p><strong>Cuidados Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";

       

        // Botones de acción
        listaSeguimientos += "<div class='btn-container'>";
        listaSeguimientos += "<a href='principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioSeg.jsp&accion=Modificar&codigo=" + formulario.getCodigo() + "'>";
        listaSeguimientos += "<button class='btn-otro'>Descargar Formulario</button></a>";
        listaSeguimientos += "<button class='btn-eliminar' onClick='eliminar(" + formulario.getCodigo() + ")'>Eliminar</button>";
        listaSeguimientos += "</div>"; // Fin del contenedor de botones

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
            <input type="text" id="searchInput" placeholder="Buscar por adoptante" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
        </div>
        <ul id="nameList"></ul>
    </form>

    <!-- Botón de adicionar -->
    <button onclick="window.location.href = 'principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp';" class="btn-otro">
        Volver
    </button>
</div>

<div class="swiper-container">
    <%= listaSeguimientos %>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>

<div id="result"></div>

<script type="text/javascript">
    function eliminar(codigo) {
        resultado = confirm("¿Realmente desea eliminar el formulario con código " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioSeg.jsp&accion=Eliminar&codigo=" + codigo;
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