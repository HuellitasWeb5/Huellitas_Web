<%-- 
    Document   : index
    Created on : 25/08/2024, 04:42:24 PM
    Author     : Luis Eraso
--%>

<%@page import="java.util.List"%>
<%@page import="clases.Datos"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String mensaje = "";
    if (request.getParameter("error") != null) {
        switch (request.getParameter("error")) {
            case "1":
                mensaje = "Identificacion o contaseña no valido";
                break;
            case "2":
                mensaje = "Acceso denegado";
                break;
            default:
                mensaje = "Error desconocido";
        }
    }
%>
<!DOCTYPE html>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"  href="presentacion/style-Index.css">
<meta charset="UTF-8">
<link rel="icon" href="presentacion/imagenes/Logo.png" type="image/x-icon">
<title>Huellitas Web</title>
<link rel="shortcut icon" href="LogoPequeÑo.png" type="image/x-icon">
<style>
    /* Estilo para los enlaces del menú */
    .navbar-nav .nav-item .nav-link {
        position: relative;
        display: inline-block;
        padding: 8px 12px; /* Ajusta el espaciado según sea necesario */
        text-decoration: none; /* Quita el subrayado predeterminado */
    }

    /* Efecto de subrayado al pasar el cursor */
    .navbar-nav .nav-item .nav-link::after {
        content: '';
        position: absolute;
        width: 0;
        height: 2px;
        background-color: #000; /* Cambia el color según tus necesidades */
        left: 0;
        bottom: 0;
        transition: width 0.3s ease;
    }

    .navbar-nav .nav-item .nav-link:hover::after {
        width: 100%;
    }

</style>
<%
    String Titulo1 = "";
    String Titulo2 = "";
    String Descripcion = "";
    String imagen = "";
    Datos muro = new Datos();
    List<Datos> datos = Datos.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        muro = datos.get(i);
        Titulo1 += "<h3 class='titulo'>" + muro.getTitulo1() + "</h3>";
        Titulo2 += "<h4 class='titulo'>" + muro.getTitulo2() + "</h3>";
        Descripcion += "<p>" + muro.getInformacion() + "</p>";
        imagen += "<img src='" + request.getContextPath() + "/presentacion/imagenes/" + muro.getFoto() + "' alt='Imagen de datos' class='imagen'>";
    }
%>
<title>VIdeo</title>
</head>

<body>
    <header>
        <nav>
            <a href="#" class="btn-iniciar-sesion" onclick="window.location.href = 'index-InicioSesion.jsp'">INICIAR SESIÓN</a>
        </nav>

        <section class="textos-header">
            <h2>FUNDACIÓN</h2>
            <h1>DE LA PATA CON LOS PELUDOS</h1>
            <h2>Albergue Villa Esperanza</h2>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                        style="height: 100%; width: 100%;" >
            <path d="M0.28,50.83 C138.54,164.31 349.20,-49.98 500.00,49.98 L500.00,150.00 L-1.97,153.47 Z"
                  style="stroke: none; fill: rgb(255, 255, 255);"></path>
            </svg></div>

    </header>
    <%=Titulo1%>

    <section class="eventos">

            <%=imagen%>
        

        <div class="evento-info">

            <%=Titulo2%>
            <ul>
            <%=Descripcion%>
            </ul>
                
        </div>
    </section>

    <h2 class="titulo">¡CONOCE UN POCO MÁS DE NOSOTROS!</h2>
    <center> <iframe width="990" height="715" src="https://www.youtube.com/embed/uUoWTZW3ugw?si=93vZ8npeOHSEsO11?autoplay=1" title="YouTube video player" frameborder="0" 
        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></center>

    <footer>
        <div class="contenedor-footer">
            <div class="contact-info">
                <h6>
                    <img src="presentacion/iconos/whatsApp.png" alt="Celular" width="24" height="24"> WhatsApp

                </h6>
                <p>   <a href="https://wa.me/573162562576" target="_blank">
                        3162562576
                    </a>
                </p>

            </div>
            <div class="content-foo">
                <h6>
                    <img src="presentacion/iconos/tiktok.png" alt="tiktok" width="24" height="24"> TikTok
                </h6>
                <p>
                    <a href="https://www.tiktok.com/@villa.esperanza.28" target="_blank">
                        villa.esperanza.28
                    </a>
                </p>
            </div>
            <div class="content-foo">
                <h6>
                    <img src="presentacion/iconos/facebook.png" alt="Facebook" width="24" height="24"> Facebook
                </h6>
                <p>
                    <a href="https://www.facebook.com/share/imnHxwmHPePBDVvu/" target="_blank">
                        Villa Esperanza
                    </a>
                </p>
            </div>

            <div class="content-foo">
                <h6>
                    <img src="presentacion/iconos/ubicacion.png" alt="Dirección" width="24" height="24"> Dirección
                </h6>
                <p>
                    <a href="https://maps.app.goo.gl/SJvHhvZrxt8fKixj9" target="_blank">
                        Parque Natural Chimayoy
                    </a>
                </p>
            </div>

            <div class="content-foo">
                <h6>
                    <img src="presentacion/iconos/mundo.png" alt="Ciudad" width="24" height="24"> Ciudad
                </h6>
                <p>
                    <a href="https://maps.app.goo.gl/G3CdcyUxiZ2aXAvf9" target="_blank">
                        Pasto, Nariño, Colombia 
                    </a>
                </p>
            </div>
        </div>
        <h2 class="titulo-final">&copy;HUELLITAS WEB</h2>

    </footer>
</body>

</html>

</center>	
</body>
<script>
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 30,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        },
        loop: true, // Hace que las tarjetas roten en un bucle
    });
</script>
</html>
