<%-- 
    Document   : index
    Created on : 25/08/2024, 04:42:24 PM
    Author     : Luis Eraso
--%>

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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet"  href="presentacion/style-Index.css">
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Huellitas Web</title>
<link rel="shortcut icon" href="LogoPequeï¿½o.png" type="image/x-icon">
<link rel="stylesheet" href="Principal.css">
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

<title>VIdeo</title>
</head>

<body>
    <header>
        <nav>
            <a href="#" onclick="window.location.href = 'index-InicioSesion.jsp'">INICIAR SESION</a>
        </nav>
        <section class="textos-header">
            <h2>FUNDACION</h2>
            <h1>VILLA ESPERANZA</h1>
            <h2>Huellitas De Amor</h2>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                        style="height: 100%; width: 100%;">
            <path d="M0.28,50.83 C138.54,164.31 349.20,-49.98 500.00,49.98 L500.00,150.00 L-1.97,153.47 Z"
                  style="stroke: none; fill: rgb(255, 255, 255);"></path>
            </svg></div>
    </header>
    <main>
        <center> <iframe width="990" height="715" src="https://www.youtube.com/embed/uUoWTZW3ugw?si=93vZ8npeOHSEsO11?autoplay=1" title="YouTube video player" frameborder="0" 
                         allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></center>

        <section class="historias contenedor">
            <h2 class="titulo">NUESTRAS HISTORIAS</h2>
            <div class="cards">
                <div class="card">
                    <img src="presentacion/mascota/perritoamca.PNG" alt="">
                    <div class="contenido-texto-adop">
                        <center><h4>Peluchin</h4></center>
                        <p>Gracias al albergue Villa Esperanza pudieron rescatarme, ya que a la edad de 2 aï¿½os me abandonaron en 
                            la carretera  unos migrantes, pero gracias a Dios ya estoy bajo la proteccion del albergue.
                        </p>
                    </div>
                </div>
                <div class="card">
                    <img src="presentacion/mascota/abuela.PNG" alt="">
                    <div class="contenido-texto-adop">
                        <center><h4>Abuela</h4></center>
                        <p> Soy una perrita de 12 aï¿½os de edad, el albergue me acogio cuando tenia 5 aï¿½os 
                            y desde entonces me ha cuidado y me ha brindado todo el amor posible
                        </p>
                    </div>
                </div>
                <div class="card">
                    <img src="presentacion/mascota/tomate.PNG" alt="">
                    <div class="contenido-texto-adop">
                        <center><h4>Minino Mono</h4></center>
                        <p>Soy una gatica que estaba en la calles de pasto, tenia muchas heridas fisicas, el albergue me econtro y desde ese dia me cuido y esuvo pendiente de mi, ahora estoy feliz por tener una gran familia peluda. 
                        </p>
                    </div>
                </div>
                <div class="card">
                    <img src="presentacion/mascota/pechuga.PNG" alt="">
                    <div class="contenido-texto-adop">
                        <center><h4>Comino</h4></center>
                        <p>Soy perrito que me encontraron amarrado en una via que conduce a un pueblo nariï¿½o, soy perrito ciego que llegue al albergue totalmente desnutrido, pero hoy despues de tanto tiempo ya estoy feliz por mi nuevo inicio de vida
                        </p>
                    </div>
                </div>
        </section>
        <section>
            <h1 class="titulo">OBJETIVO</h1>
            <div class="historia">

                <img src="presentacion/mascota/perrito1.jpg" alt="">
                <div class="HistoriaObjetivo">
                    <p>Nuestro objetivo es poder rescatar a los perritos que no se encuentran en buen estado intentando poder ayudarles a velar por la seguridad de estos animales, tambien asi ayudando a conseguirles un hogar donde puedan vivir en condiciones ï¿½ptimas para el cuidado de ellos, la adopciï¿½n no es algo tan sencillo, primero debe mirar si la persona interesada en adopciï¿½n cumple con las condiciones necesarias para poder cuidar a una mascota y si el trato que le van a dar es el correcto.

                </div>
        </section>
    </main>     <footer>
        <div class="contenedor-footer">
            <div class="content-foo">
                <h4>Celular:</h4>
                <p>3143143142</p>
            </div>

            <div class="content-foo">
                <h4>Correo:</h4>
                <p>villaesperanza@gmail.com</p>
            </div>
            <div class="content-foo">
                <h4>Direcciï¿½n:</h4>
                <p>Parque De Chimayoy</p>
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
