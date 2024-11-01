<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-inicio.css">
</head>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="ruta/a/tu/estilo.css"> <!-- Asegúrate de que la ruta al CSS sea correcta -->
    <title>Bienvenido</title>
</head>
<body>
    <header>
        <div class="dark-background">
            <div class="texto-superpuesto">
                <h2>¡BIENVENIDO!</h2>
                <h1>Fundación "De la pata con los peludos"</h1>
                <h2>Albergue Villa Esperanza</h2>
                <p>En nuestra familia peluda, rodeados de patitas y colitas felices, creemos que hay un peludito especial esperando por cada persona dispuesta a abrir su corazón.</p>
                <a href="principal.jsp?CONTENIDO=3.Mascotas/mascotas.jsp&nombre=" class="btn-adicionar">Conoce a nuestros peluditos</a>
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

