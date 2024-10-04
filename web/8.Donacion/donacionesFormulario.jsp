<%@page import="clases.ConceptoDonacion"%>
<%@page import="clases.TipoDonacion"%>
<%@page import="clases.DonacionDetalle"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String accion = request.getParameter("accion");
    DonacionDetalle donacionDetalle = new DonacionDetalle();
%>

<h3><%=accion.toUpperCase()%>  Donaciones</h3>
<!-- Formulario principal -->
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=8.Donacion/donacionesFormularioActualizar.jsp">

    <div class="container">
        <button class="close-btn" onclick="toggleContainer()">−</button>
        <div class="header">Datos del Usuario</div>
        <div class="content">
            <div class="form-group">
                <label>Identificación</label>
                <input type="text" name="identificacionD" id="identificacionD" value="">
            </div>
            <div class="form-group">
                <label for="nombre">Nombre</label>
                <span name="nombre" id="nombre" value="" readonly></span>
            </div>
            <div class="form-group">
                <label for="numero">Número</label>
                <span name="numero" id="numero" value="" readonly></span>
            </div>
            <div class="form-group">
                <label for="direccion">Dirección</label>
                <span name="direccion" id="direccion" value="" readonly></span>
            </div>
            <div class="form-group">
                <label for="correo">Correo Electrónico</label>
                <span type="text" id="correo" value="" readonly></span>
            </div>
        </div>
        <input name="donacion" id="donacion" type="hidden"> <!-- Input oculto para almacenar las donaciones -->
    </div>
</form>

<!-- Botón para abrir el formulario modal -->
<button class="add-button" onclick="abrirFormulario();">Abrir ventana</button>

<!-- Formulario modal para ingresar detalles de donaciones -->
<div id="formulario" title="Apadrinar mascota">
    <form name="formularioDonacionDetalle">
        <table>
            <tr>
                <th>Nombre</th>
                <td><input type="text" name="nombreDetalle" id="nombreDetalle" required></td>
            </tr>
            <tr>
                <th>Tipo de donacion</th>
                <td>
                    <select id="tipoDonacion" name="tipoDonacion">
                        <option value="" disabled selected>Seleccione un tipo de donacion</option>
                        <%= TipoDonacion.getListaEnOptions(null)%>
                    </select>
                </td>
            </tr>
            <tr>
                <th>Donacion concepto</th>
                <td>
                    <select id="donacionConcepto" name="donacionConcepto">
                        <option value="" disabled selected>Seleccione una donacion</option>
                        <%= ConceptoDonacion.getListaEnOptions(null)%>
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

<!-- Contenedor de las tarjetas -->
<div class="swiper-container">
    <div class="swiper-wrapper">
        <!-- aqui va las tarjetas--> 
        <br><br>
    </div>
    <div class="swiper-button-next"></div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-pagination"></div>
</div>

<script>

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
        $('#formulario').dialog('close');
        limpiarFormulario(); // Llama a la función para limpiar los campos
    }

    function actualizarTabla() {
        var objeto = document.getElementById("donacion");

        // Verifica si el campo "donacion" tiene contenido previo
        if (objeto.value != '')
            objeto.value += "||"; // Agrega un separador para nuevos registros

        // Captura los valores del formulario
        var nombreDetalle = document.getElementById('nombreDetalle').value;
        var tipoDonacion = document.getElementById('tipoDonacion').value;
        var donacionConcepto = document.getElementById('donacionConcepto').value;
        var cantidad = document.getElementById('cantidad').value;

        // Guarda los valores en el input oculto
        objeto.value += nombreDetalle + "|" + tipoDonacion + "|" + donacionConcepto + "|" + cantidad;

        cargarTabla();  // Actualiza las tarjetas
        cerrarFormulario();  // Cierra el formulario modal
    }

    function cargarTabla() {
        // Obtiene el contenedor de las tarjetas
        var contenedor = document.querySelector('.swiper-wrapper');
        contenedor.innerHTML = '';  // Limpia el contenedor antes de agregar nuevas tarjetas

        // Obtiene los datos almacenados en el input oculto "donacion"
        var datos = document.getElementById('donacion').value;

        // Verifica si hay datos
        if (datos === '') {
            return;
        }

        // Separa los registros usando "||" como delimitador
        var registros = datos.split('||');

        // Itera sobre cada registro y genera una tarjeta
        registros.forEach(function (registro, index) {
            var campos = registro.split('|');

            // Crea la tarjeta
            var tarjeta = document.createElement('div');
            tarjeta.classList.add('swiper-slide');

            var card = document.createElement('div');
            card.classList.add('card');

            // Agrega el contenido de la tarjeta
            var nombreElemento = document.createElement('h2');
            nombreElemento.textContent = 'Nombre: ' + campos[0];

            var tipoDonacionElemento = document.createElement('p');
            tipoDonacionElemento.innerHTML = '<strong>Tipo de Donación:</strong> ' + campos[1];

            var conceptoElemento = document.createElement('p');
            conceptoElemento.innerHTML = '<strong>Donación Concepto:</strong> ' + campos[2];

            var cantidadElemento = document.createElement('p');
            cantidadElemento.innerHTML = '<strong>Cantidad:</strong> ' + campos[3];

            // Botón para eliminar la tarjeta
            var botonEliminar = document.createElement('button');
            botonEliminar.textContent = 'Eliminar';
            botonEliminar.onclick = function () {
                eliminarRegistro(index); // Llama a la función eliminar con el índice del registro
            };

            // Añadir elementos a la tarjeta
            card.appendChild(nombreElemento);
            card.appendChild(tipoDonacionElemento);
            card.appendChild(conceptoElemento);
            card.appendChild(cantidadElemento);
            card.appendChild(botonEliminar); // Añadir el botón de eliminar

            tarjeta.appendChild(card);

            // Añadir la tarjeta al contenedor
            contenedor.appendChild(tarjeta);
        });
    }

    function limpiarFormulario() {
        // Limpia los campos del formulario
        document.getElementById('nombreDetalle').value = '';
        document.getElementById('tipoDonacion').value = '';
        document.getElementById('donacionConcepto').value = '';
        document.getElementById('cantidad').value = '';
    }
    function eliminarRegistro(index) {
        // Obtiene los datos actuales
        var datos = document.getElementById('donacion').value;

        // Separa los registros
        var registros = datos.split('||');

        // Elimina el registro en la posición indicada por 'index'
        registros.splice(index, 1);

        // Vuelve a unir los registros y los guarda en el input oculto
        document.getElementById('donacion').value = registros.join('||');

        // Recarga las tarjetas
        cargarTabla();
    }

    const swiper = new Swiper('.swiper-container', {
        loop: true,
        slidesPerView: 4, // ayuda a mostrarme  4 tarjetas a la vez
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
</script>
