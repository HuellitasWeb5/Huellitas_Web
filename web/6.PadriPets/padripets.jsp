<%@page import="clases.Apadrinamiento"%>
<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String listaApadrinamiento = "<div class='swiper-wrapper'>";

List<Apadrinamiento> datosApadrinamiento = Apadrinamiento.getListaEnObjetos(null, null);
for (int j = 0; j < datosApadrinamiento.size(); j++) {
    Apadrinamiento apadrinamiento = datosApadrinamiento.get(j);
    listaApadrinamiento += "<div class='swiper-slide'>";
    listaApadrinamiento += "<div class='card'>";
    listaApadrinamiento += "<div class='card-header'>";
    listaApadrinamiento += "<h2>Apadrinamiento #" + apadrinamiento.getCodigo() + "</h2>";
    listaApadrinamiento += "</div>";
    listaApadrinamiento += "<div class='card-body'>";
    listaApadrinamiento += "<p><strong>Fecha:</strong> " + apadrinamiento.getFecha() + "</p>";
    listaApadrinamiento += "<p><strong>Identificación Padrino:</strong> " + apadrinamiento.getIdentificacionPadrino() + "</p>";
    listaApadrinamiento += "<p><strong>Foto Recibo:</strong> <img src='" + apadrinamiento.getFotoRecibo() + "' alt='Recibo' /></p>";
    listaApadrinamiento += "<p><strong>Foto Cédula:</strong> <img src='" + apadrinamiento.getFotoCedula() + "' alt='Cédula' /></p>";
    listaApadrinamiento += "<div class='button-container'>";
    listaApadrinamiento += "<input type='radio' name='apadrinamientoSeleccionado' value='" + apadrinamiento.getCodigo() + "'>";
    listaApadrinamiento += "</div>";
    listaApadrinamiento += "</div>"; // card-body
    listaApadrinamiento += "</div>"; // card
    listaApadrinamiento += "</div>"; // swiper-slide
}

listaApadrinamiento += "</div>"; // swiper-wrapper
%>

<h3>PADRIPETS</h3>
<a href="principal.jsp?CONTENIDO=6.PadriPets/padrinosFormulario.jsp&accion=Adicionar">
    <button type="button">Adicionar Padripet</button>
</a>

<!-- Aquí puedes incluir el carrusel fuera de la tabla -->
<div class='carousel-container'>
    <div class='swiper-container carousel'>
        <%= listaApadrinamiento %>
        <div class='swiper-button-prev'></div>
        <div class='swiper-button-next'></div>
    </div>
</div>

<script type="text/javascript">
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev'
        },
        loop: true
    });
    
    function eliminar(codigo){
        resultado = confirm("Realmente desea eliminar el registro padripet con el codigo: " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=6.PadriPets/padrinoActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }
</script>
