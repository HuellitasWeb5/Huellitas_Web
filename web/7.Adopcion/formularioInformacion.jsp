
<%-- 
    Document   : FormularioInformacion
    Created on : 5/10/2024, 02:37:31 PM
    Author     : Luis Eraso
--%>

<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.FormularioDeInformacion"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
    <link rel="stylesheet" href="presentacion/style-Formularios.css" />
</head>
<%
    String accion = request.getParameter("accion");
    FormularioDeInformacion formularioDeInformacion = new FormularioDeInformacion();
    Mascota mascota = new Mascota();
    Persona persona = new Persona(formularioDeInformacion.getIdentificacionAdoptante());

%>  
<body onload="cargarFecha()">
    <h3><%=accion.toUpperCase()%> FORMULARIO DE ADOPCIÓN </h3>
    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp" enctype="multipart/form-data">
        <div  class="formulario-adopcion">
            <div>Fecha actual: <span id="fecha"></span></div>
            <div class="contenedor-tarjetas">

                <!-- Sección de SAN PATITAS (Adoptante) -->
                <div class="tableDatos">
                    <h2>ADOPTANTE</h2>
                    <div class="datos-con-foto">
                        <div class="datos">
                            <label>Identificación:</label>
                            <input type="text" name="identificacionAdoptante" id="identificacion" placeholder="Digite aquí la identificación del adoptante" required>
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
                            <img id="foto" class="fotoPreview" src="presentacion/clientes/<%= persona.getFoto()%>" alt="Foto de <%= persona.getNombre()%>" style="width: 100px; height: auto;">
                        </div>
                    </div>
                </div>

                <!-- Sección de MASCOTA -->
                <div class="tableDatos">
                    <h2>MASCOTA</h2>
                    <div class="datos-con-foto">
                        <div class="datos">
                            <label>Código:</label>
                            <input type="text" name="codigoMascotas" id="codigoMascotas" placeholder="Digite aquí el código de la mascota" required>
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
                            <img id="fotoMascota" class="fotoPreview" src="presentacion/mascota/<%= mascota.getFoto()%>" alt="Foto de <%= mascota.getNombre()%>" style="width: 100px; height: auto;">
                        </div>
                    </div>
                </div>
            </div>

            <div class="swiper-container">
                <div class="swiper-wrapper">
                </div>
                <div class="swiper-button-next"></div>
                <div class="swiper-button-prev"></div>
            </div> 
            <table>

                <button class="btn-adicionar" type="button" onclick="abrirFormulario();">Agregar Otra Mascota</button><br>

                <input type="hidden" name="fechaActual" id="fechaActual">
                <!-- FORMULARIO  -->  

                <label for="ocupacion">¿Cuál es su ocupación?</label>
                <input type="text" id="ocupacion" name="ocupacion" maxlength="100" required><br><br>

                <label for="tiempoLibre">¿Cuenta con tiempo de calidad para el cuidado de la mascota?</label>
                <fieldset>
                    <input type="radio" id="tiempoLibreSi" name="tiempoLibre" value="S" required>
                    <label for="tiempoLibreSi">Sí</label>
                    <input type="radio" id="tiempoLibreNo" name="tiempoLibre" value="N">
                    <label for="tiempoLibreNo">No</label>
                </fieldset>

                <label for="espacio">¿Cuenta con un espacio adecuado para el cuidado de la mascota?</label>
                <fieldset>
                    <input type="radio" id="espacioSi" name="espacio" value="S" required>
                    <label for="espacioSi">Sí</label>
                    <input type="radio" id="espacioNo" name="espacio" value="N">
                    <label for="espacioNo">No</label>
                </fieldset>

                <label for="compromiso">¿Está dispuesto a esterilizar a la mascota y proporcionarle atención médica regular?</label>
                <fieldset>
                    <input type="radio" id="compromisoSi" name="compromiso" value="S" required>
                    <label for="compromisoSi">Sí</label>
                    <input type="radio" id="compromisoNo" name="compromiso" value="N">
                    <label for="compromisoNo">No</label>
                </fieldset>

                <label for="ninos">¿En el hogar viven niños? ¿Cuántos?</label>
                <input type="number" id="ninos" name="ninos" min="0" required placeholder="Ingrese un valor numérico (Si la respuesta es negativa digite 0)"><br><br>

                <label for="habitantes">¿Cuántas personas conforman su hogar?</label>
                <input type="number" id="habitantes" name="habitantes" min="1" required placeholder="Ingrese un valor numérico"><br><br>

                <label for="responsables">¿Cuántas personas estarán al cuidado de la mascota?</label>
                <input type="number" id="responsables" name="responsables" min="1" required placeholder="Ingrese un valor numérico"><br><br>

                <label for="otrasMascotas">¿Tiene otras mascotas a su cargo?</label>
                <fieldset>
                    <input type="radio" id="otrasMascotasSi" name="otrasMascotas" value="S" required>
                    <label for="otrasMascotasSi">Sí</label>
                    <input type="radio" id="otrasMascotasNo" name="otrasMascotas" value="N">
                    <label for="otrasMascotasNo">No</label>
                </fieldset>


                <label for="propietario">¿Es propietario de la vivienda en la que reside?</label>
                <fieldset>
                    <input type="radio" id="propietarioSi" name="propietario" value="S" required>
                    <label for="propietarioSi">Sí</label>
                    <input type="radio" id="propietarioNo" name="propietario" value="N">
                    <label for="propietarioNo">No</label>
                </fieldset>

                <label for="motivacion">¿Cuál es el motivo por el cuál desea adoptar a la mascota?</label>
                <input type="text" id="motivacion" name="motivacion" maxlength="100" required><br><br>

                <label for="fechaVisitaDia">Por favor, indíquenos los días de la semana en los que estaría disponible para recibir la visita de seguimiento con respecto al cuidado de la mascota:</label>
                <div style="display: flex; gap: 45px;">
                    <br><label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Lunes"> Lunes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Martes"> Martes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Miercoles"> Miércoles</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Jueves"> Jueves</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Viernes"> Viernes</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Sabado"> Sábado</label>
                    <label style="display: flex; align-items: center;"><input type="checkbox" name="fechaVisitaDia" value="Domingo"> Domingo</label>
                </div>
                <input type="hidden" id="fechaVisitaDiaHidden" name="fechaVisitaDia">
                <p id="error-message" style="color: red; display: none;">Debe seleccionar al menos un día de la semana</p>
                <br>

                <label for="fechaVisitaHora">Selecciona la hora estimada para la visita:</label>
                <input type="time" id="fechaVisitaHora" name="fechaVisitaHora" style="width: 120px; text-align: center;" required><br>

                <label for="fotoCedula">Por favor, cargue una foto de su cédula de ciudadanía (ambos lados):</label>
                <br><input type="file" id="fotoCedula" name="fotoCedula" accept="image/*, application/pdf" required>
                <br>
                
                <label for="fotoRecibo">Por favor, cargue una foto del recibo de servicios públicos de su vivienda (gas, energía o agua):</label>
                <br><input type="file" id="fotoRecibo" name="fotoRecibo" accept="image/*, application/pdf" required>
                <br>

                <label for="fotoVivienda">(Opcional) Por favor, cargue una foto del espacio donde vivirá la mascota (puede incluir foto de la cama, alimento o accesorios):</label>
                <br><input type="file" id="fotoVivienda" name="fotoVivienda" accept="image/*, application/pdf">
                <br>

                <label for="descripcion">Descripción adicional:</label>
                <br><textarea id="descripcion" name="descripcion" rows="4" cols="88"></textarea><br><br>

                <div style="display: flex; align-items: center;">
                    <input type="checkbox" id="autorizacion" name="autorizacion" value="S" required>
                    <label for="autorizacion" style="margin-left: 8px;">Autorizo el uso de mis datos personales exclusivamente para fines relacionados con la adopción 
                        y el bienestar de la(s) mascota(s), en cumplimiento con la legislación vigente en materia de protección de datos.</label>
                </div>
                <br><br>

                <!-- Botones de envío -->
                <input class="btn-adicionar" type="submit" name="accion" value="<%=accion%>">
                <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()">

            </table>
            <input type="hidden" name="formularioInfo" id="formularioInfo" >
        </div>
    </form>
</body>
<div id="formulario" title="Adoptar mascota">
    <form name="formularioAdoptarMascota">
        <table class="tableDatos">
            <h2>MASCOTA</h2>
            <div class="datos-con-foto">
                <div class="datos">
                    <label>Código:</label>
                    <input type="hidden" name="codigosMascotas" id="codigosMascotas" value="">
                    <input type="text" name="codigoFormulario" id="codigoFormulario" placeholder="Digite aquí el código de la mascota" required>
                    <label>Nombre de la mascota:</label>
                    <input type="text" name="nombreMascota" id="nombreMascotaFormulario" readonly>
                    <label>Fecha de nacimiento Aproximada:</label>
                    <input type="text" name="fechaNacimiento" id="fechaNacimientoFormulario" readonly>
                    <label>Género:</label>
                    <input type="text" name="genero" id="generoFormulario" readonly>
                    <label>Cuidados Especiales:</label>
                    <input type="text" name="cuidadosEspeciales" id="cuidadosEspecialesFormulario" readonly>
                </div>
                <div class="foto">
                    <img id="fotoMascotaFormulario" class="fotoPreview" src="presentacion/mascota/<%= mascota.getFoto()%>" alt="Foto de <%= mascota.getNombre()%>" style="width: 100px; height: auto;">
                </div>
            </div>
        </table>
        <input class="btn-adicionar" type="button" value="Agregar" onclick="agregarMascota();">
        <input class="btn-eliminar" type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>    
</div>

<script>

// ADICIONAR LA NUEVA MASCOTA 

    function agregarMascota() {
        const codigoMascota = document.getElementById('codigoFormulario').value;
        const nombreMascota = document.getElementById('nombreMascotaFormulario').value;
        const fechaNacimiento = document.getElementById('fechaNacimientoFormulario').value;
        const genero = document.getElementById('generoFormulario').value;
        const cuidadosEspeciales = document.getElementById('cuidadosEspecialesFormulario').value;

        if (codigoMascota === '' || nombreMascota === '' || fechaNacimiento === '' || genero === '' || cuidadosEspeciales === '') {
            alert('Por favor, completa todos los campos antes de agregar la mascota.');
            return;
        }

        const formularioInfo = document.getElementById('formularioInfo');
        const codigosMascotas = document.getElementById('codigosMascotas');

        if (formularioInfo.value !== '') {
            formularioInfo.value += "||";
            codigosMascotas.value += "||";
        }

        const detallesMascota = codigoMascota + "|" + nombreMascota + "|" + fechaNacimiento + "|" + genero + "|" + cuidadosEspeciales;

        formularioInfo.value += detallesMascota;
        codigosMascotas.value += detallesMascota;
        cargarTablaMascotas();
        cerrarFormulario();
    }

    function cargarTablaMascotas() {
        var contenedor = document.querySelector('.swiper-wrapper');
        contenedor.innerHTML = '';
        var datos = document.getElementById('codigosMascotas').value;

        if (datos === '') {
            return;
        }
        var registros = datos.split('||');
        registros.forEach(function (registro, index) {
            var campos = registro.split('|');
            var tarjeta = document.createElement('div');
            tarjeta.classList.add('swiper-slide');

            var contenedorDatos = document.createElement('div');
            contenedorDatos.classList.add('tableDatos');

            var h2 = document.createElement('h2');
            h2.textContent = 'MASCOTA';

            var datosConFoto = document.createElement('div');
            datosConFoto.classList.add('datos-con-foto');

            var datos = document.createElement('div');
            datos.classList.add('datos');

            var labelCodigo = document.createElement('label');
            labelCodigo.textContent = 'Código:';
            var inputCodigo = document.createElement('input');
            inputCodigo.type = 'text';
            inputCodigo.name = 'codigoMascota';
            inputCodigo.id = 'codigoMascota' + index;
            inputCodigo.value = campos[0];
            inputCodigo.readOnly = true;

            var labelNombre = document.createElement('label');
            labelNombre.textContent = 'Nombre de la mascota:';
            var inputNombre = document.createElement('input');
            inputNombre.type = 'text';
            inputNombre.name = 'nombreMascota';
            inputNombre.id = 'nombreMascota' + index;
            inputNombre.value = campos[1];
            inputNombre.readOnly = true;

            var labelFechaNacimiento = document.createElement('label');
            labelFechaNacimiento.textContent = 'Fecha de nacimiento Aproximada:';
            var inputFechaNacimiento = document.createElement('input');
            inputFechaNacimiento.type = 'text';
            inputFechaNacimiento.name = 'fechaNacimiento';
            inputFechaNacimiento.id = 'fechaNacimiento' + index;
            inputFechaNacimiento.value = campos[2];
            inputFechaNacimiento.readOnly = true;

            var labelGenero = document.createElement('label');
            labelGenero.textContent = 'Género:';
            var inputGenero = document.createElement('input');
            inputGenero.type = 'text';
            inputGenero.name = 'genero';
            inputGenero.id = 'genero' + index;
            inputGenero.value = campos[3];
            inputGenero.readOnly = true;

            var labelCuidadosEspeciales = document.createElement('label');
            labelCuidadosEspeciales.textContent = 'Cuidados Especiales:';
            var inputCuidadosEspeciales = document.createElement('input');
            inputCuidadosEspeciales.type = 'text';
            inputCuidadosEspeciales.name = 'cuidadosEspeciales';
            inputCuidadosEspeciales.id = 'cuidadosEspeciales' + index;
            inputCuidadosEspeciales.value = campos[4];
            inputCuidadosEspeciales.readOnly = true;

            var fotoContenedor = document.createElement('div');
            fotoContenedor.classList.add('foto');

            var fotoElemento = document.createElement('img');
            fotoElemento.id = 'foto' + index;
            fotoElemento.classList.add('fotoPreview');
            fotoElemento.src = campos[5];
            fotoElemento.alt = 'Foto de la mascota';
            fotoElemento.style.width = '100px';
            fotoElemento.style.height = 'auto';

            fotoContenedor.appendChild(fotoElemento);

            // Botón para eliminar la mascota

            var botonEliminar = document.createElement('button');
            botonEliminar.textContent = 'Eliminar';
            botonEliminar.className = 'btn-eliminar';
            botonEliminar.onclick = function () {
                eliminarMascota(index);
            };

            datos.appendChild(labelCodigo);
            datos.appendChild(inputCodigo);

            datos.appendChild(labelNombre);
            datos.appendChild(inputNombre);

            datos.appendChild(labelFechaNacimiento);
            datos.appendChild(inputFechaNacimiento);

            datos.appendChild(labelGenero);
            datos.appendChild(inputGenero);

            datos.appendChild(labelCuidadosEspeciales);
            datos.appendChild(inputCuidadosEspeciales);

            datos.appendChild(botonEliminar);

            datosConFoto.appendChild(datos);
            datosConFoto.appendChild(fotoContenedor);

            contenedorDatos.appendChild(h2);
            contenedorDatos.appendChild(datosConFoto);

            tarjeta.appendChild(contenedorDatos);
            contenedor.appendChild(tarjeta);
        });
    }

    // BUSCAR PERSONA

    var personas = <%=Persona.getListaEnArreglosJS("tipo='C'", null)%>;
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
        var identificacion = this.value.trim();
        var indicePersona = buscarPersona(identificacion, 0);

        if (indicePersona !== false) {
            var nombre = personas[indicePersona][1];
            var telefono = personas[indicePersona][2];
            var direccion = personas[indicePersona][3];
            var residencia = personas[indicePersona][4];
            var foto = personas[indicePersona][6];

            document.getElementById("nombre").value = nombre;
            document.getElementById("telefono").value = telefono;
            document.getElementById("direccion").value = direccion;
            document.getElementById("residencia").value = residencia;
            document.getElementById("fotoPreview").src = foto;
        } else {
            document.getElementById("nombre").value = '';
            document.getElementById("telefono").value = '';
            document.getElementById("direccion").value = '';
            document.getElementById("residencia").value = '';
            document.getElementById("fotoPreview").src = '';
        }
    });

    // MOSTRAR GENERO MASCOTA

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

    var mascotas = <%=Mascota.getListaCompletaEnArregloJS("estado<>'adoptado'", null)%>;
    var vectorMascotas = new Array();
    for (var i = 0; i < mascotas.length; i++) {
        vectorMascotas[i] = mascotas[i][0];
    }

    $("#codigoMascotas").autocomplete({
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

    $('#codigoMascotas').change(function () {
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
            document.getElementById("fotoPreview").src = foto;
        } else {
            document.getElementById("nombreMascota").value = '';
            document.getElementById("fechaNacimiento").value = '';
            document.getElementById("genero").value = '';
            document.getElementById("cuidadosEspeciales").value = '';
            document.getElementById("fotoPreview").src = '';
        }
    });

    function limpiarCamposFormulario() {
        document.getElementById("nombreMascota").value = '';
        document.getElementById("fechaNacimiento").value = '';
        document.getElementById("genero").value = '';
        document.getElementById("cuidadosEspeciales").value = '';
        document.getElementById("fotoPreview").src = '';
    }

    // BUSCAR MASCOTA FORMULARIO 

    var mascotas = <%=Mascota.getListaCompletaEnArregloJS("estado<>'adoptado'", null)%>;
    var vectorMascotas = new Array();
    for (var i = 0; i < mascotas.length; i++) {
        vectorMascotas[i] = mascotas[i][0];
    }
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

    $('#codigoFormulario').change(function () {
        var codigo = this.value.trim();
        var indiceMascota = buscarMascota(codigo, 0);

        if (indiceMascota !== false) {
            var nombreMascota = mascotas[indiceMascota][1];
            var fechaNacimiento = mascotas[indiceMascota][6];
            var genero = mascotas[indiceMascota][2];
            var cuidadosEspeciales = mascotas[indiceMascota][5];
            var foto = mascotas[indiceMascota][4];

            document.getElementById("nombreMascotaFormulario").value = nombreMascota;
            document.getElementById("fechaNacimientoFormulario").value = fechaNacimiento;
            document.getElementById("generoFormulario").value = mostrarGenero(genero);
            document.getElementById("cuidadosEspecialesFormulario").value = cuidadosEspeciales;
            document.getElementById("fotoPreview").src = "presentacion/mascota/" + foto;
        } else {
            document.getElementById("nombreMascotaFormulario").value = '';
            document.getElementById("fechaNacimientoFormulario").value = '';
            document.getElementById("generoFormulario").value = '';
            document.getElementById("cuidadosEspecialesFormulario").value = '';
            document.getElementById("fotoPreview").src = '';
        }
    });

    function limpiarCamposFormulario() {
        document.getElementById("nombreMascotaFormulario").value = '';
        document.getElementById("fechaNacimientoFormulario").value = '';
        document.getElementById("generoFormulario").value = '';
        document.getElementById("cuidadosEspecialesFormulario").value = '';
        document.getElementById("fotoPreview").src = '';
    }

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

    // ELIMINAR MASCOTA 

    function eliminarMascota(index) {
        var codigosMascotas = document.getElementById('codigosMascotas');
        var registros = codigosMascotas.value.split('||');

        if (index >= 0 && index < registros.length) {
            registros.splice(index, 1);
        }
        var nuevosDatos = registros.join('||');
        codigosMascotas.value = nuevosDatos;
        document.getElementById('formularioInfo').value = nuevosDatos;
        cargarTablaMascotas();
    }

    // VALIDAR DATOS

    function validarFormulario(event) {
        const checkboxes = document.querySelectorAll('input[name="fechaVisitaDia"]:checked');
        const errorMessage = document.getElementById('error-message');
        if (checkboxes.length === 0) {
            errorMessage.style.display = 'block';
            event.preventDefault();
        } else {
            errorMessage.style.display = 'none';
        }
    }
    document.querySelector('form').addEventListener('submit', validarFormulario);

    // AGREGAR MÁS DÍAS AL SELECCIONAR 

    function actualizarDiasVisita() {
        const checkboxes = document.querySelectorAll('input[name="fechaVisitaDia"]:checked');
        let valoresSeleccionados = [];
        checkboxes.forEach(checkbox => {
            valoresSeleccionados.push(checkbox.value);
        });
        document.getElementById('fechaVisitaDiaHidden').value = valoresSeleccionados.join('|');
    }
    document.querySelectorAll('input[name="fechaVisitaDia"]').forEach(checkbox => {
        checkbox.addEventListener('change', actualizarDiasVisita);
    });

    // ABRIR FORMULARIO

    function abrirFormulario() {
        $('#formulario').dialog('open');
    }

    // CERRAR FORMULARIO

    function cerrarFormulario() {
        $('#formularioAdoptarMascota input').val('');
        $('#formulario').dialog('close');
        document.getElementById('codigoFormulario').value = '';
        document.getElementById('nombreMascotaFormulario').value = '';
        document.getElementById('fechaNacimientoFormulario').value = '';
        document.getElementById('generoFormulario').value = '';
        document.getElementById('cuidadosEspecialesFormulario').value = '';
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
    const swiper = new Swiper('.swiper-container', {
        loop: false,
        slidesPerView: 2,
        spaceBetween: 20,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        }
    });
</script>