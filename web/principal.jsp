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
                   <h4>
                       <img src="presentacion/imagenes/whats.png" alt="Celular" width="24" height="24"> WhatsApp

                   </h4>
                   <p>   <a href="https://wa.me/573162562576" target="_blank" style="text-decoration: none; color: blue;">
                           Número: 3162562576
                       </a>
                   </p>
                   
                   <p style="font-size: small; color: #000;">
                       Haga clic en el enlace
                   </p>
                   
     </div>

        <div class="content-foo">
            <h4>
                <img src="presentacion/imagenes/email.png" alt="Correo" width="24" height="24"> Correo electrónico
            </h4>
            <p>
                <a href="mailto:huellitasweb5@gmail.com" target="_blank" style="text-decoration: none; color: blue;">
                    villaesperanza@gmail.com
                </a>
            </p>
            <p style="font-size: small; color: #000;">
                Haga clic en el enlace 
            </p>
        </div>

        <div class="content-foo">
            <h4>
                <img src="presentacion/imagenes/mapa.png" alt="Dirección" width="24" height="24"> Dirección
            </h4>
            <p>
                    <a href="https://maps.app.goo.gl/SJvHhvZrxt8fKixj9" target="_blank" style="text-decoration: none; color: blue;">
                        Albergue Villa Esperanza-Chimayoy
                    </a>
                </p>
            <p style="font-size: small; color: #000;">
                Haga clic en el enlace 
            </p>
        </div>

        <div class="content-foo">
            <h4>
                <img src="presentacion/imagenes/ciudad.png" alt="Ciudad" width="24" height="24"> Ciudad
            </h4>
            <p>
                <a href="https://maps.app.goo.gl/G3CdcyUxiZ2aXAvf9" target="_blank" style="text-decoration: none; color: blue;">
                    Pasto, Nariño, Colombia
                </a>
            </p>
            <p style="font-size: small; color: #000;">
                Haga clic en el enlace 
            </p>
        </div>

        <div class="content-foo">
            <h4>
                <img src="presentacion/imagenes/tiktok.png" alt="tiktok" width="24" height="24"> TikTok
            </h4>
            <p>
                <a href="https://www.tiktok.com/@villa.esperanza.28" target="_blank" style="text-decoration: none; color: blue;">
                    villa.esperanza.28
                </a>
            </p>
            <p style="font-size: small; color: #000;">
                Haga clic en el enlace 
            </p>
        </div>

    </div>
    <h2 class="titulo-final">&copy;HUELLITAS WEB</h2>
</footer>

    </body>
</html>