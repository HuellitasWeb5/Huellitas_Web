<%@ page import="clases.FormularioDeInformacion" %>
<%@ page import="java.sql.Date" %>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%
    String accion = request.getParameter("accion");
    String id = "Sin generar";

    if (accion.equals("Modificar")) {

    }
%>

<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
    </head>

    <body onload="cargarFecha()">
        <form action="/HuellitasWeb/principal.jsp?CONTENIDO=actualizarFormularioInfo.jsp" method="post" enctype="multipart/form-data">
            <div class="containerFormulario">
                <h1>FORMULARIO DE ADOPCIÓN</h1>
                <input type="hidden" name="accion" value="grabar">

                <!-- FECHA -->
                <div>Fecha actual: <span id="fecha"></span></div>

                <div class="contenedor-tarjetas">
                    <!-- Sección de SAN PATITAS (Adoptante) -->
                    <div class="tableDatos">
                        <h2>ADOPTANTE</h2>
                        <div class="datos-con-foto">
                            <div class="datos">
                                <label>Identificación:</label>
                                <input type="text" name="identificacion" id="identificacion" placeholder="Digite aquí la identificación del adoptante">
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
                                <input type="text" name="codigo" id="codigo" placeholder="Digite aquí el código de la mascota">
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

                <button class="btn-adicionar" type="button" onclick="abrirFormulario();">Agregar Otra Mascota</button><br>

                <!-- FORMULARIO  -->    

                <table  class="tableFormulario">

                    <!-- Ocupación -->

                    <label for="ocupacion">¿Cuál es su ocupación?</label>
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
                    <label for="compromiso">¿Está dispuesto a esterilizar a la mascota y proporcionarle atención médica regular?</label>
                    <fieldset>
                        <input type="radio" id="compromisoSi" name="compromiso" value="si">
                        <label for="compromisoSi">Sí</label>
                        <input type="radio" id="compromisoNo" name="compromiso" value="no">
                        <label for="compromisoNo">No</label>
                    </fieldset>

                    <!-- Niños en casa (Número) -->
                    <label for="ninos">¿En el hogar viven niños? ¿Cuántos?</label>
                    <input type="number" id="ninos" name="ninos" min="0" required placeholder="0"><br><br>

                    <!-- Habitantes (Número) -->
                    <label for="habitantes">¿Cuántas personas conforman su hogar?</label>
                    <input type="number" id="habitantes" name="habitantes" min="1" required placeholder="0"><br><br>

                    <!-- Responsables del animal (Número) -->
                    <label for="responsables">¿Cuántas personas estarán al cuidado de la mascota?</label>
                    <input type="number" id="responsables" name="responsables" min="1" required placeholder="0"><br><br>

                    <!-- Otras mascotas (Sí o No) -->
                    <label for="otrasMascotas">¿Tiene otras mascotas a su cargo?</label>
                    <fieldset>
                        <input type="radio" id="otrasMascotasSi" name="otrasMascotas" value="si">
                        <label for="otrasMascotasSi">Sí</label>
                        <input type="radio" id="otrasMascotasNo" name="otrasMascotas" value="no">
                        <label for="otrasMascotasNo">No</label>
                    </fieldset>

                    <!-- Propietario (Sí o No) -->
                    <label for="propietario">¿Es propietario de la vivienda en la que reside?</label>
                    <fieldset>
                        <input type="radio" id="propietarioSi" name="propietario" value="si">
                        <label for="propietarioSi">Sí</label>
                        <input type="radio" id="propietarioNo" name="propietario" value="no">
                        <label for="propietarioNo">No</label>
                    </fieldset>

                    <!-- Motivación para adoptar -->
                    <label for="motivacion">¿Cuál es el motivo por el cuál desea adoptar a la mascota?</label>
                    <input type="text" id="motivacion" name="motivacion" maxlength="100" required><br><br>

                    <!-- Campo para seleccionar días de la semana -->

                    <label for="horarioVisitaDias">Por favor, indíquenos los días en los que estaría disponible para recibir la visita de seguimiento con respecto al cuidado de la mascota:</label>
                    <br>
                    <div style="display: flex; gap: 25px;">
                        <label style="display: flex; align-items: center;"><input type="checkbox" name="horarioVisitaDias" value="Lunes"> Lunes</label>
                        <label style="display: flex; align-items: center;"><input type="checkbox" name="horarioVisitaDias" value="Martes"> Martes</label>
                        <label style="display: flex; align-items: center;"><input type="checkbox" name="horarioVisitaDias" value="Miércoles"> Miércoles</label>
                        <label style="display: flex; align-items: center;"><input type="checkbox" name="horarioVisitaDias" value="Jueves"> Jueves</label>
                        <label style="display: flex; align-items: center;"><input type="checkbox" name="horarioVisitaDias" value="Viernes"> Viernes</label>
                        <label style="display: flex; align-items: center;"><input type="checkbox" name="horarioVisitaDias" value="Sábado"> Sábado</label>
                        <label style="display: flex; align-items: center;"><input type="checkbox" name="horarioVisitaDias" value="Domingo"> Domingo</label>
                    </div>
                    <br>

                    <!-- Campo para seleccionar la hora con selector AM/PM -->
                    <label for="horarioVisitaHora">Selecciona la hora:</label>
                    <input type="text" id="horarioVisitaHora" name="horarioVisitaHora" placeholder="HH:MM" maxlength="5" style="width: 80px; text-align: center; margin-right: 20px; ">
                    <select id="horarioVisitaAmPm" name="horarioVisitaAmPm">
                        <option value="AM">AM</option>
                        <option value="PM">PM</option>
                    </select>

                    <!-- Campo para subir foto de la vivienda -->
                    <label for="fotoVivienda">Por favor, suba una foto del espacio donde vivirá la mascota (puede incluir foto de la cama, alimento o accesorios):</label>
                    <br><input type="file" id="fotoVivienda" name="fotoVivienda" accept="image/*, application/pdf" >
                    <br>

                    <!-- Campo para subir foto del recibo -->
                    <label for="fotoRecibo">Por favor, cargue una foto del recibo de servicios públicos de su vivienda (gas, energía o agua):</label>
                    <br><input type="file" id="fotoRecibo" name="fotoRecibo" accept="image/*, application/pdf">
                    <br>

                    <!-- Campo para subir foto de la cédula -->
                    <label for="fotoCedula">Por favor, cargue una foto de su cédula de ciudadanía:</label>
                    <br><input type="file" id="fotoCedula" name="fotoCedula" accept="image/*, application/pdf">
                    <br>

                    <!-- Descripción -->
                    <label for="descripcion">Descripción adicional:</label>
                    <br><textarea id="descripcion" name="descripcion" rows="4" cols="88" required></textarea><br><br>

                    <!-- Autorización -->
                    <div style="display: flex; align-items: center;">
                        <input type="checkbox" id="autorizacion" name="autorizacion" value="S" required>
                        <label for="autorizacion" style="margin-left: 8px;">Autorizo el uso de mis datos personales exclusivamente para fines relacionados con la adopción 
                            y el bienestar de la(s) mascota(s), en cumplimiento con la legislación vigente en materia de protección de datos.</label>
                    </div>
                    <br><br>

                </table>
                <div class="btn-container">

                    <input type="hidden" name="id" value="<%=id%>">
                    <input class="btn-adicionar"  type="submit" name="accion" value="<%=accion%>">
                    <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()">
                    </body>
                </div>

            </div>
        </form>
    </body>
    <div id="formulario" style="display:none;" title="Agregar nueva mascota">
        <form name="formularioMascota">
            <div class="tableDatos">
                <h2>MASCOTA</h2>
                <div class="datos-con-foto">
                    <div class="datos">
                        <label>Código:</label>
                        <input type="text" name="codigoFormulario" id="codigoFormulario">
                        <label>Nombre de la mascota:</label>
                        <input type="text" name="nombreMascotaFormulario" id="nombreMascotaFormulario">
                        <label>Fecha de nacimiento Aproximada:</label>
                        <input type="text" name="fechaNacimientoFormulario" id="fechaNacimientoFormulario">
                        <label>Género:</label>
                        <input type="text" name="generoFormulario" id="generoFormulario">
                        <label>Cuidados Especiales:</label>
                        <input type="text" name="cuidadosEspecialesFormulario" id="cuidadosEspecialesFormulario">
                    </div>
                    <div class="foto">
                        <img id="fotoMascotaPreviewFormulario" class="fotoPreview" src="" alt="Foto de la Mascota">
                    </div>
                </div>
            </div>
            <button class="btn-adicionar" type="button" onclick="agregarMascota();">Agregar</button>
            <button class="btn-eliminar" type="button" onclick="cerrarFormulario();">Cancelar</button>
        </form>
    </div>

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
                return "";  // Retorna cadena vacía si no es "h" o "m"
            }
        }

        // BUSCAR MASCOTA PRINCIPAL

        var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
        var vectorMascotas = new Array();
        for (var i = 0; i < mascotas.length; i++) {
            vectorMascotas[i] = mascotas[i][0]; // Asumiendo que el índice 0 contiene el código
        }

        // Autocompletar el código de la mascota
        $("#codigo").autocomplete({
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
        $('#codigo').change(function () {
            var codigo = this.value.trim();
            var indiceMascota = buscarMascota(codigo, 0);

            if (indiceMascota !== false) {
                var nombreMascota = mascotas[indiceMascota][1]; // Asumiendo que el nombre está en el índice 1
                var fechaNacimiento = mascotas[indiceMascota][6]; // Asumiendo que la fecha está en el índice 6
                var genero = mascotas[indiceMascota][2]; // Asumiendo que el género está en el índice 2
                var cuidadosEspeciales = mascotas[indiceMascota][5]; // Asumiendo que los cuidados están en el índice 5
                var foto = mascotas[indiceMascota][4]; // Asumiendo que la foto está en el índice 4

                // Llenar los campos del formulario
                document.getElementById("nombreMascota").value = nombreMascota;
                document.getElementById("fechaNacimiento").value = fechaNacimiento;
                document.getElementById("genero").value = mostrarGenero(genero);
                document.getElementById("cuidadosEspeciales").value = cuidadosEspeciales;
                document.getElementById("fotoMascotaPreview").src = foto;
            } else {
                // Limpiar los campos si no se encuentra la mascota
                document.getElementById("nombreMascota").value = '';
                document.getElementById("fechaNacimiento").value = '';
                document.getElementById("genero").value = '';
                document.getElementById("cuidadosEspeciales").value = '';
                document.getElementById("fotoMascotaPreview").src = '';
            }
        });

        // Función para agregar la nueva mascota a la tabla
        function agregarMascota() {
            // Obtener los datos de la mascota
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

            // Limpiar el formulario y cerrar el modal
            cerrarFormulario();
        }

        // Función para capturar todos los datos y enviarlos al servidor
        function actualizarTabla() {
            var formData = new FormData();

            // Capturar los datos del adoptante y mascota principal
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

            // Añadir las mascotas adicionales
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

        // Cargar la fecha actual
        function cargarFecha() {
            var fecha = new Date();
            var dia = String(fecha.getDate()).padStart(2, '0');
            var mes = String(fecha.getMonth() + 1).padStart(2, '0');
            var anio = fecha.getFullYear();
            document.getElementById('fecha').innerText = dia + '/' + mes + '/' + anio;
        }

        function agregarMascota() {
            // Obtener los valores ingresados en el formulario
            var codigo = document.getElementById("codigoFormulario").value;
            var nombreMascota = document.getElementById("nombreMascotaFormulario").value;
            var fechaNacimiento = document.getElementById("fechaNacimientoFormulario").value;
            var genero = document.getElementById("generoFormulario").value;
            var cuidadosEspeciales = document.getElementById("cuidadosEspecialesFormulario").value;

            // Validar que los campos requeridos no estén vacíos
            if (codigo === "" || nombreMascota === "" || fechaNacimiento === "" || genero === "") {
                alert("Por favor, complete todos los campos.");
                return;
            }

            // Crear el nuevo bloque HTML para la tarjeta de mascota
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

            // Insertar la nueva tarjeta en el contenedor de tarjetas
            $('.contenedor-tarjetas').append(nuevaTarjeta);

            // Cerrar el formulario y resetear los campos
            cerrarFormulario();
        }

        // BUSCAR MASCOTA FORMULARIO 

        var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
        var vectorMascotas = new Array();
        for (var i = 0; i < mascotas.length; i++) {
            vectorMascotas[i] = mascotas[i][0]; // Asumiendo que el índice 0 contiene el código
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
        }

        mentById('fecha').innerText = fechaFormateada;

    </script>
