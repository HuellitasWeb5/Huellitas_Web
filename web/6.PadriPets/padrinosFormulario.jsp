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
<%
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    String lineaModificar = "";
    
    String listaDetalle = "";
    if (accion.equals("Modificar")) {
        Apadrinamiento apadrinamiento = new Apadrinamiento(codigo);
        lineaModificar = "<tr><th>Fecha</th><td>" + apadrinamiento.getFecha() + "</td></tr>";
        lineaModificar += "<tr><th>Codigo</th><td>" + apadrinamiento.getCodigo() + "</td></tr>";
        List<ApadrinamientoDetalle> datosDetalle = apadrinamiento.getDetalles();
        for (int k = 0; k < datosDetalle.size(); k++) {
            ApadrinamientoDetalle detalle = datosDetalle.get(k);
            listaDetalle += "<tr>";
            listaDetalle += "<td align='rigth'>" + detalle.getCodigoMascota() + "</td>";
            listaDetalle += "<td align='rigth'>" + detalle.getPlanApadrinamiento() + "</td>";
            listaDetalle += "<td align='rigth'>" + detalle.getLapsoApadrinamiento() + "</td>";
            listaDetalle += "<td>";
            listaDetalle += "<img src='presentacion/imagenes/modificar.png' width='30' heigth='30'  title='Modificar'>";
            listaDetalle += "<img src='presentacion/imagenes/eliminar.png' width='30' heigth='30'  title='Eliminar'>";
            listaDetalle += "</td>";
            listaDetalle += "</tr>";
        }
    }
    String listaPlan = "";
    List<PlanesApadrinamiento> datosPlanes = PlanesApadrinamiento.getListaEnObjetos(null, null);
    for (int j = 0; j < datosPlanes.size(); j++) {
        PlanesApadrinamiento planes2 = datosPlanes.get(j);
        listaPlan += "<tr>";
        listaPlan += "<td>" + planes2.getId() + "</td>";
        listaPlan += "<td>" + planes2.getNombre() + "</td>";
        listaPlan += "<td>" + planes2.getDescripcion() + "</td>";
        listaPlan += "<td><input type='radio' name='opcionSeleccionada' value='" + planes2.getNombre()+ "'></td>";
        listaPlan += "</tr>";
    }
%>

<h3><%=accion.toUpperCase()%>  PADRIPET</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=6.PadriPets/padrinosActualizar.jsp">
    <table border='0'>
        <%=lineaModificar%>
        <tr>
            <th>Código</th><td id="codigoPadrino"></td>
        </tr>
        <tr>
            <th>Identificacion</th>
            <td><input type="text" id="identificacionPadrino"></td>
        </tr>
        <tr>
            <th>Direccion</th>
            <td><input type="text" id="direccionPadrino"></td>
        </tr>
        <tr>
            <th>Telefono</th>
            <td><input type="text" id="telefonoPadrino"></td>
        </tr>
    </table>
    <br>
    <input type="button" value="Adicionar Mascota" onclick="abrirFormulario();">

    <input type="hidden" name="mascotasPlan" size="100">

    <table border="1" id="tablaMascotas">
        <tr><th>Mascota</th><th>Codigo Mascota</th><th>Plan</th><th>Lapso Plan</th></tr>
        <%=listaDetalle%>
    </table>

    <input type="hidden" name="numero" value="<%=codigo%>">
    <input type="submit" name="accion" value="<%=accion%>">
    <input type="button" value="Cancelar" onClick="window.history.back()">
</form>
<div id="formulario" title="Apadrinar mascota">
    <form name="formularioMascotas">
        <table id="mascotas" border="0">
            <thead>
                <tr><th>Mascota</th><th><input type="text" id="Mascota"></th></tr>
                <tr><th>Fecha Inicio: </th><th><input type="date" id="Fecha"></th></tr>
                <tr><th>Fecha Fin: </th><th><input type="date" id="FechaFin"></th></tr>
            </thead>
        </table>
        <br>
        <table id='planes' border="1">
            <thead>
                <tr><th>Codigo</th><th>Nombre</th><th>Descripcion</th><th>Seleccionar</th></tr>
            </thead>
            <tbody>
                <%= listaPlan%>
            </tbody>
        </table>
        <br>
        <input type="button" value="Agregar" onclick="actualizarTabla();">
        <input type="button" value="Cancelar" onclick="cerrarFormulario();">
    </form>
</div>
<script>
    var mascota = <%=Mascota.getListaCompletaEnArregloJS(null, null)%>;
    var vectorMascotas = new Array();
    for(var i = 0; i < mascota.length; i++) {
    vectorMascotas[i] = mascota[i][1] + " - " + mascota[i][0];
    };
    $("#Mascota").autocomplete({
    source: vectorMascotas
    });

var personas = <%=Persona.getListaEnArregloJS("tipo='C'", null)%>;
    $("#identificacionPadrino").autocomplete({
        source: personas
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
        var codigoMascota = codigo.substring(codigo.indexOf("-")+1).trim();
        var Plan =document.querySelectorAll('input[name="opcionSeleccionada"]');
            let seleccion = '';
            Plan.forEach(Plan => {
                if (Plan.checked) {
                    seleccion = Plan.value;
                }
            });
        var fechaInicio = document.getElementById('Fecha').value;
        var fechaFin = document.getElementById('FechaFin').value;
        var LapsoPlan = fechaInicio + " / " + fechaFin;
        objeto.value += nombreMascota + "|" + codigoMascota + "|" + seleccion +"|"+ LapsoPlan;

        cargarTabla();
        cerrarFormulario();
    }
            
    function cargarTabla() {
        document.getElementById("tablaMascotas").innerHTML = '<tr><th>Mascota</th><th>Codigo Mascota</th><th>Plan</th><th>Lapso Plan</th></tr>';
        var filas = document.formulario.mascotasPlan.value.split("||");
        for (var i = 0; i < filas.length; i++) {
            var fila = filas[i].split("|");
            var nombreMascota = fila[0];
            var codMascota = fila[1];
            var plan = fila[2];
            var lapsoplan = fila[3];
            

            document.getElementById("tablaMascotas").innerHTML += "<tr><td>" + nombreMascota + "</td><td align='right'>" +
                    codMascota + "</td><td align='right'>" + plan + "</td><td align='right'>" + lapsoplan + "</td></tr>";
        }
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
            width: 600,   // Ancho del diálogo en píxeles
            height: 400
        });
    });


    function abrirFormulario() {
        $('#formulario').dialog('open');
    }

    function cerrarFormulario() {
        $('#formulario').dialog('close');
    }
</script>