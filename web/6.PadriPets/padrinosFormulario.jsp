<%-- 
    Document   : padrinosFormulario.jsp
    Created on : 02-sep-2024, 16:58:56
    Author     : SENA
--%>

<%@page import="clases.Persona"%>
<%@page import="clases.Mascota"%>
<%@page import="clases.PlanesApadrinamiento"%>
<%@page import="clases.ApadrinamientoDetalle"%>
<%@page import="java.util.List"%>
<%@page import="clases.Apadrinamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="presentacion/estiloRepetido.css">
</head>

<%
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    String lineaModificar = "";
    Apadrinamiento apadrinamiento = new Apadrinamiento();
    String listaDetalle = "";
    if (accion.equals("Modificar")) {
        apadrinamiento = new Apadrinamiento(codigo);
        lineaModificar = "<tr><th>Fecha</th><td>" + apadrinamiento.getFecha() + "</td></tr>";
        lineaModificar += "<tr><th>Codigo</th><td>" + apadrinamiento.getCodigo() + "</td></tr>";
        lineaModificar += "<tr><th>Identificacion</th><td>" + apadrinamiento.getIdentificacionPadrino() + "</td></tr>";
        lineaModificar += "<tr><th>Foto Recibo</th><td>" + apadrinamiento.getFotoRecibo() + "</td></tr>";
        lineaModificar += "<tr><th>Foto Cedula</th><td>" + apadrinamiento.getFotoCedula() + "</td></tr>";
        List<ApadrinamientoDetalle> datosDetalle = apadrinamiento.getDetalles();
        for (int k = 0; k < datosDetalle.size(); k++) {
            ApadrinamientoDetalle detalle = datosDetalle.get(k);
            listaDetalle += "<tr>";
            listaDetalle += "<td align='rigth'>" + detalle.getCodigoMascota() + "</td>";
            listaDetalle += "<td align='rigth'>" + detalle.getPlanApadrinamiento() + "</td>";
            listaDetalle += "<td align='rigth'>" + detalle.getLapsoApadrinamiento() + "</td>";
            listaDetalle += "<td>";
            listaDetalle += "<input type='button' title='Eliminar'>eliminar";
            listaDetalle += "</td>";
            listaDetalle += "</tr>";
        }
    }
    String listaPlan = "<div class='carousel-container'>"; // Contenedor principal
    listaPlan += "<div class='swiper-container carousel'>"; // Contenedor de Swiper
    listaPlan += "<div class='swiper-wrapper'>"; // Necesario para Swiper
    List<PlanesApadrinamiento> datosPlanes = PlanesApadrinamiento.getListaEnObjetos(null, null);
    System.out.println("Tamaño de datosPlanes: " + datosPlanes.size());
    for (int j = 0; j < datosPlanes.size(); j++) {
        PlanesApadrinamiento planes2 = datosPlanes.get(j);
        listaPlan += "<div class='swiper-slide'>"; // Clase para swiper
        listaPlan += "<div class='card'>";
        listaPlan += "<div class='card-header'>";
        listaPlan += "<h2>" + planes2.getNombre() + "</h2>";
        listaPlan += "</div>";
        listaPlan += "<div class='card-body'>";
        listaPlan += "<p><strong>Codigo:</strong> " + planes2.getId() + "</p>";
        listaPlan += "<p><strong>Descripción:</strong> " + planes2.getDescripcion() + "</p>";
        listaPlan += "<div class='button-container'>";
        listaPlan += "<input type='radio' name='opcionSeleccionada' value='" + planes2.getNombre() + "'>";
        listaPlan += "</div>";
        listaPlan += "</div>";
        listaPlan += "</div>";
        listaPlan += "</div>";
    }
    listaPlan += "</div>"; // Cierre del contenedor de tarjetas

    listaPlan += "<div class='swiper-button-prev'></div>";
    listaPlan += "<div class='swiper-button-next'></div>";
    listaPlan += "</div>"; // Cierre del contenedor de Swiper
    listaPlan += "</div>"; // Cierre del contenedor principal


%>

<h3><%=accion.toUpperCase()%>  PADRIPET</h3>
<table border="0">
    <td>
        <form name="formulario" method="post" action="principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp">
            <table border='0'>
                <%=lineaModificar%>
                <tr>
                    <th>Código</th><td id="codigoPadrino"></td>
                </tr>
                <tr>
                    <th>Identificacion</th>
                    <td><input type="text" name="identificacion" id="identificacion"></td>
                </tr>
                <tr>
                    <th>Nombre</th>
                    <td type="text" name="nombre" id="nombre"></td>
                </tr>
                <tr>
                    <th>Direccion</th>
                    <td type="text" name="direccion" id="direccion"></td>
                </tr>
                <tr>
                    <th>Telefono</th>
                    <td type="text" name="telefono" id="telefono"></td>
                </tr>
                <tr>
                    <th>Foto recibo</th>
                    <td>
                        <input type="file" name="fotoRecibo" accept="image/*" onchange="mostrarFotoRecibo();">
                    </td>
                </tr>
                <tr>
                    <th>Foto cedula</th>
                    <td>
                        <input type="file" name="fotoCedula" accept="image/*" onchange="mostrarFotoCedula();">
                    </td>
                </tr>

            </table>
        </form>
    </td>
</td><td><img src="presentacion/padripet/<%=apadrinamiento.getFotoRecibo()%>" id="fotoRecibo" width="auto" height="350"></td>
</td><td><img src="presentacion/padripet/<%=apadrinamiento.getFotoCedula()%>" id="fotoCedula" width="auto" height="350"></td>
</table>
<input type="button" value="Adicionar Mascota" onclick="abrirFormulario();">

            <input type="hidden" name="mascotasPlan" size="100">
<!--  desde aqui tengo que hacer cambios para las tarjetas de las mascotas seleccionadas y el plan-->
            <div class="carousel-container"> <!-- Contenedor principal para las tarjetas -->
                <div class="swiper-container" id="mascotasCarousel"> <!-- Contenedor de Swiper -->
                    <div class="swiper-wrapper" id="mascotasCards"> <!-- Contenedor de las tarjetas -->
                        <!-- Las tarjetas se generarán aquí -->
                    </div>
                    <div class="swiper-button-prev"></div>
                    <div class="swiper-button-next"></div>
                </div>
            </div>

            <input type="hidden" name="numero" value="<%=codigo%>">
            <input type="submit" name="accion" value="<%=accion%>">
            <input type="button" value="Cancelar" onClick="window.history.back()">
<div id="formulario" title="Apadrinar mascota">
    <form name="formularioMascotas">
        <table id="mascotas" border="0">
            <thead>
                <tr><th>Mascota</th><th><input type="text" id="Mascota"></th></tr>
                <tr><th>Fecha Inicio: </th><th><input type="date" id="Fecha"></th></tr>
                <tr><th>Fecha Fin: </th><th><input type="date" id="FechaFin"></th></tr>
            </thead>
        </table>
        <%= listaPlan%>
        <input type="button" value="Agregar" onclick="actualizarTabla();">
        <input type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>
</div>
<script>

    document.addEventListener("DOMContentLoaded", function () {
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 'auto', // Permite mostrar tantas tarjetas como quepan
            spaceBetween: 10, // Espacio entre tarjetas
            loop: false, // Cambia a true si quieres que el carrusel sea cíclico
            navigation: {
                nextEl: '.swiper-button-next', // Selecciona el botón siguiente
                prevEl: '.swiper-button-prev', // Selecciona el botón anterior
            },
        });
    });


    function mostrarFotoRecibo() {
        var lector = new FileReader();
        lector.readAsDataURL(document.formulario.fotoRecibo.files[0]);
        lector.onloadend = function () {
            document.getElementById("fotoRecibo").src = lector.result;
        };
    }

    function mostrarFotoCedula() {
        var lector = new FileReader();
        lector.readAsDataURL(document.formulario.fotoCedula.files[0]);
        lector.onloadend = function () {
            document.getElementById("fotoCedula").src = lector.result;
        };
    }



    var mascota = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
    var vectorMascotas = new Array();
    for (var i = 0; i < mascota.length; i++) {
        vectorMascotas[i] = mascota[i][1] + " - " + mascota[i][0];
    }
    ;
    $("#Mascota").autocomplete({
        source: vectorMascotas
    });

    var personas = <%=Persona.getListaEnArreglosJS("tipo='C'", null)%>;
    var vectorPersonas = new Array();
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0];
    }
    ;
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
        nombres = personas[indicePersona][1];
        direccion = personas[indicePersona][3];
        telefono = personas[indicePersona][2];
        document.getElementById("nombre").innerHTML = nombres;
        document.getElementById("direccion").innerHTML = direccion;
        document.getElementById("telefono").innerHTML = telefono;
    });

    function buscarMascota(valor, indice) {
        var encontrado = false;
        var i = 0;
        while (!encontrado) {
            if (valor == mascota[i][indice]) {
                encontrado = true;
            }
            i++;
        }
        if (encontrado)
            return i - 1;
        else
            return false;
    }

    function actualizarTabla() {
        var objeto = document.formulario.mascotasPlan;
        if (objeto.value != '')
            objeto.value += "||";

        var mascota = document.formularioMascotas.Mascota.value;
        var nombreMascota = mascota.substring(0, mascota.indexOf("-")).trim();
        var codigo = document.formularioMascotas.Mascota.value;
        var codigoMascota = codigo.substring(codigo.indexOf("-") + 1).trim();

        var Plan = document.querySelectorAll('input[name="opcionSeleccionada"]');
        let seleccion = '';
        Plan.forEach(Plan => {
            if (Plan.checked) {
                seleccion = Plan.value;
            }
        });

        var fechaInicio = document.getElementById('Fecha').value;
        var fechaFin = document.getElementById('FechaFin').value;
        var LapsoPlan = fechaInicio + " / " + fechaFin;

        objeto.value += nombreMascota + "|" + codigoMascota + "|" + seleccion + "|" + LapsoPlan;

        cargarTabla(); // Cargar las tarjetas después de agregar
        cerrarFormulario(); // Si tienes un formulario que deseas cerrar
    }

    function cargarTabla() {
    var contenedor = document.getElementById("mascotasCards");
            contenedor.innerHTML = ''; // Limpiar el contenedor de tarjetas
            var filas = document.formulario.mascotasPlan.value.split("||");
            if (filas != "") {
    filas.forEach((fila, index) => {
    var datos = fila.split("|");
            var nombreMascota = datos[0];
            var codMascota = datos[1];
            var plan = datos[2];
            var lapsoplan = datos[3];
            // Crear tarjeta
            contenedor.innerHTML += `
                <div class="swiper-slide">
                    <div class="card">
                        <div class="card-header">
                            <h2>${nombreMascota}</h2>
                        </div>
                        <div class="card-body">
                            <p><strong>Código Mascota:</strong> ${codMascota}</p>
                            <p><strong>Plan:</strong> ${plan}</p>
                            <p><strong>Lapso Plan:</strong> ${lapsoplan}</p>
                            <button title='Eliminar' onClick='eliminar(${index})'>Eliminar</button>
                        </div>
                    </div>
                </div>`;
    });
    }
    }
    function eliminar(fila) {
    var mascotae = "";
            var filas = document.formulario.mascotasPlan.value.split("||");
            var contador = 0;
            for (var i = 0; i < filas.length; i++) {
    if (i != fila) {
    if (contador > 0)
            mascotae += "||";
            mascotae += filas[i];
            contador++;
    }
    }
    document.formulario.mascotasPlan.value = mascotae;
            cargarTabla();
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
            width: 920, // Ancho del diálogo en píxeles
            height: 440
    });
    });
            function abrirFormulario() {
            $('#formulario').dialog('open');
            }

    function cerrarFormulario() {
    // Cerrar el diálogo
    $('#formulario').dialog('close');
            // Restaurar valores del formulario
            document.forms['formularioMascotas'].reset(); // Resetea todos los inputs del formulario

            // Limpiar el contenido de la tabla de selección (si es necesario)
            $('#mascotas input[type="text"]').val(''); // Limpia los campos de texto
            $('#planes input[type="checkbox"]:checked').prop('checked', false); // Desmarca cualquier checkbox seleccionado en la tabla de planes
    }
</script>
