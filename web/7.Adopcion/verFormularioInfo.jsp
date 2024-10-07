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
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());

        // Añadir la sección de la mascota
        listaAdopciones += "<div class='card-header'>Código de formulario: " + formulario.getCodigo() + "</div>"; // Código de la mascota
        listaAdopciones += "<div class='card-body'>"; // Cuerpo de la tarjeta
        listaAdopciones += "<p><strong>Fecha de solicitud:</strong> " + formulario.getFecha() + "</p>";
        
         // Aquí se añade la foto
        listaAdopciones += "<div style='margin-right: 20px;'>";
        listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' style='width: 100px; height: auto;'/>";
        listaAdopciones += "</div>"; // Fin del cuerpo de la tarjeta
        
        listaAdopciones += "<p><strong>Nombre adoptante:</strong> " + persona.getNombre() + "</p>";
        listaAdopciones += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaAdopciones += "<p><strong>Contacto:</strong> " + persona.getTelefono() + "</p>";
        listaAdopciones += "<p><strong>Direccion:</strong> " + persona.getDireccion() + "</p>";
         // Aquí se añade la foto
        listaAdopciones += "<div style='margin-right: 20px;'>";
        listaAdopciones += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' style='width: 100px; height: auto;'/>";
        listaAdopciones += "</div>"; // Fin del cuerpo de la tarjeta
        
        listaAdopciones += "<p><strong>Nombre mascota:</strong> " + formulario.getMascota() + "</p>";
        listaAdopciones += "<p><strong>Edad:</strong> " + mascota.getEdad() + " años</p>";
        listaAdopciones += "<p><strong>Cuidados Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";

       

        // Botones de acción
        listaAdopciones += "<div class='btn-container'>";
        listaAdopciones += "<a href='principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp&accion=Modificar&codigo=" + formulario.getCodigo() + "'>";
        listaAdopciones += "<button class='btn-otro' href='exportaciones/formulario_informacion.pdf'>Descargar PDF</button></a>";
        listaAdopciones += "<button class='btn-adicionar' onclick='document.getElementById(\"formAceptar" + formulario.getCodigo() + "\").submit();'>Aceptar</button>";
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

    <!-- Botón de adicionar -->
    <button onclick="window.location.href = 'principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp';" class="btn-otro">
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

<form action='principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp' method='POST' style='display:none;' id='formAceptar" + formulario.getCodigo() + "'>
    <input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>
    <input type='hidden' name='fechaSolicitud' value='" + formulario.getFecha() + "'>
    <input type='hidden' name='identificacionAdoptante' value='" + formulario.getIdentificacionAdoptante() + "'>
    <input type='hidden' name='mascota' value='" + formulario.getMascota() + "'>
</form>

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