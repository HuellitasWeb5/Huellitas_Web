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
        <p>Debes comprometerte a cuidar lo mejor que puedas al peludito que estés acogiendo...</p>
        <p>Adoptar un perrito no solo le brinda un hogar lleno de amor y seguridad, sino que también le das la oportunidad de vivir una vida plena y feliz. ¡Si deseas hacer la diferencia y adoptar, haz clic aquí!</p>
        <a href="principal.jsp?CONTENIDO=7.Adopcion/formularioInformacion.jsp&accion=Adicionar"btn-adicionar">
           <button>PRE-FORMULARIO DE ADOPCION</button>
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
