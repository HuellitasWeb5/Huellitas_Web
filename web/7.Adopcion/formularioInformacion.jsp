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
    <link rel="stylesheet" href="presentacion/style-Formularios.css" />
</head>


<%
    String accion = request.getParameter("accion");
    String codigoMascota = request.getParameter("codigoMascota");
    String nombreCliente = request.getParameter("nombre");
    String tipoUsuario = (String) session.getAttribute("tipoUsuario");
   

    String privado = "";
    if (tipoUsuario.equals("C")) {
        privado = "readonly";
    }
    FormularioDeInformacion formularioDeInformacion = new FormularioDeInformacion();
    Mascota mascota = new Mascota();
    Persona persona = new Persona(formularioDeInformacion.getIdentificacionAdoptante());
    String identificacionUsuario = (String) request.getAttribute("identificacionUsuario");

%>  

<h3><%=accion.toUpperCase()%> FORMULARIO DE PRE-ADOPCIÓN </h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=7.Adopcion/actualizarFormularioInfo.jsp&nombre=<%=nombreCliente%>" enctype="multipart/form-data">
    <div class="formulario-adopcion">
        <div class="fecha-contenedor" onload="cargarFecha()">Fecha actual: <span class="fecha" id="fecha"></span></div>
        <div class="contenedor-tarjetas">

            <!-- Sección de SAN PATITAS -->
            <div class="tableDatos">
                <h4>ADOPTANTE</h4>
                <div class="datos-con-foto">
                    <div class="datos">
                        <label>Identificación:</label>
                        <input type="text" name="identificacion" id="identificacion" placeholder="Digite aquí la identificación del adoptante" class="custom-text-input2" <%=privado%>>
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
                        <input type="text" name="codigoMascotas" id="codigoMascotas" placeholder="Digite aquí el código de la mascota" class="custom-text-input2" font-family: 'Open Sans' required>
                        <label>Nombre de la mascota:</label>
                        <input type="text" name="nombreMascota" id="nombreMascota" class="custom-text-input2" readonly>
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

        <div class="swiper-container">
            <div class="swiper-wrapper">
            </div>
            <div class="swiper-button-next"></div>
            <div class="swiper-button-prev"></div>
        </div> 
        <table>

            <button class="btn-adicionar2" type="button" onclick="abrirFormulario();">Agregar Otra Mascota</button><br>

            <input type="hidden" name="fechaActual" id="fechaActual">

            <!-- FORMULARIO  -->  

            <div class="divisor"></div>

            <h1>Cuestionario de información</h1>

            <div class="pregunta-container">
                <label for="estadoCivil">Estado Civil:</label>
                <div class="opciones-estado-civil">
                    <input type="radio" id="estadoCivilSoltero" name="estadoCivil" value="Soltero" required>
                    <label for="estadoCivilSoltero">Soltero(a)</label>
                    <input type="radio" id="estadoCivilCasado" name="estadoCivil" value="Casado">
                    <label for="estadoCivilCasado">Casado(a)</label>
                    <input type="radio" id="estadoCivilViudo" name="estadoCivil" value="Viudo">
                    <label for="estadoCivilViudo">Viudo(a)</label>
                    <input type="radio" id="estadoCivilDivorciado" name="estadoCivil" value="Divorciado">
                    <label for="estadoCivilDivorciado">Divorciado(a)</label>
                    <input type="radio" id="estadoCivilUnionL" name="estadoCivil" value="UnionLibre">
                    <label for="estadoCivilUnionL">Unión Libre</label>
                </div>
            </div>

            <label for="ocupacion">Ocupación:</label>
            <input type="text" id="ocupacion" name="ocupacion" class="custom-text-input" maxlength="100" required><br><br>

            <label for="motivacion">¿Por qué desea adoptar al peludito?</label>
            <input type="text" id="motivacion" name="motivacion" class="custom-text-input" maxlength="100" required><br><br>

            <div class="pregunta-container">
                <label for="otrasMascotas">¿Tiene alguna mascota actualmente?</label>
                <div class="opciones-SiNo">
                    <input type="radio" id="otrasMascotasSi" name="otrasMascotas" value="S" required>
                    <label for="otrasMascotasSi">Sí</label>
                    <input type="radio" id="otrasMascotasNo" name="otrasMascotas" value="N">
                    <label for="otrasMascotasNo">No</label>
                </div>
            </div>

            <div id="otrasMascotasR-container" style="display: none;">
                <label for="otrasMascotasR">¿Qué tipo de animalito es?</label>
                <input type="text" id="otrasMascotasR" name="otrasMascotasR" class="custom-text-input" maxlength="100"><br><br>
            </div>

            <div class="pregunta-container-p" id="esterilizados-container" style="display: none;">
                <label for="esterilizados">¿Está esterilizado?</label>
                <div class="opciones-SiNo-p">
                    <input type="radio" id="esterilizadosSi" name="esterilizados" value="S">
                    <label for="esterilizadosSi">Sí</label>
                    <input type="radio" id="esterilizadosNo" name="esterilizados" value="N">
                    <label for="esterilizadosNo">No</label>
                </div>
            </div>

            <div id="esterilizadosR-container" style="display: none;">
                <label for="esterilizadosR">¿Por qué no está esterilizado?</label>
                <input type="text" id="esterilizadosR" name="esterilizadosR" class="custom-text-input" maxlength="100"><br><br>
            </div>
            <div class="pregunta-container">
                <label for="anteriorMascotas">¿Ha tenido otras mascotas anteriormente?</label>
                <div class="opciones-SiNo">
                    <input type="radio" id="anteriorMascotasSi" name="anteriorMascotas" value="S" required>
                    <label for="anteriorMascotasSi">Sí</label>
                    <input type="radio" id="anteriorMascotasNo" name="anteriorMascotas" value="N">
                    <label for="anteriorMascotasNo">No</label>
                </div>
            </div>

            <div id="anteriorMascotasR-container" style="display: none;">
                <label for="anteriorMascotasR">¿Qué tipo de animalitos eran?</label>
                <input type="text" id="anteriorMascotasR" name="anteriorMascotasR" class="custom-text-input" maxlength="100"><br><br>
            </div>
            <label for="habitantes">¿Cuántas personas conforman su hogar?</label>
            <input type="number" id="habitantes" name="habitantes" min="1" required placeholder="Ingrese un valor numérico"><br><br>

            <div class="pregunta-container">
                <label for="habitantesR">¿Están de acuerdo en adoptar?</label>
                <div class="opciones-SiNo">
                    <input type="radio" id="habitantesRSi" name="habitantesR" value="S">
                    <label for="habitantesRSi">Sí</label>
                    <input type="radio" id="habitantesRNo" name="habitantesR" value="N">
                    <label for="habitantesRNo">No</label>
                </div>
            </div>

            <div class="pregunta-container">
                <label for="ninos">¿Hay niños en el hogar?</label>
                <div class="opciones-SiNo">
                    <input type="radio" id="ninosSi" name="ninos" value="S" required>
                    <label for="ninosSi">Sí</label>
                    <input type="radio" id="ninosNo" name="ninos" value="N">
                    <label for="ninosNo">No</label>
                </div>
            </div>

            <div id="ninosR-container" style="display: none;">
                <label for="ninosR">¿Qué edad(es) tiene(n)?</label>
                <input type="text" id="ninosR" name="ninosR" class="custom-text-input" maxlength="100"><br><br>
            </div>

            <div class="pregunta-container">
                <label for="alergias">¿Alguien de su hogar es alérgico a los animalitos o sufre de asma?</label>
                <div class="opciones-SiNo">
                    <input type="radio" id="alergiasSi" name="alergias" value="S" required>
                    <label for="alergiasSi">Sí</label>
                    <input type="radio" id="alergiasNo" name="alergias" value="N">
                    <label for="alergiasNo">No</label>
                </div>
            </div>
            <div class="pregunta-container" >
                <label for="vivienda">La casa y/o apartamento donde vive actualmente es:</label>
                <div class="opciones-estado-civil">
                    <input type="radio" id="viviendaPropio" name="vivienda" value="Propio" required>
                    <label for="viviendaPropio">Propio</label>
                    <input type="radio" id="viviendaArriendo" name="vivienda" value="Arrendado">
                    <label for="viviendaArriendo">Arrendado</label>
                    <input type="radio" id="viviendaAnticres" name="vivienda" value="Anticresado">
                    <label for="viviendaAnticres">Anticresado</label>
                    <input type="radio" id="viviendaFamiliar" name="vivienda" value="Familiar">
                    <label for="viviendaFamiliar">Familiar</label>
                </div>
            </div>

            <div class="pregunta-container-p" id="permiteMascotas-container" style="display: none;">
                <label for="permiteMascotas">¿El propietario permite animalitos?</label>
                <div class="opciones-SiNo-p">
                    <input type="radio" id="permiteMascotasSi" name="permiteMascotas" value="S">
                    <label for="permiteMascotasSi">Sí</label>
                    <input type="radio" id="permiteMascotasNo" name="permiteMascotas" value="N">
                    <label for="permiteMascotasNo">No</label>
                </div>
            </div>

            <label for="cambiarDomicilio">Si por algún motivo tuviera que cambiar de domicilio, ¿Qué pasaría con el peludito?</label>
            <input type="text" id="cambiarDomicilio" name="cambiarDomicilio" class="custom-text-input" maxlength="100" required><br><br>

            <label for="rupturaFamiliar">En caso de una ruptura en la familia (divorcio, fallecimiento) o la llegada de un nuevo integrante ¿Cuáles serían los cambios en el trato hacia el peludito adoptado?</label>
            <input type="text" id="rupturaFamiliar" name="rupturaFamiliar" class="custom-text-input" maxlength="100" required><br><br>

            <label for="proyeccionFutura">¿Cómo se ve con el peludito que desea adoptar dentro de 5 años?</label>
            <input type="text" id="proyeccionFutura" name="proyeccionFutura" class="custom-text-input" maxlength="100" required><br><br>

            <label for="espacio">¿En qué área de la casa dormirá el peludito?</label>
            <input type="text" id="espacio" name="espacio" class="custom-text-input" maxlength="100" required><br><br>

            <label for="responsables">¿Con quién permanecerá el peludito durante el día?</label>
            <input type="text" id="responsables" name="responsables" class="custom-text-input" maxlength="100" required><br><br>

            <label for="compromiso">Si el comportamiento del peludito no es el que usted desea (juguetón, mordelón, inquieto, mimado, rebelde), ¿Qué medidas tomaría?</label>
            <input type="text" id="compromiso" name="compromiso" class="custom-text-input" maxlength="100" required><br><br>

            <div class="pregunta-container">
                <label for="autorizaVisitas">¿Está de acuerdo en que se haga una visita periódica a su domicilio para ver cómo se encuentra el peludito adoptado?</label>
                <div class="opciones-SiNo">
                    <input type="radio" id="autorizaVisitasSi" name="autorizaVisitas" value="S" required> 
                    <label for="autorizaVisitasSi">Sí</label>
                    <input type="radio" id="autorizaVisitasNo" name="autorizaVisitas" value="N">
                    <label for="autorizaVisitasNo">No</label>
                </div>
            </div>

            <div id="autorizaVisitasR-container" style="display: none;">
                <label for="autorizaVisitasR">¿Por qué motivo no desea que se realicen visitas de seguimiento?</label>
                <input type="text" id="autorizaVisitasR" name="autorizaVisitasR" class="custom-text-input" maxlength="100"><br><br>
            </div>
            <label for="fechaVisitaDia">Por favor, indíquenos los días de la semana en los que estaría disponible para recibir la visita:</label>
            <div style="display: flex; gap: 45px;">
                <input type="checkbox" id="lunes" name="fechaVisitaDia" value="Lunes">
                <label for="lunes">Lunes</label>

                <input type="checkbox" id="martes" name="fechaVisitaDia" value="Martes">
                <label for="martes">Martes</label>

                <input type="checkbox" id="miercoles" name="fechaVisitaDia" value="Miercoles">
                <label for="miercoles">Miércoles</label>

                <input type="checkbox" id="jueves" name="fechaVisitaDia" value="Jueves">
                <label for="jueves">Jueves</label>

                <input type="checkbox" id="viernes" name="fechaVisitaDia" value="Viernes">
                <label for="viernes">Viernes</label>

                <input type="checkbox" id="sabado" name="fechaVisitaDia" value="Sabado">
                <label for="sabado">Sábado</label>

                <input type="checkbox" id="domingo" name="fechaVisitaDia" value="Domingo">
                <label for="domingo">Domingo</label>
            </div>

            <input type="hidden" id="fechaVisitaDiaHidden" name="fechaVisitaDia">
            <p id="error-message" style="color: red; display: none;">Debe seleccionar al menos un día de la semana</p>
            <br>

            <label for="fechaVisitaHora">¿A qué hora le gustaría programar la visita para el día seleccionado?</label>
            <input type="time" id="fechaVisitaHora" name="fechaVisitaHora" style="width: 120px; text-align: center;" required><br>

            <div class="divisor"></div>

            <h1>Referencias Familiares</h1>

            <div class="referencias-container">
                <div class="referencias">
                    <h4>Referencia Familiar 1</h4>
                    <label for="refNombre1">Nombre:</label>
                    <input type="text" id="refNombre1" name="refNombre1" maxlength="100" required><br>

                    <label for="refCedula1">Cédula:</label>
                    <input type="number" id="refCedula1" name="refCedula1" maxlength="100" required><br>

                    <label for="refDireccion1">Dirección:</label>
                    <input type="text" id="refDireccion1" name="refDireccion1" maxlength="100" required><br>

                    <label for="refCelular1">Celular:</label>
                    <input type="number" id="refCelular1" name="refCelular1" maxlength="100" required><br>
                </div>

                <div class="referencias">
                    <h4>Referencia Familiar 2</h4>
                    <label for="refNombre2">Nombre:</label>
                    <input type="text" id="refNombre2" name="refNombre2" maxlength="100" required><br>

                    <label for="refCedula2">Cédula:</label>
                    <input type="number" id="refCedula2" name="refCedula2" maxlength="100" required><br>

                    <label for="refDireccion2">Dirección:</label>
                    <input type="text" id="refDireccion2" name="refDireccion2" maxlength="100" required><br>

                    <label for="refCelular2">Celular:</label>
                    <input type="number" id="refCelular2" name="refCelular2" maxlength="100" required><br>
                </div>
            </div>

            <div class="divisor"></div>

            <h1>Referencias Personales</h1>

            <div class="referencias-container">
                <div class="referencias">
                    <h4>Referencia Personal 1</h4>
                    <label for="refNombre3">Nombre:</label>
                    <input type="text" id="refNombre3" name="refNombre3" class="custom-text-input" maxlength="100" required>

                    <label for="refCedula3">Cédula:</label>
                    <input type="number" id="refCedula3" name="refCedula3" class="custom-text-input" maxlength="100" required>

                    <label for="refDireccion3">Dirección:</label>
                    <input type="text" id="refDireccion3" name="refDireccion3" class="custom-text-input" maxlength="100" required>

                    <label for="refCelular3">Celular:</label>
                    <input type="number" id="refCelular3" name="refCelular3" class="custom-text-input" maxlength="100" required>
                </div>

                <div class="referencias">
                    <h4>Referencia Personal 2</h4>
                    <label for="refNombre4">Nombre:</label>
                    <input type="text" id="refNombre4" name="refNombre4" class="custom-text-input" maxlength="100" required>

                    <label for="refCedula4">Cédula:</label>
                    <input type="number" id="refCedula4" name="refCedula4" class="custom-text-input" maxlength="100" required>

                    <label for="refDireccion4">Dirección:</label>
                    <input type="text" id="refDireccion4" name="refDireccion4" class="custom-text-input" maxlength="100" required>

                    <label for="refCelular4">Celular:</label>
                    <input type="number" id="refCelular4" name="refCelular4" class="custom-text-input" maxlength="100" required>
                </div>
            </div>

            <div class="divisor"></div>

            <label for="fotoCedula">Por favor, cargue una foto de su cédula de ciudadanía (ambos lados):</label>
            <br><input type="file" id="fotoCedula" name="fotoCedula"  accept="image/*" required>
            <br>

            <label for="fotoRecibo">Por favor, cargue una foto del recibo de servicios públicos de su vivienda (gas, energía o agua):</label>
            <br><input type="file" id="fotoRecibo" name="fotoRecibo"  accept="image/*" required>
            <br>

            <label for="fotoVivienda">(Opcional) Por favor, cargue una foto del espacio donde vivirá la mascota (puede incluir foto de la cama, alimento o accesorios):</label>
            <br><input type="file" id="fotoVivienda" name="fotoVivienda"  accept="image/*">
            <br>

            <label for="descripcion">Descripción adicional:</label> 
            <br><textarea id="descripcion" name="descripcion" rows="4" cols="88"></textarea><br><br>

            <div style="display: flex; align-items: center;">
                <input type="checkbox" id="autorizacion" name="autorizacion" value="S" required>
                <label for="autorizacion" style="margin-left: 8px;">Autorizo el uso de mis datos personales exclusivamente para fines relacionados con la adopción 
                    y el bienestar de la(s) mascota(s), en cumplimiento con la legislación vigente en materia de protección de datos.</label>
            </div>
            <br>

            <div class="divisor"></div>
            <h1>¡Gracias por dar el primer paso!</h1>
            <h2>
                <p>Una vez envíe el formulario, uno de nuestros representantes se pondrá en contacto contigo lo antes posible.</p>
                <p>Mientras tanto, su solicitud estará en proceso y cuando sea aprobada, podrá verla en la sección de </p>
                <p>'Mis Ayudas' - 'Ver mis Adopciones'.</p>
                <p>¡Gracias de corazón por tu amor y compromiso con nuestros peluditos en busca de un hogar!</p>
            </h2>

            <div class="divisor"></div><br>
            <!-- Botones de envío -->
            <input class="btn-adicionar2" type="submit" name="accion" value="<%=accion%>">
            <input class="btn-eliminar2" type="button" value="Cancelar" onClick="window.history.back()">

        </table>
        <input type="hidden" name="formularioInfo" id="formularioInfo" >
    </div>
</form>
<div id="formulario" title="Adoptar mascota">
    <form name="formularioAdoptarMascota">
        <table class="tableDatos">
            <h4>MASCOTA</h4>
            <div class="datos-con-foto">
                <div class="datos">
                    <label>Código:</label>
                    <input type="hidden" name="codigosMascotas" id="codigosMascotas" value="">
                    <input type="text" name="codigoFormulario" id="codigoFormulario" class="custom-text-input2" placeholder="Digite aquí el código de la mascota" required>
                    <label>Nombre de la mascota:</label>
                    <input type="text" name="nombreMascota" id="nombreMascotaFormulario" class="custom-text-input2" readonly>
                    <label>Fecha de nacimiento Aproximada:</label>
                    <input type="text" name="fechaNacimiento" id="fechaNacimientoFormulario" class="custom-text-input2" readonly>
                    <label>Género:</label>
                    <input type="text" name="genero" id="generoFormulario" class="custom-text-input2" readonly>
                    <label>Cuidados Especiales:</label>
                    <input type="text" name="cuidadosEspeciales" id="cuidadosEspecialesFormulario" class="custom-text-input2" readonly>
                </div>
                <div class="foto">
                    <img id="fotoMascotaFormulario" class="fotoPreview" src="presentacion/mascota/<%= mascota.getFoto()%>" alt="Foto de <%= mascota.getNombre()%>" style="width: 100px; height: 100px;">
                </div>
            </div>
        </table>
        <input class="btn-adicionar2" type="button" value="Agregar" onclick="agregarMascota();">
        <input class="btn-eliminar2" type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>    
</div>
<script>

    // AUTOCOMPLETAR LOS DATOS SI ES CIENTE

    var identificacionUsuario = "<%= identificacionUsuario%>";
    var personas = <%=Persona.getListaEnArreglosJS("tipo='C'", null)%>;
    var tipoUsuario = "<%= tipoUsuario%>";

    if (tipoUsuario === "C") {
        document.getElementById("identificacion").value = identificacionUsuario;
        indicePersona = buscarPersona(identificacionUsuario, 0);
        var nombre = personas[indicePersona][1];
        var telefono = personas[indicePersona][2];
        var direccion = personas[indicePersona][3];
        var residencia = personas[indicePersona][4];
        document.getElementById("nombre").value = nombre;
        document.getElementById("telefono").value = telefono;
        document.getElementById("direccion").value = direccion;
        document.getElementById("residencia").value = residencia;
    }

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

            var h2 = document.createElement('h4');
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
            inputCodigo.classList.add('custom-text-input2');
            inputCodigo.placeholder = "Digite aquí el código de la mascota";
            inputCodigo.readOnly = true;

            var labelNombre = document.createElement('label');
            labelNombre.textContent = 'Nombre de la mascota:';
            var inputNombre = document.createElement('input');
            inputNombre.type = 'text';
            inputNombre.name = 'nombreMascota';
            inputNombre.id = 'nombreMascota' + index;
            inputNombre.value = campos[1];
            inputNombre.classList.add('custom-text-input2');
            inputNombre.readOnly = true;

            var labelFechaNacimiento = document.createElement('label');
            labelFechaNacimiento.textContent = 'Fecha de nacimiento Aproximada:';
            var inputFechaNacimiento = document.createElement('input');
            inputFechaNacimiento.type = 'text';
            inputFechaNacimiento.name = 'fechaNacimiento';
            inputFechaNacimiento.id = 'fechaNacimiento' + index;
            inputFechaNacimiento.value = campos[2];
            inputFechaNacimiento.classList.add('custom-text-input2');
            inputFechaNacimiento.readOnly = true;

            var labelGenero = document.createElement('label');
            labelGenero.textContent = 'Género:';
            var inputGenero = document.createElement('input');
            inputGenero.type = 'text';
            inputGenero.name = 'genero';
            inputGenero.id = 'genero' + index;
            inputGenero.value = campos[3];
            inputGenero.classList.add('custom-text-input2');
            inputGenero.readOnly = true;

            var labelCuidadosEspeciales = document.createElement('label');
            labelCuidadosEspeciales.textContent = 'Cuidados Especiales:';
            var inputCuidadosEspeciales = document.createElement('input');
            inputCuidadosEspeciales.type = 'text';
            inputCuidadosEspeciales.name = 'cuidadosEspeciales';
            inputCuidadosEspeciales.id = 'cuidadosEspeciales' + index;
            inputCuidadosEspeciales.value = campos[4];
            inputCuidadosEspeciales.classList.add('custom-text-input2');
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
            botonEliminar.className = 'btn-eliminar2';
            botonEliminar.style.marginTop = '10px';
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

    // Preguntas Dependientes

    document.addEventListener('DOMContentLoaded', function () {
        // Escucha el cambio en la respuesta de "¿Tiene alguna mascota actualmente?"
        document.querySelectorAll('input[name="otrasMascotas"]').forEach((input) => {
            input.addEventListener('change', function () {
                if (this.value === 'S') {
                    document.getElementById('otrasMascotasR-container').style.display = 'block';
                    document.getElementById('esterilizados-container').style.display = 'block';
                } else {
                    document.getElementById('otrasMascotasR-container').style.display = 'none';
                    document.getElementById('esterilizados-container').style.display = 'none';
                    document.getElementById('esterilizadosR-container').style.display = 'none';
                }
            });
        });

        // Escucha el cambio en la respuesta de "¿Están esterilizados?"
        document.querySelectorAll('input[name="esterilizados"]').forEach((input) => {
            input.addEventListener('change', function () {
                if (this.value === 'N') {
                    document.getElementById('esterilizadosR-container').style.display = 'block';
                } else {
                    document.getElementById('esterilizadosR-container').style.display = 'none';
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        // Escucha el cambio en la respuesta de "¿Ha tenido otras mascotas anteriormente?"
        document.querySelectorAll('input[name="anteriorMascotas"]').forEach((input) => {
            input.addEventListener('change', function () {
                if (this.value === 'S') {
                    document.getElementById('anteriorMascotasR-container').style.display = 'block';
                } else {
                    document.getElementById('anteriorMascotasR-container').style.display = 'none';
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        // Escucha el cambio en la respuesta de "¿Hay niños en el hogar?"
        document.querySelectorAll('input[name="ninos"]').forEach((input) => {
            input.addEventListener('change', function () {
                if (this.value === 'S') {
                    document.getElementById('ninosR-container').style.display = 'block';
                } else {
                    document.getElementById('ninosR-container').style.display = 'none';
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        // Escucha el cambio en la respuesta de "La casa y/o apartamento donde vive actualmente es:"
        document.querySelectorAll('input[name="vivienda"]').forEach((input) => {
            input.addEventListener('change', function () {
                if (this.value === 'Arrendado' || this.value === 'Anticresado') {
                    document.getElementById('permiteMascotas-container').style.display = 'block';
                } else {
                    document.getElementById('permiteMascotas-container').style.display = 'none';
                }
            });
        });
    });

    document.addEventListener('DOMContentLoaded', function () {
        // Escucha el cambio en la respuesta de "¿Está de acuerdo en que se haga una visita periódica a su domicilio?"
        document.querySelectorAll('input[name="autorizaVisitas"]').forEach((input) => {
            input.addEventListener('change', function () {
                if (this.value === 'N') {
                    document.getElementById('autorizaVisitasR-container').style.display = 'block';
                } else {
                    document.getElementById('autorizaVisitasR-container').style.display = 'none';
                }
            });
        });
    });

    var codigoDeMascota = "<%=codigoMascota%>";

    // Autocompletar el formulario con los datos de la mascota
    if (codigoDeMascota != null && codigoDeMascota !== "") {
        document.getElementById("codigoMascotas").value = codigoDeMascota;
        // Buscar la mascota usando la función buscarMascota
        var indiceMascota = buscarMascota(codigoDeMascota, 0);
        if (indiceMascota !== false) {
            // Asignar los valores a los campos correspondientes del formulario
            var nombreMascota = mascotas[indiceMascota][1];
            var genero = mascotas[indiceMascota][2];
            var tamano = mascotas[indiceMascota][3];
            var foto = mascotas[indiceMascota][4];
            var cuidadosEspeciales = mascotas[indiceMascota][5];
            var fechaNacimiento = mascotas[indiceMascota][6];
            // Asignar los valores a los campos del formulario
            document.getElementById("nombreMascota").value = nombreMascota;
            document.getElementById("genero").value = mostrarGenero(genero);
            document.getElementById("fechaNacimiento").value = fechaNacimiento;
            document.getElementById("cuidadosEspeciales").value = cuidadosEspeciales;
            document.getElementById("fotoMascota").src = "presentacion/mascota/" + foto;

        } else {
            console.error("No se encontró una mascota con el código proporcionado.");
        }
    }
</script>
</body>
</html>