<%-- 
    Document   : principal
    Created on : 25/08/2024, 04:43:56 PM
    Author     : Luis Eraso
--%>


<%@page import="clases.Persona"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    HttpSession sesion = request.getSession();
    Persona USUARIO = null;
    if (sesion.getAttribute("usuario") == null) {
        response.sendRedirect("index.jsp?error=2");
    } else {
        USUARIO = (Persona) sesion.getAttribute("usuario");
    }
    request.setAttribute("identificacionUsuario", USUARIO.getIdentificacion());
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="recursos/jquery-ui-1.13.3.custom/jquery-ui.css">
        <link rel="stylesheet" href="recursos/bootstrap/css/bootstrap.min.css">
        <link rel="stylesheet" href="presentacion/Prueba.css">
        <script src="recursos/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="recursos/jquery-3.7.1.min.js"></script>
        <script src="recursos/jquery-ui-1.13.3.custom/jquery-ui.min.js"></script>
        <script src="recursos/swiper-bundle.min.js"></script>   
        <script src="recursos/amcharts5/index.js"></script>
        <script src="recursos/amcharts5/xy.js"></script>
        <script src="recursos/amcharts5/themes/Animated.js"></script>
        <link rel="stylesheet" href="recursos/swiper-bundle.min.css" />

        <title>HUELLITAS WEB</title>

        <style>


        </style>
    </head>

    <body>

        <nav class="navbar">
            <ul class="navbar-nav">
                <!-- Menú de navegación -->
            </ul>
        </nav>

        <!-- Contenedor principal del contenido de la página -->
        <div class="main-content">
            <div id="banner"></div>
            <div id="menu"><%=USUARIO.getTipoEnObjeto().getMenu()%></div>
            <div id="contenido">
                <jsp:include page='<%=request.getParameter("CONTENIDO")%>' flush="true" />

            </div>
        </div>

        <!-- Footer -->
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