<%-- 
    Document   : cambioDatos
    Created on : 10/12/2024, 10:32:16 AM
    Author     : Luis Eraso
--%>

<%@page import="clases.Datos"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String id = "1";
    String accion = request.getParameter("accion");
    Datos datos = new Datos();

    if (accion.equals("Modificar")) {
        datos = new Datos(id);
        System.out.println(datos.getFoto());
    }

%>

<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Formulario Datos</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                margin: 20px;
            }
            form {
                max-width: 500px;
                margin: auto;
                padding: 20px;
                border: 1px solid #ccc;
                border-radius: 10px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }
            label {
                display: block;
                margin-top: 10px;
                font-weight: bold;
            }
            input, textarea, button {
                width: 100%;
                padding: 10px;
                margin-top: 5px;
                margin-bottom: 15px;
                border: 1px solid #ccc;
                border-radius: 5px;
            }
            button {
                background-color: #007BFF;
                color: white;
                border: none;
                cursor: pointer;
            }
            button:hover {
                background-color: #0056b3;
            }
        </style>

    </head>
    <body>
        <h1>Formulario de Datos</h1>
        <form name="formulario" action="principal.jsp?CONTENIDO=12.Configuracion/cambioDatosActualizar.jsp" method="POST" enctype="multipart/form-data">
            <label for="titulo1">Título Principal</label>
            <textarea id="titulo1" name="titulo1" rows="2" value="" required><%=datos.getTitulo1()%></textarea>

            <label for="titulo2">SubTítulo</label>
            <textarea id="titulo2" name="titulo2" rows="2" value="" required><%=datos.getTitulo2()%></textarea>

            <label for="informacion">Información</label>
            <textarea id="informacion" name="informacion" rows="5" required><%=datos.getInformacion()%></textarea>

            <label for="foto">Foto</label>
            <input type="file" name="foto" accept="image/*" onchange="mostrarFoto();">
            <input type="submit" name="accion" value="<%=accion%>">
            <input type="hidden" name="id" value="<%=datos.getId()%>">
        </form>
        <img src="<%=request.getContextPath()%>/presentacion/imagenes/<%=datos.getFoto()%>" id="foto" width="300" height="400">

    </body>
</html>
<script type="text/javascript">
    function mostrarFoto() {
        var lector = new FileReader();
        lector.readAsDataURL(document.formulario.foto.files[0]);
        lector.onloadend = function () {
            document.getElementById("foto").src = lector.result;
        }
    }

</script>