<%@page import="clases.Donacion"%>
<%@page import="clases.Persona"%>
<%@page import="clases.TipoDonacion"%>
<%@page import="clases.ConceptoDonacion"%>
<%@page import="java.util.List"%>
<%@page import="clases.DonacionDetalle"%>
<%@page import="clases.DonacionDetalle"%>
<head>
    <link rel="stylesheet" href="presentacion/Donacion.css">
</head>
<%
    String lista = "";
    String listaDonante = "";
    String codigo = request.getParameter("codigo");
    DonacionDetalle donacionDetalle = new DonacionDetalle();
    Donacion donacion = new Donacion();
    List<Donacion> datos = Donacion.getListaEnObjetos(null, null);
    List<DonacionDetalle> detalles = DonacionDetalle.getListaEnObjetos("codigoDonacion=" + codigo, null); // Método para obtener la lista de DonacionDetalle
    for (int i = 0; i < datos.size(); i++) {
        donacion = datos.get(i);
        Persona persona = new Persona(donacion.getIdentificacionDonante());
        listaDonante += "<div class='container'>";
        listaDonante += "<div class='header'>Datos del Usuario</div>";
        listaDonante += "<div class='content'>";
        
        listaDonante += "<div class='form-group'>";
        listaDonante += "<label>Identificación</label>";
        listaDonante += "<span>" + persona.getIdentificacion()+ "</span>";
        listaDonante += "</div>";
        
        listaDonante += "<div class='form-group'>";
        listaDonante += "<label>Nombre</label>";
        listaDonante += "<span>" + persona.getNombre()+ "</span>";
        listaDonante += "</div>";
        
        listaDonante += "<div class='form-group'>";
        listaDonante += "<label>Fecha</label>";
        listaDonante += "<span>" + donacion.getFecha()+ "</span>";
        listaDonante += "</div>";
        
        listaDonante += "<div class='form-group'>";
        listaDonante += "<label>Descripcion</label>";
        listaDonante += "<span>" + donacion.getDescripcion()+ "</span>";
        listaDonante += "</div>";
        listaDonante += "</div>";
        listaDonante += "</div>";
   

    }
    for (int i = 0; i < detalles.size(); i++) {
        donacionDetalle = detalles.get(i);

        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>ID: " + donacionDetalle.getId() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>Código Tipo Donación:</strong> " + donacionDetalle.getTipoDonacion() + "</p>";
        lista += "<p><strong>ID Concepto:</strong> " + donacionDetalle.getConceptoDonacion() + "</p>";
        lista += "<p><strong>Cantidad:</strong> " + donacionDetalle.getCantidad() + "</p>";
        lista += "<p><strong>Código Donación:</strong> " + donacionDetalle.getCodigoDonacion() + "</p>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>
<h3>Detalles de Donaciones</h3> 

<div class="filter-container">
    <button class="btn-regresar" onclick="window.history.back();">Regresar</button>
</div>

        <%=listaDonante%>
<div class="swiper-container">
    <div class="swiper-wrapper">
        <%=lista%>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
</div>
<script>
    const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 3, // Ayuda a mostrarme 3 tarjetas a la vez
        spaceBetween: 20, // poner el espacio entre las tarjetas
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

    