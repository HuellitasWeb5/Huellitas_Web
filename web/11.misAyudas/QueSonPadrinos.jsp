<link rel="stylesheet" href="presentacion/style-MascotasHeader.css" />


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Ser un Padripet - Fundación de Perritos</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif; /* Fuente más amigable */
            background-color: #f8f8f8;
            margin: 0;
            padding: 20px;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        .container {
            display: flex;
            flex-direction: column;
            align-items: stretch; /* Contenedores ocupan toda la pantalla */
            max-width: 800px;
            margin: auto;
        }
        .content-container {
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            margin: 15px 0; /* Margen vertical */
            padding: 20px;
            width: 100%;
            color: #333; /* Texto negro */
        }
        .significado {
            background-color: rgba(168, 230, 207, 0.8); /* Verde claro con transparencia */
        }
        .como-ser {
            background-color: rgba(255, 204, 204, 0.8); /* Rosa claro con transparencia */
        }
        .beneficios {
            background-color: rgba(255, 243, 224, 0.8); /* Amarillo claro con transparencia */
        }
        h2 {
            margin-bottom: 10px;
        }
        p, ol, ul {
            margin: 0; /* Para un mejor espaciado */
        }
    </style>
</head>
<body>
    <header>
        <section class="textos-header">
            <h2>QUE SIGNIFICA SER</h2>
            <h1>UN PADRIPET</h1>
        </section>
        <div class="wave" style="height: 150px; overflow: hidden;">
            <svg viewBox="0 0 500 150" preserveAspectRatio="none" style="height: 100%; width: 100%;">
                <path d="M0.28,50.83 C138.54,164.31 349.20,-49.98 500.00,49.98 L500.00,150.00 L-1.97,153.47 Z" style="stroke: none; fill: rgb(255, 255, 255);"></path>
            </svg>
        </div>
    </header>
    <h1>¡Sé un Padripet!</h1>
    <div class="container">
        <div class="content-container significado">
            <h2>¿Qué significa ser un Padripet?</h2>
            <p>Ser un padripet significa ser el padrino o madrina de uno o varios perritos en nuestra fundación. Tu compromiso ayuda a garantizar que cada perro tenga acceso a atención médica, alimentación y un hogar lleno de amor.</p>
        </div>
        <div class="content-container como-ser">
            <h2>¿Cómo ser un Padripet?</h2>
            <p>Convertirse en un padripet es fácil y gratificante:</p>
            <ol>
                <li>Visita nuestra sección de mascotas disponibles.</li>
                <li>Selecciona el perrito que desees apoyar.</li>
                <li>Completa el formulario con los datos de la mascota y elige un plan.</li>
                <li>¡Listo! Tu apoyo marcará la diferencia.</li>
            </ol>
        </div>
        <div class="content-container beneficios">
            <h2>Beneficios de ser un Padripet</h2>
            <p>Al ser padripet, obtienes:</p>
            <ul>
                <li><strong>Conexión emocional:</strong> Fortalece el vínculo con tu mascota.</li>
                <li><strong>Satisfacción personal:</strong> Ayudas a un ser vivo en necesidad.</li>
                <li><strong>Actualizaciones:</strong> Información sobre el bienestar de tu perrito.</li>
                <li><strong>Oportunidades de voluntariado:</strong> Participa en eventos de la fundación.</li>
            </ul>
        </div>
    </div>
    <div class="btn-container">
        <a href="principal.jsp?CONTENIDO=6.PadriPets/padrinosFormulario.jsp&accion=Adicionar">
            <button class="btn-adicionar">Apadrina un peludito</button>
        </a>  
    </div>
</body>
</html>
