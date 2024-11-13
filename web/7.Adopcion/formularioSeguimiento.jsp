<%@ page import="clases.FormularioDeSeguimiento" %> 
<%@ page import="java.sql.Date" %>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Formularios.css" />
</head>

<%
    String accion = request.getParameter("accion");
    FormularioDeSeguimiento formularioDeSeguimiento = new FormularioDeSeguimiento();
    Mascota mascota = new Mascota();
    Persona persona = new Persona(formularioDeSeguimiento.getIdentificacionAdoptante());
%>  

<body onload="cargarFecha()">
    <h3><%=accion.toUpperCase()%> FORMULARIO DE SEGUIMIENTO </h3>
    <a href="formularioSeguimiento.jsp"></a>
    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioSeg.jsp" enctype="multipart/form-data">
        <div class="formulario-adopcion">
            <div class="fecha-contenedor">Fecha actual: <span class="fecha" id="fecha"></span></div>
            <div class="contenedor-tarjetas">

                <!-- Sección de SAN PATITAS (Adoptante) -->
                <div class="tableDatos">
                    <h4>ADOPTANTE</h4>
                    <div class="datos-con-foto">
                        <div class="datos">
                            <label>Identificación:</label>
                            <input type="text" name="identificacionAdoptante" id="identificacion" placeholder="Digite aquí la identificación del adoptante" class="custom-text-input2" required>
                            <label>Nombre del Adoptante</label>
                            <input type="text" name="nombre" id="nombre" class="custom-text-input2" readonly>
                            <label>Teléfono</label>
                            <input type="text" name="telefono" id="telefono" class="custom-text-input2" readonly>
                            <label>Dirección</label>
                            <input type="text" name="direccion" id="direccion" class="custom-text-input2" readonly>
                            <label>Residencia</label>
                            <input type="text" name="residencia" id="residencia" class="custom-text-input2" readonly>
                        </div>
                        <div class="foto">
                            <img id="foto" class="fotoPreview" src="presentacion/clientes/<%= persona.getFoto()%>" alt="Foto de <%= persona.getNombre()%>" style="width: 100px; height: 100px;">
                        </div>
                    </div>
                </div>

                <!-- Sección de MASCOTA -->
                <div class="tableDatos">
                    <h4>MASCOTA</h4>
                    <div class="datos-con-foto">
                        <div class="datos">
                            <label>Código:</label>
                            <input type="text" name="codigoMascota" id="codigoMascota" placeholder="Digite aquí el código de la mascota" class="custom-text-input2" required>
                            <label>Nombre de la mascota:</label>
                            <input type="text" name="nombreMascota" id="nombreMascota" placeholder="Digite aquí el nombre de la mascota" class="custom-text-input2">
                            <label>Fecha de nacimiento Aproximada:</label>
                            <input type="text" name="fechaNacimiento" id="fechaNacimiento" class="custom-text-input2" readonly>
                            <label>Género:</label>
                            <input type="text" name="genero" id="genero" class="custom-text-input2" readonly>
                            <label>Cuidados Especiales:</label>
                            <input type="text" name="cuidadosEspeciales" id="cuidadosEspeciales" class="custom-text-input2" readonly>
                        </div>
                        <div class="foto">
                            <img id="fotoMascota" class="fotoPreview" src="presentacion/mascota/<%= mascota.getFoto()%>" alt="Foto de <%= mascota.getNombre()%>" style="width: 100px; height: 100px;">
                        </div>
                    </div>
                </div>
            </div>
            <table>
                <input type="hidden" name="fechaActual" id="fechaActual">

                <!-- FORMULARIO  -->    

                <h1>Cuestionario de seguimiento</h1>

                <label>¿Cómo describirías el estado actual de la salud de la mascota?</label><br>
                <input type="radio" id="saludExcelente" name="evolucionMedica" value="Excelente" required>
                <label for="saludExcelente">Excelente</label>
                <input type="radio" id="saludBueno" name="evolucionMedica" value="Bueno">
                <label for="saludBueno">Bueno</label>
                <input type="radio" id="saludRegular" name="evolucionMedica" value="Regular">
                <label for="saludRegular">Regular</label>
                <input type="radio" id="saludMalo" name="evolucionMedica" value="Malo">
                <label for="saludMalo">Malo</label><br><br>

                <label> ¿Cómo ha sido la evolución del peso de la mascota desde la adopción?</label><br>
                <input type="radio" id="pesoExcelente" name="masaCorporal" value="Excelente" required>
                <label for="pesoExcelente">Excelente</label>
                <input type="radio" id="pesoBueno" name="masaCorporal" value="Bueno">
                <label for="pesoBueno">Bueno</label>
                <input type="radio" id="pesoRegular" name="masaCorporal" value="Regular">
                <label for="pesoRegular">Regular</label>
                <input type="radio" id="pesoMalo" name="masaCorporal" value="Malo">
                <label for="pesoMalo">Malo</label><br><br>

                <label>¿Cómo describirías el estado emocional de la mascota?</label><br>
                <input type="radio" id="emocionalExcelente" name="estadoEmocional" value="Excelente" required>
                <label for="emocionalExcelente">Excelente</label>
                <input type="radio" id="emocionalBueno" name="estadoEmocional" value="Bueno">
                <label for="emocionalBueno">Bueno</label>
                <input type="radio" id="emocionalRegular" name="estadoEmocional" value="Regular">
                <label for="emocionalRegular">Regular</label>
                <input type="radio" id="emocionalMalo" name="estadoEmocional" value="Malo">
                <label for="emocionalMalo">Malo</label><br><br>

                <label>¿Cómo se ha adaptado la mascota en su nuevo hogar?</label><br>
                <input type="radio" id="adaptacionExcelente" name="adaptacion" value="Excelente" required>
                <label for="adaptacionExcelente">Excelente</label>
                <input type="radio" id="adaptacionBien" name="adaptacion" value="Bien">
                <label for="adaptacionBien">Bien</label>
                <input type="radio" id="adaptacionRegular" name="adaptacion" value="Regular">
                <label for="adaptacionRegular">Regular</label>
                <input type="radio" id="adaptacionMal" name="adaptacion" value="Mal">
                <label for="adaptacionMal">Mal</label><br><br>

                <label>¿Cómo es la relación del dueño con la mascota?</label><br>
                <input type="radio" id="relacionExcelente" name="vinculo" value="Excelente" required>
                <label for="relacionExcelente">Excelente</label>
                <input type="radio" id="relacionBuena" name="vinculo" value="Buena">
                <label for="relacionBuena">Buena</label>
                <input type="radio" id="relacionRegular" name="vinculo" value="Regular">
                <label for="relacionRegular">Regular</label>
                <input type="radio" id="relacionMala" name="vinculo" value="Mala">
                <label for="relacionMala">Mala</label><br><br>

                <label for="foto">Sube una foto del estado actual de la mascota:</label>
                <br><input type="file" id="foto" name="foto" accept="image/*, application/pdf" required>
                <br>

                <label for="fechaProximaVisita">Fecha de la próxima visita:</label><br>
                <input type="date" id="fechaProximaVisita" name="fechaProximaVisita" required><br><br>

                <label for="descripcion">Descripción general del seguimiento:</label><br>
                <textarea id="descripcion" name="descripcion" rows="4" cols="50" required></textarea><br><br>

                <label for="calificacionForm">Considerando tus respuestas anteriores, ¿cómo calificarías el bienestar del animal en su nuevo hogar?
                    teniendo en cuenta que 1 estrella es la calificación más baja y 5 la más alta:</label><br>
                <div class="rating">
                    <input type="radio" id="star5" name="calificacion" value="5" required /><label for="star5" title="5 estrellas">★</label>
                    <input type="radio" id="star4" name="calificacion" value="4" /><label for="star4" title="4 estrellas">★</label>
                    <input type="radio" id="star3" name="calificacion" value="3" /><label for="star3" title="3 estrellas">★</label>
                    <input type="radio" id="star2" name="calificacion" value="2" /><label for="star2" title="2 estrellas">★</label>
                    <input type="radio" id="star1" name="calificacion" value="1" /><label for="star1" title="1 estrella">★</label>
                </div>
                <span id="calificacionError" style="color: red; display: none;">Por favor, selecciona al menos una estrella.</span>
                <br><br>

                <!-- Botones de envío -->

                <input class="btn-adicionar2" type="submit" name="accion" value="<%=accion%>">
                <input class="btn-eliminar2" type="button" value="Cancelar" onClick="window.history.back()">

            </table>
        </div>
    </form>
</body>
<script>

    // BUSCAR PERSONA

    var personas = <%=Persona.getListaEnArreglosJS("tipo='C'", null)%>;
    var vectorPersonas = new Array();
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0];
    }

    $("#identificacion").autocomplete({
        source: vectorPersonas,
        select: function (event, ui) {
            var identificacion = ui.item.value.trim();
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
                document.getElementById("foto").src = "presentacion/clientes/" + foto;
            } else {
                limpiarCampos();
            }

            $(this).autocomplete("close");
        }
    });

    function buscarPersona(valor, indice) {
        let encontrado = false;
        let i = 0;
        while (!encontrado && i < personas.length) {
            if (valor == personas[i][indice]) {
                encontrado = true;
            }
            i++;
        }
        return encontrado ? i - 1 : false;
    }

    $('#identificacion').on('input', function () {
        limpiarCampos();
    });

    function limpiarCampos() {
        document.getElementById("nombre").value = '';
        document.getElementById("telefono").value = '';
        document.getElementById("direccion").value = '';
        document.getElementById("residencia").value = '';
        document.getElementById("foto").src = '';
    }


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

    // BUSCAR MASCOTA 

    var mascotas = <%=Mascota.getListaCompletaEnArregloJS("estado='adoptado'", null)%>;
    var vectorMascotas = new Array();
    for (var i = 0; i < mascotas.length; i++) {
        vectorMascotas[i] = {
            codigo: mascotas[i][0],
            nombre: mascotas[i][1],
            fechaNacimiento: mascotas[i][6],
            genero: mascotas[i][2],
            cuidadosEspeciales: mascotas[i][5],
            foto: mascotas[i][4]
        };
    }
    $("#codigoMascota").autocomplete({
        source: vectorMascotas.map(m => m.codigo)
    });

    $("#nombreMascota").autocomplete({
        source: vectorMascotas.map(m => m.nombre)
    });

    function buscarMascota(valor, campo) {
        return vectorMascotas.findIndex(m => m[campo] === valor);
    }

    $('#codigoMascota').change(function () {
        var codigo = this.value.trim();
        var indiceMascota = buscarMascota(codigo, 'codigo');

        if (indiceMascota !== -1) {
            precargarDatos(indiceMascota);
        } else {
            limpiarDatos();
        }
    });

    $('#nombreMascota').change(function () {
        var nombre = this.value.trim();
        var indiceMascota = buscarMascota(nombre, 'nombre');

        if (indiceMascota !== -1) {
            var codigoMascota = vectorMascotas[indiceMascota].codigo;
            $('#codigoMascota').val(codigoMascota);
            precargarDatos(indiceMascota);
        } else {
            limpiarDatos();
        }
    });

    function precargarDatos(indice) {
        var mascota = vectorMascotas[indice];
        document.getElementById("codigoMascota").value = mascota.codigo;
        document.getElementById("nombreMascota").value = mascota.nombre;
        document.getElementById("fechaNacimiento").value = mascota.fechaNacimiento;
        document.getElementById("genero").value = mostrarGenero(mascota.genero);
        document.getElementById("cuidadosEspeciales").value = mascota.cuidadosEspeciales;
        document.getElementById("fotoMascota").src = "presentacion/mascota/" + mascota.foto;
    }

    function limpiarDatos() {
        document.getElementById("codigoMascota").value = '';
        document.getElementById("nombreMascota").value = '';
        document.getElementById("fechaNacimiento").value = '';
        document.getElementById("genero").value = '';
        document.getElementById("cuidadosEspeciales").value = '';
        document.getElementById("fotoMascota").src = '';
    }

    // MENSAJE DE QUE DEBE SELECCIONAR UNA CALIFICACIÓN 

    function validarCalificacion() {
        // Obtener todos los radio buttons con el nombre "calificacion"
        const calificaciones = document.getElementsByName('calificacion');
        let seleccionada = false;

        // Verificar si al menos una opción está seleccionada
        for (let i = 0; i < calificaciones.length; i++) {
            if (calificaciones[i].checked) {
                seleccionada = true;
                break;
            }
        }

        // Mostrar el mensaje de error si ninguna opción está seleccionada
        const errorMensaje = document.getElementById('calificacionError');
        if (!seleccionada) {
            errorMensaje.style.display = 'block';
        } else {
            errorMensaje.style.display = 'none';
            // Enviar el formulario si la calificación está seleccionada
            alert('Formulario enviado correctamente.');
            // Aquí puedes agregar el código para enviar el formulario
        }
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

        console.log(document.getElementById('fechaActual').value);
    }

    // PRECARGAR DATOS ADOPTANTE

    var listaMascota = <%=FormularioDeSeguimiento.getListaMascotaEnObjeto(null)%>;

</script>
