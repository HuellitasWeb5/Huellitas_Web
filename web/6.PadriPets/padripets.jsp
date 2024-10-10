<%@page import="clases.PlanesApadrinamiento"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.ApadrinamientoDetalle"%>
<%@page import="clases.Apadrinamiento"%>
<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
String listaApadrinamiento = "<div class='swiper-wrapper'>";

List<Apadrinamiento> datosApadrinamiento = Apadrinamiento.getListaEnObjetos(null, null);
for (int j = 0; j < datosApadrinamiento.size(); j++) {
    Apadrinamiento apadrinamiento = datosApadrinamiento.get(j);
    Persona persona = new Persona(apadrinamiento.getIdentificacionPadrino());
    ApadrinamientoDetalle detalle = new ApadrinamientoDetalle(apadrinamiento.getCodigo());
    Mascota mascota = new Mascota(detalle.getCodigoMascota());
    PlanesApadrinamiento plan = new PlanesApadrinamiento(detalle.getIdPlanApadrinamiento());

    listaApadrinamiento += "<div class='swiper-slide'>";
    listaApadrinamiento += "<div class='card'>";
    listaApadrinamiento += "<div class='card-header'>";
    listaApadrinamiento += "<h2>Apadrinamiento #" + apadrinamiento.getCodigo() + "</h2>";
    listaApadrinamiento += "</div>";
    listaApadrinamiento += "<div class='card-body'>";

    // Información de la persona con su foto
    listaApadrinamiento += "<div style='display: flex; margin-bottom: 20px;'>";
    listaApadrinamiento += "<div style='margin-right: 20px;'>";
    listaApadrinamiento += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' style='width: 100px; height: auto;'/>";
    listaApadrinamiento += "</div>";
    
    listaApadrinamiento += "<div>";
    listaApadrinamiento += "<p><strong>Nombre:</strong> " + persona.getNombre() + "</p>";
    listaApadrinamiento += "<p><strong>Identificación:</strong> " + apadrinamiento.getIdentificacionPadrino() + "</p>";
    listaApadrinamiento += "<p><strong>Teléfono:</strong> " + persona.getTelefono() + "</p>";
    listaApadrinamiento += "<p><strong>Dirección:</strong> " + persona.getDireccion() + "</p>";
    listaApadrinamiento += "</div>"; 
    listaApadrinamiento += "</div>"; 

    // Información de la mascota con su foto
    listaApadrinamiento += "<div style='display: flex; margin-bottom: 20px;'>";
    listaApadrinamiento += "<div style='margin-right: 20px;'>";
    listaApadrinamiento += "<img src='presentacion/clientes/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' style='width: 100px; height: auto;'/>";
    listaApadrinamiento += "</div>";
    
    listaApadrinamiento += "<div>";
    listaApadrinamiento += "<p><strong>Nombre:</strong> " + mascota.getNombre() + "</p>";
    listaApadrinamiento += "<p><strong>Identificación:</strong> " + mascota.getCodigo() + "</p>";
    listaApadrinamiento += "<p><strong>C. Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
    listaApadrinamiento += "<p><strong>Edad:</strong> " + mascota.getEdad() + "</p>";
    listaApadrinamiento += "</div>"; 
    listaApadrinamiento += "</div>"; 

    // Datos de los detalles
    listaApadrinamiento += "<div>";
    listaApadrinamiento += "<p><strong>Fecha inicio:</strong> " + detalle.getFechaInicio() + "</p>";
    listaApadrinamiento += "<p><strong>Fecha Fin:</strong> " + detalle.getFechaFin() + "</p>";
    listaApadrinamiento += "<p><strong>Plan:</strong> " + plan.getNombre() + "</p>";
    listaApadrinamiento += "</div>"; 
    
    listaApadrinamiento += "<button class='btn-eliminar' onclick='eliminar(" + apadrinamiento.getCodigo() + ")'>Eliminar</button>";
    listaApadrinamiento += "<button class='btn-otro' onclick='detalles(" + apadrinamiento.getCodigo() + ")'>Detalles</button>";
    listaApadrinamiento += "</div>"; 
    listaApadrinamiento += "</div>"; 
    listaApadrinamiento += "</div>";
}

listaApadrinamiento += "</div>"; 

%>



<h3>PADRIPETS</h3>
<div class='btn-container'>
<a href="principal.jsp?CONTENIDO=6.PadriPets/padrinosFormulario.jsp&accion=Adicionar" >
    <button class="btn-adicionar">Adicionar Padripet</button>
</a>
</div>


<div class='carousel-container'>
    <div class='swiper-container carousel'>
        <%= listaApadrinamiento %>
        <div class='swiper-button-prev'></div>
        <div class='swiper-button-next'></div>
    </div>
</div>

<script type="text/javascript">
    
    function detalles(codigo) {  
    window.location.href = "principal.jsp?CONTENIDO=6.PadriPets/verDetallesPadripets.jsp&codigo=" + codigo;
}
    
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
            document.location = "principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }
</script>
