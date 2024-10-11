<%@ page import="clases.FormularioDeSeguimiento" %> 
<%@ page import="java.sql.Date" %>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>

<%
    String accion = request.getParameter("accion");
%>  

<body onload="cargarFecha()">
    <h3><%=accion.toUpperCase()%> FORMULARIO DE SEGUIMIENTO </h3>
    <a href="formularioSeguimiento.jsp"></a>
    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioSeg.jsp" enctype="multipart/form-data">
        <div class="containerFormulario">
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
                            <img id="fotoAdoptante" class="fotoPreview" src="" alt="Foto Adoptante">
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
                            <input type="text" name="codigoMascota" id="codigoMascota" placeholder="Digite aquí el código de la mascota" required>
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
                            <img id="fotoMascota" class="fotoPreview" src="" alt="Foto Mascota">
                        </div>
                    </div>
                </div>
            </div>
            <table>
                <input type="hidden" name="fechaActual" id="fechaActual">

                <!-- FORMULARIO  -->    

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
                <input type="radio" id="pesoBien" name="masaCorporal" value="Bueno">
                <label for="pesoBueno">Bueno</label>
                <input type="radio" id="pesoRegular" name="masaCorporal" value="Regular">
                <label for="pesoRegular">Regular</label>
                <input type="radio" id="pesoMal" name="masaCorporal" value="Malo">
                <label for="pesoMalo">Malo</label><br><br>

                <label>¿Cómo describirías el estado emocional de la mascota?</label><br>
                <input type="radio" id="emocionalExcelente" name="estadoEmocional" value="Excelente" required>
                <label for="emocionalExcelente">Excelente</label>
                <input type="radio" id="emocionalBien" name="estadoEmocional" value="Bueno">
                <label for="emocionalBueno">Bueno</label>
                <input type="radio" id="emocionalRegular" name="estadoEmocional" value="Regular">
                <label for="emocionalRegular">Regular</label>
                <input type="radio" id="emocionalMal" name="estadoEmocional" value="Malo">
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
                <input type="radio" id="relacionBien" name="vinculo" value="Buena">
                <label for="relacionBuena">Buena</label>
                <input type="radio" id="relacionRegular" name="vinculo" value="Regular">
                <label for="relacionRegular">Regular</label>
                <input type="radio" id="relacionMal" name="vinculo" value="Mala">
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

                <input class="btn-adicionar" type="submit" name="accion" value="<%=accion%>">
                <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()">

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
        document.getElementById("nombre").value = nombre;
        document.getElementById("telefono").value = telefono;
        document.getElementById("direccion").value = direccion;
        document.getElementById("residencia").value = residencia;
        document.getElementById("foto").src = foto;
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


    // BUSCAR MASCOTA 

    var mascotas = <%=Mascota.getListaCompletaEnArregloJS("estado='adoptado'", null)%>;
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
            document.getElementById("fotoMascota").src = foto;
        } else {
            document.getElementById("nombreMascota").value = '';
            document.getElementById("fechaNacimiento").value = '';
            document.getElementById("genero").value = '';
            document.getElementById("cuidadosEspeciales").value = '';
            document.getElementById("fotoMascota").src = '';
        }
    });

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

</script>
