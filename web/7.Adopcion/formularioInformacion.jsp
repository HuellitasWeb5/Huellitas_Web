<%@ page import="clases.FormularioDeInformacion" %>
<%@ page import="java.sql.Date" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
    <head>
        <title>Formulario de Información para Adopción</title>
        <script>
            function validarFormulario() {
                var fecha = document.getElementById("fecha").value;
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

        <h1>Formulario de Información</h1>
        <form method="post" action="formularioInformacion.jsp" onsubmit="return validarFormulario();">
            <input type="hidden" name="accion" value="grabar">

            <!-- Fecha -->
            <label for="fecha">Fecha:</label>
            <input type="date" id="fecha" name="fecha" required><br><br>

            <!-- Ocupación -->
            <label for="ocupacion">¿ Cuál es su ocupación?</label>
            <input type="text" id="ocupacion" name="ocupacion" maxlength="100" required><br><br>

            <!-- Tiempo libre (Sí o No) -->
            <label for="tiempoLibre">¿Cuenta con tiempo de calidad para el cuidado de la mascota?</label>
            <fieldset>
                <input type="radio" id="tiempoLibreSi" name="tiempoLibre" value="si">
                <label for="tiempoLibreSi">Sí</label>
                <input type="radio" id="tiempoLibreNo" name="tiempoLibre" value="no">
                <label for="tiempoLibreNo">No</label>
            </fieldset>

            <!-- Espacio disponible (Sí o No) -->
            <label for="espacio">¿Cuenta con un espacio adecuado para el cuidado de la mascota?</label>
            <fieldset>
                <input type="radio" id="espacioSi" name="espacio" value="si">
                <label for="espacioSi">Sí</label>
                <input type="radio" id="espacioNo" name="espacio" value="no">
                <label for="espacioNo">No</label>
            </fieldset>

            <!-- Compromiso (Sí o No) -->
            <label for="compromiso">¿Está dispuesto a esterilizar a la mascota y proporcionarle atención medica regular?</label>
             <fieldset>
                <input type="radio" id="compromisoSi" name="compromiso" value="si">
                <label for="compromisoSi">Sí</label>
                <input type="radio" id="espacioNo" name="compromiso" value="no">
                <label for="compromisoNo">No</label>
            </fieldset>

            <!-- Niños en casa (Número) -->
            <label for="ninos">¿En el hogar viven niños?,¿Cuántos?</label>
            <input type="number" id="ninos" name="ninos" min="0" required><br><br>

            <!-- Habitantes (Número) -->
            <label for="habitantes">¿Cuántas personas conforman su hogar?</label>
            <input type="number" id="habitantes" name="habitantes" min="1" required><br><br>

            <!-- Responsables del animal (Número) -->
            <label for="responsables">¿Cuántas personas estarán al cuidado de la mascota?</label>
            <input type="number" id="responsables" name="responsables" min="1" required><br><br>

            <!-- Otras mascotas (Sí o No) -->
            <label for="otrasMascotas">¿Tiene otras mascotas a su cargo?</label>
             <fieldset>
                <input type="radio" id="otrasMascotasSi" name="otrasMascotas" value="si">
                <label for="otrasMascotasSi">Sí</label>
                <input type="radio" id="otrasMascotasNo" name="otrasMascotas" value="no">
                <label for="otrasMascotasNo">No</label>
            </fieldset>

            <!-- Propietario (Sí o No) -->
            <label for="propietario">¿Es propietario de la vivienda en la que  reside?</label>
            <fieldset>
                <input type="radio" id="propietarioSi" name="propietario" value="si">
                <label for="propietarioSi">Sí</label>
                <input type="radio" id="otrasMascotasNo" name="propietario" value="no">
                <label for="propietarioNo">No</label>
            </fieldset>

            <!-- Motivación para adoptar -->
            <label for="motivacion">¿Cuál es el motivo por el cuál  desea adoptar a la mascota?</label>
            <input type="text" id="motivacion" name="motivacion" maxlength="100" required><br><br>

            <!-- Descripción -->
            <label for="descripcion">Descripción adicional:</label>
            <textarea id="descripcion" name="descripcion" rows="5" cols="30" required></textarea><br><br>

            <!-- Código de adopción -->
            <label for="codigoAdopcion">Código de Adopción:</label>
            <input type="number" id="codigoAdopcion" name="codigoAdopcion" required><br><br>

            <button type="submit">Enviar</button>
        </form>

    </body>
</html>
