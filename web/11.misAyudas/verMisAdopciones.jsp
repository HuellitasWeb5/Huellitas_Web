<%@page import="clases.Adopcion"%>
<%@ page import="java.util.List"%> 
<%@ page import="clases.FormularioDeInformacion"%>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
    <link rel="stylesheet" href="presentacion/style-Adopcion.css">
</head>

<%
    // Sección de acciones al cancelar el formulario

    String codigoAdopcion = request.getParameter("codigoAdopcion");
    String codigoMascota = request.getParameter("codigoMascota");

    if (codigoAdopcion != null && codigoMascota != null) {
        Adopcion adopcion = new Adopcion();
        adopcion.setCodigo(codigoAdopcion);
        adopcion.setEstado("Cancelado");
        boolean adopcionActualizada = adopcion.modificar();

        if (adopcionActualizada) {
            Mascota mascota = new Mascota(codigoMascota);
            mascota.setEstado("Disponible");
            mascota.modificar();
        }
    }
    response.sendRedirect("principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp");

    // Sección de la adopción 
    String listaAdopciones = "";
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos("estado='Aceptado'", null);
    List<Adopcion> adopciones = Adopcion.getListaEnObjetos(null, null);
    boolean tieneAdopciones = false;
            
    listaAdopciones += "<div class='swiper-wrapper'>";

    for (int i = 0; i < formularios.size(); i++) {
        tieneAdopciones = true;
        FormularioDeInformacion formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());

        Adopcion adopcion = (i < adopciones.size()) ? adopciones.get(i) : new Adopcion();

        listaAdopciones += "<div class='swiper-slide'>";
        listaAdopciones += "<div class='card'>";
        listaAdopciones += "<div class='card-header'>Mi Adopción</div>";

        listaAdopciones += "<div class='card-body-Adop'>";
        listaAdopciones += "<p><strong>FECHA DE ADOPCIÓN:</strong> " + adopcion.getFechaAdopcion() + "</p>";
        listaAdopciones += "<p><strong>ESTADO:</strong> " + adopcion.getEstado() + "</p>";

        // Sección de adoptante
        listaAdopciones += "<div class='adoptante-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='imagen-Adop'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>NOMBRE: </strong>" + persona.getNombre() + "</p>";
        listaAdopciones += "<p><strong>IDENTIFICACIÓN:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaAdopciones += "<p><strong>CONTACTO:</strong> " + persona.getTelefono() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        // Sección de mascota
        listaAdopciones += "<div class='mascota-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' class='imagen-Adop'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>NOMBRE:</strong> " + mascota.getNombre() + "</p>";
        listaAdopciones += "<p><strong>IDENTIFICACIÓN:</strong> " + mascota.getCodigo() + "</p>";
        listaAdopciones += "<p><strong>EDAD:</strong> " + mascota.getEdad() + " años</p>";
        listaAdopciones += "<p><strong>CUIDADOS ESPECIALES:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        String actaAdopcion = adopcion.getActaAdopcion();
        if (actaAdopcion != null && !actaAdopcion.equals("null")) {
            String rutaArchivo = "uploads/" + actaAdopcion;
            listaAdopciones += "<a href='" + rutaArchivo + "' target='_blank' class='btn-otro2'>Ver contrato de adopción</a>";
        }

        listaAdopciones += "<form action='7.Adopcion/formularioInfoPDF.jsp' method='post' target='_blank'>";
        listaAdopciones += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Ver formulario de pre-adopción' class='btn-adicionar2'>";
        listaAdopciones += "</form>";

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
