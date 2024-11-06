<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Adopciones</title>
        <link rel="stylesheet" href="presentacion/style_AdopcionInicio.css">
    </head>
    <body>
        <header>
            <section class="textos-header">
                <h1>ADOPTA UN PELUDITO</h1>
                <h2>¡Un hogar para él, mucho amor para ti!</h2>
            </section>
        </header>
        <div class="dark-background">
            <div class="cards-container">
                <div class="preguntas">
                    <h4>Compromisos al adoptar</h4>
                    <p>Adoptar es mucho más que llevar un peludito contigo a casa; significa abrir tu vida y tu corazón para siempre.
                    Este compromiso implica cuidar, amar y respetar a un ser que dependerá de ti para sentirse seguro y feliz.
                    Al brindarle un hogar, estás ofreciendo una segunda oportunidad a un ser que lo necesita. Con paciencia y cariño,
                    podrás ayudarlo a superar cualquier miedo o experiencia pasada, permitiéndole vivir una vida plena y llena de amor.
                    Recibirás, a cambio, lealtad incondicional y la gratitud más pura.
                    <p>El primer paso para dar la bienvenida a un peludito en tu vida es completar un formulario de preadopción. 
                    La fundación lo revisará cuidadosamente y se pondrá en contacto contigo.</p>
                    <p>¡haz clic abajo y comienza esta maravillosa aventura de amor!</p>
                    <a href="principal.jsp?CONTENIDO=7.Adopcion/formularioInformacion.jsp&accion=Adicionar&codigoMascota=" class="btn-adicionar">
                        <button>¡DESEO ADOPTAR AHORA!</button>
                     </a>
                </div>
            </div>
    </body>
</html>
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const textosHeader = document.querySelector('.textos-header');

        setTimeout(() => {
            textosHeader.classList.add('visible');
        }, 100);
    });

</script>