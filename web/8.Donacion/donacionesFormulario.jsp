<%@page import="clases.Donacion"%>
<%@page import="java.util.List"%>
<%@page import="clases.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" href="presentacion/style-TarjetasModificar.css">

</head>

<%
    Donacion Donacion = new Donacion();
    String accion = request.getParameter("accion");
    String codigo = request.getParameter("codigo");
    List<Donacion> datos = Donacion.getListaEnObjetos(null, null);
    if (accion.equals("Modificar")) {
        Donacion = new Donacion(codigo);
    }

%>

<center><h3>Agregar donacionDetallees</h3></center>
<table>

    <tr>
        <th>Identificación donante</th>
        <td><input type="text" name="identificacionDonante" id="identificacionDonante"></td>
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
<input type="text" size="200">
<div class="filter-container">
    <button class="add-button" onclick="AgregarDonacion();">Adicionar Donacion</button>
</div>
<script>
    var personas = <%=Persona.getListaEnArreglosJS(null, null)%>;
    var vectorPersonas = new Array();
    for (var i = 0; i < personas.length; i++) {
        vectorPersonas[i] = personas[i][0];//+ " - " + personas[i][1];
    }
    $("#identificacionDonante").autocomplete({
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
    $('#identificacionDonante').change(function () {
        identificacionDonante = this.value.trim();
        indicePersona = buscarPersona(identificacionDonante, 0);
        nombres = personas[indicePersona][1];
        document.getElementById("nombre").innerHTML = nombres;
    });


    function AgregarDonacion() {
        var identificacionDonante = document.getElementById('identificacionDonante').value;
        var fecha = document.getElementById('fecha').value;
        var descripcion = document.getElementById('descripcion').value;
        var url = "8.Donacion/donacionesFormularioActualizar.jsp?accion=Adicionar&identificacionDonante=" + identificacionDonante + "&fecha=" + fecha + "&descripcion=" + descripcion;
        window.location.href = url;
    }

</script>
