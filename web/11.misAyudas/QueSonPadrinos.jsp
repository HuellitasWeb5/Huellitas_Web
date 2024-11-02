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
                <h2>S� su h�roe desde donde est�s</h2>
            </section>
        </header>
        <div class="dark-background">

            <!-- Contenedor de las tarjetas -->
            <div class="cards-container">

                <div class="info-box green-box">
                    <h2>�Qu� significa ser un Padripet?</h2>
                    <p>Significa convertirte en el padrino o madrina de uno o varios perritos que forman 
                        parte de nuestra fundaci�n. Gracias a tu apoyo, el peludito podr� acceder a atenci�n m�dica regular, alimentaci�n de 
                        calidad, un espacio c�modo y seguro y por supuesto, mucho amor y cari�o. Ser un padripet no solo significa apoyar a un peludito, sino tambi�n ser parte de una
                        comunidad que comparte el amor por los animales y busca transformar sus vidas para mejor.</p>
                </div>
                <div class="info-box pink-box">
                    <h2>�C�mo ser un Padripet?</h2>
                    <p><strong>1)</strong> Visita nuestra secci�n de peluditos</p>
                    <p><strong>2)</strong> Selecciona el peludito que desees apoyar.</p>
                    <p><strong>3)</strong> Completa el formulario con los datos correspondientes de la mascota y elige el plan que deses.</p>
                    <p><strong>4)</strong> Luego nos pondremos en contacto contigo lo m�s pronto posible.</p>
                    <p><strong>�Y Listo! Tu apoyo marcar� la diferencia.</strong></p>
                </div>
                <div class="info-box green-box">
                    <h2>Beneficios de ser un Padripet</h2>
                    <p><strong>* Conexi�n emocional:</strong> Crea un lazo �nico con tu peludito.</p>
                    <p><strong>* Satisfacci�n �nica:</strong> Contribuye al bienestar de un peludito y experimenta la felicidad de ayudar a perritos sin hogar.</p>
                    <p><strong>* Actualizaciones:</strong> Recibe noticias sobre el bienestar de tu amiguito.</p>
                    <p><strong>* Voluntariado:</strong> Participa en actividades y eventos de la fundaci�n.</p>
                </div>
            </div>

            <!-- Bot�n centrado debajo de las tarjetas -->
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