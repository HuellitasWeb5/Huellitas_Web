<%@ page import="java.util.List"%>
<%@ page import="clases.Adopcion"%>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
    <link rel="stylesheet" href="presentacion/style-Adopcion.css">
</head>

<%
    // Obtener la identificación del usuario de la sesión
    String identificacionUsuario = (String) session.getAttribute("numeroUsuario");

    String listaAdopciones = "";
    List<Adopcion> adopciones = Adopcion.getListaEnObjetos("identificacionAdoptante='" + identificacionUsuario + "'", null);
    boolean tieneAdopciones = !adopciones.isEmpty();

    listaAdopciones += "<div class='swiper-wrapper'>";

    for (Adopcion adopcion : adopciones) {
        Persona persona = new Persona(adopcion.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(adopcion.getCodigoMascota());

        // Tarjeta de adopción
        listaAdopciones += "<div class='swiper-slide'>";
        listaAdopciones += "<div class='card'>";

        listaAdopciones += "<div class='card-header'>Mi Adopción</div>";

        listaAdopciones += "<div class='card-body-Adop'>";
        listaAdopciones += "<p><strong>FECHA DE ADOPCIÓN</strong> " + adopcion.getFechaAdopcion() + "</p>";
        listaAdopciones += "<p><strong>ESTADO:</strong> " + adopcion.getEstado() + "</p>";

        // Datos del adoptante
        listaAdopciones += "<div class='adoptante-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='imagen-Adop'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>NOMBRE:</strong> " + persona.getNombre() + "</p>";
        listaAdopciones += "<p><strong>IDENTIFICACIÓN:</strong> " + persona.getIdentificacion() + "</p>";
        listaAdopciones += "<p><strong>CONTACTO:</strong> " + persona.getTelefono() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        // Datos de la mascota
        listaAdopciones += "<div class='mascota-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' class='imagen-Adop'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>NOMBRE:</strong> " + mascota.getNombre() + "</p>";
        listaAdopciones += "<p><strong>IDENTIFICACIÓN:</strong> " + mascota.getCodigo() + "</p>";
        listaAdopciones += "<p><strong>EDAD:</strong> " + mascota.getEdad() + " años</p>";
        listaAdopciones += "<p><strong>C.ESPECIALES:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        String actaAdopcion = adopcion.getActaAdopcion();
        if (actaAdopcion != null && !actaAdopcion.equals("null")) {
            String rutaArchivo = "uploads/" + actaAdopcion;
            listaAdopciones += "<a href='" + rutaArchivo + "' target='_blank' class='btn-otro2'>Ver contrato de adopción</a>";
        }
        
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";
    }

    listaAdopciones += "</div>";
%>

<h3>ADOPCIONES</h3>

<%
    if (tieneAdopciones) {
%>
<div class="swiper-container">
    <%= listaAdopciones %>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>
<%
    } else {
%>
<br/>
<h4>
    <p>Aún no has realizado ninguna adopción.</p>
    <p>¡Anímate a cambiar una vida y adopta un peludito!</p>
</h4>
<%
    }
%>

<div id="result"></div>

<script type="text/javascript">
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
