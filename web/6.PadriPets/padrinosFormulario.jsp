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
    String listaPlan = "<div class='carousel-container'>";
    listaPlan += "<div class='swiper-container carousel'>";
    listaPlan += "<div class='swiper-wrapper'>";
    List<PlanesApadrinamiento> datosPlanes = PlanesApadrinamiento.getListaEnObjetos(null, null);
    System.out.println("Tamaño de datosPlanes: " + datosPlanes.size());
    for (int j = 0; j < datosPlanes.size(); j++) {
        PlanesApadrinamiento planes2 = datosPlanes.get(j);
        listaPlan += "<div class='swiper-slide'>";
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
    listaPlan += "</div>";

    listaPlan += "<div class='swiper-button-prev'></div>";
    listaPlan += "<div class='swiper-button-next'></div>";
    listaPlan += "</div>";
    listaPlan += "</div>";


%>

<h3><%=accion.toUpperCase()%>  PADRIPET</h3>
<table border="0">
    <td>
        <form name="formulario" method="post" action="principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp">

            <input type="hidden" name="mascotasPlan" id="mascotasPlan">
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
<input type="button" value="Seleccionar Mascota" onclick="abrirFormulario();">


<div class="carousel-container">
    <div class="swiper-container" id="contenedorTarjetas">
        <div class="swiper-wrapper">
            <!-- Aquí se generarán dinámicamente las tarjetas -->
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
                <tr><th>Mascota</th><th><input type="text" name="Mascota" id="Mascota"></th></tr>
                <tr><th>Fecha Inicio:</th><th><input type="date" name="Fecha" id="Fecha"></th></tr>
                <tr><th>Fecha Fin:</th><th><input type="date" name="FechaFin" id="FechaFin"></th></tr>
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

  $(document).ready(function() {
    var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
    var vectorMascotas = [];
    for (var i = 0; i < mascotas.length; i++) {
        vectorMascotas[i] = mascotas[i][1] + " - " + mascotas[i][0];
    }
    
    // Inicializa el autocompletado con una configuración básica
    $("#Mascota").autocomplete({
        source: vectorMascotas,
        minLength: 1 // Se activa cuando el usuario escribe al menos 1 carácter
    });
});

    var personas = <%=Persona.getListaEnArreglosJS("tipo='C'", null)%>;
    var vectorPersonas = new Array();
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0];
    } ;
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
        var objeto = document.getElementById("mascotasPlan");

        if (objeto.value != '')
            objeto.value += "||";  // Asegúrate de agregar el separador correctamente

        var mascota = document.formularioMascotas.Mascota.value;
        var nombreMascota = mascota.substring(0, mascota.indexOf("-")).trim();  // Corregido subString
        var codigoMascota = mascota.substring(mascota.indexOf("-") + 1).trim();

        // Obtener la opción seleccionada
        var plan = document.querySelectorAll('input[name="opcionSeleccionada"]');
        var seleccion = '';
        plan.forEach(plan => {
            if (plan.checked) {
                seleccion = plan.value;
            }
        });

        // Fechas
        var fechaInicio = document.getElementById('Fecha').value;
        var fechaFin = document.getElementById('FechaFin').value;
        var lapsoPlan = fechaInicio + " / " + fechaFin;

        // Guardar el valor en el input "mascotasPlan"
        objeto.value += nombreMascota + "|" + codigoMascota + "|" + seleccion + "|" + lapsoPlan;

        cargarTabla();  // Asegúrate de que esta función exista o esté implementada correctamente
        cerrarFormulario();  // Cerrar formulario
    }

    function cargarTabla() {
    // Obtener el contenedor de las tarjetas (el swiper-wrapper dentro de la swiper-container)
    var contenedor = document.querySelector('.swiper-wrapper');
    contenedor.innerHTML = '';  // Limpiar el contenedor antes de agregar nuevas tarjetas

    // Obtener el valor del input 'mascotasPlan'
    var datos = document.getElementById('mascotasPlan').value;
    
    // Verificar que haya datos
    if (datos === '') {
        return;
    }

    // Separar los datos por el delimitador '||'
    var registros = datos.split('||');
    
    // Iterar sobre cada registro
    registros.forEach(function(registro) {
        var campos = registro.split('|');
        
        // Crear los elementos para la tarjeta
        var tarjeta = document.createElement('div');
        tarjeta.classList.add('swiper-slide');  // Añadir clase de swiper-slide
        
        var card = document.createElement('div');
        card.classList.add('card');  // Añadir clase de tarjeta
        
        // Crear el contenido de la tarjeta
        var nombreElemento = document.createElement('h2');
        nombreElemento.textContent = 'Mascota: ' + campos[0];
        
        var codigoElemento = document.createElement('p');
        codigoElemento.innerHTML = '<strong>Código:</strong> ' + campos[1];
        
        var planElemento = document.createElement('p');
        planElemento.innerHTML = '<strong>Plan:</strong> ' + campos[2];
        
        var lapsoElemento = document.createElement('p');
        lapsoElemento.innerHTML = '<strong>Lapso:</strong> ' + campos[3];
        
        // Agregar los elementos a la tarjeta
        card.appendChild(nombreElemento);
        card.appendChild(codigoElemento);
        card.appendChild(planElemento);
        card.appendChild(lapsoElemento);
        
        // Agregar la tarjeta a la diapositiva
        tarjeta.appendChild(card);
        
        // Agregar la tarjeta al contenedor (swiper-wrapper)
        contenedor.appendChild(tarjeta);
    });
    
    // Reiniciar swiper.js para actualizar el carrusel con las nuevas tarjetas
    var swiper = new Swiper('.swiper-container', {
        slidesPerView: 3,
        spaceBetween: 10,
        navigation: {
            nextEl: '.swiper-button-next',
            prevEl: '.swiper-button-prev',
        },
        loop: true,  // Hace que el carrusel sea cíclico
    });
}


   function eliminar(fila) {
    console.log("Eliminando fila:", fila);

    var mascotae = "";
    var filas = document.formulario.mascotasPlan.value.split("||");
    console.log("Filas antes de eliminar:", filas);

    var contador = 0;

    for (var i = 0; i < filas.length; i++) {
        if (i !== fila) {
            if (contador > 0)
                mascotae += "||";
            mascotae += filas[i];
            contador++;
        }
    }

    console.log("Filas después de eliminar:", mascotae);

    document.formulario.mascotasPlan.value = mascotae;

    cargarTabla(); // Recarga las tarjetas
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
