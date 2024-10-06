<%-- 
    Document   : FormularioInformacion
    Created on : 5/10/2024, 02:37:31 PM
    Author     : Luis Eraso
--%>

<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>
<%
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    FormularioDeInformacion formularioDeInformacion = new FormularioDeInformacion();

%>  
<body onload="cargarFecha()">
    <h3><%=accion.toUpperCase()%> ADOPCIONES </h3>
    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp" enctype="multipart/form-data">
        <div class="containerFormulario">
            <div>Fecha actual: <span id="fecha"></span></div>
            <div class="contenedor-tarjetas">

                <!-- Sección de SAN PATITAS (Adoptante) -->
                <div class="tableDatos">
                    <h2>ADOPTANTE</h2>
                    <div class="datos-con-foto">
                        <div class="datos">
                            <label>Identificación:</label>
                            <input type="text" name="identificacionAdoptante" id="identificacion" placeholder="Digite aquí la identificación del adoptante">
                            <label>Nombre del Adoptante</label>
                            <input type="text" name="nombre" id="nombre" readonly>
                            <label>Teléfono</label>
                            <input type="text" name="telefono" id="telefono" readonly>
                            <label>Dirección</label>
                            <input type="text" name="direccion" id="direccion" readonly>
                            <label>Residencia</label>
                            <input type="text" name="residencia" id="residencia" readonly>
                        </div>
                        <div class="foto">
                            <img id="fotoClientePreview" class="fotoPreview" src="" alt="Foto del Cliente">
                        </div>
                    </div>
                </div>

                <!-- Sección de MASCOTA -->
                <div class="tableDatos">
                    <h2>MASCOTA</h2>
                    <div class="datos-con-foto">
                        <div class="datos">
                            <label>Código:</label>
                            <input type="hidden" name="codigosMascotas" id="codigosMascotas" value="">
                            <input type="text" name="codigoMascota" id="codigoMascota" placeholder="Digite aquí el código de la mascota">
                            <label>Nombre de la mascota:</label>
                            <input type="text" name="nombreMascota" id="nombreMascota" readonly>
                            <label>Fecha de nacimiento Aproximada:</label>
                            <input type="text" name="fechaNacimiento" id="fechaNacimiento" readonly>
                            <label>Género:</label>
                            <input type="text" name="genero" id="genero" readonly>
                            <label>Cuidados Especiales:</label>
                            <input type="text" name="cuidadosEspeciales" id="cuidadosEspeciales" readonly>
                        </div>
                        <div class="foto">
                            <img id="fotoMascotaPreview" class="fotoPreview" src="" alt="Foto de la Mascota">
                        </div>
                    </div>
                </div>
            </div>
            <table>
                <input type="hidden" name="fechaActual" id="fechaActual">
                <label for="ocupacion">¿Cuál es su ocupación?</label>
                <input type="text" id="ocupacion" name="ocupacion" maxlength="100" required><br><br>

                <label for="tiempoLibre">¿Cuenta con tiempo de calidad para el cuidado de la mascota?</label>
                <fieldset>
                    <input type="radio" id="tiempoLibreSi" name="tiempoLibre" value="S">
                    <label for="tiempoLibreSi">Sí</label>
                    <input type="radio" id="tiempoLibreNo" name="tiempoLibre" value="N">
                    <label for="tiempoLibreNo">No</label>
                </fieldset>

                <label for="espacio">¿Cuenta con un espacio adecuado para el cuidado de la mascota?</label>
                <fieldset>
                    <input type="radio" id="espacioSi" name="espacio" value="S">
                    <label for="espacioSi">Sí</label>
                    <input type="radio" id="espacioNo" name="espacio" value="N">
                    <label for="espacioNo">No</label>
                </fieldset>

                <label for="compromiso">¿Está dispuesto a esterilizar a la mascota y proporcionarle atención médica regular?</label>
                <fieldset>
                    <input type="radio" id="compromisoSi" name="compromiso" value="S">
                    <label for="compromisoSi">Sí</label>
                    <input type="radio" id="compromisoNo" name="compromiso" value="N">
                    <label for="compromisoNo">No</label>
                </fieldset>

                <label for="ninos">¿En el hogar viven niños? ¿Cuántos?</label>
                <input type="number" id="ninos" name="ninos" min="0" required placeholder="0"><br><br>

                <label for="habitantes">¿Cuántas personas conforman su hogar?</label>
                <input type="number" id="habitantes" name="habitantes" min="1" required placeholder="0"><br><br>

                <label for="responsables">¿Cuántas personas estarán al cuidado de la mascota?</label>
                <input type="number" id="responsables" name="responsables" min="1" required placeholder="0"><br><br>

                <label for="otrasMascotas">¿Tiene otras mascotas a su cargo?</label>
                <fieldset>
                    <input type="radio" id="otrasMascotasSi" name="otrasMascotas" value="S">
                    <label for="otrasMascotasSi">Sí</label>
                    <input type="radio" id="otrasMascotasNo" name="otrasMascotas" value="N">
                    <label for="otrasMascotasNo">No</label>
                </fieldset>

                <label for="propietario">¿Es propietario de la vivienda en la que reside?</label>
                <fieldset>
                    <input type="radio" id="propietarioSi" name="propietario" value="S">
                    <label for="propietarioSi">Sí</label>
                    <input type="radio" id="propietarioNo" name="propietario" value="N">
                    <label for="propietarioNo">No</label>
                </fieldset>

                <label for="motivacion">¿Cuál es el motivo por el cuál desea adoptar a la mascota?</label>
                <input type="text" id="motivacion" name="motivacion" maxlength="100" required><br><br>

                <label for="fechaVisitaDia">Por favor, indíquenos los días en los que estaría disponible para recibir la visita de seguimiento con respecto al cuidado de la mascota:</label>
                <br>
                <div style="display: flex; gap: 25px;">
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Lunes"> Lunes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Martes"> Martes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Miercoles"> Miércoles</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Jueves"> Jueves</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Viernes"> Viernes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Sabado"> Sábado</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Domingo"> Domingo</label>
                </div>
                <br>

                <label for="fechaVisitaHora">Selecciona la hora estimada de visita:</label>
                <input type="time" id="fechaVisitaHora" name="fechaVisitaHora" style="width: 120px; text-align: center;">

                <label for="fotoVivienda">Por favor, suba una foto del espacio donde vivirá la mascota (puede incluir foto de la cama, alimento o accesorios):</label>
                <br><input type="file" id="fotoVivienda" name="fotoVivienda" accept="image/*, application/pdf" >
                <br>

                <label for="fotoRecibo">Por favor, cargue una foto del recibo de servicios públicos de su vivienda (gas, energía o agua):</label>
                <br><input type="file" id="fotoRecibo" name="fotoRecibo" accept="image/*, application/pdf">
                <br>

                <label for="fotoCedula">Por favor, cargue una foto de su cédula de ciudadanía:</label>
                <br><input type="file" id="fotoCedula" name="fotoCedula" accept="image/*, application/pdf">
                <br>

                <label for="descripcion">Descripción adicional:</label>
                <br><textarea id="descripcion" name="descripcion" rows="4" cols="88" required></textarea><br><br>

                <div style="display: flex; align-items: center;">
                    <input type="checkbox" id="autorizacion" name="autorizacion" value="S" required>
                    <label for="autorizacion" style="margin-left: 8px;">Autorizo el uso de mis datos personales exclusivamente para fines relacionados con la adopción 
                        y el bienestar de la(s) mascota(s), en cumplimiento con la legislación vigente en materia de protección de datos.</label>
                </div>
                <br><br>

                <input type="submit" name="accion" value="<%=accion%>">



            </table>
        </div>
    </form>
</body>
<script>

    // BUSCAR PERSONA

    var personas = <%=Persona.getListaEnArreglosJS(null, null)%>;
    var vectorPersonas = new Array();
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0];
    }
    $("#identificacion").autocomplete({
        source: vectorPersonas
    });
    function buscarPersona(valor, indice) {
        encontrado = false;
        i = 0;
        while (!encontrado) {
            if (valor == personas[i][indice])
                encontrado = true;
            i++;
        }
        if (encontrado)
            return i - 1;
        else
            return false;
    }
    $('#identificacion').change(function () {
        identificacion = this.value.trim();
        indicePersona = buscarPersona(identificacion, 0);
        nombre = personas[indicePersona][1];
        telefono = personas[indicePersona][2];
        direccion = personas[indicePersona][3];
        residencia = personas[indicePersona][4];
        foto = personas[indicePersona][6];
        document.getElementById("nombre").innerHTML = nombre;
        document.getElementById("telefono").innerHTML = telefono;
        document.getElementById("direccion").innerHTML = direccion;
        document.getElementById("residencia").innerHTML = residencia;
        document.getElementById("fotoClientePreview").src = foto;
    });

    function mostrarGenero(genero) {
        if (genero && genero.toLowerCase() === "h") {
            return "Hembra";
        } else if (genero && genero.toLowerCase() === "m") {
            return "Macho";
        } else {
            return "";
        }
    }

    // BUSCAR MASCOTA PRINCIPAL

    var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
    var vectorMascotas = new Array();
    for (var i = 0; i < mascotas.length; i++) {
        vectorMascotas[i] = mascotas[i][0];
    }

    $("#codigoMascota").autocomplete({
        source: vectorMascotas
    });

    function buscarMascota(valor, indice) {
        encontrado = false;
        i = 0;
        while (!encontrado && i < mascotas.length) {
            if (valor == mascotas[i][indice])
                encontrado = true;
            i++;
        }
        if (encontrado)
            return i - 1;
        else
            return false;
    }

    $('#codigoMascota').change(function () {
        var codigo = this.value.trim();
        var indiceMascota = buscarMascota(codigo, 0);

        if (indiceMascota !== false) {
            var nombreMascota = mascotas[indiceMascota][1];
            var fechaNacimiento = mascotas[indiceMascota][6];
            var genero = mascotas[indiceMascota][2];
            var cuidadosEspeciales = mascotas[indiceMascota][5];
            var foto = mascotas[indiceMascota][4];

            document.getElementById("nombreMascota").value = nombreMascota;
            document.getElementById("fechaNacimiento").value = fechaNacimiento;
            document.getElementById("genero").value = mostrarGenero(genero);
            document.getElementById("cuidadosEspeciales").value = cuidadosEspeciales;
            document.getElementById("fotoMascotaPreview").src = foto;
        } else {

            document.getElementById("nombreMascota").value = '';
            document.getElementById("fechaNacimiento").value = '';
            document.getElementById("genero").value = '';
            document.getElementById("cuidadosEspeciales").value = '';
            document.getElementById("fotoMascotaPreview").src = '';
        }
    });

    function agregarMascota() {

        var codigo = document.getElementById("codigoFormulario").value;
        var nombre = document.getElementById("nombreMascotaFormulario").value;
        var edad = document.getElementById("fechaNacimientoFormulario").value;
        var genero = document.getElementById("generoFormulario").value;
        var cuidados = document.getElementById("cuidadosEspecialesFormulario").value;

        // Agregar la nueva mascota a la tabla
        var nuevaMascota = `
                   <tr>
                       <td>${codigo}</td>
                       <td>${nombre}</td>
                       <td>${edad}</td>
                       <td>${genero}</td>
                       <td>${cuidados}</td>
                   </tr>
               `;
        document.querySelector("#tablaMascotas tbody").innerHTML += nuevaMascota;

        cerrarFormulario();
    }

    function actualizarTabla() {
        var formData = new FormData();

        formData.append("identificacion", document.getElementById("identificacion").value);
        formData.append("nombreAdoptante", document.getElementById("nombre").value);
        formData.append("telefono", document.getElementById("telefono").value);
        formData.append("direccion", document.getElementById("direccion").value);
        formData.append("residencia", document.getElementById("residencia").value);
        formData.append("codigoMascota", document.getElementById("codigo").value);
        formData.append("nombreMascota", document.getElementById("nombreMascota").value);
        formData.append("edadAproximada", document.getElementById("fechaNacimiento").value);
        formData.append("genero", document.getElementById("genero").value);
        formData.append("cuidadosEspeciales", document.getElementById("cuidadosEspeciales").value);

        var tablaMascotas = document.querySelectorAll("#tablaMascotas tbody tr");
        tablaMascotas.forEach((row, index) => {
            var columns = row.getElementsByTagName("td");
            formData.append(`mascotas[${index}][codigo]`, columns[0].innerText);
            formData.append(`mascotas[${index}][nombre]`, columns[1].innerText);
            formData.append(`mascotas[${index}][edad]`, columns[2].innerText);
            formData.append(`mascotas[${index}][genero]`, columns[3].innerText);
            formData.append(`mascotas[${index}][cuidados]`, columns[4].innerText);
        });

        // Enviar los datos al backend (AJAX)
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "ruta_al_backend", true);
        xhr.send(formData);

        xhr.onload = function () {
            if (xhr.status === 200) {
                alert("Datos guardados correctamente.");
            } else {
                alert("Error al guardar los datos.");
            }
        };
    }

    function agregarMascota() {
        // Obtener los valores ingresados en el formulario
        var codigo = document.getElementById("codigoFormulario").value;
        var nombreMascota = document.getElementById("nombreMascotaFormulario").value;
        var fechaNacimiento = document.getElementById("fechaNacimientoFormulario").value;
        var genero = document.getElementById("generoFormulario").value;
        var cuidadosEspeciales = document.getElementById("cuidadosEspecialesFormulario").value;

        if (codigo === "" || nombreMascota === "" || fechaNacimiento === "" || genero === "") {
            alert("Por favor, complete todos los campos.");
            return;
        }

        var nuevaTarjeta = "<div class='tableDatos'>" +
                "<h2>MASCOTA</h2>" +
                "<div class='datos-con-foto'>" +
                "<div class='datos'>" +
                "<label>Código:</label><input type='text' name='codigo' value='" + codigo + "' readonly>" +
                "<label>Nombre de la mascota:</label><input type='text' name='nombreMascota' value='" + nombreMascota + "' readonly>" +
                "<label>Fecha de nacimiento Aproximada:</label><input type='text' name='fechaNacimiento' value='" + fechaNacimiento + "' readonly>" +
                "<label>Género:</label><input type='text' name='genero' value='" + genero + "' readonly>" +
                "<label>Cuidados Especiales:</label><input type='text' name='cuidadosEspeciales' value='" + cuidadosEspeciales + "' readonly>" +
                "</div>" +
                "<div class='foto'>" +
                "<img id='fotoMascotaPreview' class='fotoPreview' src='' alt='Foto de la Mascota'>" +
                "</div>" +
                "</div>" +
                "</div>";

        $('.contenedor-tarjetas').append(nuevaTarjeta);

        cerrarFormulario();
    }

    // BUSCAR MASCOTA FORMULARIO 

    var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
    var vectorMascotas = new Array();
    for (var i = 0; i < mascotas.length; i++) {
        vectorMascotas[i] = mascotas[i][0];
    }

    // Autocompletar el código de la mascota
    $("#codigoFormulario").autocomplete({
        source: vectorMascotas
    });

    function buscarMascota(valor, indice) {
        encontrado = false;
        i = 0;
        while (!encontrado && i < mascotas.length) {
            if (valor == mascotas[i][indice])
                encontrado = true;
            i++;
        }
        if (encontrado)
            return i - 1;
        else
            return false;
    }

    // Evento que se dispara cuando el código de la mascota cambia
    $('#codigoFormulario').change(function () {
        var codigo = this.value.trim();
        var indiceMascota = buscarMascota(codigo, 0);

        if (indiceMascota !== false) {
            var nombreMascota = mascotas[indiceMascota][1]; // Asumiendo que el nombre está en el índice 1
            var fechaNacimiento = mascotas[indiceMascota][6]; // Asumiendo que la fecha está en el índice 6
            var genero = mascotas[indiceMascota][2]; // Asumiendo que el género está en el índice 2
            var cuidadosEspeciales = mascotas[indiceMascota][5]; // Asumiendo que los cuidados están en el índice 5
            var foto = mascotas[indiceMascota][4]; // Asumiendo que la foto está en el índice 4

            // Llenar los campos del formulario
            document.getElementById("nombreMascotaFormulario").value = nombreMascota;
            document.getElementById("fechaNacimientoFormulario").value = fechaNacimiento;
            document.getElementById("generoFormulario").value = mostrarGenero(genero);


            document.getElementById("cuidadosEspecialesFormulario").value = cuidadosEspeciales;
            document.getElementById("fotoMascotaPreviewFormulario").src = foto;
        } else {
            // Limpiar los campos si no se encuentra la mascota
            document.getElementById("nombreMascotaFormulario").value = '';
            document.getElementById("fechaNacimientoFormulario").value = '';
            document.getElementById("generoFormulario").value = '';
            document.getElementById("cuidadosEspecialesFormulario").value = '';
            document.getElementById("fotoMascotaPreviewFormulario").src = '';
        }
    });

    // AGREGAR MASCOTA A LA ADOPCION

    $(function () {
        $("#formulario").dialog({
            autoOpen: false,
            show: {
                effect: "blind",
                duration: 1000
            },
            hide: {
                effect: "explode",
                duration: 1000
            },
            width: 600,
            height: 600
        });
    });
    function abrirFormulario() {
        $('#formulario').dialog('open');
    }

    // GRABAR L0S DATOS 



    $('#identificacion').change(function () {
        var identificacion = this.value.trim();
        var indicePersona = buscarPersona(identificacion, 0);

        if (indicePersona !== false) {
            var nombre = personas[indicePersona][1];
            var telefono = personas[indicePersona][2];
            var direccion = personas[indicePersona][3];
            var residencia = personas[indicePersona][4];
            var foto = personas[indicePersona][6];

            // Asignar valores a los inputs
            document.getElementById("nombre").value = nombre;
            document.getElementById("telefono").value = telefono;
            document.getElementById("direccion").value = direccion;
            document.getElementById("residencia").value = residencia;
            document.getElementById("fotoClientePreview").src = foto;
        } else {
            // Limpiar los campos si no se encuentra
            document.getElementById("nombre").value = '';
            document.getElementById("telefono").value = '';
            document.getElementById("direccion").value = '';
            document.getElementById("residencia").value = '';
            document.getElementById("fotoClientePreview").src = '';
        }
    });


    function cerrarFormulario() {
        // Cerrar el diálogo
        $('#formulario').dialog('close');

        // Limpiar los campos del formulario
        $('#formulario input[type="text"]').val(''); // Limpia todos los inputs de tipo text
    }

    // CARGAR FECHA
    function cargarFecha() {
        var fecha = new Date();
        var dia = String(fecha.getDate()).padStart(2, '0');
        var mes = String(fecha.getMonth() + 1).padStart(2, '0');
        var anio = fecha.getFullYear();
        var fechaActual = dia + '/' + mes + '/' + anio;
        document.getElementById('fecha').innerText = fechaActual;
        document.getElementById('fechaActual').value = anio + '-' + mes + '-' + dia;
    }

    document.addEventListener('DOMContentLoaded', function () {
        const checkboxes = document.querySelectorAll('input[name="horarioVisitaDias"]');
        const fechaVisitaDiaInput = document.getElementById('fechaVisitaDia');

        checkboxes.forEach(function (checkbox) {
            checkbox.addEventListener('change', function () {
                let diasSeleccionados = [];

                checkboxes.forEach(function (cb) {
                    if (cb.checked) {
                        diasSeleccionados.push(cb.value);
                    }
                });

                fechaVisitaDiaInput.value = diasSeleccionados.join(',');
            });
        });
    });

</script>