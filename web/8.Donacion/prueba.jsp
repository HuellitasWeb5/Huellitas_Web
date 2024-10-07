<%--
    Document   : agendacionFormulario
    Created on : 4/09/2024, 02:41:00 PM
    Author     : DELL
--%>


<%@page import="clases.Persona"%>
<%@page import="java.util.List"%>
<%
    String accion = request.getParameter("accion");
    String idCita = "Sin generar";
    Citas cita = new Citas();
    Persona persona = new Persona();
    Especialidad especialidad = new Especialidad();

    if (accion.equals("Modificar")) {
        cita = new Citas(idCita);
        persona = cita.getPersona();
    }
%>
<h3><%=accion.toUpperCase()%> CITAS</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=agendacionCitas/agendacionActualizar.jsp">
    <input type="hidden" name="accion" value="Adicionar">
    <table border="0">
        <tr><th>Id</th><td>Sin generar</td></tr>
        <tr>
            <th>Identificación</th>
            <td><input type="text" name="identificacion" id="identificacion" maxlength="12" required></td>
        </tr>
        <tr>
            <th>Nombres</th>
            <td><input type="text" name="nombres" id="nombres" size="50" maxlength="50"></td>
        </tr>
        <tr>
            <th>Apellidos</th>
            <td><input type="text" name="apellidos" id="apellidos" size="50" maxlength="50"></td>
        </tr>
        <tr>
            <th>Teléfono</th>
            <td><input type="tel" name="telefono" id="telefono" maxlength="12"></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><input type="email" name="email" id="email" maxlength="80" required></td>
        </tr>
        <tr>
            <th>Fecha</th>
            <td>
                <input type="date" name="fechaHora" id="fechaHora" title="Seleccione el día específico de su cita" required>
            </td>
        </tr>
        <tr>
            <th>Especialidad</th>
            <td>
                <select name="especialidad" id="especialidad" required onchange="filtrarUsuariosHorarios()">
                   
                    <%=especialidad.getListaEnOptions(null)%>
                </select>
                <select name="usuario" id="usuario" required></select>
            </td>
        </tr>
        <tr>
            <th>Estado</th>
            <td>
                <select name="estado" id="estado" required>
                    <option value="activa">Activa</option>
                    <option value="pendiente">Pendiente</option>
                </select>
            </td>
        </tr>
    </table>

    <input type="submit" name="accion" value="Confirmar Cita">
    <input type="button" value="Cancelar" onClick="window.history.back()">
</form>


<div id="calendario" style="margin-top: 20px;">
    <h4>Horarios Disponibles</h4>
    <div id="fechaSeleccionada" style="font-weight: bold; margin-bottom: 10px;"></div> <!-- Display formatted date -->
    <div id="horaSeleccionada" style="font-weight: bold; margin-top: 10px;"></div> <!-- New element for selected time -->
    <table id="tablaHorarios" border="1">
        <thead>
            <tr>
                <th>Día</th>
                <th>Inicio</th>
                <th>Fin</th>
                <th>Seleccionar</th>
            </tr>
        </thead>
        <tbody>
            <!-- Aquí se cargarán los horarios disponibles -->
        </tbody>
    </table>
</div>


<script type="text/javascript">

    $(document).ready(function () {
        // Autocompletar en el campo de identificación
        $("#identificacion").autocomplete({
            source: personas,
            select: function (event, ui) {
                var persona = ui.item;
                $("#nombres").val(persona.nombres).prop('readonly', true).addClass('readonly');
                $("#apellidos").val(persona.apellidos).prop('readonly', true).addClass('readonly');
                $("#telefono").val(persona.telefono).prop('readonly', true).addClass('readonly');
                $("#email").val(persona.email).prop('readonly', true).addClass('readonly');
            }
        });

        // Cuando se selecciona una fecha
        $("#fechaHora").change(function () {
            var fechaSeleccionada = new Date($(this).val());
            fechaSeleccionada.setDate(fechaSeleccionada.getDate() + 1);
            var opciones = {month: 'long', day: 'numeric'};
            var fechaFormateada = fechaSeleccionada.toLocaleDateString('es-ES', opciones);
            $("#fechaSeleccionada").text(fechaFormateada);
            cargarHorarios(); // Cargar horarios después de seleccionar la fecha
        });
    });



    // Filtrar odontólogos según la especialidad
    function filtrarUsuariosHorarios() {
        var especialidadId = $("#especialidad").val();
        $.ajax({
            url: 'UsuarioServlet',
            type: 'GET',
            data: {especialidad: especialidadId},
            success: function (data) {
                var options = "<option value=''>Seleccione un usuario</option>";
                $.each(data, function (index, usuario) {
                    options += "<option value='" + usuario.identificacion + "'>" + usuario.nombres + "</option>";
                });
                $("#usuario").html(options);
                // Llamar a cargar horarios si ya hay un usuario seleccionado
                $("#usuario").change();
            },
            error: function () {
                alert("Error al cargar usuarios.");
            }
        });
    }

    // Cargar horarios disponibles cuando se selecciona un usuario
    $("#usuario").change(function () {
        var usuarioId = $(this).val();
        if (usuarioId) {
            cargarHorarios(usuarioId);
        } else {
            $("#tablaHorarios tbody").empty(); // Limpiar la tabla si no hay usuario seleccionado
        }
    });

    function cargarHorarios(usuarioId) {
        $.ajax({
            url: 'UsuarioServlet',
            type: 'GET',
            data: {odontologo: usuarioId},
            success: function (data) {
                var rows = '';
                $.each(data, function (index, horario) {
                    rows += '<tr>' +
                            '<td>' + horario.dia + '</td>' +
                            '<td>' + horario.inicio + '</td>' +
                            '<td>' + horario.fin + '</td>' +
                            '<td><input type="radio" name="horarioSeleccionado" value="' + horario.dia + ' ' + horario.inicio + ' - ' + horario.fin + '" class="horario-radio"></td>' +
                            '</tr>';
                });
                $("#tablaHorarios tbody").html(rows);

                // Attach event listener to the newly created radio buttons
                $(".horario-radio").change(function () {
                    // Get the selected value
                    var selectedHorario = $(this).val();
                    // Display the selected date and time in the new element
                    $("#horaSeleccionada").text("Fecha y Hora Seleccionada: " + selectedHorario);
                });
            },
            error: function () {
                alert("Error al cargar horarios.");
            }
        });
    }
</script>