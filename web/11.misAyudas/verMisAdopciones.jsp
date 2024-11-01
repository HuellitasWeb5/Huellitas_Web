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
    String identificacionUsuario = (String) session.getAttribute("identificacionUsuario");

    String listaAdopciones = "";
    String estado = request.getParameter("estado");
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos("estado<>'Aceptado'", null);
    boolean tieneAdopciones = false;

    listaAdopciones += "<div class='swiper-wrapper'>";

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeInformacion formulario = formularios.get(i);

        if (formulario.getIdentificacionAdoptante().equals(identificacionUsuario)) {
            tieneAdopciones = true; // Se encontró al menos una adopción
            Persona persona = new Persona(formulario.getIdentificacionAdoptante());
            Mascota mascota = new Mascota(formulario.getCodigoMascota());

            listaAdopciones += "<div class='swiper-slide'>";
            listaAdopciones += "<div class='card'>";

            listaAdopciones += "<div class='card-header'>Mi Adopción</div>";

            listaAdopciones += "<div class='card-body'>";
            listaAdopciones += "<p><strong>Fecha de solicitud:</strong> " + formulario.getFecha() + "</p>";

            // Datos del adoptante
            listaAdopciones += "<div style='display: flex; align-items: center; margin-bottom: 10px;'>";
            listaAdopciones += "<div style='margin-right: 10px;'>";
            listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='profile-image'/>";
            listaAdopciones += "</div>";
            listaAdopciones += "<div>";
            listaAdopciones += "<p><strong>Nombre:</strong> " + persona.getNombre() + "</p>";
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
            listaAdopciones += "<p><strong>Nombre:</strong> " + mascota.getNombre() + "</p>";
            listaAdopciones += "<p><strong>Identificación:</strong> " + mascota.getCodigo() + "</p>";
            listaAdopciones += "<p><strong>Edad:</strong> " + mascota.getEdad() + " años</p>";
            listaAdopciones += "<p><strong>C.Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
            listaAdopciones += "</div>";
            listaAdopciones += "</div>";
            listaAdopciones += "</div>";

            // Botones de acción
            listaAdopciones += "<div class='btn-container'>";
            listaAdopciones += "<form action='7.Adopcion/formularioInfoPDF.jsp' method='post' target='_blank'>";
            listaAdopciones += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
            listaAdopciones += "<input type='submit' value='Generar PDF' class='btn-otro'>";
            listaAdopciones += "</form>";
            listaAdopciones += "</div>";

            listaAdopciones += "</div>";
            listaAdopciones += "</div>";
        }
    }
    listaAdopciones += "</div>";
%>

<h3>ADOPCIONES</h3>

<%
    if (tieneAdopciones) {
%>
<div class="swiper-container">
    <%= listaAdopciones%>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>
<%
} else {
%>
<br/>  
<h4><p>Aún no has realizado ninguna adopción.</p>
<p>¡Anímate a cambiar una vida y adopta un peludito!</p>
<h4> 
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
