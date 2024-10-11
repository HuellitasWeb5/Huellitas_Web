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
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
    <link rel="stylesheet" href="presentacion/style-Adopciones.css" />
</head>
<%
    // Obtener la lista de formularios de adopción
    String listaAdopciones = "";
    String listaAdopcion = "";
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos("estado='Aceptado'", null);
    List<Adopcion> adopciones = Adopcion.getListaEnObjetos(null, null);

    listaAdopciones += "<div class='swiper-wrapper'>"; // Inicio del swiper-wrapper

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeInformacion formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());
        listaAdopciones += "<div class='swiper-slide'>"; // Inicio de la tarjeta
        listaAdopciones += "<div class='cardAdop'>"; 
        listaAdopciones += "<div class='cardAdop-header'>Código de formulario: " + formulario.getCodigo() + "</div>";
        listaAdopciones += "<div class='cardAdop-body'>";
        listaAdopciones += "<div class='adoptante-section' style='display: flex; align-items: center; margin-bottom: 10px;'>";
        listaAdopciones += "<div class='image-container' style='margin-right: 10px;'>";
        listaAdopciones += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' class='profile-image'/>";
        listaAdopciones += "</div>";
        listaAdopciones += "<div class='info-container'>";
        listaAdopciones += "<p><strong>Nombre adoptante:</strong> " + persona.getNombre() + "</p>";
        listaAdopciones += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
        listaAdopciones += "<p><strong>Contacto:</strong> " + persona.getTelefono() + "</p>";
        listaAdopciones += "</div>";
        listaAdopciones += "</div>";
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

    }
    for (int i = 0; i < adopciones.size(); i++) {
        Adopcion adopcion = adopciones.get(i);
        listaAdopciones += "<form name='formulario' method='post' action='principal.jsp?CONTENIDO=7.Adopcion/Acta.jsp' enctype='multipart/form-data'>";
        listaAdopciones += "<label for='acta'>Por favor, suba el acta de la mascota:</label>";
        listaAdopciones += "<br><input type='file' id='acta' name='acta' accept='application/pdf, image/*' required>";
        listaAdopciones += "<br>";
        listaAdopciones += "<input type='hidden' name='accion' value='Acta'>";  // Enviar la acción como 'Acta'
        listaAdopciones += "<input type='hidden' id='codigoFormulario' name='codigoFormulario' value='" + adopcion.getCodigo() + "'>";
        System.out.println(adopcion.getCodigo());
        listaAdopciones += "<input type='submit' value='Guardar Acta' class='btn-otro'>";  // Botón para enviar el formulario
        listaAdopciones += "</form>";

        // Comprobar si hay un acta disponible para mostrar el botón de "Ver Acta"
        if (adopcion.getActaAdopcion() != null && !adopcion.getActaAdopcion().isEmpty()) {
            String rutaArchivo = "uploads/" + adopcion.getActaAdopcion();
            listaAdopciones += "<a href='" + rutaArchivo + "' target='_blank' class='btn-ver-acta'>Ver Acta</a>";
        }
    }

    listaAdopciones += "</div>"; // Fin de la tarjeta
    listaAdopciones += "</div>"; // Fin de la diapositiva
    listaAdopciones += "</div>"; // Fin del swiper-wrapper
%>


<h3>ADOPCIONES</h3>

<div class="header-container">
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon"> 
        </div>
        <ul id="nameList"></ul> 
    </form>
</div>

<div class="btn-container">
    <a href="principal.jsp?CONTENIDO=7.Adopcion/formularioInformacion.jsp&accion=Adicionar">
        <button id="Adicionar" class="btn-adicionar">Realizar Adopción</button>
    </a>
</div>  

<div class="swiper-container">
    <%= listaAdopciones%>

    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
    <div class="swiper-pagination"></div>
</div>