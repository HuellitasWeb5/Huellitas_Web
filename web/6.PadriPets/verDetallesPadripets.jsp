<%-- Definiciones y dependencias --%>
<%@page import="clases.ApadrinamientoDetalle"%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.Apadrinamiento"%>
<%@page import="clases.PlanesApadrinamiento"%>
<%@page import="java.util.List"%>

<link rel="stylesheet" href="presentacion/style-Tarjetas.css">

<%
    String codigo = request.getParameter("codigo");
    Apadrinamiento apadrinamiento = new Apadrinamiento(codigo);
    Persona persona = new Persona(apadrinamiento.getIdentificacionPadrino());
    List<ApadrinamientoDetalle> detalles = ApadrinamientoDetalle.getListaEnObjetos("CodigoApadrinamiento = " + codigo, null);
    String fotoCedula = apadrinamiento.getFotoCedula();
    String fotoRecibo = apadrinamiento.getFotoRecibo();
    System.out.println("Foto recibo:" + fotoRecibo);
    System.out.println("pdf cedula:" + fotoCedula);

    String listaDetalle = "<div class='carousel-container'>";
    listaDetalle += "<div class='swiper-container carousel'>";
    listaDetalle += "<div class='swiper-wrapper'>";

    for (int idx = 0; idx < detalles.size(); idx++) {
        ApadrinamientoDetalle ADetalle = detalles.get(idx);
        Mascota mascota = new Mascota(ADetalle.getCodigoMascota());
        PlanesApadrinamiento plan = new PlanesApadrinamiento(ADetalle.getIdPlanApadrinamiento());

        listaDetalle += "<div class='swiper-slide'>";
        listaDetalle += "<div class='card'>";
        listaDetalle += "<div class='card-header'>";
        listaDetalle += "<h2>" + mascota.getNombre() + "</h2>"; // Nombre de la mascota
        listaDetalle += "</div>";
        listaDetalle += "<div class='card-body'>";

        // Información de la tarjeta
        listaDetalle += "<p><strong>Código:</strong> " + mascota.getCodigo() + "</p>";
        listaDetalle += "<p><strong>Plan:</strong> " + plan.getNombre() + "</p>";
        listaDetalle += "<p><strong>Lapso:</strong> " + ADetalle.getLapsoApadrinamiento() + "</p>";

        listaDetalle += "</div>"; // Cierra el card-body
        listaDetalle += "</div>"; // Cierra el card
        listaDetalle += "</div>"; // Cierra el swiper-slide
    }

    listaDetalle += "</div>"; // Cierra el swiper-wrapper
    listaDetalle += "<div class='swiper-button-prev'></div>";
    listaDetalle += "<div class='swiper-button-next'></div>";
    listaDetalle += "</div>"; // Cierra el swiper-container
    listaDetalle += "</div>"; // Cierra el carousel-container
%>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="presentacion/estiloyandar.css">
    <title>Detalles de Padripet</title>

</head>

<center>
    <div class="card-carousel">
        <div class="card">
            <div class="card-header">
                <h3>DETALLES PADRIPET</h3>
            </div>
            <div class="card-body">
                <form name="formulario" method="post" action="principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp" enctype="multipart/form-data">

                    <input type="hidden" name="mascotasPlan" id="mascotasPlan" required="">

                    <div class="form-group">
                        <label for="identificacion">Identificación</label>
                        <span id="identificacion" style="display: inline-block; border-bottom: 1px solid #ccc; padding: 5px;">
                            <%= persona.getIdentificacion()%>
                        </span>
                    </div>

                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <span id="nombre" style="display: inline-block; border-bottom: 1px solid #ccc; padding: 5px;">
                            <%= persona.getNombre()%>
                        </span>
                    </div>

                    <div class="form-group">
                        <label for="direccion">Dirección</label>
                        <span id="direccion" style="display: inline-block; border-bottom: 1px solid #ccc; padding: 5px;">
                            <%= persona.getDireccion()%>
                        </span>
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono</label>
                        <span id="telefono" style="display: inline-block; border-bottom: 1px solid #ccc; padding: 5px;">
                            <%= persona.getTelefono()%>
                        </span>
                    </div>

                    <div class="form-group">
                        <label for="fotoRecibo">Foto recibo</label>
                        <button type="button" class="btn-otro" onclick="openModal('<%= request.getContextPath() + fotoRecibo%>')">Ver</button>
                    </div>

                    <div class="form-group">
    <label for="fotoCedula">PDF cédula (ambos lados)</label>
    <button type="button" class="btn-otro" onclick="window.open('<%= request.getContextPath() + fotoCedula %>', '_blank')">Ver</button>
</div>

                    

                    <div class='btn-container'>
                        <input type="hidden" name="numero" value="<%=codigo%>">
                        <input type="button" class="btn-otro" value="Regresar" onClick="window.history.back()">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <%= listaDetalle%>
</center>
<div id="modal" class="modal">
    <span class="close" onclick="closeModal()">&times;</span>
    <img class="modal-content" id="modalImage" src="" alt="Imagen no disponible">
    <div id="caption"></div>
    <button class="btn-otro" onclick="closeModal()">Volver</button>
</div>

<script>
    function openModal(imageSrc) {
    var modal = document.getElementById("modal");
    var modalImage = document.getElementById("modalImage");
    
    // Verifica si es una imagen
    if (imageSrc.endsWith('.png') || imageSrc.endsWith('.jpg') || imageSrc.endsWith('.jpeg')) {
        modal.style.display = "block";
        modalImage.src = imageSrc;  // Usamos la imagen almacenada
    } else {
        alert('No se puede mostrar el archivo en el modal.'); // Manejo de error
    }
}


    function closeModal() {
        var modal = document.getElementById("modal");
        modal.style.display = "none";
    }

    document.addEventListener("DOMContentLoaded", function () {
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3, // Ajusta el número de tarjetas visibles
            spaceBetween: 10, // Espacio entre tarjetas
            loop: false,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
        });
    });
</script>