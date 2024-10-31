<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adopciones</title>
    <link rel="stylesheet" href="presentacion/style_AdopcionInicio.css" />
</head>
<body>
<header>
    <div class="contenedor-imagen">
        <img src="presentacion/imagenes/Adopcionees.jpg" alt="Imagen de la Fundación">
    </div>
    <div class="texto-superpuesto">
        <h1>¿POR QUÉ ADOPTAR?</h1>
            <div class="preguntas">
        <h4>Compromisos al adoptar</h4>
        <p>Adoptar significa comprometerse a brindar todo el amor, cuidado y responsabilidad al peludito que estás acogiendo en tu vida.</p>
        <p>Al brindarle un hogar, no solo le ofreces amor y seguridad, sino también la oportunidad de vivir una vida plena y feliz.</p>
        <p>¡Si quieres hacer la diferencia y cambiar una vida, haz clic aquí abajo!</p> 
        <a href="principal.jsp?CONTENIDO=9.Perfil/formularioInformacion.jsp&accion=Adicionar"btn-adicionar">
           <button>DESEO ADOPTAR</button>
        </a>
        <a href="principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp&nombre=Cliente" class="btn-adicionar">
            <button>CONOCE A NUESTROS PELUDITOS</button>
        </a>
    </div>
    </div>
</header>
        <script>
        document.addEventListener('DOMContentLoaded', function() {
            const textoSuperpuesto = document.querySelector('.texto-superpuesto');
            setTimeout(() => {
                textoSuperpuesto.classList.add('visible'); 
            }, 100); 
        });
    </script>
</body>
</html>
