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
                <p>Ser un padripet significa ser el padrino o madrina de uno o varios perritos en nuestra fundaci�n. Tu compromiso ayuda a garantizar que cada perro tenga acceso a atenci�n m�dica, alimentaci�n y un hogar lleno de amor.</p>
            </div>
            <div class="info-box pink-box">
                <h2>�C�mo ser un Padripet?</h2>
                <p>Convertirse en un padripet es f�cil y gratificante:</p>
                <ol>
                    <li>Visita nuestra secci�n de mascotas disponibles.</li>
                    <li>Selecciona el perrito que desees apoyar.</li>
                    <li>Completa el formulario con los datos de la mascota y elige un plan.</li>
                    <li>�Listo! Tu apoyo marcar� la diferencia.</li>
                </ol>
            </div>
            <div class="info-box green-box">
                <h2>Beneficios de ser un Padripet</h2>
                <p>Al ser padripet, obtienes:</p>
                <ul>
                    <li><strong>Conexi�n emocional:</strong> Fortalece el v�nculo con tu mascota.</li>
                    <li><strong>Satisfacci�n personal:</strong> Ayudas a un ser vivo en necesidad.</li>
                    <li><strong>Actualizaciones:</strong> Informaci�n sobre el bienestar de tu perrito.</li>
                    <li><strong>Oportunidades de voluntariado:</strong> Participa en eventos de la fundaci�n.</li>
                </ul>
            </div>
        </div>
        
        <!-- Bot�n centrado debajo de las tarjetas -->
        <div class="btn-container">
            <a href="principal.jsp?CONTENIDO=6.PadriPets/padrinosFormulario.jsp&accion=Adicionar">
                <button class="btn-adicionar">Apadrina un peludito</button>
            </a>
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