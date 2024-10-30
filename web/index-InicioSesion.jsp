<%-- 
    Document   : index
    Created on : 25/08/2024, 04:42:24 PM
    Author     : Luis Eraso
--%>

<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    String mensaje = "";
    if (request.getParameter("error") != null) {
        switch (request.getParameter("error")) {
            case "1":
                mensaje = "Usuario o contraseña no válido";
                break;
            case "2":
                mensaje = "Acceso denegado";
                break;
            default:
                mensaje = "Error desconocido";
        }
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/Style-InicioSesion.css">
        <title>Huellitas Web</title>
    </head>
    <body>
        <video autoplay muted loop>
            <source src="presentacion/videos/inicioSesion.mp4" type="video/mp4">
        </video>
        <div class="logo-container">
            <img src="presentacion/imagenes/Logo-Fundacion.png" alt="Logo Izquierdo" class="logo logo-left">
            <img src="presentacion/imagenes/Logo.png" alt="Logo Derecho" class="logo logo-right">
        </div>
        <div class="container"> 
            <h3>HUELLITAS WEB</h3>
            <p id="error"><%=mensaje%></p>
            <form name="formulario" method="post" action="validar.jsp">  
                <div class="input-box">
                    <label for="usuario">IDENTIFICACIÓN</label>
                    <div class="icon-input">
                        <input type="text" name="identificacion" id="usuario" required placeholder="Digite aquí su número de identificaciòn">
                        <img src="presentacion/iconos/identificacion.png" alt="usuario" class="icon">
                    </div>
                </div>
                <div class="input-box">
                    <label for="clave">CONTRASEÑA</label>
                    <div class="icon-input">
                        <input type="password" name="clave" id="clave" required placeholder="Digite aquí su contraseña">
                        <img src="presentacion/iconos/seguridad.png" alt="clave" class="icon">
                    </div>
                </div>
                <input type="submit" value="Iniciar" id="Iniciar">
            </form>
            <!-- Nueva sección para recordar contraseña y registro -->
            <div class="recordar">
                <a href="10.RecuperarContraseña/recuperarContrase.jsp">¿Olvidó su contraseña?</a>
            </div>
            <div class="registro">
                ¿Aún no tienes una cuenta? <a href="registrarseFormulario.jsp">Registrarse</a>
            </div>
        </div> <!-- Cierre del contenedor -->
    </body>
</html>