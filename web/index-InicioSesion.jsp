<%-- 
    Document   : index
    Created on : 25/08/2024, 04:42:24 PM
    Author     : Luis Eraso
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

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
            <source src="presentacion/mascota/videofull2.mp4" type="video/mp4">
            Tu navegador no soporta el elemento de video.
        </video>
        <div class="container"> <!-- Contenedor principal -->
            <h3>HUELLITAS WEB</h3>
            <p id="error"><%=mensaje%></p>
            <form name="formulario" method="post" action="validar.jsp">  
                <div class="input-box">
                    <label for="usuario">IDENTIFICACION</label>
                    <div class="icon-input">
                        <input type="text" name="identificacion" id="usuario" required placeholder="Ingrese su identificacion">
                        <img src="presentacion/iconos/identificacion.png" alt="usuario" class="icon">
                    </div>
                </div>
                <div class="input-box">
                    <label for="clave">CONTRASEÑA</label>
                    <div class="icon-input">
                        <input type="password" name="clave" id="clave" required placeholder="Ingrese su contraseña">
                        <img src="presentacion/iconos/seguridad.png" alt="clave" class="icon">
                    </div>
                </div>
                <input type="submit" value="Iniciar" id="Iniciar">
            </form>
            <!-- Nueva sección para recordar contraseña y registro -->
            <div class="recordar">
                ¿Olvidó su contraseña?
            </div>
            <div class="registro">
                ¿Aún no tienes una cuenta? <a href="registrarseFormulario.jsp">Registrarse</a>
            </div>
        </div> <!-- Cierre del contenedor -->
    </body>
</html>