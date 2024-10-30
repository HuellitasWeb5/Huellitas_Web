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
             <h1>Fundación "De la pata con los peludos"</h1>
             <h2>Albergue Villa Esperanza</h2>
            <p>En nuestra familia peluda, rodeados de patitas y colitas felices
                creemos que hay un peludito </p>
            <p>especial esperando por cada persona dispuesta a abrir su corazón.</p>
            <a href=principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp&nombre=" class="btn-adicionar">Conoce a nuestros peluditos</a>
        </div> 
    </div>

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
