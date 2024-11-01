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
        <title>JSP Page</title>
    </head>

    <header>
        <section class="textos-header">
            <h1>DONACIONES</h1>
            <h2 >No vamos a cambiar el mundo ayunando a un animal,</h2>
            <h2 > pero al menos el mundo habrá cambiado para el</h2>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                        style="height: 100%; width: 100%;" >
            <path d="M0.28,50.83 C138.54,164.31 349.20,-49.98 500.00,49.98 L500.00,150.00 L-1.97,153.47 Z"
                  style="stroke: none; fill: rgb(255, 255, 255);"></path>
            </svg></div>
    </header>

    <div class="container my-5">
        <div class="info-box col-lg-10 col-md-10 col-sm-12 mx-auto">
            <h2 class="text-center" >Amigos de los animales</h2>
            <p>
                En la Fundación de la pata con los peludos, trabajamos incansablemente por el bienestar de los perros abandonados y maltratados. Su apoyo y generosidad nos ayudan a seguir adelante con esta labor.
            </p>
            <p>
                Invitamos a todos a contribuir con sus donaciones. Cada aporte, grande o pequeño, hace una diferencia significativa en la vida de estos animales.
            </p>
            <p>
                Gracias por ser parte de esta misión y por ayudarnos a brindar un futuro mejor a nuestros amigos de cuatro patas. Juntos, creamos un mundo más compasivo y lleno de esperanza.
            </p>
            <p class="text-right font-weight-bold">Con gratitud,<br>Fundación Villa Esperanza</p>
        </div>
    </div>


    <div class="btn-container">
        <br>
        <a href="principal.jsp?CONTENIDO=9.Perfil/donacionesFormulario.jsp&accion=Adicionar" >
            <button class="btn-adicionar">¡Realiza tu donacion!</button>
        </a>
    </div>
    <br>
</html>
