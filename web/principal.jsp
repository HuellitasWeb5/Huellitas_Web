<%-- 
    Document   : principal
    Created on : 25/08/2024, 04:43:56 PM
    Author     : Luis Eraso
--%>


<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
        <link rel="stylesheet" href="presentacion/style-TarjetasModificar.css">
        <link rel="stylesheet" href="recursos/jquery-ui-1.13.3.custom/jquery-ui.css">
        <link rel="stylesheet" href="presentacion/style-Index.css">
        <link rel="stylesheet" href="recursos/bootstrap/css/bootstrap.min.css">
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
            /* Estilos para el menú desplegable */
            .navbar {
                background-color: #f8f9fa; /* Color de fondo de la barra de navegación */
                padding: 10px 20px; /* Espaciado interno */
            }

            .nav-link {
                color: #007bff; /* Color de los enlaces */
                text-decoration: none; /* Sin subrayado */
            }

            .nav-link:hover {
                color: #0056b3; /* Color de los enlaces al pasar el mouse */
            }

            .dropdown-menu {
                background-color: #ffffff; /* Color de fondo del menú desplegable */
                border: 1px solid #dee2e6; /* Borde del menú desplegable */
            }

            .dropdown-item {
                color: #212529; /* Color de los elementos del menú */
            }

            .dropdown-item:hover {
                background-color: #f1f1f1; /* Color de fondo al pasar el mouse sobre un elemento del menú */
            }

            /* Estilos responsivos */
            @media (max-width: 768px) {
                .navbar-nav {
                    flex-direction: column; /* Muestra los elementos del menú en columnas en pantallas pequeñas */
                }

                .navbar-toggler {
                    margin-left: auto; /* Alinea el botón de menú a la derecha */
                }
            }
        </style>
    </head>

    <body>
        <nav class="navbar">
            <ul class="navbar-nav">
                <li class="nav-item">

                </li>
                <li class="nav-item dropdown">

                </li>

            </ul>
        </nav>


        <div id="banner"></div>
        <div id="menu"><%=USUARIO.getTipoEnObjeto().getMenu()%></div>
        <div id="contenido">
            <jsp:include page='<%=request.getParameter("CONTENIDO")%>' flush="true" />
        </div>

        <footer>  
            <div class="contenedor-footer">
                <div class="content-foo">
                    <h4>3162562576</h4>
                    <p>Celular</p>
                </div>
                <div class="content-foo">
                    <h4>Villaesperanza@gmail.com</h4>
                    <p>Correo electrónico</p>
                </div>
                <div class="content-foo">
                    <h4>Parque Natural Chimayoy</h4> 
                    <p>Dirección</p>
                </div>
                <div class="content-foo">
                    <h4>Pasto, Nariño, Colombia</h4>
                    <p>Ciudad</p>
                </div>
            </div>
            <h2 class="titulo-final">&copy;HUELLITAS WEB</h2>
        </footer>
    </body>
</html>