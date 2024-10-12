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
<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>

<style>
    .card.selected {
        border: 2px solid #007BFF;
        background-color: #E9F5FF;
    }

    .ui-autocomplete {
        z-index: 1000; 
        max-height: 200px; 
        overflow-y: auto; 
        overflow-x: hidden;
    }
    </style>

    <%
        String accion = request.getParameter("accion");
        String codigo = request.getParameter("codigo");
        Apadrinamiento apadrinamiento = new Apadrinamiento();

        String listaPlan = "<div class='carousel-container'>";
        listaPlan += "<div class='swiper-container carousel'>";
        listaPlan += "<div class='swiper-wrapper'>";
        List<PlanesApadrinamiento> datosPlanes = PlanesApadrinamiento.getListaEnObjetos(null, null);
        for (int j = 0; j < datosPlanes.size(); j++) {
            PlanesApadrinamiento planes2 = datosPlanes.get(j);
            listaPlan += "<div class='swiper-slide'>";
            listaPlan += "<div class='card'>";
            listaPlan += "<div class='card-header'>";
            listaPlan += "<h2>" + planes2.getNombre() + "</h2>";
            listaPlan += "</div>";
            listaPlan += "<div class='card-body'>";

            // Aquí se agrega el label alrededor de la tarjeta
            listaPlan += "<label style='display: block; cursor: pointer;'>";
            listaPlan += "<p><strong>Codigo:</strong> " + planes2.getId() + "</p>";
            listaPlan += "<p><strong>Descripción:</strong> " + planes2.getDescripcion() + "</p>";
            listaPlan += "<div class='button-container'>";
            listaPlan += "<input type='radio' name='opcionSeleccionada' value='" + planes2.getId() + "' style='display: none;'>";
            listaPlan += "</div>";
            listaPlan += "</label>"; // Cierra el label

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
    <center>
        <div class="card-carousel">
            <div class="card">
                <div class="card-header">
                    <h3><%=accion.toUpperCase()%>  PADRIPET</h3>
                </div>
                <div class="card-body">

                    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp">

                        <input type="hidden" name="mascotasPlan" id="mascotasPlan">
                        <table border='0'>
                            <tr>
                                <th>Identificacion</th>
                                <td><input type="text" name="identificacion" id="identificacion" required></td>
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
                                    <input type="file" name="fotoRecibo" accept="image/*" onchange="mostrarFotoRecibo();" required="">
                                </td>
                            </tr>
                            <tr>
                                <th>Foto cedula</th>
                                <td>
                                    <input type="file" name="fotoCedula" accept="image/*" onchange="mostrarFotoCedula();" required="">
                                </td>
                            </tr>
                            </div>

                            <tr>
                                <td><input type="button" class="btn-otro" value="Seleccionar Mascota" onclick="abrirFormulario();" required=""></td>
                            </tr>

                        </table>
                        
                    </form>
                </div>
                <div class='btn-container'>
                            <input type="hidden" name="numero" value="<%=codigo%>">
                            <input type="submit" name="accion" class="btn-adicionar" value="<%= accion != null ? accion : "Adicionar"%>">
                            <input type="button" class="btn-eliminar" value="Cancelar" onClick="window.history.back()">
                        </div>

                <div class="carousel-container">
                    <div class="swiper-container" id="contenedorTarjetas">
                        <div class="swiper-wrapper">
                            <!-- Aquí se generarán dinámicamente las tarjetas -->
                        </div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>


            </div>

            <div id="formulario" title="Apadrinar mascota">
                <form name="formularioMascotas">
                    <table id="mascotas" border="0">
                        <tr><th>Mascota</th><th><input type="text" name="Mascota" id="Mascota" required></th></tr>
                        <tr><th>Fecha Inicio:</th><th><input type="date" name="Fecha" id="Fecha" required></th></tr>
                        <tr><th>Fecha Fin:</th><th><input type="date" name="FechaFin" id="FechaFin" required></th></tr>
                    </table>
                    <%= listaPlan%>
                    <div class='btn-container'>
                        <input type="button" class="btn-adicionar" value="Agregar" onclick="actualizarTabla();">
                        <input type="button" class="btn-eliminar" value="Cancelar" onclick="cerrarFormulario();">
                    </div>
                </form>
            </div>
    </center>
    <script>

        document.querySelectorAll('input[name="opcionSeleccionada"]').forEach(function (radio) {
            radio.addEventListener('change', function () {
                // Quitar la clase 'selected' de todas las tarjetas
                document.querySelectorAll('.card').forEach(function (card) {
                    card.classList.remove('selected');
                });

                // Agregar la clase 'selected' a la tarjeta correspondiente
                const card = this.closest('.card');
                if (card) {
                    card.classList.add('selected');
                }
            });
        });

        var planes = <%= PlanesApadrinamiento.getListaCompletaEnArregloJS(null, null)%>;

        function buscarPlanes(valor, indice) {
            var encontrado = false;
            var i = 0;
            while (!encontrado && i < planes.length) {
                if (valor === planes[i][indice]) {
                    encontrado = true;
                }
                i++;
            }
            if (encontrado)
                return i - 1;
            else
                return false;
        }


        document.addEventListener("DOMContentLoaded", function () {
            var swiper = new Swiper('.swiper-container', {
                slidesPerView: 3,
                spaceBetween: 5,
                loop: false,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev',
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

        $(document).ready(function () {
            var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
            var vectorMascotas = [];
            for (var i = 0; i < mascotas.length; i++) {
                vectorMascotas[i] = mascotas[i][1] + " - " + mascotas[i][0];
            }

            $("#Mascota").autocomplete({
                source: vectorMascotas,
                minLength: 1

            });
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



        function actualizarTabla() {
            var objeto = document.getElementById("mascotasPlan");

            if (objeto.value != '') {
                objeto.value += "||";
            }

            var mascota = document.formularioMascotas.Mascota.value;
            var codigoMascota = mascota.substring(mascota.indexOf("-") + 1).trim();

            var plan = document.querySelectorAll('input[name="opcionSeleccionada"]');
            var seleccion = '';
            plan.forEach(plan => {
                if (plan.checked) {
                    seleccion = plan.value;
                }
            });

            var fechaInicio = document.getElementById('Fecha').value;
            var fechaFin = document.getElementById('FechaFin').value;
            var lapsoPlan = fechaInicio + "/" + fechaFin;

            // Aquí se está creando la cadena para el input
            objeto.value += codigoMascota + "|" + seleccion + "|" + lapsoPlan;

            // Llamar a cargarTabla después de actualizar el input
            cargarTabla();

            cerrarFormulario();
        }


        var mascotas = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
        function buscarMascota(valor, indice) {
            var encontrado = false;
            var i = 0;
            while (!encontrado) {
                if (valor == mascotas[i][indice]) {
                    encontrado = true;
                }
                i++;
            }
            if (encontrado) {
                return i - 1;
            } else
                return false;
        }

        var planes = <%= PlanesApadrinamiento.getListaCompletaEnArregloJS(null, null)%>;

        function buscarPlanes(valor, indice) {
            var encontrado = false;
            var i = 0;
            while (!encontrado && i < planes.length) {
                if (valor === planes[i][indice]) {
                    encontrado = true;
                }
                i++;
            }
            if (encontrado)
                return i - 1;
            else
                return false;
        }


        function cargarTabla() {
            var contenedor = document.querySelector('.swiper-wrapper');
            contenedor.innerHTML = '';  // Limpiar el contenedor antes de agregar nuevas tarjetas

            var datos = document.getElementById('mascotasPlan').value;

            // Dividir los registros por '||'
            var registros = datos.split('||');
            registros.forEach(function (registro, index) {
                var campos = registro.split('|');

                // Buscar el nombre de la mascota
                var posision = buscarMascota(campos[0], 0);
                if (posision !== false) {
                    var nombreElemento = document.createElement('h2');
                    nombreElemento.textContent = 'Mascota: ' + mascotas[posision][1];

                    var codigoElemento = document.createElement('p');
                    codigoElemento.innerHTML = '<strong>Código:</strong> ' + campos[0];

                    // Buscar el plan
                    var posisionPlan = buscarPlanes(campos[1], 0);
                    if (posisionPlan !== false) {
                        var planElemento = document.createElement('p');
                        planElemento.innerHTML = '<strong>Plan:</strong> ' + planes[posisionPlan][1];
                    } else {
                        var planElemento = document.createElement('p');
                        planElemento.innerHTML = '<strong>Plan:</strong> No encontrado';
                    }

                    var lapsoElemento = document.createElement('p');
                    lapsoElemento.innerHTML = '<strong>Lapso:</strong> ' + campos[2];

                    // Crear tarjeta
                    var tarjeta = document.createElement('div');
                    tarjeta.classList.add('card'); // Asegúrate de que la clase sea la correcta

                    // Crear botón de eliminar
                    var botonEliminar = document.createElement('button');
                    botonEliminar.textContent = 'Eliminar';
                    botonEliminar.onclick = function () {
                        eliminar(index); // Pasar el índice de la tarjeta a la función eliminar
                    };

                    // Añadir elementos a la tarjeta
                    tarjeta.appendChild(nombreElemento);
                    tarjeta.appendChild(codigoElemento);
                    tarjeta.appendChild(planElemento);
                    tarjeta.appendChild(lapsoElemento);
                    tarjeta.appendChild(botonEliminar);

                    // Añadir la tarjeta al contenedor
                    contenedor.appendChild(tarjeta);
                } else {
                    console.warn('Mascota no encontrada para el código: ' + campos[0]);
                }
            });

            // Inicializar Swiper
            var swiper = new Swiper('.swiper-container', {
                slidesPerView: 3,
                spaceBetween: 10,
                navigation: {
                    nextEl: '.swiper-button-next',
                    prevEl: '.swiper-button-prev'
                },
                loop: true
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

            // Actualizar el campo con los nuevos datos
            document.formulario.mascotasPlan.value = mascotae;

            // Recargar la tabla de tarjetas para reflejar el cambio
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
                width: 920,
                height: 'auto', // Cambia '440' por 'auto' para ajustar a la altura del contenido
                maxHeight: 440, // Establece un máximo si necesitas limitar la altura
                modal: true, // Opcional, si deseas que el fondo se oscurezca
                open: function (event, ui) {
                    $(this).dialog('option', 'height', $(this).outerHeight());
                }
            });
        });

        function abrirFormulario() {
            $('#formulario').dialog('open');
        }

        function cerrarFormulario() {

            $('#formulario').dialog('close');

            document.forms['formularioMascotas'].reset();

            $('#mascotas input[type="text"]').val('');
            $('#planes input[type="checkbox"]:checked').prop('checked', false);

        }


    </script>