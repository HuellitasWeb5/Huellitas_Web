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
                mensaje = "Identificacion o contaseña no valido";
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
        <div class="container"> <!-- Contenedor principal -->
            <center>
                <h3>HUELLITAS WEB</h3>
                <p id="error"><%=mensaje%></p>
                <form name="formulario" method="post" action="validar.jsp">  
                    <div class="input-box">
                        <label for="usuario">Identificacion</label>
                        <input type="text" name="identificacion" id="usuario" required placeholder="Ingrese su identificacion">
                    </div>
                    <div class="input-box">
                        <label for="clave">Contraseña</label>
                        <input type="password" name="clave" id="clave" required placeholder="Ingrese su contraseña">
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
            </center>
        </div> <!-- Cierre del contenedor -->
    </body>
</html>