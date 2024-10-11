<%-- 
    Document   : verDetallesPadripets
    Created on : 10-oct-2024, 10:30:47
    Author     : SENA
--%>

<%@page import="clases.Mascota"%>
<%@page import="clases.Apadrinamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="clases.PlanesApadrinamiento"%>
<%@page import="java.util.List"%>
<!DOCTYPE html>
<%
        String codigo = request.getParameter("codigo");
        Apadrinamiento apadrinamiento = new Apadrinamiento(codigo);

%>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="presentacion/estiloyandar.css">
    <title>Detalles de Padripet</title>
</head>
<center>
        <div class="card-carousel">
            <div class="card">
                <div class="card-header">
                    <h3>DETALLES PADRIPET</h3>
                </div>
                <div class="card-body">

                    <form name="formulario" method="post" action="principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp">

                        <input type="hidden" name="mascotasPlan" id="mascotasPlan">
                        <table border='0'>
                            <tr>
                                <th>Identificacion</th>
                                <td><input type="text" name="identificacion" id="identificacion" required disabled> <%= apadrinamiento.getIdentificacionPadrino() %> </td>
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
                                    <input type="file" name="fotoRecibo" accept="image/*" onchange="mostrarFotoRecibo();" required="" disabled>
                                </td>
                            </tr>
                            <tr>
                                <th>Foto cedula</th>
                                <td>
                                    <input type="file" name="fotoCedula" accept="image/*" onchange="mostrarFotoCedula();" required=""  disabled>
                                </td>
                            </tr>
                            </div>

                        </table>
                        <div class='btn-container'>
                            <input type="hidden" name="numero" value="<%=codigo%>">
                            <input type="button" class="btn-otro" value="Regresar" onClick="window.history.back()">
                        </div>
                    </form>
                </div>


                <div class="carousel-container">
                    <div class="swiper-container" id="contenedorTarjetas">
                        <div class="swiper-wrapper">
                        </div>
                        <div class="swiper-button-prev"></div>
                        <div class="swiper-button-next"></div>
                    </div>
                </div>
            </div>
    </center>

<script>
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

                    // Añadir elementos a la tarjeta
                    tarjeta.appendChild(nombreElemento);
                    tarjeta.appendChild(codigoElemento);
                    tarjeta.appendChild(planElemento);
                    tarjeta.appendChild(lapsoElemento);
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
    
</script>