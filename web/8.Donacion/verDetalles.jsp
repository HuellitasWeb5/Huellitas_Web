<%@page import="java.util.List"%>
<%@page import="clases.DonacionDetalle"%>
<%@page import="clases.DonacionDetalle"%>
<%
    String codigo = request.getParameter("codigo");
    DonacionDetalle donacionDetalle = new DonacionDetalle();
    String lista = "";
    List<DonacionDetalle> detalles = DonacionDetalle.getListaEnObjetos("codigoDonacion="+codigo, null); // Método para obtener la lista de DonacionDetalle
    for (int i = 0; i < detalles.size(); i++) {
        donacionDetalle = detalles.get(i);
        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>ID: " + donacionDetalle.getId() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>ID Concepto:</strong> " + donacionDetalle.getIdConcepto() + "</p>";
        lista += "<p><strong>Cantidad:</strong> " + donacionDetalle.getCantidad() + "</p>";
        lista += "<p><strong>Código Tipo Donación:</strong> " + donacionDetalle.getCodigoTipoDonacion() + "</p>";
        lista += "<p><strong>Código Donación:</strong> " + donacionDetalle.getCodigoDonacion() + "</p>";
        lista += "</div>"; // Fin de card-body
        lista += "</div>"; // Fin de card
        lista += "</div>"; // Fin de swiper-slide
    }
%>
<h3>Detalles de Donaciones</h3> 

<div class="filter-container">
    <button class="btn-regresar" onclick="window.history.back();">Regresar</button>
</div>

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