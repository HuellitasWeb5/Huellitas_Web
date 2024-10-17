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
        style="height: 100%; width: 100%;" >
            <path d="M0.28,50.83 C138.54,164.31 349.20,-49.98 500.00,49.98 L500.00,150.00 L-1.97,153.47 Z"
                  style="stroke: none; fill: rgb(255, 255, 255);"></path>
            </svg></div>
        
    </header>
    
    

    <section class="eventos">
        <img src="presentacion/imagenes/invitacion.jpg" alt="Invitación a eventos de octubre">
        <div class="evento-info">
            <h1 class="titulo">¡NUESTROS EVENTOS PARA EL MES DE OCTUBRE!</h1>
            <h4 class="titulo">Recuerda que con tu participación podríamos ayudar a muchos peluditos</h4>
            <p>
                Este mes, la fundación ha organizado varios eventos increíbles para apoyar a nuestros amigos peludos:
            </p>
            <ul>
                <li><strong>1 de octubre:</strong> Caminata por los peluditos rescatados.</li>
                <li><strong>15 de octubre:</strong> Jornada de adopción responsable.</li>
                <li><strong>22 de octubre:</strong> Taller de cuidados para mascotas adoptadas.</li>
                <li><strong>31 de octubre:</strong> Fiesta de disfraces para mascotas.</li>
            </ul>
            <p>¡No te lo pierdas y ven a ser parte del cambio!</p>
        </div>
    </section>
    
    <h2 class="titulo">¡CONOCE MÁS DE NUESTROS PELUDIDITOS RESCATADOS!</h2>
    <h2 class="titulo">NUESTRAS HISTORIAS</h2>
    <div class="cards">
        <div class="card">
            <img src="presentacion/mascota/perritoamca.PNG" >
            <h4>Peluchin</h4>
            <div class="contenido-texto-adop">
                <p>Gracias al albergue Villa Esperanza pudieron rescatarme, ya que a la edad de 2 años me abandonaron en la carretera unos migrantes, pero gracias a Dios ya estoy bajo la protección del albergue.</p>
            </div>
            <button class="btn-conocer" onclick="location.href='index-InicioSesion.jsp'">CONOCE MÁS DE MÍ!</button>
        </div>
        <div class="card">
            <img src="presentacion/mascota/abuela.PNG" alt="Abuela">
            <h4>Abuela</h4>
            <div class="contenido-texto-adop">
                <p>Soy una perrita de 12 años de edad, el albergue me acogió cuando tenía 5 años y desde entonces me ha cuidado y me ha brindado todo el amor posible.</p>
            </div>
            <button class="btn-conocer" onclick="location.href='index-InicioSesion.jsp'">CONOCE MÁS DE MÍ!</button>
        </div>
        <div class="card">
            <img src="presentacion/mascota/tomate.PNG" alt="Minino Mono">
            <h4>Minino Mono</h4>
            <div class="contenido-texto-adop">
                <p>Soy un perrito que estaba en las calles de Pasto, tenía muchas heridas físicas, el albergue me encontró y desde ese día me cuido y estuvo pendiente de mí, ahora estoy feliz por tener una gran familia peluda.</p>
            </div>
            <button class="btn-conocer" onclick="location.href='index-InicioSesion.jsp'">CONOCE MÁS DE MÍ!</button>
        </div>
        <div class="card">
            <img src="presentacion/mascota/pechuga.PNG" alt="Comino">
            <h4>Comino</h4>
            <div class="contenido-texto-adop">
                <p>Soy un perrito que me encontraron amarrado en una vía que conduce a un pueblo nariño, soy perrito ciego que llegué al albergue totalmente desnutrido, pero hoy después de tanto tiempo ya estoy feliz por mi nuevo inicio de vida.</p>
            </div>
            <button class="btn-conocer" onclick="location.href='index-InicioSesion.jsp'">CONOCE MÁS DE MÍ!</button>
        </div>
    </div>

    <main>
        <center> <iframe width="700" height="600" src="https://www.youtube.com/embed/uUoWTZW3ugw?si=93vZ8npeOHSEsO11?autoplay=1" title="YouTube video player" frameborder="0" 
                         allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe></center>

    </main>   
    <footer>
        <div class="contenedor-footer">
            <div class="contact-info">
                <h4>
                    <img src="presentacion/imagenes/celular.png" alt="Celular" width="24" height="24"> WhatsApp

                </h4>
                <p>   <a href="https://wa.me/573162562576" target="_blank" style="text-decoration: none; color: blue;">
                        Número: 3162562576
                    </a>
                </p>

                <p style="font-size: small; color: #000;">
                    Haga clic en el enlace para ir directamente a whatsap
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
                    Haga clic en el enlace para enviar un correo
                </p>
            </div>

            <div class="content-foo">
                <h4>
                    <img src="presentacion/imagenes/mapa.png" alt="Dirección" width="24" height="24"> Dirección
                </h4>
                <p>
                    <a href="https://maps.app.goo.gl/Rgo3wTyBEUH4Fsvt5" target="_blank" style="text-decoration: none; color: blue;">
                        Parque Natural Chimayoy
                    </a>
                </p>
                <p style="font-size: small; color: #000;">
                    Haga clic en el enlace para ver la ubicación
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
                    Haga clic en el enlace para ver la ubicación
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
                    Haga clic en el enlace para ir a TikTok
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
