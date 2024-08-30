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
                mensaje = "Usuario o contaseña no valido";
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
        <title>HUELLITAS WEB</title>


    </head>
    <body>
    <center>
        <h3>PROYECTO HUELLITAS WEB</h3>
        <p id="error"><%=mensaje%></p>
        <form name="formulario" method="post" action="validar.jsp">  
            <div id="texto">
                <table border="0">
                    <tr><td>Identificacion</td><td><input type="text" name="identificacion" id="usuario" required></td></tr>
                    <tr><td>Contraseña</td><td><input type="password" name="clave" id="clave" required></td></tr>
                </table>

                <input type="submit" value="Iniciar" id="Iniciar">
            </div>
        </form>       
    </center>	
</body>
</html>