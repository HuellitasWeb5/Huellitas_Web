<%@page import="clases.DonacionDetalle"%>
<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    DonacionDetalle donacionDetalle = new DonacionDetalle();
    String accion =request.getParameter("accion");
    String codigo =request.getParameter("codigo");
    String lista = "";
    List<DonacionDetalle> datos = DonacionDetalle.getListaEnObjetos(null, null);
    for (int i = 0; i < datos.size(); i++) {
        donacionDetalle = datos.get(i);

        lista += "<div class='swiper-slide'>";
        lista += "<div class='card'>";
        lista += "<div class='card-header'>";
        lista += "<h2>Código Donación: " + donacionDetalle.getCodigoDonacion() + "</h2>";
        lista += "</div>";
        lista += "<div class='card-body'>";
        lista += "<p><strong>ID Concepto:</strong> " + donacionDetalle.getIdConcepto() + "</p>";
        lista += "<p><strong>Cantidad:</strong> " + donacionDetalle.getCantidad() + "</p>";
        lista += "<p><strong>Valor Unitario:</strong> " + donacionDetalle.getValorUnitarios() + "</p>";
        lista += "<p><strong>Código Donación:</strong> " + donacionDetalle.getCodigoDonacion() + "</p>";
        lista += "<div class='button-container'>";
        lista += "<button class='btn-detalles' onclick='verDetalles(\"" + donacionDetalle.getId() + "\");'>Detalles</button>";
        lista += "<button class='btn-modificar' onclick='abrirFormularioModificar(\"" + donacionDetalle.getId() + "\");'>Modificar</button>";
        lista += "<button class='btn-eliminar' onclick='confirmarEliminacion(\"" + donacionDetalle.getId() + "\");'>Eliminar</button>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
        lista += "</div>";
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
    <link rel="stylesheet" href="presentacion/prueba.css">
    <script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
</head>
<body>
    <center><h3>Agregar donacionDetallees</h3></center>
    <table>
        <tr>
            <th>Identificación</th>
            <td><input type="text" name="identificacion" id="identificacion"></td>
        </tr>
        <tr>
            <th>Nombre</th>
            <td type="text" name="nombre" id="nombre" ></td>
        </tr>
        <tr>
            <th>Fecha</th>
            <td><input type="datetime-local" name="fecha" id="fecha"></td>
        </tr>
        <tr>
            <th>Descripción</th>
            <td><input type="text" name="descripcion" id="descripcion"></td>
        </tr>
    </table>
    <div class="filter-container">
        <input type="text" id="filtroDonacions" placeholder="Filtrar donacions...">
        <button class="add-button" onclick="abrirFormulario();">Adicionar Donacion</button>
    </div>

    <div class="swiper-container">
        <div class="swiper-wrapper">
            <%=lista%>
        </div>
        <!-- Add Pagination -->
        <div class="swiper-pagination"></div>
        <!-- Add Navigation -->
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
    </div>

    <div id="formulario" title="Adicionar donacionDetallees">
        <form name="formularioDonacionDetalle"> 
            <table>
                <tr>
                    <th>ID Concepto</th>
                    <td><input type="text" name="idConcepto" id="idConcepto"></td>
                </tr>
                <tr>
                    <th>Cantidad</th>
                    <td><input type="text" name="cantidad" id="cantidad"></td>
                </tr>
                <tr>
                    <th>Valor Unitario</th>
                    <td><input type="text" name="valorUnitario" id="valorUnitario"></td>
                </tr>
                <tr>
                    <th>Código Donación</th>
                    <td><input type="text" name="codigoDonacion" id="codigoDonacion"></td>
                </tr>
            </table>
            <input type="button" value="Agregar" onclick="agregar();">
            <input type="button" value="Cancelar" onclick="cerrarFormulario();">
        </form>    
    </div>

    <script>
        var personas = <%=Persona.getListaEnArreglosJS(null, null)%>;
        var vectorPersonas = new Array();
        for (var i = 0; i < personas.length; i++) {
            vectorPersonas[i] = personas[i][0];//+ " - " + personas[i][1];
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
            nombres = personas[indicePersona][1];
            document.getElementById("nombre").innerHTML = nombres;
        });
        $(function () {
            $("#formulario").dialog({
                autoOpen: false,
                show: {
                    effect: "blind",
                    duration: 500
                },
                hide: {
                    effect: "explode",
                    duration: 500
                }
            });
        });

        function abrirFormulario(accion, id = null) {
            if (accion === "Modificar") {
                $('#formulario').dialog('option', 'title', 'Modificar Donación Detalle');
                document.querySelector('input[type="button"][value="Agregar"]').value = 'Modificar';
                document.querySelector('input[type="button"][value="Modificar"]').setAttribute('onclick', 'modificarDonacionDetalle(' + id + ');');

                cargarDatosDonacionDetalle(id);

            } else if (accion === "Adicionar") {
                $('#formulario').dialog('option', 'title', 'Adicionar Donación Detalle');
                document.querySelector('input[type="button"][value="Agregar"]').value = 'Agregar';
                document.querySelector('input[type="button"][value="Agregar"]').setAttribute('onclick', 'agregarDonacionDetalle();');

                document.getElementById('idConcepto').value = '';
                document.getElementById('cantidad').value = '';
                document.getElementById('valorUnitario').value = '';
                document.getElementById('codigoDonacion').value = '';
            }

            $('#formulario').dialog('open');
        }

        // Swiper JS initialization
        var swiper = new Swiper('.swiper-container', {
            slidesPerView: 3,
            spaceBetween: 30,
            navigation: {
                nextEl: '.swiper-button-next',
                prevEl: '.swiper-button-prev',
            },
            pagination: {
                el: '.swiper-pagination',
                clickable: true,
            },
        });
    </script>
</body>
</html>