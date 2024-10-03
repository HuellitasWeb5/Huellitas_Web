<%@ page import="clases.FormularioDeInformacion" %> 
<%@ page import="java.sql.Date" %>
<%@ page import="clases.Persona"%>
<%@ page import="clases.Mascota"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-Tarjetas.css" />
</head>

<body onload="cargarFecha()">
    <form method="POST" action="/guardarFormularioDeSeguimiento" enctype="multipart/form-data">
        <div class="containerFormulario">
            <h1>FORMULARIO DE SEGUIMIENTO</h1>
            <input type="hidden" name="accion" value="grabar">

            <!-- FECHA -->
            <div>Fecha actual: <span id="fecha"></span></div>

            <!-- ADOPTANTE  --> 
            <div class="contenedor-tarjetas">
                <table  class="tableDatos">
                    <th>SAN PATITAS</th>
                    <tr>
                        <th>Identificación:</th>
                        <td><input type="text" name="identificacion" id="identificacion"></td>
                        <td rowspan="5" style="text-align: center; vertical-align: middle;">
                            <img id="fotoClientePreview" src="" alt="Foto del Cliente" width="125" height="125">
                        </td>
                    </tr>
                    <tr>
                        <th>Nombre del Adoptante</th>
                        <td type="text" name="nombre" id="nombre"></td>
                    </tr>
                    <tr>
                        <th>Teléfono</th>
                        <td type="text" name="telefono" id="telefono"></td>
                    </tr>
                    <tr>
                        <th>Dirección</th>
                        <td type="text" name="direccion" id="direccion"></td>
                    </tr>
                    <tr>
                        <th>Residencia</th>
                        <td type="text" name="residencia" id="residencia"></td>
                    </tr>
                </table>


                <!-- MASCOTA  --> 

                <table class="tableDatos">
                    <th>MASCOTA</th>
                    <tr>
                        <th>Código:</th>
                        <td><input type="text" name="codigo" id="codigo"></td>
                        <td rowspan="5" style="text-align: center; vertical-align: middle;">
                            <img id="fotoMascotaPreview" src="" alt="Foto de la Mascota" width="125" height="125">
                        </td>
                    </tr>
                    <tr>
                        <th>Nombre de la mascota</th>
                        <td type="text" name="nombreMascota" id="nombreMascota" ></td>
                    </tr>
                    <tr>
                        <th>Edad Aproximada</th>
                        <td type="text" name="fechaNacimiento" id="fechaNacimiento" ></td>
                    </tr>
                    <tr>
                        <th>Género</th>
                        <td type="text" name="genero" id="genero"></td>
                    </tr>
                    <tr>
                        <th>Cuidados Especiales</th>
                        <td type="text" name="cuidadosEspeciales" id="cuidadosEspeciales"></td>
                    </tr>
                </table>
            </div>

            <!-- FORMULARIO  -->    
            <table class="tableFormulario">

                <!-- Cambio notable en la salud -->
                <label>¿Se puede apreciar algún cambio notable en la salud de la mascota?</label><br>
                <input type="radio" id="saludSi" name="cambioSalud" value="Si" required>
                <label for="saludSi">Sí</label>
                <input type="radio" id="saludNo" name="cambioSalud" value="No">
                <label for="saludNo">No</label><br><br>

                <!-- Cambio en el peso -->
                <label>¿La mascota ha sufrido algún cambio en el peso desde la adopción?</label><br>
                <input type="radio" id="pesoSi" name="cambioPeso" value="Si" required>
                <label for="pesoSi">Sí</label>
                <input type="radio" id="pesoNo" name="cambioPeso" value="No">
                <label for="pesoNo">No</label><br><br>

                <!-- Cambio emocional -->
                <label>¿La mascota ha presentado algún tipo de cambio emocional?</label><br>
                <input type="radio" id="emocionalSi" name="cambioEmocional" value="Si" required>
                <label for="emocionalSi">Sí</label>
                <input type="radio" id="emocionalNo" name="cambioEmocional" value="No">
                <label for="emocionalNo">No</label><br><br>

                <!-- Adaptación al entorno -->
                <label>¿Cómo se ha adaptado la mascota en su nuevo hogar?</label><br>
                <input type="radio" id="adaptacionExcelente" name="adaptacion" value="Excelente" required>
                <label for="adaptacionExcelente">Excelente</label>
                <input type="radio" id="adaptacionBien" name="adaptacion" value="Bien">
                <label for="adaptacionBien">Bien</label>
                <input type="radio" id="adaptacionRegular" name="adaptacion" value="Regular">
                <label for="adaptacionRegular">Regular</label>
                <input type="radio" id="adaptacionMal" name="adaptacion" value="Mal">
                <label for="adaptacionMal">Mal</label><br><br>

                <!-- Relación con el dueño -->
                <label>¿Cómo es la relación del dueño con la mascota?</label><br>
                <input type="radio" id="relacionExcelente" name="relacion" value="Excelente" required>
                <label for="relacionExcelente">Excelente</label>
                <input type="radio" id="relacionBien" name="relacion" value="Bien">
                <label for="relacionBien">Bien</label>
                <input type="radio" id="relacionRegular" name="relacion" value="Regular">
                <label for="relacionRegular">Regular</label>
                <input type="radio" id="relacionMal" name="relacion" value="Mal">
                <label for="relacionMal">Mal</label><br><br>

                <!-- Subir foto -->
                <label for="foto">Sube una foto del estado actual de la mascota:</label><br>
                <input type="file" id="foto" name="foto" accept="image/*,application/pdf"><br><br>

                <!-- Fecha próxima visita -->
                <label for="fechaProximaVisita">Fecha de la próxima visita:</label><br>
                <input type="date" id="fechaProximaVisita" name="fechaProximaVisita" required><br><br>

                <!-- Descripción -->

                <label for="descripcion">Descripción general del seguimiento:</label><br>
                <textarea id="descripcion" name="descripcion" rows="4" cols="50" required></textarea><br><br>

                <!-- Calificación general del cuidado (1 a 10) -->
                <label for="calificacion">Considerando tus respuestas anteriores, ¿cómo calificarías el bienestar del animal en su nuevo hogar?
                   teniendo en cuenta que 1 estrella es la calificación más baja y 5 la más alta:</label><br>
                <div class="rating">
                    <input type="radio" id="star5" name="rating" value="5" /><label for="star5" title="5 estrellas">★</label>
                    <input type="radio" id="star4" name="rating" value="4" /><label for="star4" title="4 estrellas">★</label>
                    <input type="radio" id="star3" name="rating" value="3" /><label for="star3" title="3 estrellas">★</label>
                    <input type="radio" id="star2" name="rating" value="2" /><label for="star2" title="2 estrellas">★</label>
                    <input type="radio" id="star1" name="rating" value="1" /><label for="star1" title="1 estrella">★</label>
                </div><br><br>

                <!-- Botones de envío -->
                <div class="btn-container">
                    <input class="btn-adicionar" type="submit" value="Enviar">
                    <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()">
                </div>

            </table>
        </div>
    </form>

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

        // BUSCAR MASCOTA PRINCIPAL

        var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
        var vectorMascotas = new Array();
        for (var i = 0; i < mascotas.length; i++) {
            vectorMascotas[i] = mascotas[i][0];
        }
        $("#codigo").autocomplete({
            source: vectorMascotas
        });
        function buscarMascota(valor, indice) {
            encontrado = false;
            i = 0;
            while (!encontrado) {
                if (valor == mascotas[i][indice])
                    encontrado = true;
                i++;
            }
            if (encontrado)
                return i - 1;
            else
                return false;
        }

        $('#codigo').change(function () {
            codigo = this.value.trim();
            indiceMascota = buscarMascota(codigo, 0);
            nombreMascota = mascotas[indiceMascota][1];
            fechaNacimiento = mascotas[indiceMascota][6];
            genero = mascotas[indiceMascota][2];
            cuidadosEspeciales = mascotas [indiceMascota][5];
            foto = mascotas [indiceMascota][4];
            document.getElementById("nombreMascota").innerHTML = nombreMascota;
            document.getElementById("fechaNacimiento").innerHTML = fechaNacimiento;
            document.getElementById("genero").innerHTML = genero;
            document.getElementById("cuidadosEspeciales").innerHTML = cuidadosEspeciales;
            document.getElementById("fotoMascotaPreview").src = foto;
        });

        // CARGAR FECHA
        function cerrarFormulario() {
            // Cerrar el diálogo
            $('#formulario').dialog('close');

        }
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
