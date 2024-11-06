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
                <h2>�Un hogar para �l, mucho amor para ti!</h2>
            </section>
        </header>
        <div class="dark-background">
            <div class="cards-container">
                <div class="preguntas">
                    <h4>Compromisos al adoptar</h4>
                    <p>Adoptar es mucho m�s que llevar un peludito contigo a casa; significa abrir tu vida y tu coraz�n para siempre.
                    Este compromiso implica cuidar, amar y respetar a un ser que depender� de ti para sentirse seguro y feliz.
                    Al brindarle un hogar, est�s ofreciendo una segunda oportunidad a un ser que lo necesita. Con paciencia y cari�o,
                    podr�s ayudarlo a superar cualquier miedo o experiencia pasada, permiti�ndole vivir una vida plena y llena de amor.
                    Recibir�s, a cambio, lealtad incondicional y la gratitud m�s pura.
                    <p>El primer paso para dar la bienvenida a un peludito en tu vida es completar un formulario de preadopci�n. 
                    La fundaci�n lo revisar� cuidadosamente y se pondr� en contacto contigo.</p>
                    <p>�haz clic abajo y comienza esta maravillosa aventura de amor!</p>
                    <a href="principal.jsp?CONTENIDO=7.Adopcion/formularioInformacion.jsp&accion=Adicionar&codigoMascota=" class="btn-adicionar">
                        <button>�DESEO ADOPTAR AHORA!</button>
                    �</a>
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