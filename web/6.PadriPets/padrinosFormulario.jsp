<%-- 
    Document   : padrinosFormulario.jsp
    Created on : 02-sep-2024, 16:58:56
    Author     : SENA
--%>

<%@page import="clases.Mascota"%>
<%@page import="clases.PlanesApadrinamiento"%>
<%@page import="clases.ApadrinamientoDetalle"%>
<%@page import="java.util.List"%>
<%@page import="clases.Apadrinamiento"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String accion=request.getParameter("accion");
String codigo=request.getParameter("codigo");
String codigoPlan=request.getParameter("codigoPlan");
String lineaModificar = "";
Apadrinamiento apadrinamiento = new Apadrinamiento();
String listaDetalle="";
if(accion.equals("Modificar")){
    apadrinamiento= new Apadrinamiento(codigo);
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
String lista = "";
List<Mascota> datos = Mascota.getListaEnObjetos(null, null);
if (accion.equals("Modificar")) {
        apadrinamiento=new Apadrinamiento(codigo);
    }
for (int i = 0; i < datos.size(); i++) {
    Mascota mascotas = datos.get(i);
    lista += "<tr>";
    lista += "<td>" + mascotas.getCodigo() + "</td>";
    lista += "<td>" + mascotas.getNombre() + "</td>";
    lista += "<td>" + mascotas.getFoto() + "</td>";
    lista += "<td>" + mascotas.getCuidadosEspeciales() + "</td>";
    lista += "<td><input type='checkbox' class='select-row' data-id='" + mascotas.getCodigo() + "'></td>";
    lista += "</tr>";
}
PlanesApadrinamiento planes1=new PlanesApadrinamiento(codigoPlan);
    String listaPlan="";
    List<PlanesApadrinamiento> datosPlanes=PlanesApadrinamiento.getListaEnObjetos(null, null);
    for(int j=0; j < datosPlanes.size();j++){
        PlanesApadrinamiento planes2 = datosPlanes.get(j);
        listaPlan += "<tr>";
        listaPlan += "<td>" + planes2.getId() + "</td>";
        listaPlan += "<td>" + planes2.getNombre() + "</td>";
        listaPlan += "<td>" + planes2.getDescripcion() + "</td>";
        listaPlan += "<td><input type='checkbox' class='select-row' id='" + planes2.getId() + "'></td>";
        listaPlan += "</tr>";
    }
%>

<h3><%=accion.toUpperCase() %>  PADRIPET</h3>
<form name="formulario" method="post" action="principal.jsp?CONTENIDO=padrinosActualizar.jsp">
    <table border='0'>
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
    <button onclick="abrirFormulario()">Adicionar mascota</button>
        <input type="hidden" name="mascotasPlan" size="100">

    <table border="1" id="tablaMascotas">
        <tr>
            <th>Mascota</th><th>Plan</th><th>Fecha Fin</th>
        </tr>
        <%=listaDetalle%>
    </table>
    
    <input type="hidden" name="numero" value="<%=codigo%>">
    <input type="submit" name="accion" value="<%=accion%>">
    <input type="button" value="Cancelar" onClick="window.history.back()">
</form>
<div id="formularioPlan" title="Apadrinar mascota">
    <form name="formularioMascotas">
        <table id="mascotas" border="1">
            <thead>
                <tr>
                    <th>Mascota</th><th><input type="text" id="Mascota"></th>
                </tr>
                <tr>
                    <th>Fecha Inicio: </th><input type="date" id="Fecha"></th>
                </tr>
                <tr>
                    <th>Fecha Fin: </th><input type="date" ></th>
                </tr>
            </thead>
        </table>
        <br>
        <table id='planes' border="1">
            <thead>
                <tr>
                    <th>Codigo</th>
                    <th>Nombre</th>
                    <th>Descripcion</th>
                    <th>Seleccionar</th>
                </tr>
            </thead>
            <tbody>
                <%= listaPlan %>
            </tbody>
        </table>
        <br>
        <label>Fecha fin:</label><input type="date" id="fechaFin">
        <br>
        <button onclick="apadrinar()">Aceptar</button>
        <button onclick="cerrarFormulario()">Cancelar</button>
    </form>
</div>
<script>
    $(function () {
        $("#formularioPlan").dialog({
            autoOpen: false,
            width: 700,
            height: 500,
            show: {
                effect: "blind",
                duration: 1000
            },
            hide: {
                effect: "explode",
                duration: 1000
            }
        });
    });

    function abrirFormulario() {
        $('#formularioPlan').dialog('open');
    }

    function cerrarFormulario() {
        $('#formularioPlan').dialog('close');
    }

    function apadrinar() {
        var objeto = document.formulario.mascotasPlan;
        if (objeto.value != '')
            objeto.value += "||";

        var selectedMascota = document.formularioMascotas.querySelector('#mascotas input[name="mascota"]:checked');
        var selectedPlan = document.formularioMascotas.querySelector('#planes input[name="plan"]:checked');
        var fechaFin = document.formularioMascotas.getElementById('fechaFin').value;

        if (!selectedMascota || !selectedPlan) {
            alert('Debes seleccionar una mascota y un plan.');
            return;
        }

        var rowMascota = selectedMascota.closest('tr');
        var nombreMascota = rowMascota.cells[1].innerText;

        var rowPlan = selectedPlan.closest('tr');
        var nombrePlan = rowPlan.cells[1].innerText;

        objeto.value += nombreMascota + "|" nombrePlan + "|" + fechaFin;
        cargarTabla();
        cerrarFormulario();
    }

    function cargarTabla() {
        document.getElementById("tablaMascotas").innerHTML = '<tr><th>Mascota</th><th>Plan</th><th>Fecha Fin</th>\n\
                    <th><img src="presentacion/imagenes/añadir.png" width="30" height="30" title="Adicionar" onclick="abrirFormulario();"></th></tr>';
        var filas = document.formulario.mascotasPlan.value.split("||");
                for (var i = 0; i < filas.length;i++){
        var fila = filas[i].split("|");
        var nombre = fila[0];

        var nombrePlan = fila[1];
        var fecha = fila[2];

        document.getElementById("tablaMascotas").innerHTML += "<tr><td>" + nombre + "</td><td align='right'>" +
                nombrePlan + "</td><td align='right'>" + fecha + "</td> +
                "<td><img src='presentacion/imagenes/eliminar.png' width='30' height='30' title='Eliminar' onClick='eliminar(" + i + ")'>\n\
                           </td></tr>";
        };
    }

    function eliminar(fila) {
        var mascotasPlan = "";
        var filas = document.formulario.mascotasPlan.value.split("||"); 
        var contador = 0;
        for (var i = 0; i < filas.length; i++) {
            if (i != fila) {
                if (contador > 0)
                    mascotasPlan += "||";
                mascotasPlan += filas[i];
                contador++;
            }
        }
        document.formulario.mascotasPlan.value = mascotasPlan;

        cargarTabla();
    }
</script>