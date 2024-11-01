<%@page import="clases.PlanesApadrinamiento"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.ApadrinamientoDetalle"%>
<%@page import="clases.Apadrinamiento"%>
<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    response.setContentType("text/html; charset=UTF-8");
%>
<link rel="stylesheet" href="presentacion/style-Tarjetas.css">

<%
String listaApadrinamiento = "<div class='swiper-wrapper'>";
String identificacionUsuario=(String) session.getAttribute("numeroUsuario");
String tipoUsuario = (String) session.getAttribute("tipoUsuario");
List<Apadrinamiento> datosApadrinamiento = null;
if(tipoUsuario.equals("C")){
    datosApadrinamiento = Apadrinamiento.getListaEnObjetos("identificacionPadrino="+identificacionUsuario, null);
}else{
    datosApadrinamiento = Apadrinamiento.getListaEnObjetos(null, null);
}


for (int j = 0; j < datosApadrinamiento.size(); j++) {
    Apadrinamiento apadrinamiento = datosApadrinamiento.get(j);
    Persona persona = new Persona(apadrinamiento.getIdentificacionPadrino());
    ApadrinamientoDetalle detalle = new ApadrinamientoDetalle(apadrinamiento.getCodigo());
    Mascota mascota = new Mascota(detalle.getCodigoMascota());
    PlanesApadrinamiento plan = new PlanesApadrinamiento(detalle.getIdPlanApadrinamiento());

    listaApadrinamiento += "<div class='swiper-slide'>";
    listaApadrinamiento += "<div class='card'>";
    listaApadrinamiento += "<div class='card-header'>";
    listaApadrinamiento += "<h2 style='font-weight: bold;'>Códido padripet: " + apadrinamiento.getCodigo() + "</h2>";
    listaApadrinamiento += "</div>";
    listaApadrinamiento += "<div class='card-body'>";

    // Información de la persona con su foto
    listaApadrinamiento += "<div style='display: flex; margin-bottom: 20px;'>";
    listaApadrinamiento += "<div style='margin-right: 20px;'>";
    listaApadrinamiento += "<img src='presentacion/clientes/" + persona.getFoto() + "' alt='Foto de " + persona.getNombre() + "' style='width: 170px; height: 170px; border-radius: 50%; object-fit: cover; border: 5px solid #05af8b;'/>";

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
    listaApadrinamiento += "<img src='presentacion/mascota/" + mascota.getFoto() + "' alt='Foto de " + mascota.getNombre() + "' style='width: 170px; height: 170px; border-radius: 50%; object-fit: cover; border: 5px solid #05af8b;'/>";
    listaApadrinamiento += "</div>";
    
    listaApadrinamiento += "<div>";
    listaApadrinamiento += "<p><strong>Nombre:</strong> " + mascota.getNombre() + "</p>";
    listaApadrinamiento += "<p><strong>Identificación:</strong> " + mascota.getCodigo() + "</p>";
    listaApadrinamiento += "<p><strong>Edad:</strong> " + mascota.getEdad() + " años</p>";
    listaApadrinamiento += "<p><strong>C. Especiales:</strong> " + mascota.getCuidadosEspeciales() + "</p>";
    listaApadrinamiento += "</div>"; 
    listaApadrinamiento += "</div>"; 

    // Datos de los detalles
    listaApadrinamiento += "<div>";
    listaApadrinamiento += "<p><strong>Fecha inicio:</strong> " + detalle.getFechaInicio() + "</p>";
    listaApadrinamiento += "<p><strong>Fecha Fin:</strong> " + detalle.getFechaFin() + "</p>";
    listaApadrinamiento += "<p><strong>Plan:</strong> " + plan.getNombre() + "</p>";
    listaApadrinamiento += "</div>"; 
    
    if (!"C".equals(tipoUsuario)) {
        listaApadrinamiento += "<button class='btn-eliminar' onclick='eliminar(" + apadrinamiento.getCodigo() + ")'>Eliminar</button>";
    }
     listaApadrinamiento += "<button class='btn-otro' onclick='detalles(" + apadrinamiento.getCodigo() + ")'>Detalles</button>";
    listaApadrinamiento += "</div>"; 
    listaApadrinamiento += "</div>";  
    listaApadrinamiento += "</div>";
}

listaApadrinamiento += "</div>"; 

%>



<h3>PADRIPETS</h3>
<div class="header-container">
    <!-- Buscar por nombre -->
    <% if (!"C".equals(tipoUsuario)) { %>
    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por persona o mascota" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon">
        </div>
        <ul id="nameList"></ul>
    </form>
    <% } %>
    <!-- Botón de adicionar -->
    <div class="btn-container">
        <% if (!"C".equals(tipoUsuario)) { %>
        <a href="principal.jsp?CONTENIDO=6.PadriPets/padrinosFormulario.jsp">
            <button class="btn-adicionar">Adicionar</button>
        </a>
    <% } %>
    </div>
</div>
<% if ("C".equals(tipoUsuario) && listaApadrinamiento.equals("<div class='swiper-wrapper'></div>")) { %>
<h2>Aún no has apadrinado a ningún peludito.</h2>
<h2>¡Conviértete en su padrino y ayúdanos a brindarle una vida llena de amor y cuidado!</h2>
<% } %>
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
        loop: false
    });
    
    function eliminar(codigo){
        resultado = confirm("Realmente desea eliminar el registro padripet con el codigo: " + codigo + "?");
        if (resultado) {
            document.location = "principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp&accion=Eliminar&codigo=" + codigo;
        }
    }
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
</script>
