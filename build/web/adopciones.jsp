<%-- 
    Document   : adopcion
    Created on : 27 ago 2024, 8:54:07
    Author     : Angie
--%>

<%@page import="clases.Mascota"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
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
    <header>
        <nav>
            <ul>
                <li><a href="inicio.jsp">Inicio</a></li>
                <li><a href="adopcion.jsp">Adopción</a></li>
                <li><a href="donacion.jsp">Donación</a></li>
                <li><a href="padripets.jsp">Padripets</a></li>
                <li><a href="perfil.jsp">Perfil</a></li>
                <li><a href="salir.jsp">Salir</a></li>
            </ul>
        </nav>
    </header>

    <section class="search-section">
        <input type="text" placeholder="Buscar..." id="search" onkeyup="buscarAdopcion()">
        <button onclick="realizarAdopcion()">Realizar Adopción</button>
    </section>

    <section class="adopciones-section">
        <%
            // Ejemplo de uso de datos dinámicos con JSP
            List<Adopcion> adopciones = (List<Adopcion>) request.getAttribute("adopciones");
            if (adopciones == null) {
                adopciones = new ArrayList<>();
                // Supongamos que se han cargado las adopciones desde la base de datos
                // Adopcion adopcion = new Adopcion("codigo"); // Ejemplo para cargar una adopción
                // adopciones.add(adopcion);
                request.setAttribute("adopciones", adopciones);
            }

            for (Adopcion adopcion : adopciones) {
        %>
        <div class="adopcion-card">
            <h3>Código Adopción: <%= adopcion.getCodigo() %></h3>
            <p><strong>Nombre del Adoptante: <%= adopcion.getIdentificacionAdoptante() %></strong></p>
            <p>Fecha de Adopción: <%= adopcion.getFechaAdopcion() %></p>
            <p>Acta de Adopción: <%= adopcion.getActaAdopcion() %></p>

            <ul>
                <% for (Mascota mascota : adopcion.getMascotas()) { %>
                    <li>
                        <p><strong><%= mascota.getNombre() %></strong></p>
                        <p>Código: <%= mascota.getCodigo() %></p>
                        <p>C. Especiales: <%= mascota.getCondicionesEspeciales() %></p>
                    </li>
                <% } %>
            </ul>

            <div class="form-buttons">
                <button onclick="verFormulario('adopcion', <%= adopcion.getCodigo() %>)">C. Adopción</button>
                <button onclick="verFormulario('seguimiento', <%= adopcion.getCodigo() %>)">Seguimiento</button>
                <button onclick="generarPDF('informacion', <%= adopcion.getCodigo() %>)">Información</button>
                <button onclick="generarPDF('word', <%= adopcion.getCodigo() %>)">WORD</button>
                <button onclick="generarPDF('pdf', <%= adopcion.getCodigo() %>)">PDF</button>
            </div>
        </div>
        <% } %>
    </section>

    <footer>
        <div class="footer-info">
            <p>Celular: +3141672624w</p>
            <p>Correo: fundacionvillaesperanza@gmail.com</p>
            <p>Dirección: Chimayoy</p>
        </div>
    </footer>

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
            window.location.href = tipo + '.jsp?codigo=' + codigo;
        }

        function generarPDF(tipo, codigo) {
            // Lógica para generar PDFs de la adopción
            window.location.href = 'generarDocumento.jsp?tipo=' + tipo + '&codigo=' + codigo;
        }
    </script>
</body>
</html>