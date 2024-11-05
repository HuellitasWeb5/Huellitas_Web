<%@page import="clases.Donacion"%>
<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.ConceptoDonacion"%>
<%@page import="clases.TipoDonacion"%>
<%@page import="clases.DonacionDetalle"%>
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>

    <head>
        <link rel="stylesheet" href="presentacion/style-TarjetasFormularios.css">
    </head>
    <%
        String accion = request.getParameter("accion");
    %>

    <body onload="cargarFecha()">
    <center><h3>DONACIONES</h3></center>

    <!-- Formulario principal -->
    <div class="card-carousel">
        <div class="card">
            <div class="titulo">
                <h2>DATOS DEL USUARIO</h2>
            </div>
            <div class="card-body">
                <form name="formulario" method="post" action="principal.jsp?CONTENIDO=8.Donacion/donacionesFormularioActualizar.jsp">

                    <div class="form-group">
                        <label>Fecha actual:</label>
                        <span id="fecha"></span> <!-- Aquí no se usa value, se cambiará el contenido con JavaScript -->
                    </div>

                    <div class="form-group">
                        <label>Identificación</label>
                        <input type="text" name="identificacionD" id="identificacionD" value="" required>
                    </div>

                    <div class="form-group">
                        <label for="nombre">Nombre</label>
                        <span id="nombre" readonly></span> <!-- Se elimina el atributo "value" en span -->
                    </div>

                    <div class="form-group">
                        <label for="telefono">Número de teléfono</label>
                        <span id="telefono" readonly></span> <!-- Se elimina el atributo "value" en span -->
                    </div>

                    <div class="form-group">
                        <label for="direccion">Dirección</label>
                        <span id="direccion" readonly></span> <!-- Se elimina el atributo "value" en span -->
                    </div>

                    <div class="form-group">
                        <label for="residencia">Residencia</label>
                        <span id="residencia" readonly></span> <!-- Se elimina el atributo "value" en span -->
                    </div>

                    <div class="form-group">
                        <label for="correo">Correo Electrónico</label>
                        <span id="correo" readonly></span> <!-- Se elimina el atributo "value" en span -->
                    </div>

                    <div class="form-group">
                        <label>Descripción</label>
                        <textarea id="descripcion" name="descripcion" rows="6" cols="40" required></textarea>
                    </div>

                    <!-- Campo oculto para almacenar la cadena de donaciones -->
                    <input  name="donacion" id="donacion" required>
                    <input type="hidden" name="accion" value="<%=accion%>">
                    <center>
                        <br><br>

                        <div class="btn-container">
                            <input class="btn-adicionar" type="submit" value="Guardar Donación" onclick="return validarFormularioPrincipal();">
                            <input class="btn-eliminar" type="button" value="Cancelar" onClick="window.history.back()" class="btn-cancelar">
                        </div>
                    </center>
                </form>
                <div class="form-group"><button class="btn-otro" onclick="abrirFormulario();">Agregar Detalles de Donación</button></div>
            </div>
        </div>
    </div>


    <!-- Botón para abrir el formulario modal -->

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

    <!-- Contenedor para mostrar los detalles de donaciones -->
    <div class="swiper-container">
        <div class="swiper-wrapper">
            <!-- Aquí se cargan dinámicamente las tarjetas de donaciones -->
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
    </div>
</body>

<script>
    var personas = <%=Persona.getListaEnArreglosJS("tipo='C'", null)%>;
    var conceptoDonacion = <%=ConceptoDonacion.getListaEnArreglosJS(null, null)%>;
    var vectorPersonas = new Array();
    var vectorIdConceptosDonaciones=new Array();
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
            if (conceptoDonacion[i][2] == codigoTipoDonacion && !vectorIdConceptosDonaciones.includes(conceptoDonacion[i][0])) {
                document.formularioDonacionDetalle.donacionConcepto.length++;
                document.formularioDonacionDetalle.donacionConcepto.options[document.formularioDonacionDetalle.donacionConcepto.length - 1].value = conceptoDonacion[i][0];
                document.formularioDonacionDetalle.donacionConcepto.options[document.formularioDonacionDetalle.donacionConcepto.length - 1].text = conceptoDonacion[i][1];
            }
        }
    }

    $('#identificacionD').change(function () {
        let identificacion = this.value.trim();
        let indicePersona = buscarPersona(identificacion, 0);
        let nombre = personas[indicePersona][1];
        let telefono = personas[indicePersona][2];
        let direccion = personas[indicePersona][3];
        let residencia = personas[indicePersona][4];
        let correo = personas[indicePersona][5];

        document.getElementById("nombre").innerText = nombre;
        document.getElementById("telefono").innerText = telefono;
        document.getElementById("direccion").innerText = direccion;
        document.getElementById("residencia").innerText = residencia;
        document.getElementById("correo").innerText = correo;
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

    $(function () {
        $("#formulario").dialog({
            autoOpen: false,
            show: {
                effect: "clip",
                duration: 1000
            },
            hide: {
                effect: "clip",
                duration: 1000
            },
            width: 560,
            height: 294
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
        const tipoDonacionId = document.getElementById('tipoDonacion').value;
        const donacionConceptoId = document.getElementById('donacionConcepto').value;
        vectorIdConceptosDonaciones[vectorIdConceptosDonaciones.length]=donacionConceptoId;
        const cantidad = document.getElementById('cantidad').value;

        if (tipoDonacionId === '' || donacionConceptoId === '' || cantidad === '' || cantidad <= 0) {
            alert('Por favor, completa todos los campos antes de agregar el detalle de la donación.');
            return;
        }

        const objeto = document.getElementById("donacion");

        if (objeto.value !== '') {
            objeto.value += "||"; // separador para múltiples entradas
        }

        objeto.value += tipoDonacionId + "|" + donacionConceptoId + "|" + cantidad;

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

            var tipoDonacionElemento = document.createElement('p');
            tipoDonacionElemento.innerHTML = '<strong>Tipo de Donación:</strong> ' + campos[0];

            var conceptoElemento = document.createElement('p');
            conceptoElemento.innerHTML = '<strong>Donación Concepto:</strong> ' + campos[1];

            var cantidadElemento = document.createElement('p');
            cantidadElemento.innerHTML = '<strong>Cantidad:</strong> ' + campos[2];

            var botonEliminar = document.createElement('button');
            botonEliminar.textContent = 'Eliminar';
            botonEliminar.classList.add('btn-eliminar');
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

    function eliminarRegistro(index) {
        var datos = document.getElementById('donacion').value;
        var registros = datos.split('||');
        registros.splice(index, 1);
        document.getElementById('donacion').value = registros.join('||');
        cargarTabla();
    }

    function cargarFecha() {
        var fecha = new Date();
        var dia = String(fecha.getDate()).padStart(2, '0');
        var mes = String(fecha.getMonth() + 1).padStart(2, '0');
        var anio = fecha.getFullYear();
        var fechaActual = dia + '/' + mes + '/' + anio;
        document.getElementById('fecha').innerText = fechaActual;
    }

    cargarFecha();

    const swiper = new Swiper('.swiper-container', {
        loop: false,
        slidesPerView: 4,
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
</html>