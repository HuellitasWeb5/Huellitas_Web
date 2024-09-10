<%@ page import="clases.FormularioDeInformacion" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Formulario de Información para Adopción</title>
    <script>
        function validarFormulario() {
            // Validar campos importantes antes de enviar
            var fecha = document.getElementById("fecha").value;
            var ocupacion = document.getElementById("ocupacion").value;
            var codigoAdopcion = document.getElementById("codigoAdopcion").value;

            if (fecha === "" || ocupacion === "" || codigoAdopcion === "") {
                alert("Por favor, complete los campos obligatorios.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>

<%
    // Obtenemos los parámetros si se están enviando desde el formulario
    String accion = request.getParameter("accion");
    FormularioDeInformacion formulario = new FormularioDeInformacion();

    if ("grabar".equals(accion)) {
        formulario.setFecha(Date.valueOf(request.getParameter("fecha")));
        formulario.setOcupacion(request.getParameter("ocupacion"));
        formulario.setTiempoLibre(request.getParameter("tiempoLibre"));
        formulario.setEspacio(request.getParameter("espacio"));
        formulario.setCompromiso(request.getParameter("compromiso"));
        formulario.setNinos(request.getParameter("ninos"));
        formulario.setHabitantes(request.getParameter("habitantes"));
        formulario.setResponsables(request.getParameter("responsables"));
        formulario.setOtrasMascotas(request.getParameter("otrasMascotas"));
        formulario.setPropietario(request.getParameter("propietario"));
        formulario.setMotivacion(request.getParameter("motivacion"));
        formulario.setDescripcion(request.getParameter("descripcion"));
        formulario.setCodigoAdopcion(Integer.parseInt(request.getParameter("codigoAdopcion")));

        if (formulario.grabar()) {
            out.println("<h3>Formulario guardado exitosamente.</h3>");
        } else {
            out.println("<h3>Error al guardar el formulario.</h3>");
        }
    }
%>

<h1>Formulario de Información para Adopción</h1>
<form method="post" action="formularioInformacion.jsp" onsubmit="return validarFormulario();">
    <input type="hidden" name="accion" value="grabar">

    <!-- Fecha -->
    <label for="fecha">Fecha:</label>
    <input type="date" id="fecha" name="fecha" required><br><br>

    <!-- Ocupación -->
    <label for="ocupacion">Ocupación del propietario:</label>
    <input type="text" id="ocupacion" name="ocupacion" maxlength="100" required><br><br>

    <!-- Tiempo libre (Sí o No) -->
    <label for="tiempoLibre">¿Tiene tiempo libre? (Sí/No):</label>
    <select id="tiempoLibre" name="tiempoLibre" required>
        <option value="Sí">Sí</option>
        <option value="No">No</option>
    </select><br><br>

    <!-- Espacio disponible (Sí o No) -->
    <label for="espacio">¿Tiene espacio disponible? (Sí/No):</label>
    <select id="espacio" name="espacio" required>
        <option value="Sí">Sí</option>
        <option value="No">No</option>
    </select><br><br>

    <!-- Compromiso (Sí o No) -->
    <label for="compromiso">¿Está comprometido? (Sí/No):</label>
    <select id="compromiso" name="compromiso" required>
        <option value="Sí">Sí</option>
        <option value="No">No</option>
    </select><br><br>

    <!-- Niños en casa (Número) -->
    <label for="ninos">Número de niños en casa:</label>
    <input type="number" id="ninos" name="ninos" min="0" required><br><br>

    <!-- Habitantes (Número) -->
    <label for="habitantes">Número de habitantes:</label>
    <input type="number" id="habitantes" name="habitantes" min="1" required><br><br>

    <!-- Responsables del animal (Número) -->
    <label for="responsables">Número de responsables del animal:</label>
    <input type="number" id="responsables" name="responsables" min="1" required><br><br>

    <!-- Otras mascotas (Sí o No) -->
    <label for="otrasMascotas">¿Tienen otras mascotas? (Sí/No):</label>
    <select id="otrasMascotas" name="otrasMascotas" required>
        <option value="Sí">Sí</option>
        <option value="No">No</option>
    </select><br><br>

    <!-- Propietario (Sí o No) -->
    <label for="propietario">¿Es propietario de la vivienda? (Sí/No):</label>
    <select id="propietario" name="propietario" required>
        <option value="Sí">Sí</option>
        <option value="No">No</option>
    </select><br><br>

    <!-- Motivación para adoptar -->
    <label for="motivacion">Motivación para adoptar:</label>
    <input type="text" id="motivacion" name="motivacion" maxlength="100" required><br><br>

    <!-- Descripción -->
    <label for="descripcion">Descripción del ambiente:</label>
    <textarea id="descripcion" name="descripcion" rows="5" cols="30" required></textarea><br><br>

    <!-- Código de adopción -->
    <label for="codigoAdopcion">Código de Adopción:</label>
    <input type="number" id="codigoAdopcion" name="codigoAdopcion" required><br><br>

    <button type="submit">Enviar</button>
</form>

</body>
</html>
