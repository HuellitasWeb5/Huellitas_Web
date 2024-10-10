<%@page import="clases.Donacion"%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.ConceptoDonacion"%>
<%@page import="clases.TipoDonacion"%>
<%@page import="clases.DonacionDetalle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <link rel="stylesheet" href="presentacion/Donacion.css">
</head>
<%
    TipoDonacion tipoDonacion = new TipoDonacion();
    String accion = request.getParameter("accion");
    Donacion donacion = new Donacion();
    DonacionDetalle donacionDetalle = new DonacionDetalle();
    String codigo = request.getParameter("codigo");
    
%>
<body onload="cargarFecha()">
    <h3>DONACIONES</h3>

    <!-- Formulario principal -->
    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=8.Donacion/donacionesFormularioActualizar.jsp">
        <div class="container">
            <button class="close-btn" onclick="toggleContainer(event)">−</button>

            <div class="header">Datos del Usuario</div>
            <div class="content">

                <div class="form-group">
                    <label>Fecha actual:</label>
                    <span id="fecha"></span>
                </div>

                <div class="form-group">
                    <label>Identificación</label>
                    <input type="text" name="identificacionD" id="identificacionD" value="" required>
                </div>

                <div class="form-group">
                    <label for="nombre">Nombre</label>
                    <span name="nombre" id="nombre" value="" readonly></span>
                </div>

                <div class="form-group">
                    <label for="telefono">Número de teléfono</label>
                    <span name="telefono" id="telefono" value="" readonly></span>
                </div>

                <div class="form-group">
                    <label for="direccion">Dirección</label>
                    <span name="direccion" id="direccion" value="" readonly></span>
                </div>

                <div class="form-group">

                    <label for="residencia">Residencia</label>
                    <span name="residencia" id="residencia" value="" readonly></span>
                </div>

                <div class="form-group">
                    <label for="correo">Correo Electrónico</label>
                    <span type="text" id="correo" value="" readonly></span>
                </div>

                <div class="form-group">
                    <label>Descripción</label>
                    <textarea id="descripcion" name="descripcion" rows="6" cols="40" required></textarea>
                </div>

                <!-- Campo oculto para almacenar la cadena de donaciones -->
                <input  type="hidden" name="donacion" id="donacion" required>
                <input type="hidden" name="accion" value="<%=accion%>">
            </div>

            <!-- Botón de envío que enviará los datos al archivo donacionesFormularioActualizar.jsp -->
            <!-- Botón de envío que enviará los datos al archivo donacionesFormularioActualizar.jsp -->
            <input type="submit" value="Guardar Donación" class="btn-submit" onclick="return validarFormularioPrincipal();">


        </div>  
    </form>

    <!-- Botón para abrir el formulario modal -->
    <button class="add-button" onclick="abrirFormulario();">Agregar Detalles de Donación</button>

    <!-- Formulario modal para ingresar detalles de donaciones -->
    <div id="formulario" title="Donaciones">
        <form name="formularioDonacionDetalle">
            <table>
                <tr>
                    <th>Tipo de donación</th>
                    <td>
                        <select id="tipoDonacion" name="tipoDonacion" onChange="actualizarConceptos(this.value)">
                            <option value="">Seleccione un tipo de donación</option>
                            <%= TipoDonacion.getListaEnOptions(null)%>
                        </select>
                    </td>
                </tr>
                <tr>
                    <th>Donación concepto</th>
                    <td>
                        <select id="donacionConcepto" name="donacionConcepto">
                            <option value="" disabled selected>Seleccione un concepto de donación</option>

                        </select>
                    </td>
                    <td>

                    </td>
                </tr>
                <tr>
                    <th>Cantidad</th>
                    <td><input type="number" name="cantidad" id="cantidad" value="1" required></td>
                </tr>
            </table>
            <input class="btn-adicionar" type="button" value="Agregar" onclick="actualizarTabla();">
            <input class="btn-eliminar" type="button" value="Cancelar" onclick="cerrarFormulario();">
        </form>
    </div>

    <!-- Contenedor de las tarjetas de detalles -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <!-- aquí van las tarjetas -->
            <br><br>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
</body>

<script>
    var personas = <%=Persona.getListaEnArreglosJS(null, null)%>;
    var conceptoDonacion = <%=ConceptoDonacion.getListaEnArreglosJS(null, null)%>;
    var vectorPersonas = new Array();
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0];
    }
    $("#identificacionD").autocomplete({
        source: vectorPersonas
    });
    function validarFormularioPrincipal() {

        const donacionDetalles = document.getElementById('donacion').value;

        if (donacionDetalles === '') {
            alert('Por favor, agregue al menos un detalle de donación antes de guardar el formulario.');
            return false; // Evita que el formulario se envíe
        }

        return true;
    }

    function actualizarConceptos(codigoTipoDonacion) {
        document.formularioDonacionDetalle.donacionConcepto.length = 1;
        for (var i = 0; i < conceptoDonacion.length; i++) {
            if (conceptoDonacion[i][2] == codigoTipoDonacion) {
                document.formularioDonacionDetalle.donacionConcepto.length++;
                document.formularioDonacionDetalle.donacionConcepto.options[document.formularioDonacionDetalle.donacionConcepto.length - 1].value = [i][0];
                document.formularioDonacionDetalle.donacionConcepto.options[document.formularioDonacionDetalle.donacionConcepto.length - 1].text = conceptoDonacion[i][1];
            }
        }
    }

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

    $('#identificacionD').change(function () {
        identificacion = this.value.trim();
        indicePersona = buscarPersona(identificacion, 0);
        nombre = personas[indicePersona][1];
        telefono = personas[indicePersona][2];
        direccion = personas[indicePersona][3];
        residencia = personas[indicePersona][4];
        correo = personas[indicePersona][5];
        document.getElementById("nombre").innerHTML = nombre;
        document.getElementById("telefono").innerHTML = telefono;
        document.getElementById("direccion").innerHTML = direccion;
        document.getElementById("residencia").innerHTML = residencia;
        document.getElementById("correo").innerHTML = correo;
    });

    function toggleContainer(event) {
        event.preventDefault();
        const content = document.querySelector('.content');
        content.classList.toggle('hidden');
    }

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
            width: 400,
            height: 250
        });
    });

    function abrirFormulario() {
        $('#formulario').dialog('open');
    }


    function cerrarFormulario() {
        document.getElementById('tipoDonacion').value = "";
        document.getElementById('donacionConcepto').value = "";
        document.getElementById('cantidad').value = "";
        $('#formulario').dialog('close');
    }

    function actualizarTabla() {
        // Obtén los valores de los campos del formulario modal
        const tipoDonacionId = document.getElementById('tipoDonacion').value;
        const donacionConceptoId = document.getElementById('donacionConcepto').value;
        const cantidad = document.getElementById('cantidad').value;

        // Verifica si alguno de los campos está vacío
        if (tipoDonacionId === '' || donacionConceptoId === '' || cantidad === '' || cantidad <= 0) {
            alert('Por favor, completa todos los campos antes de agregar el detalle de la donación.');
            return; // Salimos de la función si la validación no pasa
        }

        // Continúa con el proceso si todos los campos están llenos
        const objeto = document.getElementById("donacion");

        if (objeto.value !== '') {
            objeto.value += "||"; // separador para múltiples entradas
        }

        // Guardar solo los IDs en el formato: tipoDonacionId|donacionConceptoId|cantidad
        objeto.value += tipoDonacionId + "|" + donacionConceptoId + "|" + cantidad;

        // Actualizar la tabla y cerrar el formulario
        cargarTabla();
        cerrarFormulario();
    }




    function cargarTabla() {
        var contenedor = document.querySelector('.swiper-wrapper');
        contenedor.innerHTML = '';

        var datos = document.getElementById('donacion').value;

        if (datos === '') {
            return;
        }

        var registros = datos.split('||');

        registros.forEach(function (registro, index) {
            var campos = registro.split('|');

            var tarjeta = document.createElement('div');
            tarjeta.classList.add('swiper-slide');

            var card = document.createElement('div');
            card.classList.add('card');

            // Agregar título "Donación"
            var tituloElemento = document.createElement('h2');
            tituloElemento.textContent = 'Donación';
            card.appendChild(tituloElemento);

            var tipoDonacionElemento = document.createElement('p');
            tipoDonacionElemento.innerHTML = '<strong>Tipo de Donación:</strong> ' + campos[0];

            var conceptoElemento = document.createElement('p');
            conceptoElemento.innerHTML = '<strong>Donación Concepto:</strong> ' + campos[1];

            var cantidadElemento = document.createElement('p');
            cantidadElemento.innerHTML = '<strong>Cantidad:</strong> ' + campos[2];

            var botonEliminar = document.createElement('button');
            botonEliminar.textContent = 'Eliminar';
            botonEliminar.onclick = function () {
                eliminarRegistro(index);
            };

            card.appendChild(tipoDonacionElemento);
            card.appendChild(conceptoElemento);
            card.appendChild(cantidadElemento);
            card.appendChild(botonEliminar);

            tarjeta.appendChild(card);
            contenedor.appendChild(tarjeta);
        });
    }

    function limpiarFormulario() {
        document.getElementById('nombreDetalle').value = '';
        document.getElementById('tipoDonacion').value = '';
        document.getElementById('donacionConcepto').value = '';
        document.getElementById('cantidad').value = '0';
    }

    function eliminarRegistro(index) {
        var datos = document.getElementById('donacion').value;
        var registros = datos.split('||');
        registros.splice(index, 1);
        document.getElementById('donacion').value = registros.join('||');
        cargarTabla();
    }

    const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 4,
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        pagination: {
            el: '.swiper-pagination',
            clickable: true,
        }
    });
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
