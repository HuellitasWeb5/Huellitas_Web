<%-- 
    Document   : QueSonDonaciones.jsp
    Created on : 29/10/2024, 05:21:59 PM
    Author     : Luis
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/style-DonacionHeader.css" />
        <link rel="stylesheet" href="../presentacion/styleTarjetas.css" />
    </head>
<body>
  <header>
    <section class="textos-header">
        <h1>DONACIONES</h1>
        <h2>Tu apoyo transforma vidas peluditas.</h2>
        <h2>Con tu ayuda, podemos hacer mucho más.</h2>
    </section>
</header>
</header>
<div class="dark-background">
    <div class="container-fluid my-5 p-5">
        <div class="info-box col-lg-8 col-md-10 col-sm-12 mx-auto text-center">
            <h2 class="text-center">Amigos de los animales</h2>
            <p>
                En la fundación "De la pata con los peludos", trabajamos incansablemente por el bienestar de los perritos abandonados y maltratados. Su apoyo y generosidad nos ayudan a seguir adelante con esta labor.
            </p>
            <p>
               Únete a nosotros y contribuye con tu donación para transformar vidas. Cada aporte, grande o pequeño, hace una diferencia significativa en la vida de estos animalitos.
            </p>
            <p>
                Gracias por ser parte de esta misión y por ayudarnos a brindar un futuro mejor a nuestros amigos de cuatro patas. Juntos, creamos un mundo más compasivo y lleno de esperanza.
            </p>
  
             <div class="donation-section">
                <div class="heart-icon">❤</div>
                <p>¡HAZ LA DIFERENCIA HOY¡</p>
                <a href="principal.jsp?CONTENIDO=9.Perfil/donacionesFormulario.jsp&accion=Adicionar">
                    <button class="btn-donar">DONAR AHORA</button>
                </a>
        </div>
    </div>
</div>
</body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function() {
    const textosHeader = document.querySelector('.textos-header');
    
    // Espera un momento antes de activar la clase 'visible'
    setTimeout(() => {
        textosHeader.classList.add('visible'); // Activa la clase visible
    }, 100); 
});

    </script>