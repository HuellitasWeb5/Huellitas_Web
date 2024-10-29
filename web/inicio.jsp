<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-inicio.css">
</head>
<body>

    <!-- Contenedor de la imagen con texto superpuesto -->
    <div class="contenedor-imagen">
        <img src="presentacion/imagenes/inicio1.jpg" alt="Imagen de la Fundación">
        <div class="texto-superpuesto">
            <h2>¡BIENVENIDO! </h2>
             <h1>Fundación </h1>
            <h2>Villa Esperanza</h2>
            
           
            <p>En nuestra Familia Peluda,rodeado de patitas y colitas felices
                creemos que hay un peludito </p>
            <p>especial esperando por cada persona dispuesta a abrir su corazón.</p>
            <a href=principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp&nombre=" class="boton-peluditos">Conoce a nuestros peluditos </a>
        </div> <!-- Etiqueta de cierre corregida -->
    </div>

    <script>
        // Espera a que el contenido se cargue
        document.addEventListener('DOMContentLoaded', function() {
            const textoSuperpuesto = document.querySelector('.texto-superpuesto');
            setTimeout(() => {
                textoSuperpuesto.classList.add('visible'); // Agrega la clase para activar la animación
            }, 100); // Retraso de 100ms para permitir que el DOM se cargue
        });
    </script>
</body>
</html>
