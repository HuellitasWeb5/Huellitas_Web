<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Padripet</title>
        <link rel="stylesheet" href="presentacion/Stile_padrinosInicio.css">
    </head>
    <body>
        <header>
            <section class="textos-header">
                <h1>PADRINOS Y MADRINAS</h1>
                <h2>Sé su héroe desde donde estés</h2>
            </section>
        </header>
        <div class="dark-background">

            <!-- Contenedor de las tarjetas -->
            <div class="cards-container">

                <div class="info-box green-box">
                    <h2>¿Qué significa ser un Padripet?</h2>
                    <p>Significa convertirte en el padrino o madrina de uno o varios perritos que forman 
                        parte de nuestra fundación. Gracias a tu apoyo, el peludito podrá acceder a atención médica regular, alimentación de 
                        calidad, un espacio cómodo y seguro y por supuesto, mucho amor y cariño. Ser un padripet no solo significa apoyar a un peludito, sino también ser parte de una
                        comunidad que comparte el amor por los animales y busca transformar sus vidas para mejor.</p>
                </div>
                <div class="info-box pink-box">
                    <h2>¿Cómo ser un Padripet?</h2>
                    <p><strong>1)</strong> Visita nuestra sección de peluditos</p>
                    <p><strong>2)</strong> Selecciona el peludito que desees apoyar.</p>
                    <p><strong>3)</strong> Completa el formulario con los datos correspondientes de la mascota y elige el plan que deses.</p>
                    <p><strong>4)</strong> Luego nos pondremos en contacto contigo lo más pronto posible.</p>
                    <p><strong>¡Y Listo! Tu apoyo marcará la diferencia.</strong></p>
                </div>
                <div class="info-box green-box">
                    <h2>Beneficios de ser un Padripet</h2>
                    <p><strong>* Conexión emocional:</strong> Crea un lazo único con tu peludito.</p>
                    <p><strong>* Satisfacción única:</strong> Contribuye al bienestar de un peludito y experimenta la felicidad de ayudar a perritos sin hogar.</p>
                    <p><strong>* Actualizaciones:</strong> Recibe noticias sobre el bienestar de tu amiguito.</p>
                    <p><strong>* Voluntariado:</strong> Participa en actividades y eventos de la fundación.</p>
                </div>
            </div>

            <!-- Botón centrado debajo de las tarjetas -->
            <div class="btn-container">
                <a href="principal.jsp?CONTENIDO=6.PadriPets/padrinosFormulario.jsp&accion=Adicionar">
                    <button class="btn-padripet">APADRINA UN PELUDITO </button>
                </a>
            </div>
        </div>
    </body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const textosHeader = document.querySelector('.textos-header');

        // Espera un momento antes de activar la clase 'visible'
        setTimeout(() => {
            textosHeader.classList.add('visible'); // Activa la clase visible
        }, 100);
    });

</script>