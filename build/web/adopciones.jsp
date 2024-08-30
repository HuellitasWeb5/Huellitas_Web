<%-- 
    Document   : adopcion
    Created on : 27 ago 2024, 8:54:07
    Author     : Angie
--%>

<%@page import="clases.Mascota"%>
<%@page import="java.util.List"%>
<%@page import="clases.Adopcion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Adopciones</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>

    <section class="search-section">
        <input type="text" placeholder="Buscar..." id="search" onkeyup="buscarAdopcion()">
        <button onclick="realizarAdopcion()">Realizar Adopción</button>
    </section>

    <section class="adopciones-section">
        <%
            // Obtener la lista de adopciones desde el request
            List<Adopcion> adopciones = (List<Adopcion>) request.getAttribute("adopciones");
            if (adopciones == null) {
                adopciones = new ArrayList<>();
            }

            for (Adopcion adopcion : adopciones) {
        %>
        <div class="adopcion-card">
            <h3>Código Adopción: <%= adopcion.getCodigo() %></h3>
            <p><strong>Nombre del Adoptante: <%= adopcion.getIdentificacionAdoptante() %></strong></p>
            <p>Fecha de Adopción: <%= adopcion.getFechaAdopcion() %></p>
            <p>Acta de Adopción: <%= adopcion.getActaAdopcion() %></p>

            <ul>
                <% if (adopcion.getMascotas() != null) { %>
                    <% for (Mascota mascota : adopcion.getMascotas()) { %>
                        <li>
                            <p><strong><%= mascota.getNombre() %></strong></p>
                            <p>Código: <%= mascota.getCodigo() %></p>
                            <p>C. Especiales: <%= mascota.getCondicionesEspeciales() %></p>
                        </li>
                    <% } %>
                <% } %>
            </ul>

            <div class="form-buttons">
                <button onclick="verFormulario('adopcion', '<%= adopcion.getCodigo() %>')">C. Adopción</button>
                <button onclick="verFormulario('seguimiento', '<%= adopcion.getCodigo() %>')">Seguimiento</button>
                <button onclick="generarPDF('informacion', '<%= adopcion.getCodigo() %>')">Información</button>
                <button onclick="generarPDF('word', '<%= adopcion.getCodigo() %>')">WORD</button>
                <button onclick="generarPDF('pdf', '<%= adopcion.getCodigo() %>')">PDF</button>
            </div>
        </div>
        <% } %>
    </section>

    <script src="scripts.js"></script>
    <script>
        function buscarAdopcion() {
            // Lógica para buscar adopciones dinámicamente
            let input = document.getElementById("search").value.toLowerCase();
            let adopciones = document.getElementsByClassName("adopcion-card");
            for (let i = 0; i < adopciones.length; i++) {
                let nombre = adopciones[i].getElementsByTagName("p")[0].innerText.toLowerCase();
                if (nombre.includes(input)) {
                    adopciones[i].style.display = "";
                } else {
                    adopciones[i].style.display = "none";
                }
            }
        }

        function realizarAdopcion() {
            // Lógica para redirigir a un formulario de nueva adopción
            window.location.href = 'nuevaAdopcion.jsp';
        }

        function verFormulario(tipo, codigo) {
            // Lógica para mostrar formularios de adopción o seguimiento
            window.location.href = tipo + '.jsp?codigo=' + encodeURIComponent(codigo);
        }

        function generarPDF(tipo, codigo) {
            // Lógica para generar PDFs de la adopción
            window.location.href = 'generarDocumento.jsp?tipo=' + encodeURIComponent(tipo) + '&codigo=' + encodeURIComponent(codigo);
        }
    </script>
</body>
</html>
