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
        <link rel="stylesheet" href="../presentacion/style-Tarjetas.css" />
        <title>JSP Page</title>
    </head>

    <header>
        <section class="textos-header">
            <h1>DONACIONES</h1>
            <h2 >No vamos a cambiar el mundo ayunando a un animal, pero al menos el mundo habrá cambiado para el</h2>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;"><svg viewBox="0 0 500 150" preserveAspectRatio="none"
                                                                        style="height: 100%; width: 100%;" >
            <path d="M0.28,50.83 C138.54,164.31 349.20,-49.98 500.00,49.98 L500.00,150.00 L-1.97,153.47 Z"
                  style="stroke: none; fill: rgb(255, 255, 255);"></path>
            </svg></div>
    </header>
    <div class="container my-5">
        <div class="info-box col-lg-10 col-md-10 col-sm-12 mx-auto">
            <h2 class="text-center">Queridos amigos y amantes de los animales</h2>
            <p>
                En la Fundación Villa Esperanza, nuestro compromiso con la protección y el bienestar de nuestros queridos amigos peludos es inquebrantable.
                Como muchos de ustedes saben, cada día nos esforzamos por brindar un hogar amoroso y seguro a los perros abandonados y maltratados que llegan a nuestras puertas.
                Nos complace enormemente contar con el apoyo y la solidaridad de nuestra comunidad, y deseamos expresar nuestro profundo agradecimiento por su continuo respaldo.
            </p>
         
            <p>
                Entendemos que muchos de ustedes desean contribuir de manera generosa, y les pedimos amablemente que consideren ofrecer sus donaciones de manera presencial.
                Estamos ubicados en Chimayoy, y estaremos encantados de recibir su ayuda directamente en nuestras instalaciones. Cada pequeño gesto de apoyo marca la diferencia en las vidas de
                estos adorables compañeros de cuatro patas.
            </p>
            <p>
                Su generosidad nos permite seguir adelante con nuestra misión de salvar y cuidar a los perros necesitados. Gracias por ser parte de nuestra familia y por compartir nuestro amor por los animales.
                Juntos, estamos haciendo un mundo mejor para nuestros amigos peludos.
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
