<%-- Definiciones y dependencias --%>
<%@page import="clases.ApadrinamientoDetalle"%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.Apadrinamiento"%>
<%@page import="clases.PlanesApadrinamiento"%>
<%@page import="java.util.List"%>

<%
    String codigo = request.getParameter("codigo");
    Apadrinamiento apadrinamiento = new Apadrinamiento(codigo);
    Persona persona = new Persona(apadrinamiento.getIdentificacionPadrino());
    List<ApadrinamientoDetalle> detalles = ApadrinamientoDetalle.getListaEnObjetos("CodigoApadrinamiento = " + codigo, null);
    String fotoCedula= apadrinamiento.getFotoCedula();
    String fotoRecibo= apadrinamiento.getFotoRecibo();
    String listaDetalle = "<div class='carousel-container'>";
    listaDetalle += "<div class='swiper-container carousel'>";
    listaDetalle += "<div class='swiper-wrapper'>";
    
    for (int idx = 0; idx < detalles.size()-1; idx++) {
        System.out.println(detalles.size());
        ApadrinamientoDetalle ADetalle = detalles.get(idx);
        Mascota mascota = new Mascota(ADetalle.getCodigoMascota());
        PlanesApadrinamiento plan = new PlanesApadrinamiento(ADetalle.getPlanApadrinamiento());

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
    <style>
        .swiper-container {
            width: 100%; /* Asegúrate de que ocupe todo el ancho */
            height: 400px; /* Ajusta la altura según lo necesites */
        }
        .swiper-slide {
            display: flex; /* Flex para centrar el contenido */
            justify-content: center; /* Centrado horizontal */
            align-items: center; /* Centrado vertical */
        }
        .card {
            width: 300px; /* Ajusta el ancho según tus necesidades */
            margin: 10px; /* Espacio entre tarjetas */
            background-color: #fff; /* Color de fondo */
            border: 1px solid #ddd; /* Bordes */
            border-radius: 5px; /* Bordes redondeados */
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Sombra */
            padding: 15px; /* Espaciado interno */
            box-sizing: border-box; /* Incluye padding y border en el total del ancho */
        }
    </style>
</head>

<body>
    <center>
        <div class="card-carousel">
            <div class="card">
                <div class="card-header">
                    <h3>DETALLES PADRIPET</h3>
                </div>
                <div class="card-body">
                    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp">
                        <input type="hidden" name="mascotasPlan" id="mascotasPlan">
                        <table border='0'>
                            <tr>
                                <th>Identificacion</th>
                                <td><a><%= persona.getIdentificacion() %></a></td>
                            </tr>
                            <tr>
                                <th>Nombre</th>
                                <td><a><%= persona.getNombre() %></a></td>
                            </tr>
                            <tr>
                                <th>Direccion</th>
                                <td><a><%= persona.getDireccion() %></a></td>
                            </tr>
                            <tr>
                                <th>Telefono</th>
                                <td><a><%= persona.getTelefono() %></a></td>
                            </tr>
                            <tr>
                                <th>Foto recibo</th>
                                <td>
                                    <button type="button" class="btn-otro" onclick="mostrarFotoRecibo();">Ver</button>
                                </td>
                            </tr>
                            <tr>
                                <th>Foto cedula</th>
                                <td>
                                    <button type="button" class="btn-otro" onclick="mostrarFotoCedula();">Ver</button>
                                </td>
                            </tr>
                        </table>
                        <div class='btn-container'>
                            <input type="hidden" name="numero" value="<%=codigo%>">
                            <input type="button" class="btn-otro" value="Regresar" onClick="window.history.back()">
                        </div>
                    </form>
                </div>
                
            </div>
        </div>
                            <%= listaDetalle %>
    </center>

    <script>
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

        function mostrarFotoRecibo() {
            var lector = new FileReader();
            lector.readAsDataURL(document.formulario.fotoRecibo.files[0]);
            lector.onloadend = function () {
                document.getElementById("fotoRecibo").src = lector.result;
            };
        }

        function mostrarFotoCedula() {
            var lector = new FileReader();
            lector.readAsDataURL(document.formulario.fotoCedula.files[0]);
            lector.onloadend = function () {
                document.getElementById("fotoCedula").src = lector.result;
            };
        }
    </script>
</body>
