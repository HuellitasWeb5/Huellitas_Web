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
        Adopcion adopcion = adopciones.get(i);

        listaAdopciones += "<div class='swiper-slide'>";
        listaAdopciones += "<div class='card'>";
        listaAdopciones += "<div class='card-header'>Código de adopción: " + adopcion.getCodigo() + "</div>";

        listaAdopciones += "<div class='card-body-Adop'>";
        listaAdopciones += "<p><strong>Fecha de adopción:</strong> " + adopcion.getFechaAdopcion() + "</p>";
        listaAdopciones += "<p><strong>Estado:</strong> " + adopcion.getEstado() + "</p>";

        // Sección de adoptante
        listaAdopciones += "<div class='adoptante-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='imagen-Adop'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>Nombre adoptante: </strong>" + persona.getNombre() + "</p>";
        listaAdopciones += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaAdopciones += "<p><strong>Contacto:</strong> " + persona.getTelefono() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        // Sección de mascota
        listaAdopciones += "<div class='mascota-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' class='imagen-Adop'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>Nombre mascota:</strong> " + formulario.getMascota() + "</p>";
        listaAdopciones += "<p><strong>Edad:</strong> " + mascota.getEdad() + " años</p>";
        listaAdopciones += "<p><strong>Cuidados Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";

        // Formulario para subir acta
        listaAdopciones += "<form name='formulario' method='post' action='principal.jsp?CONTENIDO=7.Adopcion/Acta.jsp' enctype='multipart/form-data'>";
        listaAdopciones += "<label for='acta'>Por favor, suba el contrato de adopción de la mascota:</label>";
        listaAdopciones += "<br><input type='file' class='btn-archivo' id='acta' name='acta' accept='application/pdf, image/*' required>";
        listaAdopciones += "<br>";
        listaAdopciones += "<input type='hidden' name='accion' value='Acta'>";
        listaAdopciones += "<input type='hidden' id='codigoFormulario' name='codigoFormulario' value='" + adopcion.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Guardar' class='btn-adicionar'>";
        listaAdopciones += "</form>";

        // Verificar si hay acta para mostrar el enlace
        // Verificar si el archivo existe antes de generar el botón
        if (adopcion.getActaAdopcion() != null && !adopcion.getActaAdopcion().isEmpty()) {
            String rutaArchivo = "uploads/" + adopcion.getActaAdopcion();
            if (rutaArchivo !=null) {
                listaAdopciones += "<a href='" + rutaArchivo + "' target='_blank' class='btn-otro'>Ver contrato de adopción</a>";
            } else if(rutaArchivo == null){
                
            }
        }
// Si no existe archivo, no se agrega ningún enlace y el botón no aparecerá

        listaAdopciones += "<form action='7.Adopcion/formularioInfoPDF.jsp' method='post' target='_blank'>";
        listaAdopciones += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Ver formulario de pre-adopción' class='btn-adicionar'>";
        listaAdopciones += "</form>";   

        listaAdopciones += "<form action='principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp' method='post'>";
        listaAdopciones += "<input type='hidden' name='codigoAdopcion' value='" + adopcion.getCodigo() + "'>";
        listaAdopciones += "<input type='hidden' name='codigoMascota' value='" + mascota.getCodigo() + "'>";
        listaAdopciones += "<input type='submit' value='Cancelar adopción' class='btn-eliminar' onclick='return confirm(\"¿Está seguro que desea cancelar esta adopción?\");'>";
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

    function cancelarAdopcion(codigoAdopcion) {
        let confirmacion = confirm("¿Está seguro de que desea cancelar esta adopción?");
        if (confirmacion) {
            window.location.href = "principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp&accion=Cancelar&codigoAdopcion=" + codigoAdopcion;
        }
    }
</script>
