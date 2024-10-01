<%@page import="clases.Donacion"%>
<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasModificar.css">

</head>

<%
    Donacion donacion = new Donacion();
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    List<Donacion> datos = donacion.getListaEnObjetos(null, null);
    if (accion != null && accion.equals("Modificar")) {
        donacion = new Donacion(codigo);
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Donaciones</title>
    <style>
        .tarjeta {
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 10px;
            margin: 10px;
            display: inline-block;
            width: 200px;
            box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.1);
        }
        #formulario {
            display: none; /* Ocultar el formulario por defecto */
        }
    </style>
</head>
<body>

<center><h3>Agregar Donación Detalle</h3></center>

<!-- Formulario Principal -->
<table>
    <tr>
        <th>Identificación Donante</th>
        <td><input type="text" name="identificacionDonante" id="identificacionDonante"></td>
    </tr>
    <tr>
        <th>Nombre</th>
        <td><input type="text" name="nombre" id="nombre"></td>
    </tr>
    <tr>
        <th>Fecha</th>
        <td><input type="datetime-local" name="fecha" id="fecha"></td>
    </tr>
    <tr>
        <th>Descripción</th>
        <td><input type="text" name="descripcion" id="descripcion"></td>
    </tr>
</table>

<!-- Botón para abrir el formulario -->
<div class="filter-container">
    <button class="add-button" onclick="abrirFormulario();">Adicionar Donación</button>
</div>

<!-- Formulario de Detalle de Donación -->
<div id="formulario" title="Adicionar Donación Detalle">
    <form name="formularioDonacionDetalle"> 
        <table>
            <tr><th>Nombre</th><td><input type="text" name="nombreCatalogo" id="nombreCatalogo"></td></tr>
            <tr><th>Tipo</th><td><input type="text" name="tipoCatalogo" id="tipoCatalogo"></td></tr>
            <tr><th>Donación</th><td><input type="text" name="donacionCatalogo" id="donacionCatalogo"></td></tr>
            <tr><th>Cantidad</th><td><input type="number" name="cantidad" id="cantidad" value="1"></td></tr>
        </table>
        <input type="button" value="Agregar" onclick="actualizarTarjetas();">
        <input type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>    
</div>

<!-- Contenedor para las tarjetas -->
<div id="tarjetasDonaciones"></div> 

<script>
    var personas = <%=Persona.getListaEnArreglosJS(null, null)%>;
    var vectorPersonas = [];
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0]; // Ajusta esto según lo que necesites mostrar
    }

    // Función para abrir el formulario
    function abrirFormulario() {
        document.getElementById("formulario").style.display = "block"; // Mostrar el formulario
    }

    // Función para cerrar el formulario
    function cerrarFormulario() {
        document.getElementById("formulario").style.display = "none"; // Ocultar el formulario
    }

    // Función para actualizar las tarjetas
    function actualizarTarjetas() {
        // Obtener los valores del formulario de detalle
        var nombre = document.getElementById("nombreCatalogo").value;
        var tipo = document.getElementById("tipoCatalogo").value;
        var donacion = document.getElementById("donacionCatalogo").value;
        var cantidad = document.getElementById("cantidad").value;

        // Verificar que los campos no estén vacíos antes de agregar la tarjeta
        if (nombre === "" || tipo === "" || donacion === "" || cantidad === "") {
            alert("Por favor, completa todos los campos.");
            return; // Salir si hay campos vacíos
        }

        // Crear una nueva tarjeta en el contenedor de tarjetas
        var contenedor = document.getElementById("tarjetasDonaciones");
        var nuevaTarjeta = document.createElement("div");
        nuevaTarjeta.className = "tarjeta";

        // Agregar contenido a la tarjeta
        nuevaTarjeta.innerHTML = `
            <h4>${nombre}</h4>
            <p><strong>Tipo:</strong> ${tipo}</p>
            <p><strong>Donación:</strong> ${donacion}</p>
            <p><strong>Cantidad:</strong> ${cantidad}</p>
        `;

        // Añadir la tarjeta al contenedor
        contenedor.appendChild(nuevaTarjeta);

        // Limpiar los campos del formulario de detalle
        document.getElementById("nombreCatalogo").value = "";
        document.getElementById("tipoCatalogo").value = "";
        document.getElementById("donacionCatalogo").value = "";
        document.getElementById("cantidad").value = 1;

        // Cerrar el formulario
        cerrarFormulario();
    }
</script>
</body>
</html>
