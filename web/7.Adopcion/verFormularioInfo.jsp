<%@page import="java.util.List"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    List<FormularioDeInformacion> formularios = FormularioDeInformacion.listarFormularios();
%>

<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Formularios De Información</title>
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css">
</head>
<body>
    <h1>Formularios De Información</h1>
    <div class="header-container">

    <form id="searchForm">
        <div class="search-container">
            <input type="text" id="searchInput" placeholder="Buscar por nombre" onkeyup="filterNames()">
            <img src="presentacion/iconos/lupa.png" alt="Buscar" class="search-icon"> 
        </div>
        <ul id="nameList"></ul> 
    </form>
</div>
    <div class="contenedor-formularios">
        <% for (FormularioDeInformacion formulario : formularios) { %>
        <div class="tarjeta-formulario">
            <div class="codigo-formulario">Código de Formulario: <%= formulario.getCodigoFormulario() %></div>
            
            <!-- Datos del Adoptante -->
            <div class="adoptante-info">
                <h2>Adoptante</h2>
                <img src="<%= formulario.getFotoAdoptante() %>" alt="Foto del Adoptante" class="foto-adoptante">
                <p><strong><%= formulario.getNombreAdoptante() %></strong></p>
                <p><%= formulario.getTelefono() %></p>
                <p><%= formulario.getDireccion() %></p>
                <p><%= formulario.getResidencia() %></p>
            </div>

            <!-- Datos de las Mascotas -->
            <div class="mascotas-info">
                <h2>Mascotas</h2>
                <% List<Mascota> mascotas = formulario.getMascotas(); %>
                <% for (Mascota mascota : mascotas) { %>
                    <div class="mascota">
                        <p>Nombre: <%= mascota.getNombre() %></p>
                        <p>Código: <%= mascota.getCodigo() %></p>
                        <p>Cuidados Especiales: <%= mascota.getCuidadosEspeciales() %></p>
                        <p>Fecha de Nacimiento: <%= mascota.getFechaNacimiento() %></p>
                        <img src="<%= mascota.getFoto() %>" alt="Foto de la Mascota" class="foto-mascota">
                    </div>
                <% } %>
            </div>

            <!-- Botones de Acción -->
            <div class="acciones">
                <form action="descargarFormulario.jsp" method="post">
                    <input type="hidden" name="codigoFormulario" value="<%= formulario.getCodigoFormulario() %>">
                    <button type="submit">Descargar Formulario</button>
                </form>
                <button onclick="aceptarFormulario('<%= formulario.getCodigoFormulario() %>')">Aceptar</button>
                <button onclick="rechazarFormulario('<%= formulario.getCodigoFormulario() %>')">Rechazar</button>
            </div>
        </div>
        <% } %>
    </div>

    <script>
        function aceptarFormulario(codigoFormulario) {
            // Lógica para aceptar formulario (llamar a un servlet o función)
            alert("Formulario " + codigoFormulario + " aceptado");
        }

        function rechazarFormulario(codigoFormulario) {
            // Lógica para rechazar formulario (llamar a un servlet o función)
            alert("Formulario " + codigoFormulario + " rechazado");
        }
    </script>
</body>
</html>
