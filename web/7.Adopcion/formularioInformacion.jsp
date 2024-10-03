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

<%
/*   String lista = "";
    Lst<Mascota> datos = Mascota.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        Mascota mascotas = datos.get(i);
        lista += "<div class='swiper-slide card'>"; 
        lista += "<div class='card-body'>"; 
        lista += "<img src='presentacion/mascota/" + mascotas.getFoto() + "' width='auto' height='60' class='profile-image'>";
        lista += "<div class='card-header'>";
        lista += "<h2>" + mascotas.getNombre() + "</h2>";
        lista += "</div>";
        lista += "<p><strong>Código:</strong> " + mascotas.getCodigo() + "</p>";
        lista += "<p><strong>Género:</strong> " + mascotas.getGeneroEnObjeto() + "</p>";
        lista += "<p><strong>Tamaño:</strong> " + mascotas.getTamano() + "</p>";
        lista += "<p><strong>Cuidado:</strong> " + mascotas.getCuidadosEspeciales() + "</p>";
        lista += "<p><strong>Edad aproximada:</strong> " + mascotas.getEdad() + "</p>";
        lista += "<p><strong>Fecha de ingreso:</strong> " + mascotas.getFechaIngreso() + "</p>";
        lista += "<p><strong>Estado:</strong> " + mascotas.getEstado() + "</p>";
        lista += "<p><strong>Descripción:</strong> " + mascotas.getDescripcion() + "</p>";
        lista += "<div class='btn-container'>"; 
        lista += "<p>";
        lista += "<a href='principal.jsp?CONTENIDO=3.Mascotas/mascotasFormulario.jsp&accion=Modificar&codigo=" + mascotas.getCodigo() + "' title='Modificar'>"
                + "<button class='btn-adicionar'>Modificar</button></a> ";
        lista += "<a><button class='btn-eliminar' onClick='eliminar(" + mascotas.getCodigo() + ")'>Eliminar</button></a>";
        lista += "</p>";
        lista += "</div>"; 
        lista += "<div class='btn-container'>"; 
        lista += "<p>";
        lista += "<button class='btn-otro'>Apadrinar</button>";
        lista += "<button class='btn-otro'>Adoptar</button>";
        lista += "</p>";
        lista += "</div>"; 
        lista += "</div>"; 
        lista += "</div>"; 
    }*/
%>

<body onload="cargarFecha()">
    <form>    
        <div class="containerFormulario">
            <h1>FORMULARIO DE ADOPCIÓN</h1>
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
                <br><input type="file" id="fotoVivienda" name="fotoVivienda" accept="image/*, application/pdf">
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
                <input class="btn-adicionar" type="submit" value="Enviar">
                <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()">
                </body>
            </div>

        </div>
    </form>
</body>
<div id="formulario" title="Apadrinar mascota">
    <form name="formularioDonacionDetalle">
<<<<<<< HEAD
        <table class="tableDatos">
            <th>MASCOTA</th>
            <tr>
                <th>Código:</th>
                <td><input type="text" name="codigoFormulario" id="codigoFormulario"></td>
                <td rowspan="5" style="text-align: center; vertical-align: middle;">
                    <img id="fotoMascotaPreview" src="" alt="Foto de la Mascota" width="125" height="125">
                </td>
            </tr>
            <tr>
                <th>Nombre de la mascota</th>
                <td type="text" name="nombreMascotaFormulario" id="nombreMascotaFormulario" ></td>
            </tr>
            <tr>
                <th>Edad Aproximada</th>
                <td type="text" name="fechaNacimientoFormulario" id="fechaNacimientoFormulario" ></td>
            </tr>
            <tr>
                <th>Género</th>
                <td type="text" name="generoFormulario" id="generoFormulario"></td>
            </tr>
            <tr>
                <th>Cuidados Especiales</th>
                <td type="text" name="cuidadosEspecialesFormulario" id="cuidadosEspecialesFormulario"></td>
            </tr>
        </table>
        <input class="btn-adicionar" type="submit" value="Agregar">
        <input class="btn-eliminar" type="button" value="Cancelar" onclick="cerrarFormulario();">
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

    // BUSCAR MASCOTA FORMULARIO 

<<<<<<< HEAD
    var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
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

    $('#codigoFormulario').change(function () {
        codigo = this.value.trim();
        indiceMascota = buscarMascota(codigo, 0);
        nombreMascota = mascotas[indiceMascota][1];
        fechaNacimiento = mascotas[indiceMascota][6];
        genero = mascotas[indiceMascota][2];
        cuidadosEspeciales = mascotas [indiceMascota][5];
        foto = mascotas [indiceMascota][4];
        document.getElementById("nombreMascotaFormulario").innerHTML = nombreMascota;
        document.getElementById("fechaNacimientoFormulario").innerHTML = fechaNacimiento;
        document.getElementById("generoFormulario").innerHTML = genero;
        document.getElementById("cuidadosEspecialesFormulario").innerHTML = cuidadosEspeciales;
        document.getElementById("fotoMascotaPreviewFormulario").src = foto;
    });

    // AGREGAR MASCOTA A LA ADOPCION
=======


    // AGREGAR MASCOTA 
>>>>>>> 027640c689a9bf4ba34b99e4563b492b7ac077e8

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
<<<<<<< HEAD
            width: 550,
            height: 400
=======
            width: 920, // Ancho del diálogo en píxeles
            height: 440
>>>>>>> 027640c689a9bf4ba34b99e4563b492b7ac077e8
        });
    });
    function abrirFormulario() {
        $('#formulario').dialog('open');
    }

<<<<<<< HEAD
    // CARGAR FECHA
=======
>>>>>>> 027640c689a9bf4ba34b99e4563b492b7ac077e8
    function cerrarFormulario() {
        // Cerrar el diálogo
        $('#formulario').dialog('close');

    }
<<<<<<< HEAD
    function cargarFecha() {
=======
  function cargarFecha() {
>>>>>>> 027640c689a9bf4ba34b99e4563b492b7ac077e8
        var fecha = new Date();
        var dia = String(fecha.getDate()).padStart(2, '0');
        var mes = String(fecha.getMonth() + 1).padStart(2, '0');
        var anio = fecha.getFullYear();
        var fechaActual = dia + '/' + mes + '/' + anio;
        document.getElementById('fecha').innerText = fechaActual;
    }

    mentById('fecha').innerText = fechaFormateada;
<<<<<<< HEAD
    
=======
>>>>>>> 027640c689a9bf4ba34b99e4563b492b7ac077e8
</script>
