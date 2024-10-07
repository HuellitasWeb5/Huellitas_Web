<%-- 
    Document   : adopcion
    Created on : 27 ago 2024, 8:54:07
    Author     : Angie
--%>

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
    String codigoFormulario = request.getParameter("codigoFormulario");
    String fechaSolicitud = request.getParameter("fechaSolicitud");
    String identificacionAdoptante = request.getParameter("identificacionAdoptante");
    String codigoMascota = request.getParameter("mascota");

    if (codigoFormulario != null && fechaSolicitud != null && identificacionAdoptante != null && codigoMascota != null) {

        Adopcion adopcion = new Adopcion();
        adopcion.setFechaAdopcion(fechaSolicitud);
        adopcion.setIdentificacionAdoptante(identificacionAdoptante);
        adopcion.setCodigoMascota(codigoMascota);

    }
    
// Obtener la lista de formularios de adopción
String listaAdopciones = "";
List<FormularioDeInformacion> formularios = FormularioDeInformacion.getListaEnObjetos(null, null); // Ajusta el método según tu implementación
listaAdopciones += "<div class='swiper-wrapper'>"; // Inicio del swiper-wrapper

for (int i = 0; i < formularios.size(); i++) {
    FormularioDeInformacion formulario = formularios.get(i);

    listaAdopciones += "<div class='swiper-slide'>"; // Inicio de la tarjeta
    listaAdopciones += "<div class='card'>"; // Añadido la clase 'card'

    // Añadir la sección de la mascota
    listaAdopciones += "<div class='card-header'>Código de formulario: " + formulario.getCodigo() + "</div>"; // Código de la mascota
    listaAdopciones += "<div class='card-body'>"; // Cuerpo de la tarjeta
    listaAdopciones += "<p><strong>Fecha de solicitud:</strong> " + formulario.getFecha() + "</p>";
    listaAdopciones += "<p><strong>Identificación:</strong> " + formulario.getIdentificacionAdoptante() + "</p>";
    listaAdopciones += "<p><strong>Mascota:</strong> " + formulario.getMascota() + "</p>";

    // Mostrar las tres fotos
    if (formulario.getFotoVivienda() != null && !formulario.getFotoVivienda().isEmpty()) {
        listaAdopciones += "<p><strong>Foto Vivienda:</strong></p>";
        listaAdopciones += "<img class='foto' src='uploads/" + formulario.getFotoVivienda() + "' alt='Foto Vivienda'>";
    }

    if (formulario.getFotoRecibo() != null && !formulario.getFotoRecibo().isEmpty()) {
        listaAdopciones += "<p><strong>Foto Recibo:</strong></p>";
        listaAdopciones += "<img class='foto' src='uploads/" + formulario.getFotoRecibo() + "' alt='Foto Recibo'>";
    }

    if (formulario.getFotoCedula() != null && !formulario.getFotoCedula().isEmpty()) {
        listaAdopciones += "<p><strong>Foto Cédula:</strong></p>";
        listaAdopciones += "<img class='foto' src='uploads/" + formulario.getFotoCedula() + "' alt='Foto Cédula'>";
    }

    listaAdopciones += "</div>"; // Fin del cuerpo de la tarjeta

    // Botones de acción
    listaAdopciones += "<div class='btn-container'>";
    listaAdopciones += "<a href='principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp&accion=Modificar&codigo=" + formulario.getCodigo() + "'>";
    listaAdopciones += "<button class='btn-otro'>Descargar Contrato</button></a>";
    listaAdopciones += "<button class='btn-adicionar' onclick='document.getElementById(\"formAceptar" + formulario.getCodigo() + "\").submit();'>Aceptar</button>";
    listaAdopciones += "<button class='btn-eliminar' onClick='eliminar(" + formulario.getCodigo() + ")'>Rechazar</button>";
    listaAdopciones += "</div>"; // Fin del contenedor de botones

    listaAdopciones += "</div>"; // Fin de la tarjeta
    listaAdopciones += "</div>"; // Fin de la diapositiva

    // Formulario oculto para enviar los datos al JSP de adopciones
    listaAdopciones += "<form action='principal.jsp?CONTENIDO=7.Adopcion/adopciones.jsp' method='POST' style='display:none;' id='formAceptar" + formulario.getCodigo() + "'>";
    listaAdopciones += "<input type='hidden' name='codigoFormulario' value='" + formulario.getCodigo() + "'>";
    listaAdopciones += "<input type='hidden' name='fechaSolicitud' value='" + formulario.getFecha() + "'>";
    listaAdopciones += "<input type='hidden' name='identificacionAdoptante' value='" + formulario.getIdentificacionAdoptante() + "'>";
    listaAdopciones += "<input type='hidden' name='mascota' value='" + formulario.getMascota() + "'>";
    listaAdopciones += "</form>";
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
    <a href="principal.jsp?CONTENIDO=7.Adopcion/verFormularioSeg.jsp&accion=Adicionar">
        <button id="Adicionar" class="btn-otro">Formularios de Seguimiento</button>
    </a>
    <a href="principal.jsp?CONTENIDO=7.Adopcion/verFormularioInfo.jsp&accion=Adicionar">
        <button id="Adicionar" class="btn-otro">Formularios de Adopciones</button>
    </a>
    <a href="principal.jsp?CONTENIDO=7.Adopcion/formularioSeguimiento.jsp&accion=Adicionar">
        <button id="Adicionar" class="btn-otro">Realizar seguimiento</button>
    </a>
</div>  

