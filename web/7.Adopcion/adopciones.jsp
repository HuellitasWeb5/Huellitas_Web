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
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>

<%
    // Obtener la lista de formularios de adopción
    String listaAdopciones = "";

    List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos("estado='Aceptado'", null);
    listaAdopciones += "<div class='swiper-wrapper'>"; // Inicio del swiper-wrapper

    for (int i = 0; i < formularios.size(); i++) {
        FormularioDeInformacion formulario = formularios.get(i);
        Persona persona = new Persona(formulario.getIdentificacionAdoptante());
        Mascota mascota = new Mascota(formulario.getCodigoMascota());

        listaAdopciones += "<div class='swiper-slide'>"; // Inicio de la tarjeta
        listaAdopciones += "<div class='card'>"; // Añadido la clase 'card'

        // Añadir la sección del encabezado de la tarjeta
        listaAdopciones += "<div class='card-header'>Código de formulario: " + formulario.getCodigo() + "</div>";

        // Cuerpo de la tarjeta
        listaAdopciones += "<div class='card-body'>";

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
        listaAdopciones += "<input type='submit' value='Descargar formulario información' class='btn-otro'>";
        listaAdopciones += "</form>";
        listaAdopciones += "</div>"; // Fin de la sección de botones
        // Fin de la sección de botones

        listaAdopciones += "</div>"; // Fin de la tarjeta
        listaAdopciones += "</div>"; // Fin de la diapositiva
    }
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