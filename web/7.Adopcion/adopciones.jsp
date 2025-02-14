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

    listaAdopciones += "<div class='swiper-wrapper'>";

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeInformacion formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());

        Adopcion adopcion = (i < adopciones.size()) ? adopciones.get(i) : new Adopcion();

        listaAdopciones += "<div class='swiper-slide'>";
        listaAdopciones += "<div class='card'>";
        listaAdopciones += "<div class='card-header'>Código de adopción: " + adopcion.getCodigo() + "</div>";

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
        listaAdopciones += "<p><strong>TELÉFONO:</strong> " + persona.getTelefono() + "</p>";
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
        listaAdopciones += "<p><strong>EDAD:</strong> " + mascota.getEdad() + "</p>";
        listaAdopciones += "<p><strong>CUIDADOS ESPECIALES:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        // Formulario para subir acta
        listaAdopciones += "<form name='formulario' method='post' action='principal.jsp?CONTENIDO=7.Adopcion/Acta.jsp' enctype='multipart/form-data'>";
        listaAdopciones += "<label for='acta'>Por favor, suba el contrato de adopción de la mascota:</label>";
        listaAdopciones += "<br><input type='file' class='btn-archivo2' id='acta' name='acta' accept='application/pdf, image/*' required>";
        listaAdopciones += "<br>";
        listaAdopciones += "<input type='hidden' name='accion' value='Acta'>";
        listaAdopciones += "<input type='hidden' id='codigoFormulario' name='codigoFormulario' value='" + adopcion.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Guardar' class='btn-adicionar2'>";
        listaAdopciones += "</form>";

        String actaAdopcion = adopcion.getActaAdopcion();
        if (actaAdopcion != null && !actaAdopcion.equals("null")) {
            String rutaArchivo = "uploads/" + actaAdopcion;
            listaAdopciones += "<a href='" + rutaArchivo + "' target='_blank' class='btn-otro2'>Ver contrato de adopción</a>";
        }

        listaAdopciones += "<form action='7.Adopcion/formularioInfoPDF.jsp' method='post' target='_blank'>";
        listaAdopciones += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Ver formulario de pre-adopción' class='btn-adicionar2'>";
        listaAdopciones += "</form>";

        listaAdopciones += "<form action='principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp' method='post'>";
        listaAdopciones += "<input type='hidden' name='codigoAdopcion' value='" + adopcion.getCodigo() + "'>";
        listaAdopciones += "<input type='hidden' name='codigoMascota' value='" + mascota.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Cancelar adopción' class='btn-eliminar' onclick='return confirm(\"¿Está seguro que desea cancelar esta adopción? Una vez cancelada no podrá revertir esta acción\");'>";
        listaAdopciones += "</form>";

        listaAdopciones += "</div>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";
    }

    listaAdopciones += "</div>";

%>

<h3>ADOPCIONES</h3>

<div class="header-container">
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por el nombre del adoptante" onkeyup="filterNames()">
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

        for (let i = 0; i < slides.length; i++) {
            const cardHeader = slides[i].querySelector('.info-container');
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

    function cancelarAdopcion(codigoAdopcion) {
        let confirmacion = confirm("¿Está seguro de que desea cancelar esta adopción?");
        if (confirmacion) {
            window.location.href = "principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp&accion=Cancelar&codigoAdopcion=" + codigoAdopcion;
        }
    }
</script>
